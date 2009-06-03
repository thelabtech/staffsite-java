package org.alt60m.ministry.servlet.modules.team;
import java.sql.ResultSet;
import java.util.Hashtable;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.LocalLevel;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.InfoBaseQueries;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.util.ObjectHashUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
public class TeamHelper extends org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper {
	private static Log log = LogFactory.getLog(TeamHelper.class);

	public static Vector<Section> content(String id)throws Exception{
		Vector<Section> result=new Vector<Section>();
     	Section members=new Section();
     	members = InfoBaseModuleQueries.getTeamMembers(id);
     	result.add(members);
        Section movements=new Section();
		movements=InfoBaseModuleHelper.listMovementsUnderTeam(id);
		movements.setName("Movements Supervised By This Team");
		movements.setType("Movement");
		result.add(movements);
	    return result;
	}
	public static Hashtable info(String id)throws Exception{
		Hashtable result=new Hashtable();
		LocalLevel ll = getLocalLevelTeam(id);
		result=infotize(ll);
	    return result;
	}
    public static Section getTeamSearchResults(String name,String city,String state,String region,String strategy)throws Exception{
    	Section t=new Section();
		t.setType("Team");
		t.setName("Team Search Results");
    	ResultSet rs= TeamQueries.getSearchResults("team",name,city,state,region,strategy);
    	while (rs.next()){
    		log.debug(rs.getString("strategy")+" "+rs.getString("status"));
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
    public static synchronized void saveTeam(Hashtable request, String localLevelId, String mode) throws Exception {
        try {
            LocalLevel ll;
            if (mode.equals("update")) {
                ll = new LocalLevel(localLevelId);
                ll.select(); 
                
            } else {
                ll = new LocalLevel();
                
                
            }
            
            ObjectHashUtil.hash2obj(request, ll);
            ll.setIsActive(request.get("IsActive").equals("TRUE"));

             ll.persist();
        }
        catch (Exception e) {
            log.error("Failed to perform saveTeam().", e);
 			throw new Exception(e);
        }
    }
    public void removeTeamLeader(String personID,String teamID) throws Exception {
        try {
            TeamQueries.removeTeamMember(personID, teamID );
            TeamQueries.saveTeamMember(personID, teamID);
        }
        catch (Exception e) {
            log.error("Failed to perform removeTeamMember().", e);
  			throw new Exception(e);
        }
    }
    public void saveTeamLeader(String personID, String teamID) throws Exception {
        try {
        	TeamQueries.removeTeamMember(personID,teamID);
        	TeamQueries.saveTeamLeader(personID,teamID);
            
        }
        catch (Exception e) {
            log.error("Failed to perform saveTeamLeader().", e);
  			throw new Exception(e);
        }
    }
    public void saveTeamMember(String personID, String teamID) throws Exception {
        try {
        	TeamQueries.removeTeamMember(personID,teamID);
        	TeamQueries.saveTeamMember(personID,teamID);
            
        }
        catch (Exception e) {
            log.error("Failed to perform saveTeamMember().", e);
  			throw new Exception(e);
        }
    }
    public void removeTeamMember(String personID,String teamID) throws Exception {
        try {
        	TeamQueries.removeTeamMember(personID, teamID );
        }
        catch (Exception e) {
            log.error("Failed to perform removeTeamMember().", e);
  			throw new Exception(e);
        }
    }
}
