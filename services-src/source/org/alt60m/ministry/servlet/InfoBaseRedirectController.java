
package org.alt60m.ministry.servlet;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.alt60m.servlet.Controller;
import org.alt60m.servlet.Controller.ActionContext;


/**
 * Web controller for InfoBase History: 4/10/01	MDP	Initial Coding Completeness (0 - 5): 3 Known Issues:<p>
 * refactoring and repackaging 5/23/03 MAB
 * @author  Mark Petrotta
 * @version 1.0
 */
public class InfoBaseRedirectController extends Controller {
	
	private static final long serialVersionUID = 1L;

	public InfoBaseRedirectController() {
        log.debug("InfoBaseRedirectController constructor");
    }
    
    public void redirect(ActionContext ctx) {
    	ctx.goToView("redirect");
    }

    public void init() {
        log.debug("InfoBaseRedirectController.init()");
        try {
            initState();
        } catch (Exception e) {
            log.fatal("Failed to init!", e);
        }
    }

    protected void initState() throws Exception {
        initViews(getServletContext().getRealPath("/WEB-INF/modules/views.xml"));
        setDefaultAction("redirect");
    }
    
	protected void processRequest(HttpServletRequest req, HttpServletResponse res) {

		ActionContext ctx = new ActionContext(req, res);

		String actionName = null;
		try {

			if(req.getParameter("action") == null){
				log.debug("Invoking default action: " +_defaultAction );
				actionName = _defaultAction;
			} else {
				String requestedAction = req.getParameter("action");
				log.info("Invoking action: " + requestedAction);
				actionName = "redirect";
			}
			Method action = this.getClass().getMethod(actionName,  new Class[] {ActionContext.class});
			long beginTime = System.currentTimeMillis();
			action.invoke(this, new Object[] {ctx});
			actionInvoked(actionName, ctx);
			long endTime = System.currentTimeMillis();
			log.info("Finished action: " + actionName + " in " + (endTime - beginTime)+ " ms");

		} catch (java.lang.NoSuchMethodException e) {
			log.warn("Action doesn't exist", e );

			ctx.setError();
			ctx.goToErrorView();

        } catch (java.lang.Exception e) {
        	log.error("Error invoking action " + actionName, e );
        	ctx.setError();
            ctx.goToErrorView();
		}
	}
}