package org.alt60m.servlet;

import java.util.*;
import java.lang.reflect.*;
import javax.servlet.http.*;
import org.apache.log4j.*;
import org.alt60m.util.LogHelper;

/**
 * Defines functionality common to web controllers.
 *
 */
public abstract class Controller extends HttpServlet {

	// Logging object
	protected LogHelper Log = new LogHelper();

	// Mapping of views to URLs
	private Hashtable _views = new Hashtable();

	// Default action, if action token not provided
    protected String _defaultErrorView = "error";
    protected String _defaultAction = "";
	protected String _viewsFile = "";

	// Maintains count of # of threads in this object
	private int _thread_ctr;

	protected class ActionContext
	{
		private final String ERR_TOKEN = "error";
		private final String RETURN_TOKEN = "tub";
		private final String LAST_ACTION_TOKEN = "last_action";
		private final String LAST_LAST_ACTION_TOKEN = "last_last_action";
		private final String LAST_VIEW_TOKEN = "last_view";
		private final String LAST_LAST_VIEW_TOKEN = "last_last_view";

		private HttpSession			_session;			/** User's session object */
		private HttpServletRequest	_request;			/** Request object */
		private HttpServletResponse _response;

		public ActionContext(HttpServletRequest request, HttpServletResponse response) {

			_session = request.getSession();
			_request = request;
			_response = response;

			log(Priority.DEBUG, "New ActionContext for session ID:" + _session.getId());

			// Clear state
			_session.removeAttribute(RETURN_TOKEN);
			_session.removeAttribute(ERR_TOKEN);


		}
		public HttpSession			getSession()	{ return _session; }
		public HttpServletRequest	getRequest()	{ return _request; }
		public HttpServletResponse getResponse()	{ return _response; }

		public String getInputString(String key) {
			return _request.getParameter(key);
		}

		public String getInputString(String key, boolean required) throws MissingRequestParameterException {

			Object value = _request.getParameter(key);

			if ((value == null) && (required == true))
				throw new MissingRequestParameterException(key);
			else
				return (String) value;
		}
		public String getInputString(String key, String[] acceptableValues)
			throws MissingRequestParameterException, UnexpectedParameterValueException {

			String value = getInputString(key, true);

			for(int i =0;i<acceptableValues.length;i++) {
				if (acceptableValues[i].equals(value))
					return value;
			}

			throw new UnexpectedParameterValueException(value, acceptableValues);
		}

		public String[] getInputStringArray(String key) {
			return _request.getParameterValues(key);
		}



		public String getProfileID() {
			return (String) _session.getAttribute("loggedIn");
		}
		public Hashtable getProfile() {
			return (Hashtable) _session.getAttribute("profile");
		}

		public String getLastAction() {
			return (String) _session.getAttribute(LAST_ACTION_TOKEN);
		}

		public String getLastView() {
			return (String) _session.getAttribute(LAST_VIEW_TOKEN);
		}
		private void setLastView(String lastView) {
			setLastLastView(getLastView());
			_session.setAttribute(LAST_VIEW_TOKEN, lastView);
		}

		public String getLastLastView() {
			return (String) _session.getAttribute(LAST_LAST_VIEW_TOKEN);
		}
		private void setLastLastView(String lastView) {
			_session.setAttribute(LAST_LAST_VIEW_TOKEN, lastView);
		}

		private void setLastAction(String lastAction) {
			setLastLastAction(getLastAction());
			_session.setAttribute(LAST_ACTION_TOKEN, lastAction);
		}

		public String getLastLastAction() {
			return (String) _session.getAttribute(LAST_LAST_ACTION_TOKEN);
		}

		private void setLastLastAction(String lastAction) {
			_session.setAttribute(LAST_LAST_ACTION_TOKEN, lastAction);
		}

		public void setReturnValue(Object returnValue) {
			_session.setAttribute(RETURN_TOKEN, returnValue);
		}

		public void setSessionValue(String key, Object value) {
			_session.setAttribute(key, value);
		}
		public Object getSessionValue(String key) {
			return _session.getAttribute(key);
		}
		public void setError(String errorMsg) {
			log(Priority.ERROR, "Error state set: "+errorMsg);
			_session.setAttribute(ERR_TOKEN, errorMsg);
		}
		public void setError() {
			log(Priority.ERROR, "Error state set");
			_session.setAttribute(ERR_TOKEN, "Error processing request");
		}

		public void goToLastAction() {
			goToView(getLastAction());
		}

		public void goToErrorView() {
			goToView(_defaultErrorView);
		}

		public void goToView(String view) {
			log(Priority.DEBUG, "going to view: " + view);

			if (_views.get(view) != null)
			{
				// remember view as last view
				setLastView(view);

				String url = (String) _views.get(view);
				goToURL(url);
			} else {
				log(Priority.ERROR, "Couldn't locate view: " + view);
				System.err.println("Couldn't locate view: " + view);
			}

		}

		public void goToLastView() {
			String lastView = getLastView();
			goToView(lastView);
		}

		public void goToURL(String url) {
			try
			{
				log(Priority.DEBUG, "Forwarding to: " + url);
				getServletConfig().getServletContext().getRequestDispatcher(url).forward(_request, _response);
			}
			catch (Exception e)
			{
				log(Priority.ERROR, e.toString(), e);
			}
		}


		public Hashtable getHashedRequest() {
			Hashtable h = new Hashtable();

			for (Enumeration enumer = _request.getParameterNames(); enumer.hasMoreElements();) {
				String key = (String) enumer.nextElement();
				h.put(key, _request.getParameter(key));
			}

			return h;
		}

