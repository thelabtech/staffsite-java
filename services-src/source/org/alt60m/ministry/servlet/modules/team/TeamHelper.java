package org.alt60m.ministry.servlet.modules.team;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Hashtable;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.LocalLevel;
import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.InfoBaseQueries;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.util.ObjectHashUtil;
import org.alt60m.util.SendMessage;
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
	public static Hashtable newTeam(ActionContext ctx) throws Exception{
		Hashtable newInfo=TeamHelper.info("0");
		if(ctx.getInputString("new")!=null){
        	Hashtable<String,String> newTeam=ctx.getHashedRequest();
        	log.debug(newTeam.toString());
        	log.debug(newInfo.toString());
        	for(Object o:newInfo.keySet()){
        		if (newTeam.get(o)!=null){
            			String val=newTeam.get(o);
            			log.debug(val);
            			if(val.toLowerCase().equals("true")){
            				newInfo.put(o,true);
            				newInfo.put(((String)o).toLowerCase(),true);
            				newInfo.put(((String)o).toUpperCase(),true);
            			}else if(val.toLowerCase().equals("false")){
            				newInfo.put(o,false);
            				newInfo.put(((String)o).toLowerCase(),false);
            				newInfo.put(((String)o).toUpperCase(),false);
            			}else{
            			newInfo.put(o,val);
            			newInfo.put(((String)o).toLowerCase(),val);
        				newInfo.put(((String)o).toUpperCase(),val);
            			}
        		}
        	}
        }
		return newInfo;
	}
//    public static Section getTeamSearchResults(String name,String city,String state,String region,String strategy)throws Exception{
//    	Section t=new Section();
//		t.setType("Team");
//		t.setName("Team Search Results");
//    	ResultSet rs= TeamQueries.getSearchResults("team",name,city,state,region,strategy);
//    	while (rs.next()){
//    		log.debug(rs.getString("strategy")+" "+rs.getString("status"));
//			Hashtable<String,Object> object=new Hashtable<String,Object>();
//			object.put("name",rs.getString("name")+"");
//			object.put("city",rs.getString("city")+"");
//			object.put("state",rs.getString("state")+"");
//			object.put("region",rs.getString("region")+"");
//			object.put("id",rs.getString("id")+"");
//			t.addRow(object);
//		}
//    	return t;
//    }
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
	public void sendLocalLevelRequestEmail(Hashtable request, String to, String profileId) throws Exception {
		try {
			org.alt60m.staffSite.model.dbio.StaffSiteProfile profile=new org.alt60m.staffSite.model.dbio.StaffSiteProfile(profileId);
			Staff sender=new Staff();
			if(profile.getAccountNo()!=null&&!profile.getAccountNo().equals("")){
			sender=new Staff(profile.getAccountNo());
			}
			else
			{
			sender.setFirstName(profile.getFirstName());
			sender.setLastName(profile.getLastName());
			sender.setEmail(profile.getUserName());
			}
			SendMessage msg = new SendMessage();
			msg.setTo(to);
			
			msg.setFrom("\"StaffSite_InfoBase\" <help@campuscrusadeforchrist.com>");
			msg.setSubject("New Local Level Request");
			StringBuffer msgText = new StringBuffer(2000);
				msgText.append("To whom it may concern, \n");
				msgText.append("   This is an automated request for a new target area.\n\n\n");
				msgText.append("-----------------------------------------------------------------\n");
				msgText.append("Team Name: " + request.get("Name") + "\n");
				msgText.append("Lane: " + request.get("Lane") + "\n");
				msgText.append("Region: " + request.get("Region") + "\n");
				msgText.append("Address 1: " + request.get("Address1") + "\n");
				msgText.append("Address 2: " + request.get("Address2") + "\n");
				msgText.append("City: " + request.get("City") + "\n");
				msgText.append("State: " + request.get("State") + "\n");
				msgText.append("Zip: " + request.get("Zip") + "\n");
				msgText.append("Country: " + request.get("Country") + "\n");
				msgText.append("Phone: " + request.get("Phone") + "\n");
				msgText.append("Fax: " + request.get("Fax") + "\n");
				msgText.append("Email: " + request.get("Email") + "\n");
				msgText.append("Webpage URL: " + request.get("Url") + "\n");
				msgText.append("Is this team active? " + (request.get("IsActive").equals("TRUE") ? "Yes" : "No") + "\n");
				msgText.append("Note: " + request.get("Note") + "\n");
				msgText.append("-----------------------------------------------------------------\n");
				msgText.append(" As entered by " + sender.getFirstName()+" "+sender.getLastName()+"("+sender.getEmail()+")" + " on " + new Date().toString() + ".");
				
				msgText.append(" Click here or paste it to your browser to approve/edit: ");
				StringBuffer msgLinkText = new StringBuffer(2000);
				msgLinkText.append("http://localhost:8080/servlet/Team?action=content&id=0&new=true&");
				msgLinkText.append("Name=" + request.get("Name") + "&");
				msgLinkText.append("Lane=" + request.get("Lane") + "&");
				msgLinkText.append("Region=" + request.get("Region") + "&");
				msgLinkText.append("Address1=" + request.get("Address1") + "&");
				msgLinkText.append("Address2=" + request.get("Address2") + "&");
				msgLinkText.append("City=" + request.get("City") + "&");
				msgLinkText.append("State=" + request.get("State") + "&");
				msgLinkText.append("Zip=" + request.get("Zip") + "&");
				msgLinkText.append("Country=" + request.get("Country") + "&");
				msgLinkText.append("Phone=" + request.get("Phone") + "&");
				msgLinkText.append("Fax=" + request.get("Fax") + "&");
				msgLinkText.append("Email=" + request.get("Email") + "&");
				msgLinkText.append("Url=" + request.get("Url") + "&");
				msgLinkText.append("IsActive=" + request.get("IsActive") + "&");
				msgLinkText.append("Note=" + request.get("Note"));
				
				msg.setBody(msgText.toString()+msgLinkText.toString().replace(" ","+"));
			msg.send();
		}
		catch (Exception e) {
			log.error("Failed to perform sendLocalLevelRequestEmail().", e);
			throw new Exception(e);
		}
	}

}
