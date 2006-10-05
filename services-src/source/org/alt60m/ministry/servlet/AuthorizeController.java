package org.alt60m.ministry.servlet;

import java.util.*;
import org.apache.log4j.*;
import org.alt60m.servlet.*;
import org.alt60m.ministry.*;
import org.alt60m.ministry.model.dbio.*;
import org.alt60m.util.ObjectHashUtil;

public class AuthorizeController extends Controller {

    public void init() {
	try {
	    String pathToViews = getServletContext().getRealPath("/WEB-INF/HRAuthorizeViews.xml");
	    setViewsFile(pathToViews);
	    setDefaultAction("showPage");
	    log.info("init() completed.  Ready for action.");	     	     
	} catch (Exception e) {
	    log.fatal("failed to init");
	}	
    }

    public void showPage(ActionContext ctx) {
	try {
	    Hashtable prof = ctx.getProfile();
	    String acctNo = null;
	    HRTool hrt = new HRTool();
	    Hashtable staffInfo = new Hashtable();
	    if (prof != null) {
	    	acctNo = (String)prof.get("AccountNo");
	    	staffInfo = hrt.getUserData(prof, acctNo, null);
	    }
	    ctx.setSessionValue("staffInfo", staffInfo);
		ctx.setSessionValue("accountNo", acctNo);
	    String position = (String)staffInfo.get("Position");
	    String strategy = (String)staffInfo.get("Strategy");
	    String region = (String)staffInfo.get("Region");
	    
	    List myPendingRequests = new Vector();
	    if (position != null) {
	    	myPendingRequests = hrt.getPendingRequests(position, strategy, region);
	    }

	    ActionResults ar = new ActionResults();
	    ar.addCollection("pendingResults", myPendingRequests);
	    ctx.setReturnValue(ar);
	    ctx.goToView("pendingRequests");
	} catch (Exception e) {
	    log.error(e, e);
	    ActionResults ar =  new ActionResults();
	    ar.putValue("exceptionText", "AuthorizeController:showPage:" + e.toString());
	    ctx.setReturnValue(ar);
	    ctx.goToView("error");
	}
    }
	
    public void viewChangeRequest(ActionContext ctx) {
	try {
	    HRTool hrt = new HRTool();

	    StaffChangeRequest staffChange = new StaffChangeRequest(ctx.getInputString("changeRequestID"));
	    Staff updateStaff = staffChange.getUpdateStaff();
		OldAddress primaryAddr = updateStaff.getPrimaryAddress();
	    Hashtable t = ObjectHashUtil.obj2hash(updateStaff);
		if (updateStaff.getLoaStartDate()==null || updateStaff.getLoaStartDate().getYear()==0) {
			t.put("LoaStartDate","");
		}
		if (updateStaff.getLoaEndDate()==null || updateStaff.getLoaEndDate().getYear()==0) {
			t.put("LoaEndDate","");
		}
		if (updateStaff.getResignationDate()==null || updateStaff.getResignationDate().getYear()==0) {
			t.put("ResignationDate","");
		}
		if (updateStaff.getFianceeJoinStaffDate()==null || updateStaff.getFianceeJoinStaffDate().getYear()==0) {
			t.put("FianceeJoinStaffDate","");
		}
		if (updateStaff.getMarriageDate()==null || updateStaff.getMarriageDate().getYear()==0) {
			t.put("MarriageDate","");
		}
		if (updateStaff.getIsFianceeStaff()) {
			t.put("IsFianceeStaff","yes");
		} else {
			t.put("IsFianceeStaff","no");
		}
		t.put("SeverancePayMonthsReq",java.lang.Long.toString(updateStaff.getSeverancePayMonthsReq()));
		if (updateStaff.getContributionsToOtherAcct()) {
			t.put("ContributionsToOtherAcct","yes");
		} else {
			t.put("ContributionsToOtherAcct","no");
		}
		if (updateStaff.getIsFianceeJoiningNS()) {
			t.put("IsFianceeJoiningNS","yes");
		} else {
			t.put("IsFianceeJoiningNS","no");
		}
		if (updateStaff.getJoiningNS()) {
			t.put("JoiningNS","yes");
		} else {
			t.put("JoiningNS","no");
		}
	    if (primaryAddr!=null) {
			t.put("Address1", primaryAddr.getAddress1());
			t.put("Address2", primaryAddr.getAddress2());
			t.put("Address3", primaryAddr.getAddress3());
			t.put("Address4", primaryAddr.getAddress4());
			t.put("City", primaryAddr.getCity());
			t.put("State", primaryAddr.getState());
			t.put("Zip", primaryAddr.getZip());
			t.put("Country", primaryAddr.getCountry());
	    } else {
			t.put("Address1", "");
			t.put("Address2", "");
			t.put("Address3", "");
			t.put("Address4", "");
			t.put("City", "");
			t.put("State", "");
			t.put("Zip", "");
			t.put("Country", "");		
		}
		if (updateStaff.getMembership()!=null) {
			t.put("TeamName", updateStaff.getMembership().getName());
		} else {
			t.put("TeamName", "");
		}
		if (staffChange.getEffectiveDate() != null) {
		t.put("EffectiveDate", staffChange.getEffectiveDate().toString());
	    }
	    t.put("DateRequested", staffChange.getRequestDate().toString());
	    t.put("authorizationID", ctx.getInputString("authorizationID"));
	    t.put("changeRequestID", ctx.getInputString("changeRequestID"));
	    t.put("changeRequestType", staffChange.getType());
		List changes = new ArrayList();
	    Collection c = staffChange.getFieldChanges();
	    Iterator iter = c.iterator();
	    while (iter.hasNext()) {
			Hashtable fieldchange = new Hashtable();
			FieldChange fld = (FieldChange) iter.next();
			if (fld.getField().equals("loaNote") || fld.getField().equals("resignationLetter")) {
				continue;
			}
			fieldchange.put("field", fld.getField());
			if (fld.getField().equals("teamID")) {
				fieldchange.put("newTeam", hrt.getTeamName(fld.getNewValue()));
				if (fld.getOldValue() != null && !fld.getOldValue().equals("")) {
				fieldchange.put("oldTeam", hrt.getTeamName(fld.getOldValue()));
				}
			}
			try {
				fieldchange.put("oldValue", fld.getOldValue());     
			} catch (NullPointerException e) {
				fieldchange.put("oldValue", "");
			}	
			fieldchange.put("newValue", fld.getNewValue());
			changes.add(fieldchange);
	    }
	    t.put("fieldChanges", changes);
	    ActionResults ar = new ActionResults();
	    ar.addHashtable("changeRequest", t);
	    ctx.setReturnValue(ar);
	    ctx.goToView("request");
	} catch (Exception e) {
	    log.error(e, e);
	    ActionResults ar =  new ActionResults();
	    ar.putValue("exceptionText", "AuthorizeController:viewChangeRequest:"+e.toString());
	    ctx.setReturnValue(ar);
	    ctx.goToView("error");
	}
    }
	
