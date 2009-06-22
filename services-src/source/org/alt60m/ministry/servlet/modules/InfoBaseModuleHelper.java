package org.alt60m.ministry.servlet.modules;


import java.util.Collection;
import java.util.Date;
import java.util.Hashtable;

import java.util.Vector;
import java.sql.ResultSet;


import org.alt60m.ministry.model.dbio.Activity;

import org.alt60m.ministry.model.dbio.Address;
import org.alt60m.ministry.model.dbio.LocalLevel;

import org.alt60m.ministry.model.dbio.Person;
import org.alt60m.ministry.model.dbio.Contact;

import org.alt60m.ministry.model.dbio.TargetArea;

import org.alt60m.ministry.servlet.modules.model.Section;

import org.alt60m.servlet.Controller.ActionContext;

import org.alt60m.util.ObjectHashUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class InfoBaseModuleHelper {
	private static Log log = LogFactory.getLog(InfoBaseModuleHelper.class);

    class StaffByRegionCache {
        Date lastUpdated;
		Hashtable<String, Collection<Hashtable<String, Object>>> staffByRegion = new Hashtable<String, Collection<Hashtable<String, Object>>>();
    }


    public static Section getSearchResults(String type,String name,String city,String state,String region,String country, String strategy)throws Exception{
    	Section t=new Section();
		t.setType(type.substring(0,1).toUpperCase()+type.substring(1).toLowerCase());
		t.setName(t.getType()+" Search Results");
    	if ((name+city+state+region+strategy).equals("('nonnull')('nonnull')")&&(country.equals("USA")||country.equals(""))){
    		return t;//return empty
    	}
    	
    	ResultSet rs= InfoBaseModuleQueries.getSearchResults(type,name,city,state,region,country,strategy);
    	while (rs.next()){
			Hashtable<String,Object> object=new Hashtable<String,Object>();
			object.put("name",rs.getString("name")+"");
			object.put("city",rs.getString("city")+"");
			object.put("state",rs.getString("state")+"");
			object.put("region",rs.getString("region")+"");
			object.put("country",rs.getString("country")+"");
			object.put("strategy",rs.getString("strategy")+"");
			object.put("id",rs.getString("id")+"");
			if(type.equals("person")){
				object.put("accountNo",rs.getString("accountNo")+"");	
			}
			t.addRow(object);
		}
    	return t;
    }
    public static Vector<Section> getBreadcrumbSearchResults(String type,String name,String city,String state,String region, String country, String granularity)throws Exception{
    	Vector<Section>result=new Vector<Section>();
    	Section t=new Section();
		t.setType(type.substring(0,1).toUpperCase()+type.substring(1).toLowerCase());
		String granularTitle=granularity.substring(0,1).toUpperCase()+granularity.substring(1).toLowerCase();
		t.setName("Look for your "+t.getType()+" by selecting the "+granularTitle+" below:");
    	ResultSet rs= InfoBaseModuleQueries.getBreadcrumbSearchResults(type,name,city,state,region,country, granularity);
    	while (rs.next()){
			Hashtable<String,Object> object=new Hashtable<String,Object>();
			String objectName=rs.getString("name")+"";
			if(granularity.equals("country"))objectName=org.alt60m.util.CountryCodes.codeToName(objectName)+"";
			if(granularity.equals("region"))objectName=org.alt60m.ministry.Regions.expandRegion(objectName);
			if(granularity.equals("state"))objectName=org.alt60m.ministry.States.expandState(objectName);
			object.put("city","city name".contains(granularity)?rs.getString("city")+"":"");
			object.put("state","state city name".contains(granularity)&&(rs.getString("country")+"").equals("USA")?rs.getString("state")+"":"");
			object.put("country","country state city name".contains(granularity)?rs.getString("country")+"":"");
			object.put("region","region country state city name".contains(granularity)?rs.getString("region")+"":"");
			if(objectName.equals("")||objectName.equals("null")){
				objectName="Empty "+granularity;
				object.put(granularity, objectName);
				
			}
			object.put("name",objectName);
			object.put("strategy","");
			object.put("id",rs.getString("id")+"");
			if(type.equals("person")){
				object.put("accountNo",rs.getString("accountNo")+"");	
			}
			t.addRow(object);
		}
    	result.add(t);
    	if(granularity.equals("state")&&!country.equals("USA")){
    		granularity="country";
    		t=new Section();
    		t.setType(type.substring(0,1).toUpperCase()+type.substring(1).toLowerCase());
    		t.setName("Or look for your "+t.getType()+" in the Countries below:");
        	rs= InfoBaseModuleQueries.getBreadcrumbSearchResults(type,name,city,state,region,country, granularity);
        	while (rs.next()){
    			Hashtable<String,Object> object=new Hashtable<String,Object>();
    			String objectName=rs.getString("name")+"";
    			if(granularity.equals("country"))objectName=org.alt60m.util.CountryCodes.codeToName(objectName)+"";
    			if(granularity.equals("region"))objectName=org.alt60m.ministry.Regions.expandRegion(objectName);
    			if(granularity.equals("state"))objectName=org.alt60m.ministry.States.expandState(objectName);
    			object.put("city","city name".contains(granularity)?rs.getString("city")+"":"");
    			object.put("state","state city name".contains(granularity)&&(rs.getString("country")+"").equals("USA")?rs.getString("state")+"":"");
    			object.put("country","country state city name".contains(granularity)?rs.getString("country")+"":"");
    			object.put("region","region country state city name".contains(granularity)?rs.getString("region")+"":"");
    			if(objectName.equals("")||objectName.equals("null")){
    				objectName="Empty "+granularity;
    				object.put(granularity, objectName);
    				
    			}
    			object.put("name",objectName);
    			object.put("strategy","");
    			object.put("id",rs.getString("id")+"");
    			if(type.equals("person")){
    				object.put("accountNo",rs.getString("accountNo")+"");	
    			}
    			t.addRow(object);
    		}
    		result.add(t);
    	}
    	
    	return result;
    }
    public static Hashtable<String,Object>infotize(Object tify){
 	   Hashtable<String,Object> result=new Hashtable<String,Object>();
 	   Hashtable <String,Object>mediate=ObjectHashUtil.obj2hash(tify);
 	
 	   if(tify.getClass().getCanonicalName().equals("org.alt60m.ministry.model.dbio.Person")&&tify!=null&&!tify.equals(new Person())){
 		   Address address=new Address();
 		   address.setAddressType("current");
 		   address.setFk_PersonID(((Person)tify).getPersonID());
 		   address.select();
 		   Hashtable<String,Object> addHash=ObjectHashUtil.obj2hash(address);
 		  for(String s:addHash.keySet()){
 	 		   result.put(s.toLowerCase(), addHash.get(s));
 	 		   result.put(s.toUpperCase(), addHash.get(s));
 	 		   result.put(s, addHash.get(s));
 	 	   }
 		  result.put("name", ((Person)tify).getFirstName()+" ("+((Person)tify).getPreferredName()+") "+((Person)tify).getLastName());
 		  result.put("phone",result.get("workphone"));
 	   } else {
 		  result.put("name", "");
 		  result.put("phone","");
 	   }
 	   for(String s:mediate.keySet()){//do this after address in case of conflicting fields
 		   result.put(s.toLowerCase(), mediate.get(s));
 		   result.put(s.toUpperCase(), mediate.get(s));
 		   result.put(s, mediate.get(s));
 	   }
 	   return result;
    }

    public Activity getActivityObject(String activityId) throws Exception {
        try {
			return new Activity(activityId);
		} catch (Exception e) {
            log.error("Failed to perform getActivityObject().", e);
			throw new Exception(e);
        }
    }

    public static LocalLevel getLocalLevelTeam(String llId) throws Exception {
        try {
			return new LocalLevel(llId);
        } catch (Exception e) {
            log.error("Failed to perform getLocalLevelTeam().", e);
			throw new Exception(e);
        }
    }

    public static Collection getLocalLevelTeamsByRegion(String region) throws Exception {
        try {
			return InfoBaseModuleQueries.getLocalLevelTeamsByRegion(region);
       } catch (Exception e) {
            log.error("Failed to perform getLocalLevelTeamsByRegion().", e);
 			throw new Exception(e);
       }
    }

    public static TargetArea getTargetArea(String targetAreaId) throws Exception {
        try {
 			return new TargetArea(targetAreaId);
        } catch (Exception e) {
            log.error("Failed to perform getTargetArea().", e);
			throw new Exception(e);
        }
    }

    public Vector<Contact> listContactsByLastName(String search) throws Exception {
    	try{
    		return InfoBaseModuleQueries.listContactsByLastName(search);
    	}
    	catch (Exception e) {
            log.error("Failed to perform listContactsByLastName().", e);
  			throw new Exception(e);
        }
    }

	public static Section listTeamsForPerson(String personID){
		return InfoBaseModuleQueries.listTeamsForPerson(personID);
	}
	
	public static Section listMovementsUnderPerson(String personID)throws Exception{
		ResultSet rs=InfoBaseModuleQueries.getContactMovements(personID);
		Section s=new Section();		
		while (rs.next()){
			Hashtable<String,Object>h=new Hashtable<String,Object>();
			h.put("id" , rs.getString("id")+"");
			h.put("team_id", rs.getString("team_id")+"");
			h.put("team", rs.getString("team")+"");
			h.put("location_id", rs.getString("location_id")+"");
			h.put("location", rs.getString("location")+"");
			h.put("size", rs.getString("size")+"");
			h.put("strategy", rs.getString("strategy")+"");
			h.put("region", rs.getString("region")+"");
			h.put("city", rs.getString("city")+"");
			h.put("state", rs.getString("state")+"");
			h.put("url", rs.getString("url")+"");
			h.put("facebook", rs.getString("facebook")+"");
			s.addRow(h);
		}
		return s;
	}
	public static Section listMovementsUnderLocation(String taID)throws Exception{
		ResultSet rs=InfoBaseModuleQueries.getLocationMovements(taID);
		Section s=new Section();		
		while (rs.next()){
			Hashtable<String,Object>h=new Hashtable<String,Object>();
			h.put("id" , rs.getString("id")+"");
			h.put("team_id", rs.getString("team_id")+"");
			String[] leaders= (rs.getString("leader_id")+"").split(",");//a movement may have multiple leaders via its team
			Vector<String>movement_leaders=new Vector<String>();
			for(int i=0;i<leaders.length;i++){
				movement_leaders.add(leaders[i]);
			}
			h.put("leader_id",movement_leaders);
			h.put("team", rs.getString("team")+"");
			h.put("location_id", rs.getString("location_id")+"");
			h.put("location", rs.getString("location")+"");
			h.put("size", rs.getString("size")+"");
			h.put("strategy", rs.getString("strategy")+"");
			h.put("region", rs.getString("region")+"");
			h.put("city", rs.getString("city")+"");
			h.put("state", rs.getString("state")+"");
			h.put("url", rs.getString("url")+"");
			h.put("facebook", rs.getString("facebook")+"");
			h.put("contacts", InfoBaseModuleQueries.getMovementContacts(rs.getString("id")+""));
			s.addRow(h);
		}
		return s;
	}
	public static Section listMovementsUnderTeam(String teamID)throws Exception{
		ResultSet rs=InfoBaseModuleQueries.getTeamMovements(teamID);
		Section s=new Section();		
		while (rs.next()){
			Hashtable<String,Object>h=new Hashtable<String,Object>();
			h.put("id" , rs.getString("id")+"");
			h.put("team_id", rs.getString("team_id")+"");
			h.put("team", rs.getString("team")+"");
			h.put("location_id", rs.getString("location_id")+"");
			h.put("location", rs.getString("location")+"");
			h.put("size", rs.getString("size")+"");
			h.put("strategy", rs.getString("strategy")+"");
			h.put("region", rs.getString("region")+"");
			h.put("city", rs.getString("city")+"");
			h.put("state", rs.getString("state")+"");
			h.put("url", rs.getString("url")+"");
			h.put("facebook", rs.getString("facebook")+"");
			h.put("contacts", InfoBaseModuleQueries.getMovementContacts(rs.getString("id")+""));
			s.addRow(h);
		}
		return s;
	}
	   public static Hashtable sessionSearch(ActionContext ctx){
	    	Hashtable result=new Hashtable();
	    	String lastClass=ctx.getInputString("module")+"";
        	if (lastClass.equals("")) lastClass=(String)ctx.getSessionValue("lastClass");
        	if (lastClass.equals("")) lastClass="location";
	    	String key=lastClass+"_search";
	    	if (ctx.getSessionValue(key)!=null){
	    		return (Hashtable)ctx.getSessionValue(key);
	    	}
	    	else
	    	{
	    		Hashtable searchHash=new Hashtable();
	    		searchHash.put("type", lastClass);
	            searchHash.put("name", "");
	            searchHash.put("city", "");
	            searchHash.put("state", "");
	            searchHash.put("country", "");
	            searchHash.put("region", "('nonnull')");
	            searchHash.put("strategy", "('nonnull')");
	            ctx.setSessionValue(key,searchHash);
	            log.debug(((Hashtable)ctx.getSessionValue(key)).toString());
	            return searchHash;
	    	}
	    }
	   public static Hashtable searchInfo(ActionContext ctx){
		   Hashtable result=sessionSearch(ctx);
		   String region=(String)result.get("region");
		   region=region.replace("nonnull", "");
		   region=region.replace(",", "");
		   region=region.replace("(", "");
		   region=region.replace(")", "");
		   region=region.replace("'", "");
		   result.put("region",region);
		   return result;
	   }
	  public static Hashtable lastSearch(ActionContext ctx)
	  {
		   		return org.alt60m.ministry.servlet.modules.InfoBaseModuleHelper.sessionSearch(ctx);
	  }
   	public static String lastClass(ActionContext ctx){
   		String lastClass=ctx.getInputString("module");
   		if (lastClass==null) lastClass=(String)ctx.getSessionValue("lastClass");
       	if (lastClass==null) lastClass="location";       	
   		ctx.setSessionValue("lastClass", lastClass);
   		return lastClass;
   	}
	   @SuppressWarnings("unchecked")
	public static Hashtable storeSearch(ActionContext ctx){
		   String lastClass=lastClass(ctx);
   		ctx.setSessionValue(lastClass, "search");
       	ctx.setSessionValue("home", "search");
       	Hashtable sessionSearch=InfoBaseModuleHelper.sessionSearch(ctx);
       	String type = lastClass;
       	String name = ctx.getInputString("name")==null?(String)sessionSearch.get("name"):ctx.getInputString("name");
           String city = ctx.getInputString("city")==null?(String)sessionSearch.get("city"):ctx.getInputString("city");
           String state = ctx.getInputString("state")==null?(String)sessionSearch.get("state"):ctx.getInputString("state");
           String country = ctx.getInputString("country")==null?(String)sessionSearch.get("country"):ctx.getInputString("country");
           String strategy="(";
           if(ctx.getInputStringArray("strategy")!=null){
           String[] strategies=ctx.getInputStringArray("strategy");
           
           for (String strat:strategies){
           	strategy+="'"+strat+"',";
           }
           strategy+=")";
           strategy=strategy.replace(",)",")");
           } else
           {
           	strategy=(String)sessionSearch.get("strategy");
           }
           String region="(";
           if(ctx.getInputStringArray("region")!=null){
           String[] regions=ctx.getInputStringArray("region");
           
           for (String reg:regions){
           	region+="'"+reg+"',";
           }
           region+=")";
           region=region.replace(",)",")");
           } else
           {
           	region=(String)sessionSearch.get("region");
           }
	    	Hashtable searchHash=new Hashtable();
	    	searchHash.put("type", type);
	        searchHash.put("name", name);
	        searchHash.put("city", city);
	        searchHash.put("state", state);
	        searchHash.put("region", region);
	        searchHash.put("country", country);
	        searchHash.put("strategy", strategy);
	        log.debug(searchHash.toString());
	        ctx.setSessionValue(type+"_search", searchHash);
	        return searchHash;
	    }
	   
	   public static Vector<Section> content(String id, String type)throws Exception{
		   Vector<Section> result=new Vector<Section>();
		   if(type.equals("team")){
		   
	     	Section members=new Section();
	     	members = InfoBaseModuleQueries.getTeamMembers(id);
	     	result.add(members);
	        Section movements=new Section();
			movements=InfoBaseModuleHelper.listMovementsUnderTeam(id);
			movements.setName("Movements Supervised By This Team");
			movements.setType("Movement");
			result.add(movements);
		   } else if (type.equals("person")){
			   Section teams=InfoBaseModuleHelper.listTeamsForPerson(id);
		    	result.add(teams);
		    	Section contacts=new Section();
		        contacts=InfoBaseModuleHelper.listMovementsUnderPerson(id);
		        contacts.setName("Movements Supervised By This Person");
		        contacts.setType("Movement");
		        result.add(contacts);
		   } else {
			   Section movements=new Section();
			    movements=listMovementsUnderLocation(id);
			    movements.setName("Movements At this Location");
			    movements.setType("Movement");
			    result.add(movements);
		   }
		    return result;
		} 
	   public static Hashtable info(String id, String type)throws Exception{
			Hashtable result=new Hashtable();
			Object obj=new Object();
			 if(type.equals("team")){
				  obj = getLocalLevelTeam(id);  
		   } else if (type.equals("person")){
			  obj = new Person(id);
		   } else {
			 obj=  getTargetArea(id);
		   }
			
			result=infotize(obj);
		    return result;
		}
	   public static Hashtable newInfo(ActionContext ctx, String type) throws Exception {
	    	if(type.equals("person"))return new Hashtable();
		   Hashtable blankInfo=info("0",type);
	    	if(ctx.getInputString("new")!=null){
				
	        	Hashtable<String,String> newTeam=ctx.getHashedRequest();
	        	log.debug(newTeam.toString());
	        	log.debug(blankInfo.toString());
	        	for(Object o:blankInfo.keySet()){
	        		if (newTeam.get(o)!=null){
	            			String val=newTeam.get(o);
	            			log.debug(val);
	            			if(val.toLowerCase().equals("true")){
	            				blankInfo.put(o,true);
	            				blankInfo.put(((String)o).toLowerCase(),true);
	            				blankInfo.put(((String)o).toUpperCase(),true);
	            			}else if(val.toLowerCase().equals("false")){
	            				blankInfo.put(o,false);
	            				blankInfo.put(((String)o).toLowerCase(),false);
	            				blankInfo.put(((String)o).toUpperCase(),false);
	            			}else{
	            			blankInfo.put(o,val);
	            			blankInfo.put(((String)o).toLowerCase(),val);
	        				blankInfo.put(((String)o).toUpperCase(),val);
	            			}
	        		}
	        	}
	        	
	        	
	        }
	    	return blankInfo;
	    }
}
