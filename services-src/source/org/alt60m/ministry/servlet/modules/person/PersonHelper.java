package org.alt60m.ministry.servlet.modules.person;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.Person;
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
    public static Section getPersonSearchResults(String name,String city,String state,String region)throws Exception{
    	Section t=new Section();
		t.setType("Person");
		t.setName("Person Search Results");
    	
    	ResultSet rs= PersonQueries.getSearchResults("person", name,city,state,region);
    	while (rs.next()){
			Hashtable<String,Object> object=new Hashtable<String,Object>();
			object.put("name",rs.getString("name")+"");
			object.put("city",rs.getString("city")+"");
			object.put("state",rs.getString("state")+"");
			object.put("region",rs.getString("region")+"");
			object.put("id",rs.getString("id")+"");
			object.put("accountNo",rs.getString("accountNo")+"");	//differs from other modules
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
        ctx.setSessionValue("person_search", searchHash);
    }
    public static Hashtable sessionSearch(ActionContext ctx){
    	Hashtable result=new Hashtable();
    	if (ctx.getSessionValue("person_search")!=null){
    		return (Hashtable)ctx.getSessionValue("person_search");
    	}
    	else
    	{
    		Hashtable searchHash=new Hashtable();
            searchHash.put("name", "");
            searchHash.put("city", "");
            searchHash.put("state", "");
            searchHash.put("region", "");
            ctx.setSessionValue("person_search",searchHash);
            return searchHash;
    	}
    }
}
