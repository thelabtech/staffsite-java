package org.alt60m.hr.si.servlet.dbio;

import org.alt60m.servlet.Action;
import org.alt60m.servlet.ActionResults;
//import org.alt60m.servlet.Controller.ActionContext;

import java.io.IOException;
import java.util.*;
//import java.util.Hashtable;

public class SIController extends org.alt60m.servlet.Controller {

	private final String VIEWS_FILE = "/WEB-INF/siviews.xml";
	private final String DEFAULT_ACTION = "goToHome";
	
	//SECURITY NOTE: any action that is allowed regardless of whether or not
	//               the user is logged in should be indentified in the string array below
	private final String[] allowedActions = {"postRefFormEncEdit",
			"postRefFormSave", "paymentFromStaff","postFindStaffForPayment",
			"postPaymentFromStaff", "postCoordinatorPaymentFind",
			"postReceiveCoordinatorPayments"};

	
	//Define available actionhandlers for this Controller
	//  NOTE: in the future it'd be better to have a factory process
	//        handle this, but not this round.
	private SIAppHandler        	apphandler = new SIAppHandler();
	private SIPaymentHandler    	paymenthandler = new SIPaymentHandler();
	private SIReferenceHandler  	referencehandler = new SIReferenceHandler();
	private SIAdminHandler			adminhandler = new SIAdminHandler();

	//constructor
	public SIController() {}

    //*********************************************************
    //  Every action that is requested of the SIController is
    //  handled by an ActionHandler listed above.  SIController 
    //  NEVER contains any business logic or processes information,
    //  but rather serves as a "traffic cop" to move the action
    //  along to the designated object for processing.
    //*********************************************************

    //NOTE: it would be good to make these things configuration options
    //      external to the Controller class altogether but for this round, yada yada.
    //      for now, there must be one of these methods for every action in the SI system

    //CONVENTION: use standard Java method casing convention( processSomething NOT ProcessSomething )
    

    //WHAT TO DO: Make your handled action like this
    /*
    public void processSomething(ActionContext ctx) 
    {
        ActionResults ar = paymenthandler.processSomething(buildAction(ctx));
        postProcess(ctx, ar);
    }
    
    public void processSomethingElse(ActionContext ctx)
    {
        ActionResults ar = referencehandler.processSomethingElse(buildAction(ctx));
        postProcess(ctx, ar);
    }
    
    */
    
    //*********************************************************
    //  Actual ActionHandler methods follow.  This should be the 
    //   ONLY section you edit and you should create methods that
    //   look exactly like above except with your method name.
    //   You should NOT do any other processing here!!
    //*********************************************************

