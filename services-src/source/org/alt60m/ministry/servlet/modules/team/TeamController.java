
package org.alt60m.ministry.servlet.modules.team;

import java.util.Arrays;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import org.alt60m.ministry.Regions;
import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.Contact;
import org.alt60m.ministry.model.dbio.LocalLevel;
import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.InfoBaseTool;
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
        	ctx.setSessionValue("lastClass", "Team");
        	String id=(String)ctx.getSessionValue("team")!=null?(String)ctx.getSessionValue("team"):"";
        	if(id.equals("search")){
    			Hashtable search=TeamHelper.sessionSearch(ctx,"team");
    			Section list=TeamHelper.getTeamSearchResults((String)search.get("name"),(String)search.get("city"),(String)search.get("state"),(String)search.get("region"),(String)search.get("strategy"));
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
                LocalLevel ll=new LocalLevel(id);
                result.putValue("isRD",isTeamLeader(person,ll));
                result.putValue("mode","content");
        	}
    		result.addHashtable("search",TeamHelper.sessionSearch(ctx,"team"));
    		
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
            ctx.setSessionValue("lastClass", "Team");
            String llId = ctx.getInputString("id");
            results.addHashtable("search",TeamHelper.sessionSearch(ctx,"team"));
            
			results.addCollection("content", TeamHelper.content(llId));
			Hashtable info=TeamHelper.info(llId);
			
			if(ctx.getInputString("new")!=null){
            	Hashtable<String,String> newTeam=ctx.getHashedRequest();
            	log.debug(newTeam.toString());
            	log.debug(info.toString());
            	for(Object o:info.keySet()){
            		if (newTeam.get(o)!=null){
	            			String val=newTeam.get(o);
	            			log.debug(val);
	            			if(val.toLowerCase().equals("true")){
	            				info.put(o,true);
	            				info.put(((String)o).toLowerCase(),true);
	            				info.put(((String)o).toUpperCase(),true);
	            			}else if(val.toLowerCase().equals("false")){
	            				info.put(o,false);
	            				info.put(((String)o).toLowerCase(),false);
	            				info.put(((String)o).toUpperCase(),false);
	            			}else{
	            			info.put(o,val);
	            			info.put(((String)o).toLowerCase(),val);
            				info.put(((String)o).toUpperCase(),val);
	            			}
            		}
            	}
            	log.debug(info.toString());
            	
            }
			results.addHashtable("info",info );
			Person person=getUserPerson(ctx);
            results.putValue("personID",person.getPersonID()+"");
            LocalLevel ll=new LocalLevel(llId);
            results.putValue("isRD",isTeamLeader(person,ll));
			results.putValue("module",this.module);
			results.putValue("title",this.title);
			results.putValue("mode","content");
			if(ctx.getInputString("edit")!=null)results.putValue("mode", "edit");
			if(ctx.getInputString("new")!=null)results.putValue("mode", "newTeam");
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
        	ctx.setSessionValue("lastClass", "Team");
        	String name = ctx.getInputString("name", true);
            String city = ctx.getInputString("city", true);
            String state = ctx.getInputString("state", true);
              
            String[] strategies=ctx.getInputStringArray("strategy");
            String strategy="(";
            for (String strat:strategies){
            	strategy+="'"+strat+"',";
            }
            strategy+=")";
            strategy=strategy.replace(",)",")");
            log.debug(strategy);
            String[] regions=ctx.getInputStringArray("region");
            String region="(";
            for (String reg:regions){
            	region+="'"+reg+"',";
            }
            region+=")";
            region=region.replace(",)",")");
            log.debug(region);
            TeamHelper.storeSearch(ctx,"team");
			Section list=TeamHelper.getTeamSearchResults(name,city,state,region,strategy);
			Vector<Section> content=new Vector<Section>();
			content.add(list);
			results.addHashtable("search",TeamHelper.sessionSearch(ctx,"team"));
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
            TeamHelper ibt = new TeamHelper();
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
            TeamHelper ibt = new TeamHelper();
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
            results.addHashtable("search",TeamHelper.sessionSearch(ctx,"team"));
			results.addCollection("content", TeamHelper.content(teamID));
			results.addHashtable("info", TeamHelper.info(teamID));
			Person person=getUserPerson(ctx);
            results.putValue("personID",person.getPersonID()+"");
            LocalLevel ll=new LocalLevel(teamID);
            results.putValue("isRD",isTeamLeader(person,ll));
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
    public void saveTeam(ActionContext ctx) {
        try {
        	if(ctx.getInputString("new")==null){
        	String mode = "update";
            String localLevelId = null;
            localLevelId = ctx.getInputString("locallevelid", true); 
  			TeamHelper.saveTeam(ctx.getHashedRequest(), localLevelId, mode);
            content(ctx);
        	} else {
        		TeamHelper ibt = new TeamHelper();
        		List admins=Arrays.asList("trent.murray@uscm.org","todd.gross@uscm.org");
        		boolean admin = admins.contains(((String)ctx.getSessionValue("userName")).toLowerCase());
    			Hashtable request = ctx.getHashedRequest();
    			if (!admin) {
    				ibt.sendLocalLevelRequestEmail(request,"isaac.kimball@uscm.org", ctx.getProfileID());
    				ctx.setSessionValue("confirm", "Your location proposal has been sent.");
    			} else {
    				ibt.saveTeam(request, null, "new");
    				ctx.setSessionValue("confirm", "The new team has been saved.");
    			}
        	
            index(ctx);	
            }
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveTeam().", e);
        }
    }
    public void saveTeamLeader(ActionContext ctx) {
        try {
            String teamID = ctx.getInputString("teamID", true);
            String personID = ctx.getInputString("personID", true);
            TeamHelper ibt = new TeamHelper();
            ibt.saveTeamLeader(personID, teamID);
            content(ctx);
            
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveTeamLeader().", e);
        }
    }
    public void removeTeamLeader(ActionContext ctx) {
        try {
        	String teamID = ctx.getInputString("teamID", true);
            String personID = ctx.getInputString("personID");
            TeamHelper ibt = new TeamHelper();
			ibt.removeTeamLeader( personID,teamID);
			content(ctx);
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform removeTeamLeader().", e);
        }
    }
}