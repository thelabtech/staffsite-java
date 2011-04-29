package org.alt60m.ministry.servlet.modules.campus.location;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Hashtable;
import java.util.Vector;

import org.alt60m.ministry.model.dbio.Staff;
import org.alt60m.ministry.model.dbio.TargetArea;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper;
import org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries;
import org.alt60m.ministry.servlet.modules.model.Section;
import org.alt60m.servlet.Controller.ActionContext;
import org.alt60m.util.ObjectHashUtil;
import org.alt60m.util.SendMessage;
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
//    public static Section getCampusSearchResults(String name,String city,String state,String region,String strategy)throws Exception{
//    	Section t=new Section();
//		t.setType("Campus");
//		t.setName("Location Search Results");
//    	
//    	ResultSet rs= LocationQueries.getSearchResults("campus",name,city,state,region,strategy);
//    	while (rs.next()){
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
    @SuppressWarnings("unchecked")
	public static Hashtable<Object, Comparable> newLocation(ActionContext ctx) throws Exception {
    	Hashtable newInfo=LocationHelper.info("0");
    	if(ctx.getInputString("new")!=null){
			
        	Hashtable<String,String> newTeam = ctx.getHashedRequest();
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
	public void sendTargetAreaRequestEmail(Hashtable request, String to, String profileId, String serverName) throws Exception {
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
			msg.setSubject("New Target Area Request");
			StringBuffer msgText = new StringBuffer(2000);
				msgText.append("To whom it may concern, \n");
				msgText.append("   This is an automated request for a new target area.\n\n\n");
				msgText.append("-----------------------------------------------------------------\n");
				msgText.append("Campus Name: " + request.get("Name") + "\n");
				msgText.append("Campus Type: " + request.get("Type") + "\n");
				msgText.append("Campus Address 1: " + request.get("Address1") + "\n");
				msgText.append("Campus Address 2: " + request.get("Address2") + "\n");
				msgText.append("Campus City: " + request.get("City") + "\n");
				msgText.append("State: " + request.get("State") + "\n");
				msgText.append("Campus ZIP: " + request.get("Zip") + "\n");
				msgText.append("Country: " + request.get("Country") + "\n");
				msgText.append("Campus Phone: " + request.get("Phone") + "\n");
				msgText.append("Campus Fax: " + request.get("Fax") + "\n");
				msgText.append("Campus Email: " + request.get("Email") + "\n");
				msgText.append("Campus Webpage URL: " + request.get("Url") + "\n");
				msgText.append("Campus Abbreviation: " + request.get("Abbrv") + "\n");
				msgText.append("Campus Fice: " + request.get("Fice") + "\n");
				//msgText.append("Campus Population: " + request.get("population") + "\n");
				msgText.append("Campus Notes: " + request.get("Note") + "\n");
				msgText.append("Campus Alternate Name: " + request.get("AltName") + "\n");
				msgText.append("Is this campus secure/closed? " + request.get("isSecure") + "\n");
				msgText.append("Campus Region: " + request.get("Region") + "\n");
				msgText.append("Campus MPTA: " + request.get("Mpta") + "\n");
				msgText.append("Campus Area: " + request.get("Aoa") + "\n");
				msgText.append("Campus Area Priority: " + request.get("AoaPriority") + "\n");
				msgText.append("Info URL: " + request.get("InfoUrl") + "\n");
				msgText.append("CIA URL: " + request.get("CiaUrl") + "\n");
				msgText.append("-----------------------------------------------------------------\n");
				msgText.append(" As entered by " + sender.getFirstName()+" "+sender.getLastName()+"("+sender.getEmail()+")" + " on " + new Date().toString() + ". ");
				msgText.append(" Please click or paste the following into your browser to approve/edit this proposal: ");
				
				StringBuffer msgLinkText = new StringBuffer(2000);
				msgLinkText.append(serverName+"/servlet/Campus?action=index&module=location&new=true&");
				msgLinkText.append("Name=" + request.get("Name") + "&");
				msgLinkText.append("AltName=" + request.get("AltName") + "&");
				msgLinkText.append("Mpta=" + request.get("Mpta") + "&");
				msgLinkText.append("Aoa=" + request.get("Aoa") + "&");
				msgLinkText.append("AoaPriority=" + request.get("AoaPriority") + "&");
				msgLinkText.append("InfoUrl=" + request.get("InfoUrl") + "&");
				msgLinkText.append("CiaUrl=" + request.get("CiaUrl") + "&");
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
				msgLinkText.append("isSecure=" + request.get("isSecure") + "&");
				msgLinkText.append("IsSemester=" + request.get("IsSemester") + "&");
				msgLinkText.append("Type=" + request.get("Type") + "&");
				msgLinkText.append("Note=" + request.get("Note"));
				
				msg.setBody(msgText.toString()+msgLinkText.toString().replace(" ","+"));
				
				
			msg.send();
		}
		catch (Exception e) {
			log.error("Failed to perform sendTargetAreaRequestEmail().", e);
			throw new Exception(e);
		}
	}

	public void createNewTargetArea(Hashtable request) throws Exception {
		try {
			TargetArea target = new TargetArea();
			target.setName((String)request.get("Name"));
			target.setAddress1((String)request.get("Address1"));
			target.setAddress2((String)request.get("Address2"));
			target.setCity((String)request.get("City"));
			target.setState((String)request.get("State"));
			target.setZip((String)request.get("Zip"));
			target.setCountry((String)request.get("Country"));
			target.setPhone((String)request.get("Phone"));
			target.setFax((String)request.get("Fax"));
			target.setEmail((String)request.get("Email"));
			target.setUrl((String)request.get("Url"));
			target.setAbbrv((String)request.get("Abbrv"));
			target.setFice((String)request.get("Fice"));
			//target.setPopulation((String)request.get("population"));
			target.setNote((String)request.get("Note"));
			target.setAltName((String)request.get("AltName"));
			target.setIsSecure(((String)request.get("isSecure") != null && ((String)request.get("isSecure")).equalsIgnoreCase("true")) ? true : false);
			target.setRegion((String)request.get("Region"));
			target.setMpta((String)request.get("Mpta"));
			target.setAoa((String)request.get("Aoa"));
			target.setAoaPriority((String)request.get("AoaPriority"));
			target.setInfoUrl((String)request.get("InfoUrl"));
			target.setCiaUrl((String)request.get("CiaUrl"));
			target.setEventType(null);
			target.setEventKeyID(null);
			target.setType((String)request.get("Type"));
			target.setFice("0");
			target.setIsNoFiceOK("T");
			target.persist();
		} catch (Exception e) {
			log.error("Failed to perform createNewTargetArea().", e);
			throw new Exception(e);
	   }
	}
}
