package org.alt60m.ministry.servlet;

import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;
import org.alt60m.servlet.*;
import org.alt60m.ministry.servlet.StaffInfo;
import org.alt60m.ministry.model.dbio.*;

import org.apache.log4j.*;
import org.alt60m.util.*;
import org.alt60m.staffSite.bean.dbio.*;
import org.alt60m.staffSite.profiles.dbio.*;
import org.alt60m.staffSite.model.dbio.*;

/**
 * Staff Controller
 *		5/14/01 - Refactored to Controller2 by MDP
 *
 * @author Mat Weiss
 *
 */
public class TestOracleController extends Controller {

	
	public void testStaffUpdater(ActionContext ctx){
		org.alt60m.ministry.bean.TestStaffUpdater tsu = new org.alt60m.ministry.bean.TestStaffUpdater();
		tsu.performUpdate();
		ctx.goToURL("/servlet/StaffController?action=showHome");
	}
	public void testTeamUpdater(ActionContext ctx){
		org.alt60m.ministry.bean.TeamUpdater tu = new org.alt60m.ministry.bean.TeamUpdater();
		tu.performUpdate();
		ctx.goToURL("/servlet/StaffController?action=showHome");
	}
	public void stealTeamObjects(ActionContext ctx) throws Exception{
		org.alt60m.ministry.bean.TeamUpdater tu = new org.alt60m.ministry.bean.TeamUpdater();
		tu.stealTeamObjects();
		ctx.goToURL("/servlet/StaffController?action=showHome");
	}
}
