package org.alt60m.fsk.servlet;

import java.util.*;
//import java.text.*;
import org.apache.log4j.*;
import org.alt60m.servlet.*;
//import org.alt60m.staffSite.bean.*;
//import org.alt60m.ministry.bean.*;
import org.alt60m.fsk.FskUsersProcessor;
//import org.alt60m.fsk.servlet.*;
//import org.alt60m.util.*;
//import org.alt60m.ministry.*;
//import org.alt60m.ministry.model.*;
//import org.alt60m.staffSite.model.*;
//import org.alt60m.fsk.model.*;

/**
 * Web controller for InfoBase History: 4/4/02	MAB	Initial Coding Completeness (0 - 5): 0 
 * Known Issues:
 * @author  Mike Brinkley
 * @version 1.0
 */
public class FskController extends Controller {

    private Hashtable usersRoles = new Hashtable();

    public void init() {
		log.debug("FskController.init()");
		try {
			String pathToViews = getServletContext().getRealPath("/WEB-INF/FskViews.xml");
			setViewsFile(pathToViews);
			usersRoles = FskUsersProcessor.parse(getServletContext().getRealPath("WEB-INF/fskusers.xml"));
			setDefaultAction("showIndex");
			log.debug("init() completed.  Ready for action.");	     
		} catch (Exception e) {
			log.error("failed to init");
		}	
    }

