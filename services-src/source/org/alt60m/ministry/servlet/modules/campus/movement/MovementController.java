
package org.alt60m.ministry.servlet.modules.campus.movement;

import java.util.Collection;
import java.util.Vector;

import org.alt60m.ministry.ActivityExistsException;
import org.alt60m.ministry.Strategy;
import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.Contact;
import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.InfoBaseTool;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.campus.location.LocationHelper;
import org.alt60m.ministry.servlet.modules.team.TeamHelper;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.util.ObjectHashUtil;

public class MovementController extends org.alt60m.ministry.servlet.modules.InfoBaseModuleController {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	

    public MovementController() {
        log.debug("MovementController constructor");
    }
    private final String module="campus_movement";
	private final String title="Campus";
    public void init() {
        log.debug("MovementController.init()");
        try {
            initState();
        } catch (Exception e) {
            log.fatal("Failed to init!", e);
        }
    }
    /** @param ctx ActionContext object Request parameters: <none> */
    public void index(ActionContext ctx) {
        try {
        	ctx.setSessionValue("lastClass", "Campus");
        	ActionResults result=new ActionResults("IB index");
    		result.putValue("personID",getUsersPersonId(ctx));
    		result.putValue("module",this.module);
    		result.putValue("title",this.title);
    		ctx.setReturnValue(result);
    		
        	ctx.goToView("index");
        }
        catch (Exception e) {
            ctx.goToErrorView();
            log.error("Failed to perform showIndex().", e);
        }
    }
    public void content(ActionContext ctx) {
        try {
            
        	ActionResults results = new ActionResults("showTargetArea");
			
            String targetAreaID = ctx.getInputString("targetareaid");
            ctx.setSessionValue("campus", ctx.getInputString("targetareaid"));
            ctx.setSessionValue("lastClass", "Campus");
			results.addHashtable("search",LocationHelper.sessionSearch(ctx,"campus"));	
			
            results.addHashtable("info", LocationHelper.info(targetAreaID));
            results.addCollection("content",LocationHelper.content(targetAreaID));
            Person person=getUserPerson(ctx);
            results.putValue("personID",person.getPersonID()+"");
            results.putValue("isRD",isRD(person));
            results.putValue("mode","content");
            results.putValue("module",this.module);
            results.putValue("title",this.title);
            
            ctx.setReturnValue(results);
            ctx.goToView("index");
			
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform showTargetArea().", e);
        }
    }
    public void savePersonContact(ActionContext ctx) {
        try {
            String activityId = ctx.getInputString("activityid", true);
            String personID = ctx.getInputString("personID", true);
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            ibt.savePersonContact(personID, activityId);
            content(ctx);
            
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform savePersonContact().", e);
        }
    }
    public void removePersonContact(ActionContext ctx) {
        try {
            String activityId = ctx.getInputString("activityid", true);
            String personID = ctx.getInputString("personID");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.removePersonContact( personID,activityId);
			content(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform removePersonContact().", e);
        }
    }
    public void addPersonContact(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("addPersonContact");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String search = "";
            if(!ctx.getInputString("lastName").equals("")){
            	search = ctx.getInputString("lastName") + "%";
            }
           
            String activityId = ctx.getInputString("activityid", true);
            String targetAreaId = ctx.getInputString("targetareaid", true);
            Vector<Contact> contacts;
            contacts = ibt.listContactsByLastName(search.toUpperCase());
            results.addCollection("contacts", contacts);
            results.putValue("activityid", activityId);
            results.putValue("targetareaid", targetAreaId);
            results.addHashtable("search",LocationHelper.sessionSearch(ctx,"campus"));
			results.addCollection("content", LocationHelper.content(targetAreaId));
			results.addHashtable("info", LocationHelper.info(targetAreaId));
			Person person=getUserPerson(ctx);
            results.putValue("personID",person.getPersonID()+"");
            results.putValue("isRD",isRD(person));
			results.putValue("module",this.module);
			results.putValue("title",this.title);
			results.putValue("mode","addContact");
			ctx.setReturnValue(results);
			ctx.goToView("index");
        }
        catch (Exception e) {
			ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addPersonContact().", e);
        }
    }
    public void edit(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("editMovement");
            
            String activityId = ctx.getInputString("activityid", true);
            results.addHashtable("movement", MovementHelper.info(activityId));
            String targetAreaId = ctx.getInputString("targetareaid", true);
            results.addHashtable("search",LocationHelper.sessionSearch(ctx,"campus"));
			results.addCollection("content", LocationHelper.content(targetAreaId));
			results.addHashtable("info", LocationHelper.info(targetAreaId));
			TargetArea ta=new TargetArea(targetAreaId);
			 Collection colLLs = ObjectHashUtil.list(MovementHelper.getLocalLevelTeamsByRegion(ta.getRegion()));
	            results.addCollection("teams", colLLs);
			Person person=getUserPerson(ctx);
            results.putValue("personID",person.getPersonID()+"");
            results.putValue("isRD",isRD(person));
			
			results.putValue("module",this.module);
			results.putValue("title",this.title);
			results.putValue("mode","editMovement");
			ctx.setReturnValue(results);
			ctx.goToView("index");
        }
        catch (Exception e) {
			ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform editMovement().", e);
        }
    }
    public void saveEditActivity(ActionContext ctx) {
        try {
            String activityId = ctx.getInputString("activityid", true);
            String periodEnd = ctx.getInputString("datechanged", true);

            String Url = ctx.getInputString("url", true);
            String Facebook = ctx.getInputString("facebook", true);
            String strategy = ctx.getInputString("strategy", Strategy.strategiesArray());
            
            String updateOption = ctx.getInputString("updateoption", true);

           MovementHelper.saveEditActivity(activityId, periodEnd, strategy, updateOption, ctx.getProfileID(), ctx.getInputString("teamid"), Url, Facebook);
            content(ctx);
        }
        catch (ActivityExistsException aee) {
        	ctx.setError("Strategy is already active for this target area.");
            ctx.goToView("activityError");
        }catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveEditActivity().", e);
        }
    }

}