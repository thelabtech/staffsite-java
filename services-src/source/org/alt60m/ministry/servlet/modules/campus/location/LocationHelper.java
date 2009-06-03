package org.alt60m.ministry.servlet.modules.campus.location;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.util.ObjectHashUtil;
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
    public static Section getCampusSearchResults(String name,String city,String state,String region,String strategy)throws Exception{
    	Section t=new Section();
		t.setType("Campus");
		t.setName("Location Search Results");
    	
    	ResultSet rs= LocationQueries.getSearchResults("campus",name,city,state,region,strategy);
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
    public void saveTargetAreaInfo(Hashtable request, String targetAreaId) throws Exception {
        try {
            TargetArea ta = new TargetArea(targetAreaId);
            ObjectHashUtil.hash2obj(request, ta);
            ta.setEventType(null);
            ta.setEventKeyID(null);
            ta.persist();
        }
        catch (Exception e) {
            log.error("Failed to perform saveTargetAreaInfo().", e);
 			throw new Exception(e);
       }
    }
    
}
