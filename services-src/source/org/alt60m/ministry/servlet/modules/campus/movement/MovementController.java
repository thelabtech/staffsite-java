
package org.alt60m.ministry.servlet.modules.campus.movement;

import java.util.Vector;

import org.alt60m.ministry.model.dbio.Contact;
import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.campus.location.LocationHelper;
import org.alt60m.ministry.servlet.modules.team.TeamHelper;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;

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

			results.addHashtable("search",LocationHelper.sessionSearch(ctx));	
			
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
            results.addHashtable("search",LocationHelper.sessionSearch(ctx));
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
}