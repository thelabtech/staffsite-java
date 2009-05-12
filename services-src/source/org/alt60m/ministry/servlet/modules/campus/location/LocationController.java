
package org.alt60m.ministry.servlet.modules.campus.location;

import java.util.Collection;
import java.util.Hashtable;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.Activity;
import org.alt60m.ministry.model.dbio.Contact;
import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.ministry.servlet.modules.person.PersonHelper;
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

        	if(id.equals("search")){
    			
    			Hashtable search=LocationHelper.sessionSearch(ctx);
    			Section list=LocationHelper.getCampusSearchResults((String)search.get("name"),(String)search.get("city"),(String)search.get("state"),(String)search.get("region"));
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
        	result.addHashtable("search",LocationHelper.sessionSearch(ctx));
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
    public void search(ActionContext ctx) {
        try {
        	ActionResults results = new ActionResults("listCampus");
        	ctx.setSessionValue("campus", "search");
        	String name = ctx.getInputString("name", true);
            String city = ctx.getInputString("city", true);
            String state = ctx.getInputString("state", true);
            String region = ctx.getInputString("region", true);  
            LocationHelper.storeSearch(ctx);
			Section list=LocationHelper.getCampusSearchResults(name,city,state,region);
			Vector<Section> content=new Vector<Section>();
			content.add(list);
			results.addHashtable("search",LocationHelper.sessionSearch(ctx));
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
}