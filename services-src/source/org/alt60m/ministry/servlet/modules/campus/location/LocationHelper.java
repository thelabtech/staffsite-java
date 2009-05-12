package org.alt60m.ministry.servlet.modules.campus.location;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.servlet.Controller.ActionContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
public class LocationHelper extends org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper {
	private static final int MAX_CONTACTS = 2; //If this gets changed, need to change saveContact() checks
	private static Log log = LogFactory.getLog(LocationHelper.class);
	
	public static Vector<Section> content(String id)throws Exception{
		Vector<Section> result=new Vector<Section>();
	
	    Section movements=new Section();
	    movements=listMovementsUnderLocation(id);
	    movements.setName("Movements At this Location");
	    movements.setType("Movement");
	    result.add(movements);
	    return result;
	}
	public static Hashtable info(String id)throws Exception{
		Hashtable result=new Hashtable();
		TargetArea ta = getTargetArea(id);
		result=infotize(ta);
	    return result;
	}
    public static Section getCampusSearchResults(String name,String city,String state,String region)throws Exception{
    	Section t=new Section();
		t.setType("Campus");
		t.setName("Location Search Results");
    	
    	ResultSet rs= LocationQueries.getSearchResults("campus",name,city,state,region);
    	while (rs.next()){
			Hashtable<String,Object> object=new Hashtable<String,Object>();
			object.put("name",rs.getString("name")+"");
			object.put("city",rs.getString("city")+"");
			object.put("state",rs.getString("state")+"");
			object.put("region",rs.getString("region")+"");
			object.put("id",rs.getString("id")+"");
			t.addRow(object);
		}
    	return t;
    }
    public static void storeSearch(ActionContext ctx){
    	String name = ctx.getInputString("name");
        String city = ctx.getInputString("city");
        String state = ctx.getInputString("state");
        String region = ctx.getInputString("region");
    	Hashtable searchHash=new Hashtable();
        searchHash.put("name", name);
        searchHash.put("city", city);
        searchHash.put("state", state);
        searchHash.put("region", region);
        ctx.setSessionValue("campus_search", searchHash);
    }
    public static Hashtable sessionSearch(ActionContext ctx){
    	Hashtable result=new Hashtable();
    	if (ctx.getSessionValue("campus_search")!=null){
    		return (Hashtable)ctx.getSessionValue("campus_search");
    	}
    	else
    	{
    		Hashtable searchHash=new Hashtable();
            searchHash.put("name", "");
            searchHash.put("city", "");
            searchHash.put("state", "");
            searchHash.put("region", "");
            ctx.setSessionValue("campus_search",searchHash);
            return searchHash;
    	}
    }
}