		public String fetchId() {
			String id = new String();
			if (_request.getParameter("id") != null) {
				id = _request.getParameter("id");
			} else {
				id = (String) _session.getAttribute("id");
			}
			return id;
		}

	};

	public Controller()
	{
	}

/*
	public Controller(String xmlViews)
	{
		this(xmlViews, null);
	}
*/
/*
	public Controller(String xmlViews, String defaultAction)
	{

		this();

		_defaultAction = defaultAction;
		_viewsFile = xmlViews;

		initViews(xmlViews);

	}
*/

	/**
	 *   IF YOU OVERRIDE THIS METHOD DON'T FORGET TO CALL THIS CODE
	 */
	public void init() {
		log(Priority.DEBUG, "init() called on Controller");
	}

	/**
	 *   IF YOU OVERRIDE THIS METHOD DON'T FORGET TO CALL THIS CODE
	 */
	public void initViews(String xmlViews)
	{
		log(Priority.DEBUG, "Parsing view file: '" + xmlViews + "'.");

		_views = ViewsProcessor.parse(xmlViews);

		for (Enumeration e = _views.keys(); e.hasMoreElements();) {
			String k = (String) e.nextElement();
			log(Priority.DEBUG, k + "=" + _views.get(k));
		}
	}



	public void setViewsFile(String viewsFile) {
		_viewsFile = viewsFile;
		initViews(_viewsFile);
	}
	public void setLog4JConfigFile(String logConfFile) {
		Log.setLog4JConfigFile(logConfFile);
	}

	public String getViewsFile() { return _viewsFile; }

	public String getDefaultAction() { return _defaultAction; }
	public void setDefaultAction(String defaultAction) { _defaultAction = defaultAction; }

    public String getDefaultErrorView() { return _defaultErrorView; }
    public void setDefaultErrorView(String defaultErrorView) { _defaultErrorView = defaultErrorView; }

	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		processRequest(request, response);
	}

	/** Comment */
	protected void processRequest(HttpServletRequest req, HttpServletResponse res) {

		ActionContext ctx = new ActionContext(req, res);

		synchronized (this) {
			_thread_ctr++;
			if (_thread_ctr > 1)
			{
				log(Priority.DEBUG, "Thread count: " + _thread_ctr );
			}
		}

		try {
			if(req.getParameter("action") == null){
				log(Priority.DEBUG, "Invoking default action: " +_defaultAction );
				NDC.push(_defaultAction);

				ctx.setLastAction(_defaultAction);
				Method action = this.getClass().getMethod(_defaultAction, new Class[] {ActionContext.class});
				action.invoke(this, new Object[] {ctx} );
				actionInvoked(_defaultAction, ctx);
			} else {
				String requestedAction = req.getParameter("action");

				log(Priority.DEBUG, "Invoking action: " + requestedAction );
				NDC.push(requestedAction);

				ctx.setLastAction(requestedAction);
				Method action = this.getClass().getMethod(requestedAction,  new Class[] {ActionContext.class});
				action.invoke(this, new Object[] {ctx});
				actionInvoked(requestedAction, ctx);
				log(Priority.DEBUG, "Finished action: " + requestedAction );
				
			}
		} catch (java.lang.NoSuchMethodException e) {
			log(Priority.ERROR, "Action doesn't exist", e );

			ctx.setError();
			ctx.goToErrorView();

        } catch (java.lang.Exception e) {
            e.printStackTrace();
            log(Priority.ERROR, "Error invoking action", e );
            ctx.setError();
            ctx.goToErrorView();
		} finally {
			NDC.pop();
		}

		synchronized (this) { _thread_ctr--; }
	}

	/**
	 *   Designed to be implemented by child classes
	 *	  Called immediately after an action was called on a controller
	 */
	protected void actionInvoked(String action, ActionContext ctx) {}

	/**
	 *   Designed to be implemented by child classes
	 *	  Called when reload action called
	 */
	protected void reload() throws Exception {}

	public void health(ActionContext ctx)
	{
		try {
			String value = ctx.getInputString("value", true);

			ctx.getResponse().setHeader("response", value);

		} catch (Exception e) {
			log(Priority.ERROR, e.toString(), e);
			ctx.setError();
		}
	}

	public void reload(ActionContext ctx)
	{
		try {
			javax.servlet.ServletOutputStream out = ctx.getResponse().getOutputStream();
			try {
				reload();
				out.println("Reload successful.");
			} catch (Exception e) {
				out.println("Reload failed!<BR>"+e.toString());
				log(Priority.ERROR, e.toString(), e);
				ctx.setError();
			}
		} catch (Exception ignore) {}
	}


	public void log(java.lang.String msg) {
//		if (_inited) super.log(msg); else System.out.println(msg);
		Log.log(this.getClass().toString(),Priority.DEBUG, msg);
	}
	public void log(java.lang.String msg, java.lang.Throwable t) {
//		if (_inited) super.log(msg, t); else System.out.println(msg + "\n" + t);
		Log.log(this.getClass().toString(),Priority.DEBUG, msg, t);
	}
	public void log(Priority p, String msg) {
//		if (_inited) super.log(msg); else System.out.println(msg);
		Log.log(this.getClass().toString(),p, msg);

	}
	public void log(Priority p, String msg, java.lang.Throwable t) {
//		if (_inited) super.log(msg, t); else System.out.println(msg + "\n" + t);
		Log.log(this.getClass().toString(),p, msg, t);
	}

}