    public void testSIController(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return 

        ActionResults ar = apphandler.testSIController(buildAction(ctx));
        postProcess(ctx, ar);
    }
    
    
    public void postAppHome(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postAppHome(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postContactInfo(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postContactInfo(buildAction(ctx));
        postProcess(ctx, ar);
    }
    
    public void postMinistryInterests(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postMinistryInterests(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postStintInfo(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postStintInfo(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postChurchBackground(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postChurchBackground(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postMinistryExperience(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postMinistryExperience(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postPersonalInfo(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postPersonalInfo(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postAlchoholUse(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postAlchoholUse(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postDrugUse(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postDrugUse(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postTobaccoUse(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postTobaccoUse(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postMoralConvictions(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postMoralConvictions(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postFinancialInfo(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = apphandler.postFinancialInfo(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postMPDInfo(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = apphandler.postMPDInfo(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postBiographicalInfo(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = apphandler.postBiographicalInfo(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postReferenceInfo(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = referencehandler.postReferenceInfo(buildAction(ctx));
        postProcess(ctx, ar);
    }

    public void postSubmitApp(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = apphandler.postSubmitApp(buildAction(ctx));
        postProcess(ctx, ar);
    }


    //payment actions 
	public void postChoosePayment(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.postChoosePayment(buildAction(ctx));
        postProcess(ctx, ar);
	}

	public void postCCardPayment(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.postCCardPayment(buildAction(ctx));
        postProcess(ctx, ar);
	}

	public void postMailPayment(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.postMailPayment(buildAction(ctx));
        postProcess(ctx, ar);
	}

	public void chooseStaffForPayment(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.chooseStaffForPayment(buildAction(ctx));
        postProcess(ctx, ar);
	}

	public void paymentFromStaff(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.paymentFromStaff(buildAction(ctx));
        postProcess(ctx, ar);
	}
	
	public void postFindStaffForPayment(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.postFindStaffForPayment(buildAction(ctx));
        postProcess(ctx, ar);
	}
	
	public void postPaymentFromStaff(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.postPaymentFromStaff(buildAction(ctx));
        postProcess(ctx, ar);
	}
	
	public void postCoordinatorPaymentFind(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.postCoordinatorPaymentFind(buildAction(ctx));
        postProcess(ctx, ar);
	}
	
	public void postReceiveCoordinatorPayments(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = paymenthandler.postReceiveCoordinatorPayments(buildAction(ctx));
        postProcess(ctx, ar);
	}
	
	
	
	
    // reference form actions

	// When a reference person clicks on the link in their email to edit their reference form:
    public void postRefFormEncEdit(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = referencehandler.postRefFormEncEdit(buildAction(ctx));
        postProcess(ctx, ar);
    }

	// Single entry point for posting any page in the Reference Form
    public void postRefFormSave(ActionContext ctx)
    {
    	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = referencehandler.postRefFormSave(buildAction(ctx));
        postProcess(ctx, ar);
    }



	//admin actions
/*	public void showSIAdminTool(ActionContext ctx)
	{
		if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = adminhandler.showSIAdminTool(buildAction(ctx));
        postProcess(ctx, ar);
	}
*/	public void adminEditProject(ActionContext ctx)
	{
		SIUtil util = new SIUtil();
		String userName = ctx.getProfile().get("UserName").toString();
		if(!util.isUserAuthorized(userName,"Evaluator")){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = adminhandler.adminEditProject(buildAction(ctx));
        postProcess(ctx, ar);
	}
	public void adminListProjects(ActionContext ctx)
	{
		SIUtil util = new SIUtil();
		String userName = ctx.getProfile().get("UserName").toString();
		if(!util.isUserAuthorized(userName,"Evaluator")){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = adminhandler.adminListProjects(buildAction(ctx));
        postProcess(ctx, ar);
	}
	
	public void adminSaveProject(ActionContext ctx)
	{
		SIUtil util = new SIUtil();
		String userName = ctx.getProfile().get("UserName").toString();
		if(!util.isUserAuthorized(userName,"Evaluator")){getNotAuthorizedPage(ctx);return;} //Early return
        ActionResults ar = adminhandler.adminSaveProject(buildAction(ctx));
        postProcess(ctx, ar);
	}
	
	public void logout(ActionContext ctx)
	{
        log.info("Logging out user - invalidating session");
        ctx.getSession().invalidate();
        log.debug("logout complete.");
        try {
			ctx.getResponse().sendRedirect("/servlet/SIController");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage(), e);
		}
	}

	// 03-07-03 dc: Added for projectview.jsp
	public void postMakeDownload(ActionContext ctx)
    {
		String httpFile = "/hr_si/evaluator/apps.csv";
		String theFile = (String) getServletContext().getRealPath(httpFile);
    	//login not required for this action	if(!isAuthorized(ctx)){getNotAuthorizedPage(ctx);return;} //Early return    	
        ActionResults ar = adminhandler.postMakeDownload(buildAction(ctx), theFile, httpFile);
        postProcess(ctx, ar);
    }


	/**
	 * afterLogin - this is the destination action after a person logs in.
	 * make sure that all session variable are clear, etc.  return apphome
	 * @param ctx
	 * @author kb - 2/20/2003
	 */
	public void afterLogin(ActionContext ctx)
	{
		try
		{
			log.debug("AfterLogin firing - clearing session values: "+ctx.getSessionValue("userID"));
			//ctx.setSessionValue("SIPersonID","");
			//ctx.setSessionValue("ApplicationID","");
			// 2-26-03 kl: commented 2 lines, this was clearing the SIPersonID and we need those!
			
			ActionResults ar = new ActionResults();
			ar.putValue("as", "student"); // no, really it gets used ... tells the 'submit a reference' page that we're coming as a student
			ar.putValue("page", "apphome");
			ctx.setReturnValue(ar);
			log.debug("sicontroller=page="+ar.getValue("page"));
			ctx.goToView("apphome");
			

		}catch(Exception e)
		{
			log.error(e, e);
		}

	}
	
	
    //*********************************************************
    //  The following methods are utility methods.  The Actions go above.
    //  You probably don't want to edit anything below this line.
    //*********************************************************

    //builds the action object to pass to the actionhandler to handle
    // ActionHandlers cannot use ActionContext's so an intermediary 
    // must exist.  That is what an Action is: it wraps the important data
    // the actionhandler needs to perform its job.
    private Action buildAction (ActionContext ctx)
    {
        Action action = new Action();
        action.setName(ctx.getInputString("action"));
        action.setValues(ctx.getHashedRequest());
        
        String appid = getSessionedValue("ApplicationID",ctx);
        String persid = getSessionedValue("SIPersonID", ctx);
        
        if (appid != null)  action.putValue("ApplicationID", appid);
        if (persid != null) action.putValue("SIPersonID", persid);

			 // added 6 December 2002 by RDH.
			 action.setServerName(ctx.getRequest().getServerName());

        //any session variables needed?
        //TODO: perhaps we should spin through and add all session variables 
        // to the action?

        // added 6 December 2002 by RDH.
        // needed by methods in SIAdminController
        // this is the staffSiteProfileID of staff members logged into the staff site

        String loggedIn = getSessionedValue("loggedIn", ctx);
        if (loggedIn != null) action.putValue("loggedIn", loggedIn);

        return action;
    }


	/**
	 * will check the session if the value doesn't exist, will look in ctx values
	 * will add to session if found in ctx and missing from session.
	 * (somehow this method was previously deleted (although named something else))
	 * @param val
	 * @param ctx
	 * @return String
	 */
	private String getSessionedValue(String valname, ActionContext ctx)
	{
		String val = (String) ctx.getSessionValue(valname);
		
		if(val!=null) 
			return val;
		
		val = ctx.getInputString(valname);
		
		if (val!=null)
		{
			ctx.setSessionValue(valname,val);
			log.debug("Setting in session: "+valname+ "=" + val);	
		}
		
		return val;
	
	}


    //hooks the ar to the ctx and sets the ctx view
    private void postProcess(ActionContext ctx, ActionResults ar)
    {
        ctx.setReturnValue(ar);
        ctx.goToView(ar.getView());
        
        //put the page value in 
        String page = ctx.getInputString("page");
        if(page!=null)		ar.putValue("page", page);

    }


	/**
	*   This method allows a particular page to be returned without any further processing
	*	ex - SIController?action=goToPage&page=appHome
	*	would goto appHome in views file
	**/	
	public void goToPage(ActionContext ctx) {
		ActionResults ar = new ActionResults();
		String page = ctx.getInputString("page");
		ar.putValue("as", "student"); // no, really it gets used ... tells the 'submit a reference' page that we're coming as a student
		ar.putValue("page", page);
		try	{
			ctx.setReturnValue(ar);
			ctx.goToView(page);
		}
		catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	public void clearTub (ActionContext ctx) {
		try
		{
			ActionResults ar = new ActionResults();
			ctx.setReturnValue(ar);
			String view = ctx.getInputString("view");
			ctx.goToView(view);
		}
		catch (Exception e) {
			log.error(e.getMessage(), e);
			ctx.goToView("error");
		}
	}

	public void showProjectTool(ActionContext ctx) {
        try	{
            SIUtil util = new SIUtil();
            java.util.Hashtable tub = new java.util.Hashtable();
            Hashtable profile = ctx.getProfile();
            String userName = "";
            if (profile != null) {
            	userName = (String)profile.get("UserName");
            }
            boolean toolUser = util.isUserAuthorized(userName,"ToolUser");
            tub.put("ToolUser", (toolUser?"Granted":"Denied") );

            boolean evaluator = util.isUserAuthorized(userName,"Evaluator");
            tub.put("Evaluator", (evaluator?"Granted":"Denied") );

            ctx.setSessionValue("tub",tub);
            ctx.goToView("projecttool");
        }
        catch (Exception e) {
            log.error(e.getMessage(), e);
        }
    }

	// goes to the homepage according to the views file and resets the visited tabs
	public void goToHome(ActionContext ctx) {
		try	{
			ctx.goToView("home");
		}
		catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	//	basic initialization stuff
	public void init() {

		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
		
	}

	public void reload() {

		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
		
	}
	
	
	/**
	 * checks to see if the user (in the session) is authorized
	 * for the given action.  We have a very simple authorization scheme: all or nothing (except for
	 * certain actions which are allowed for everyone).  This just checks
	 * to make sure they're logged in or the action is in the allowall list.
	 * @param ctx
	 * @return boolean
	 */
	private boolean isAuthorized(ActionContext ctx)
	{
		return ctx.getSessionValue("userID")!=null || 
				Arrays.asList(allowedActions).contains(ctx.getInputString("action"));				
	}
	
	private void getNotAuthorizedPage(ActionContext ctx)
	{
        log.debug("in GetNotAuthorized Page--The user must not be authorized or logged in.");
		ctx.goToView("login");
        log.debug("returning login page");
	}	

	/*************************  End of utility functions section  **************************/
}