    public void submitAuthForm(ActionContext ctx) {
	if (ctx.getInputString("authorize") != null) {
	    authorize(ctx);
	} else {
	    unauthorize(ctx);
	}
    }

    public void authorize(ActionContext ctx) {
	try {
	    String changeRequestID = ctx.getInputString("changeRequestID");
	    String authorizationID = ctx.getInputString("authorizationID");
	    String comments = null;
	    if (!ctx.getInputString("comments").equals("")) {
		comments =  ctx.getInputString("comments");
	    }
	    log("changerequestid is :" + changeRequestID + ":");
	    log("authorizationID is :" + authorizationID + ":");
	    log("session accountNo (aka authorizorID) is " + ctx.getSessionValue("accountNo"));
	    HRTool hrt = new HRTool();
	    hrt.authorize(changeRequestID, authorizationID, comments, (String) ctx.getSessionValue("accountNo"));
	    showPage(ctx);
	} catch (AuthorizerNotFoundException e) {
		ActionResults ar = new ActionResults();
		ar.putValue("exceptionText", "Your approval has been submitted to the next regional HR team for approval.  " +
				"Unfortunately, that HR Regional Director is unable to receive an email notification of this submission because there is no HRRD set up in the computer system for the " + e.getAuthRegion() + " region.  " +
				"Please contact this regional office to inform them of the problem and make sure they are aware of this pending request.");
		ctx.setReturnValue(ar);
		ctx.goToView("notice");
	} catch (Exception e) {
	    ActionResults ar =  new ActionResults();
	    ar.putValue("exceptionText", "AuthorizeController:authorize:"+e.toString());
	    ctx.setReturnValue(ar);
	    ctx.goToView("error");
	}
    }

    public void unauthorize(ActionContext ctx) {
	try {
	    String changeRequestID = ctx.getInputString("changeRequestID");
	    String authorizationID = ctx.getInputString("authorizationID");
	    String comments = null;
	    if (!ctx.getInputString("comments").equals("")) {
		comments = ctx.getInputString("comments");
	    }
	    HRTool hrt = new HRTool();
	    hrt.unauthorize(changeRequestID, authorizationID, comments); //, (String) ctx.getSessionValue("accountNo"));
	    showPage(ctx);
	} catch (Exception e) {
	    ActionResults ar =  new ActionResults();
	    ar.putValue("exceptionText", "AuthorizeController:unauthorize:"+e.toString());
	    ctx.setReturnValue(ar);
	    ctx.goToView("error");
	}
    }

    //INITIATE ACOS
    public void findByLastName(ActionContext ctx) {
	ActionResults ar = new ActionResults();
	try {
	    Hashtable h = ctx.getProfile();
	    String requestorAcctNo = (String)h.get("AccountNo");
	    HRTool hrt = new HRTool();
	    Collection ret = ObjectHashUtil.list(hrt.findByLastName(ctx.getInputString("lastName")));
	    ar.addCollection("staffList", ret);
	    ar.putValue("requestedBy", requestorAcctNo);
	    ctx.setReturnValue(ar);
	    ctx.goToView("nameList");
	} catch (Exception e) {
	    ar.putValue("exceptionText", "findByLastName:" + e.toString());
	    ctx.setReturnValue(ar);
	    ctx.goToView("error");
	}
    }
	
    public void viewFormList(ActionContext ctx) {
	ActionResults ar =  new ActionResults();
	ctx.setSessionValue("accountNo", ctx.getInputString("accountNo"));
	ctx.setSessionValue("requestedBy", ctx.getInputString("requestedBy"));
	ctx.setSessionValue("hrInitiated", "true");
	try {
	    ctx.getResponse().sendRedirect("/servlet/HRUpdateController?action=showFormList");
	} catch (Exception e) {
	    ar.putValue("exceptionText", "Error redirecting to showFormList: " + e.toString());
	    ctx.setReturnValue(ar);
	    ctx.goToView("error");
	}
    }
}
