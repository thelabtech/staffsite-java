
package org.alt60m.ministry.servlet.modules.team;

import java.util.Hashtable;
import java.util.Iterator;
import java.util.Vector;

import org.alt60m.ministry.Regions;
import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.Contact;
import org.alt60m.ministry.model.dbio.LocalLevel;
import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.campus.location.LocationHelper;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.ministry.servlet.modules.person.PersonHelper;
import org.alt60m.security.dbio.model.User;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.staffSite.bean.dbio.Bookmarks;
import org.alt60m.util.ObjectHashUtil;

public class TeamController extends org.alt60m.ministry.servlet.modules.InfoBaseModuleController {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;

	

    public TeamController() {
        log.debug("TeamController constructor");
        
    }
    private final String module="team";
	private final String title="Team";
    public void init() {
        log.debug("TeamController.init()");
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
        	String id=(String)ctx.getSessionValue("team")!=null?(String)ctx.getSessionValue("team"):"";
        	if(id.equals("search")){
    			Hashtable search=TeamHelper.sessionSearch(ctx);
    			Section list=TeamHelper.getTeamSearchResults((String)search.get("name"),(String)search.get("city"),(String)search.get("state"),(String)search.get("region"));
    			Vector<Section> content=new Vector<Section>();
    			content.add(list);
    			result.addCollection("content",content);
    			result.putValue("mode","list");
    		}else if(!id.equals("")){
    			result.addHashtable("info", TeamHelper.info(id));
                result.addCollection("content",TeamHelper.content(id));
                result.addHashtable("search",(Hashtable)ctx.getSessionValue("team_search")!=null?(Hashtable)ctx.getSessionValue("team_search"):new Hashtable());
                Person person=getUserPerson(ctx);
                result.putValue("personID",person.getPersonID()+"");
                result.putValue("isRD",isRD(person));
                result.putValue("mode","content");
        	}
    		result.addHashtable("search",TeamHelper.sessionSearch(ctx));
    		
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
    /** @param ctx ActionContext object */
    public void content(ActionContext ctx) {
        try {
            ActionResults results = new ActionResults("showTeam");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            ctx.setSessionValue("team", ctx.getInputString("id"));
            String llId = ctx.getInputString("id");
            results.addHashtable("search",TeamHelper.sessionSearch(ctx));
			results.addCollection("content", TeamHelper.content(llId));
			results.addHashtable("info", TeamHelper.info(llId));
			Person person=getUserPerson(ctx);
            results.putValue("personID",person.getPersonID()+"");
            results.putValue("isRD",isRD(person));
			results.putValue("module",this.module);
			results.putValue("title",this.title);
			results.putValue("mode","content");
			ctx.setReturnValue(results);
			ctx.goToView("index");
		}
        catch (Exception e) {
            log.error("Failed to perform showTeam().", e);
            ctx.setError();
            ctx.goToErrorView();
        }
    }
    public void search(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("listCampus");
        	ctx.setSessionValue("team", "search");
        	String name = ctx.getInputString("name", true);
            String city = ctx.getInputString("city", true);
            String state = ctx.getInputString("state", true);
            String region = ctx.getInputString("region", true);  
            TeamHelper.storeSearch(ctx);
			Section list=TeamHelper.getTeamSearchResults(name,city,state,region);
			Vector<Section> content=new Vector<Section>();
			content.add(list);
			results.addHashtable("search",TeamHelper.sessionSearch(ctx));
			results.addCollection("content", content);
			results.putValue("module", this.module);
			results.putValue("title", this.title);
			results.putValue("mode", "list");
            ctx.setReturnValue(results);
            ctx.goToView("index");
        }
        catch (Exception e) {
			e.printStackTrace();
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform detailedListCampus().", e);
        }
    }
    public void saveTeamMember(ActionContext ctx) {
        try {
            String teamID = ctx.getInputString("id");
            String personID = ctx.getInputString("personID");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            ibt.saveTeamMember(personID, teamID);
          content(ctx);
            
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveTeamMember().", e);
        }
    }
    public void removeTeamMember(ActionContext ctx) {
        try {
        	ActionResults result=new ActionResults("removeTeamMember");
    		result.putValue("personID",ctx.getInputString("personID"));
        	String teamID = ctx.getInputString("id");
            String personID = ctx.getInputString("personID");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
			ibt.removeTeamMember( personID,teamID);
			
			content(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform removeTeamMember().", e);
        }
    }
    public void addMissionalTeamMember(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("addMissionalTeamMember");
            InfoBaseModuleHelper ibt = new InfoBaseModuleHelper();
            String search = "";
            Vector<Contact> contacts=new Vector<Contact>();
            if((ctx.getInputString("lastName")!= "")){
            	search = ctx.getInputString("lastName") + "%";
            	 contacts = ibt.listContactsByLastName(search.toUpperCase().replace("'", "%27"));
            }
            else
            {
	            
	        	results.putValue("infoMessage", "You need to specify a last name.");
	        	
            }
            String teamID = ctx.getInputString("id", true);
           results.addCollection("contacts", contacts);
           results.putValue("lastName",ctx.getInputString("lastName"));
            results.addHashtable("search",TeamHelper.sessionSearch(ctx));
			results.addCollection("content", TeamHelper.content(teamID));
			results.addHashtable("info", TeamHelper.info(teamID));
			Person person=getUserPerson(ctx);
            results.putValue("personID",person.getPersonID()+"");
            results.putValue("isRD",isRD(person));
			results.putValue("module",this.module);
			results.putValue("title",this.title);
			results.putValue("mode","addMember");
			ctx.setReturnValue(results);
			ctx.goToView("index");
        }
        catch (Exception e) {
			ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform addMissionalTeamMember().", e);
        }
    }
}