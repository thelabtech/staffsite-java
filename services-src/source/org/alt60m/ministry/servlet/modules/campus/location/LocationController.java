
package org.alt60m.ministry.servlet.modules.campus.location;

import java.util.Arrays;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.Contact;
import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.InfoBaseTool;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.ministry.servlet.modules.person.PersonHelper;
import org.alt60m.ministry.servlet.modules.team.TeamHelper;
import org.alt60m.security.dbio.model.User;
import org.alt60m.servlet.ActionResults;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.staffSite.bean.dbio.Bookmarks;
import org.alt60m.util.ObjectHashUtil;

public class LocationController extends org.alt60m.ministry.servlet.modules.InfoBaseModuleController {

    /**
	 *
	 */
	private static final long serialVersionUID = 1L;
	
	

    public LocationController() {
        log.debug("LocationController constructor");
    }
    private final String module="campus_location";
	private final String title="Campus";
    public void init() {
        log.debug("LocationController.init()");
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
    		String id=(String)ctx.getSessionValue("campus")!=null?(String)ctx.getSessionValue("campus"):"";
    		ctx.setSessionValue("lastClass", "Campus");
        	if(id.equals("search")){
    			
    			Hashtable search=LocationHelper.sessionSearch(ctx,"campus");
    			Section list=LocationHelper.getCampusSearchResults((String)search.get("name"),(String)search.get("city"),(String)search.get("state"),(String)search.get("region"),(String)search.get("strategy"));
    			Vector<Section> content=new Vector<Section>();
    			content.add(list);
    			result.addCollection("content",content);
    			result.putValue("mode","list");
    		}else if(!id.equals("")){
        		result.addHashtable("info", LocationHelper.info(id));
                result.addCollection("content",LocationHelper.content(id));
                Person person=getUserPerson(ctx);
                result.putValue("personID",person.getPersonID()+"");
                result.putValue("isRD",isRD(person));
                result.putValue("mode","content");
        	}
        	result.addHashtable("search",LocationHelper.sessionSearch(ctx,"campus"));
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
            
        	ActionResults results = new ActionResults("showTargetArea");
			
            String targetAreaID = ctx.getInputString("id");
            ctx.setSessionValue("campus", ctx.getInputString("id"));
            ctx.setSessionValue("lastClass", "Campus");
			results.addHashtable("search",LocationHelper.sessionSearch(ctx,"campus"));	
			
			Hashtable info=LocationHelper.info(targetAreaID);
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
            results.addHashtable("info", info);
            results.addCollection("content",LocationHelper.content(targetAreaID));
			
            Person person=getUserPerson(ctx);
            results.putValue("personID",person.getPersonID()+"");
            results.putValue("isRD",isRD(person));
            results.putValue("mode","content");
            if(ctx.getInputString("edit")!=null)results.putValue("mode", "editLocation");
            if(ctx.getInputString("new")!=null)results.putValue("mode", "newLocation");
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
    public void search(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("listCampus");
        	ctx.setSessionValue("campus", "search");
        	ctx.setSessionValue("lastClass", "Campus");
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
            LocationHelper.storeSearch(ctx,"campus");
			Section list=LocationHelper.getCampusSearchResults(name,city,state,region,strategy);
			Vector<Section> content=new Vector<Section>();
			content.add(list);
			results.addHashtable("search",LocationHelper.sessionSearch(ctx,"campus"));
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
    public void saveTargetAreaInfo(ActionContext ctx) {
        try {
            if(ctx.getInputString("new")==null){
        	String targetAreaId = ctx.getInputString(TARGET_AREA_ID_TOKEN, true);
			LocationHelper ibt = new LocationHelper();
            ibt.saveTargetAreaInfo(ctx.getHashedRequest(), targetAreaId);
        	content(ctx);
            } else {
            	LocationHelper ibt = new LocationHelper();
            	List admins=Arrays.asList("trent.murray@uscm.org","todd.gross@uscm.org");
    			boolean admin = admins.contains(((String)ctx.getSessionValue("userName")).toLowerCase());
    			if (isNullOrEmpty(ctx.getInputString("Name")) || isNullOrEmpty(ctx.getInputString("City")) ||
    				isNullOrEmpty(ctx.getInputString("Country")) || isNullOrEmpty(ctx.getInputString("isSecure"))) {
    				ctx.setSessionValue("confirm", "One or more required fields was empty. Please try again.");
    			} else { // required fields OK
    				Hashtable request = ctx.getHashedRequest();
    				if (!admin) {
    					ibt.sendTargetAreaRequestEmail(request, "isaac.kimball@uscm.org", ctx.getProfileID());
    					ctx.setSessionValue("confirm", "Your location proposal has been sent.");
    				} else {
    					ibt.createNewTargetArea(request);
    					ctx.setSessionValue("confirm", "The location has been saved.");
    				}
            	
            	
            }
    			index(ctx);
        }
        }
        catch (Exception e) {
            ctx.setError();
            ctx.goToErrorView();
            log.error("Failed to perform saveTargetAreaInfo().", e);
        }
    }
}