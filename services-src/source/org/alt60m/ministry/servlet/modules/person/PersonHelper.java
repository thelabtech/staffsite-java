package org.alt60m.ministry.servlet.modules.person;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.servlet.Controller.ActionContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
public class PersonHelper extends org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper {
	private static Log log = LogFactory.getLog(PersonHelper.class);

	public static Vector<Section> content(String id)throws Exception{
		Vector<Section> result=new Vector<Section>();
		Section teams=InfoBaseModuleHelper.listTeamsForPerson(id);
    	result.add(teams);
    	Section contacts=new Section();
        contacts=InfoBaseModuleHelper.listMovementsUnderPerson(id);
        contacts.setName("Movements Supervised By This Person");
        contacts.setType("Movement");
        result.add(contacts);
	    return result;
	}
	
	public static Hashtable info(String id)throws Exception{
		Hashtable result=new Hashtable();
		Person person = new Person(id);
		result=infotize(person);
	    return result;
	}
//    public static Section getPersonSearchResults(String name,String city,String state,String region,String strategy)throws Exception{
//    	Section t=new Section();
//		t.setType("Person");
//		t.setName("Person Search Results");
//    	
//    	ResultSet rs= PersonQueries.getSearchResults("person", name,city,state,region,strategy);
//    	while (rs.next()){
//			Hashtable<String,Object> object=new Hashtable<String,Object>();
//			object.put("name",rs.getString("name")+"");
//			object.put("city",rs.getString("city")+"");
//			object.put("state",rs.getString("state")+"");
//			object.put("region",rs.getString("region")+"");
//			object.put("id",rs.getString("id")+"");
//			object.put("accountNo",rs.getString("accountNo")+"");	//differs from other modules
//			t.addRow(object);
//		}
//    	return t;
//    }
  public Staff getStaffObject(String staffId) throws Exception {
  try {
		return new Staff(staffId);
  } catch (Exception e) {
      log.error("Failed to perform saveStatObjectWithActivity().", e);
		throw new Exception(e);
 }
}
}
