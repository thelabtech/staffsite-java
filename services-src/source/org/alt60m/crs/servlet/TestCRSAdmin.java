package org.alt60m.crs.servlet;

import org.alt60m.servlet.Controller;
import org.alt60m.servlet.ActionResults;
import org.alt60m.crs.application.*;
import org.apache.log4j.Priority;

public class TestCRSAdmin extends Controller {
	private CRSApplication crsApp;
	private final String DEFAULT_ACTION = "showConference";
	private final String DEFAULT_ERROR_VIEW = "adminError";

	// Error messages:
	private final String VIEWS_FILE = "/WEB-INF/crsadminviews.xml";

	public TestCRSAdmin() {
		crsApp = new CRSApplication();
	}
	public void adminHome(ActionContext ctx) {
		try {
			ctx.setSessionValue("eventLoggedIn", null);
			ctx.setSessionValue("authLevel", null);
			ctx.goToView("adminHome");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "adminHome");
		}
	}
	//Created: 10/29/2002 DMB
	//default error page handler
	public void goToErrorPage(ActionContext ctx, Exception e, String methodName) {
		e.printStackTrace();
		ActionResults ar = new ActionResults();
		String exceptionText = e + "<BR>\n"; //+ e.getStackTrace()[0];
		//for(int i=1; !e.getStackTrace()[i].toString().startsWith("sun"); i++)
		//  exceptionText += "<BR>\n" + e.getStackTrace()[i];
		ar.putValue("exceptionText", exceptionText);
		ctx.setReturnValue(ar);
		ctx.goToErrorView();
		log.error("Failed to perform " + methodName + "().", e);
	}
	public void init() {
		log.error("CRSAdmin.init()");
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
		super.setDefaultErrorView(DEFAULT_ERROR_VIEW);
	}
	public void reload() {
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
	}
	/********************************************************************************/
	//Created: 10/29/2002 DMB
	//Generates an exception for testing purposes.
	public void sampleError(ActionContext ctx) {
		try {
			String test = null;
			if (test.equals("EXCEPTION! OUCH"));
		} catch (Exception e) {
			goToErrorPage(ctx, e, "sampleError");
		}
	}
	public void showConference(ActionContext ctx) {
		try {
			ActionResults ar = new ActionResults();
			//String conferenceID = ctx.getSessionValue("eventLoggedIn") == null ? ctx.getInputString("conferenceID") : (String) ctx.getSessionValue("eventLoggedIn");
			//conferenceID = ctx.getInputString("conferenceID") == null ? conferenceID : ctx.getInputString("conferenceID");
			String conferenceID = "173";
			ar.putObject("conference", crsApp.getConference(conferenceID));
			ar.putValue("registered", String.valueOf(crsApp.countRegistrations(conferenceID)));
//			ar.putValue("registeredStaff", String.valueOf(crsApp.countStaffRegistrations(conferenceID)));
//			ar.putValue("registeredStudents", String.valueOf(crsApp.countStudentRegistrations(conferenceID)));
//			ar.putValue("registeredGuests", String.valueOf(crsApp.countGuestRegistrations(conferenceID)));

			// Set session values to remember logged in conference
			ctx.setSessionValue("eventLoggedIn", conferenceID);
			ctx.setSessionValue("newEvent", null);

			ctx.setReturnValue(ar);
			ctx.goToView("showConference");
		} catch (Exception e) {
			goToErrorPage(ctx, e, "showConference");
		}
	}
}