    /** @param ctx ActionContext object Request parameters: <none> */
    public void showIndex(ActionContext ctx) {
        try {
			String acctNo = null;
			String role = null;
			String region = null;
			String preferredName = null;
			String lastName = null;
			String userName = null;
			String view = null;
			Hashtable tub = new Hashtable ();
			FskTool ftool = new FskTool();

			userName = (String) ctx.getSessionValue("userName");
			System.out.println("userName= " + userName);
			if (userName.equals("greatlakes") || userName.equals("great.lakes")) {
				region = "GL";
				preferredName = "Great";
				lastName = "Lakes";
			} else if (userName.equals("greatplains") || userName.equals("great.plains")) {
				region = "GP";
				preferredName = "Great";
				lastName = "Plains";
			} else if (userName.equals("midatlantic") || userName.equals("mid.atlantic")) {
				region = "MA";
				preferredName = "Mid";
				lastName = "Atlantic";
			} else if (userName.equals("midsouth") || userName.equals("mid.south")) {
				region = "MS";
				preferredName = "Mid";
				lastName = "South";
			} else if (userName.equals("northeast") || userName.equals("north.east")) {
				region = "NE";
				preferredName = "North";
				lastName = "East";
			} else if (userName.equals("northwest") || userName.equals("north.west")) {
				region = "NW";
				preferredName = "North";
				lastName = "West";
			} else if (userName.equals("redriver") || userName.equals("red.river")) {
				region = "RR";
				preferredName = "Red";
				lastName = "River";
			} else if (userName.equals("southeast") || userName.equals("south.east")) {
				region = "SE";
				preferredName = "South";
				lastName = "East";
			} else if (userName.equals("southwest") || userName.equals("south.west")) {
				region = "SW";
				preferredName = "South";
				lastName = "West";
			} else if (userName.equals("uppermidwest") || userName.equals("upper.midwest")) {
				region = "UM";
				preferredName = "Upper";
				lastName = "Midwest";
			} else {
				acctNo = (String)ctx.getSessionValue("accountNo");
				Hashtable h = ftool.getStaff(acctNo);
				region = (String) h.get("Region");
				preferredName = (String) h.get("PreferredName");
				lastName = (String) h.get("LastName");
			}

			ctx.setSessionValue("fskUserRegion", region);
			ctx.setSessionValue("fskUserFirstName", preferredName);
			ctx.setSessionValue("fskUserLastName", lastName);

			if (usersRoles.containsKey(userName)) {
				role = (String) usersRoles.get(userName);
				ctx.setSessionValue("fskUserRole", role);
				if (role.equals("uberuser")) {
					tub = ftool.generateUberSummary();
					view = "ubersum";
				} else if (role.equals("natluser")) {
					tub = ftool.generateNatlSummary();				
					view = "natlsum";
				} else if (role.equals("reguser")) {
					tub = ftool.generateRegionalSummary(region);
					view = "regsum";
				}
			} else {
				ctx.setSessionValue("fskUserRole", "none");
				String accountno = (String) ctx.getSessionValue("accountNo");
				if (accountno != null) {
					if (ftool.oneAllocation(accountno))	{
						ctx.setSessionValue("fskLocalLeaderAccountNo", accountno);
						int allocationID = ftool.getAllocationID(accountno);
						viewOrders(ctx, allocationID, accountno);
						tub=(Hashtable)ctx.getSessionValue("tub");
						view = "localsum";
					} else {
						tub = ftool.generateLocalSummary(accountno);
						view = "chooselocalsum";
					}
				} else {
					view = "noAccountNo";
				}
			}
			ctx.setSessionValue("tub", tub);
			log("tub1:"+tub);
			ctx.goToView(view);
        }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform showIndex.", e);
        }
    }

	public void allocKits (ActionContext ctx) {
		try	{
			Hashtable h = new Hashtable();
			FskTool ftool = new FskTool();			
			if (ctx.getInputString("id") != null) {
				h = ftool.getHashedAllocation(new Integer(ctx.getInputString("id")).intValue());
			}
			ctx.setSessionValue("tub", h);

			if (ctx.getSessionValue("fskUserRole").equals("uberuser")) {
				ctx.goToView("uberAlloc");
			} else if (ctx.getSessionValue("fskUserRole").equals("natluser")) {
				ctx.goToView("natlAlloc");
			} else if (ctx.getSessionValue("fskUserRole").equals("reguser")) {
				ctx.goToView("regAlloc");
			} else {
				ctx.goToView("localAlloc");
			}
        }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform allocKits().", e);
        }
	}

	public void allocStaffKits (ActionContext ctx) {
		try	{
			Hashtable h = new Hashtable();
			FskTool ftool = new FskTool();		
			if (ctx.getSessionValue("fskUserRole").equals("reguser")) {
				Hashtable alloc = ftool.getAllocationByAcctNoAndRegion(ctx.getInputString("accountno"), (String) ctx.getSessionValue("fskUserRegion"));
				if (alloc != null) {h=alloc;}
				ctx.setSessionValue("tub", h);
				ctx.goToView("regAlloc");
			} else {
				Collection allocs = ftool.getAllocationsByAcctNo(ctx.getInputString("accountno"));
				h.put("allocationList", allocs);
				ctx.setSessionValue("tub", h);
				ctx.goToView("chooseAlloc");
			}
/*
			if (ctx.getSessionValue("fskUserRole").equals("uberuser")) {
				ctx.goToView("uberAlloc");
			} else if (ctx.getSessionValue("fskUserRole").equals("natluser")) {
				ctx.goToView("natlAlloc");
			} else if (ctx.getSessionValue("fskUserRole").equals("reguser")) {
				ctx.goToView("regAlloc");
			} else {
				ctx.goToView("localAlloc");
			}
*/
		}
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform allocStaffKits().", e);
        }
	}

	public void viewOrders(ActionContext ctx) {
		try	{
			log("viewOrders 1");
			Hashtable h = new Hashtable();
			FskTool ftool = new FskTool();			
			h = ftool.generateOrderSummary(new Integer(ctx.getInputString("AllocationID")).intValue());
			ctx.setSessionValue("tub", h);
			ctx.setSessionValue("orders", ftool.ordersHash(new Integer(ctx.getInputString("AllocationID")).intValue()));
			ctx.setSessionValue("distributions", ftool.distributionsHash(new Integer(ctx.getInputString("AllocationID")).intValue()));
			ctx.setSessionValue("fskLocalLeaderAccountNo", ctx.getInputString("accountno"));
			ctx.goToView("localsum");
        }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform viewOrders.", e);
        }
    }

	public void viewOrders(ActionContext ctx, int allocationID, String accountno) {
		try	{
			log("viewOrders #2");
			Hashtable h = new Hashtable();
			FskTool ftool = new FskTool();			
			h = ftool.generateOrderSummary(allocationID);
			ctx.setSessionValue("tub", h);
			log("tub2:"+h);
			ctx.setSessionValue("orders", ftool.ordersHash(allocationID));
			ctx.setSessionValue("distributions", ftool.distributionsHash(allocationID));
			ctx.setSessionValue("fskLocalLeaderAccountNo", accountno);
        }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform viewOrders.", e);
        }
    }

	public void enterOrder(ActionContext ctx) {
		try	{
			Hashtable tub = new Hashtable();
			tub = ctx.getHashedRequest();
			ctx.setSessionValue("tub", tub);
			ctx.goToView("showOrder");
        }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform enterOrder().", e);
        }
    }

	public void enterDistribution(ActionContext ctx) {
		try	{
			log("enteDisstribution");
			Hashtable tub = new Hashtable();
			tub = ctx.getHashedRequest();
			ctx.setSessionValue("tub", tub);
			ctx.goToView("showDistribution");
        }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform enterDistribution().", e);
        }
    }

    public void saveOrder(ActionContext ctx) {
		try	{
			log("saveOrder");
			FskTool ftool = new FskTool();			
			ctx.setSessionValue("tub", ftool.saveOrder(ctx.getHashedRequest()));
			viewOrders(ctx);
		}
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform saveOrder().", e);
        }
    }

    public void saveDistribution(ActionContext ctx) {
		try	{
			log("saveDistribution");
			FskTool ftool = new FskTool();			
			ctx.setSessionValue("tub", ftool.saveDistribution(ctx.getHashedRequest()));
			viewOrders(ctx);
		}
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform saveDistribution().", e);
        }
    }
	
	public void listStaff(ActionContext ctx) {
		try	{
			Hashtable h = new Hashtable();
			FskTool ftool = new FskTool();			
			if (ctx.getInputString("region") != null) {	
				h = ftool.listStaffRegion(ctx.getInputString("region"));
			} else if (ctx.getInputString("lastname") != null) {
				h = ftool.listStaffLastName(massageLastname(ctx.getInputString("lastname")));
			}
			ctx.setSessionValue("tub", h);
			ctx.goToView("listStaff");	
	    }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform listStaff().", e);
        }
    }

    private String massageLastname(String s) {
		String firstLetter = s.substring(0,1);
		String restOfWord = s.substring(1);
		return firstLetter.toUpperCase() + restOfWord.toLowerCase();
    }

    public void saveAlloc(ActionContext ctx) {
		try	{
			FskTool ftool = new FskTool();			
			ftool.saveAllocation(ctx.getHashedRequest());
			showIndex(ctx);
	    }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform saveAlloc.", e);
        }
    }

	public void showOrder (ActionContext ctx) {
		try	{
			log("showOrder");
			Hashtable h = new Hashtable();
			FskTool ftool = new FskTool();			
			if (ctx.getInputString("id") != null) {
				h = ftool.getHashedOrder(new Integer(ctx.getInputString("id")).intValue());
			}
			ctx.setSessionValue("tub", h);

			ctx.goToView("showOrder");
        }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform showOrder.", e);
        }
	}

public void showDistribution (ActionContext ctx) {
		try	{
			log("showDistribution");
			Hashtable h = new Hashtable();
			FskTool ftool = new FskTool();			
			if (ctx.getInputString("id") != null) {
				h = ftool.getHashedDistribution(new Integer(ctx.getInputString("id")).intValue());
			}
		log("showDistribution4");
			ctx.setSessionValue("tub", h);
			ctx.goToView("showDistribution");
					log("showDistribution6");
        }
        catch (Exception e) {
			ActionResults ar = new ActionResults();
			ar.putValue("exceptionText", e.toString());
			ctx.setReturnValue(ar);
			ctx.goToView("error");
            e.printStackTrace();
			log.error("Failed to perform showDistribution.", e);
        }
	}
}