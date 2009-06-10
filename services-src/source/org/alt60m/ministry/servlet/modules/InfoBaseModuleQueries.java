package org.alt60m.ministry.servlet.modules;

import java.text.SimpleDateFormat;
import java.util.*;

import org.alt60m.ministry.model.dbio.*;
import org.alt60m.ministry.servlet.modules.model.Section;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import org.alt60m.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class InfoBaseModuleQueries {
	private static Log log = LogFactory.getLog(InfoBaseModuleController.class);
	public static Vector getLocalLevelTeamsByRegion(String region) {
		LocalLevel ll = new LocalLevel();
		Vector v = ll.selectList("((hasMultiRegionalAccess='T' AND isActive = 'T') OR (region = '" + region + "' AND isActive = 'T')) ORDER BY name");
		return v;
	}
  
	public static ResultSet getSearchResults(String type,String name,String city,String state,String region, String strategy)throws Exception{
		Vector<Object>result=new Vector<Object>();
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		Boolean reqMovement=false;
		Boolean reqStrategy=false;
		String tables="";
		String select="";
		String group="";
		String conditions="";
		String typeConditions="";
		String nameExp="";
		if (!strategy.equals("")&&!strategy.toUpperCase().equals("('NONNULL')")&&strategy!=null){
			reqStrategy=true;
			reqMovement=true;
		}
		if (type.equals("person")){
			group=" mp.personID ";
			tables=" ministry_person mp left join ministry_newaddress ma on (ma.fk_PersonID=mp.personID and ma.addressType='current') "+
					(reqMovement?" inner ":" left ")+" join ministry_movement_contact mmc on mmc.personID= mp.personID "+
					(reqMovement?" inner ":" left ")+" join ministry_activity mact "+
					" on ( mact.ActivityID=mmc.ActivityID and mact.status <> 'IN' and mact.status is not null ) ";
			select=" Select concat(mp.firstName,' (',mp.preferredName,') ',mp.lastName) as name, "+
					" ma.city as city, ma.state as state, mp.region as region, mact.strategy as strategy, mact.status as status, mp.personID as id, mp.accountNo as accountNo ";
			nameExp=" concat(mp.firstName,' (',mp.preferredName,') ',mp.lastName) ";
		}else if (type.equals("team")){
			group=" ml.teamID ";
			tables=" ministry_locallevel ml "+(reqMovement?" inner ":" left ")+"  join ministry_activity mact on (ml.teamID=mact.fk_teamID and mact.status <> 'IN' and mact.status is not null ) ";
			select=" Select ml.name as name, "+
					" ml.city as city, ml.state as state, ml.region as region, mact.strategy as strategy,  mact.status as status, ml.teamID as id ";
			nameExp=" ml.name ";
			
		}else { 
			group=" mt.targetAreaID ";
			tables=" ministry_targetarea mt "+(reqMovement?" inner ":" left ")+" join ministry_activity mact on (mt.targetAreaID=mact.fk_targetAreaID and mact.status <> 'IN' and mact.status is not null  ) ";
			select=" Select mt.name as name, "+
					" mt.city as city, mt.state as state, mt.region as region, mact.strategy as strategy,  mact.status as status, mt.targetAreaID as id ";
			nameExp=" mt.name ";
			typeConditions=" and (mt.eventType is null or mt.eventType<=>'') ";
			
		}
		if (!name.trim().equals("")&&name!=null){
			name=name.replace("%","");
			String testPhrase="";
			
			String[]namePart=name.toUpperCase().split("[ \t\n\f\r]+");
			for (int i=0;i<namePart.length;i++){
				String s=namePart[i];
				if(s.length()>2){
					s="%"+s+"%";
				}
				if(i<namePart.length-1){
					s=s+" ";
				}
				testPhrase+=s;
			}
			conditions +=" and upper("+nameExp+") like '"+testPhrase+"' ";
		}
		else
		{
			conditions +=" and upper("+nameExp+") is not null ";
		}
		if (!city.equals("")&&city!=null){
			conditions +=" and upper(city) like '%"+city.toUpperCase().replaceAll("[ \t\n\f\r]+", "% %")+"%' ";
		}
		if (!state.equals("")&&state!=null){
			conditions +=" and upper(state) like '%"+state.toUpperCase().replaceAll("[ \t\n\f\r]+", "% %")+"%' ";
		}
		if (!region.equals("")&&!region.toUpperCase().equals("('NONNULL')")&&region!=null){
			
			conditions +=" and upper(region) in "+region.toUpperCase()+" ";
		}
		if (reqStrategy){
			conditions +=" and upper(strategy) in "+strategy.toUpperCase()+" ";
		}
		if(conditions.equals("")){conditions=" and false ";}
		String qry=select + " from "+tables+" where true "+conditions+typeConditions+" group by "+group+" order by name asc;";
		log.debug(qry);
		return stmt.executeQuery(qry);
		
	}
	public static Vector listContactsByLastName(String search) {
		try {
			Vector<Contact>c=new Vector<Contact>();
			if (search.length()>0){
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String query="SELECT ministry_person.personID as personID, ministry_person.firstName as firstName,"+
			" ministry_person.preferredName as preferredName, ministry_person.lastName as lastName, max(ministry_newaddress.email) as email,"+
			" ministry_person.accountNo as accountNo "+
			" FROM (ministry_person INNER JOIN ministry_newaddress "+
			" ON ministry_person.personID = ministry_newaddress.fk_PersonID) "+ 
			" WHERE    not(isSecure<=>'T') and UPPER(ministry_person.lastName) like '" + search.toUpperCase() + 
			"%' and ministry_newaddress.email is not null and ministry_newaddress.addressType='current' group by ministry_person.personID ORDER BY ministry_person.lastName, ministry_person.firstName;";
			log.debug(query);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()){
				Contact contact= new Contact(rs.getInt("personID"));
				contact.setAccountNo(rs.getString("accountNo"));
				contact.setFirstName(rs.getString("firstName"));
				contact.setLastName(rs.getString("lastName"));
				contact.setPreferredName(rs.getString("preferredName"));
				contact.setEmail(rs.getString("email"));
				c.add(contact);
			}
			}
			return c;
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static Vector<Hashtable<String,Object>> getMovementContacts(String activityId){
		try{
			Vector<Hashtable<String,Object>>c=new Vector<Hashtable<String,Object>>();
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String query="SELECT ministry_movement_contact.personID as personID, ministry_person.firstName as firstName,"+
			" ministry_person.preferredName as preferredName, ministry_person.lastName as lastName, max(mna1.email) as emailCurrent,  max(mna2.email) as emailPermanent,"+
			" ministry_person.accountNo as accountNo "+
			" FROM (ministry_movement_contact inner join ministry_person "+
			" on ministry_person.personID=ministry_movement_contact.personID Left JOIN ministry_newaddress mna1 "+
			" ON (ministry_person.personID = mna1.fk_PersonID and mna1.addressType='current' )Left JOIN ministry_newaddress mna2"+
			" ON (ministry_person.personID = mna2.fk_PersonID and mna2.addressType='permanent' )) " +
			" WHERE ministry_movement_contact.ActivityID ='"+activityId+"' and not(isSecure<=>'T')  group by ministry_person.personID order by lastName, firstName;";
			log.debug(query);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()){
				Hashtable<String,Object> h=new Hashtable<String,Object>();
				h.put("id",rs.getString("personID")+"");
				h.put("accountNo",rs.getString("accountNo")+"");
				h.put("name", rs.getString("firstName")+" ("+rs.getString("preferredName")+") "+rs.getString("lastName")+"");
				h.put("firstName",rs.getString("firstName")+"");
				h.put("lastName",rs.getString("lastName")+"");
				h.put("preferredName",rs.getString("preferredName")+"");
				String email=(((rs.getString("emailCurrent")==null)||(rs.getString("emailCurrent").equals("")))?
						(((rs.getString("emailPermanent")==null)||(rs.getString("emailPermanent").equals("")))?
								""
								:
								rs.getString("emailPermanent"))
						:
						rs.getString("emailCurrent"));

				h.put("email",email);
				c.add(h);
			}
			return c;
		}
		catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static ResultSet getContactMovements(String personID){
		try{
			
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String query=" Select mt.name as location, ma.strategy as strategy, ma.status as status, "+
			" mt.city as city, mt.state as state, mt.region as region, mt.targetAreaID as location_id, "+
			" ml.name as team, ml.teamID as team_id, ma.ActivityID as id, ma.url as url, ma.facebook as facebook, "+
			" if(stats.invldStudents is null,0,stats.invldStudents) as size "+
			" from ministry_targetarea mt inner join ministry_activity ma on ma.fk_targetareaid=mt.targetareaid "+
			" inner join ministry_movement_contact mmc on mmc.ActivityID=ma.ActivityID "+
			" inner join ministry_locallevel ml on ml.teamID=ma.fk_teamID "+
			" left join (select ms.fk_Activity as fk_Activity, ms.invldStudents as invldStudents from ministry_statistic ms   "+
			" inner join (select Max(lms.StatisticID) as id from ministry_statistic lms group by lms.fk_Activity ) lastStat "+
			"  on lastStat.id=ms.StatisticID ) stats on stats.fk_Activity=ma.ActivityID "+
			" "+
			" where mmc.personID="+personID+"  and ma.status<>'IN'  order by size desc ;";
			
			log.debug(query);
			ResultSet rs=stmt.executeQuery(query);
			
			return rs;
		}
		catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static ResultSet getTeamMovements(String teamID){
		try{
			
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String query=" Select mt.name as location, ma.strategy as strategy, ma.status as status, "+
			" mt.city as city, mt.state as state, mt.region as region, mt.targetAreaID as location_id, "+
			" ml.name as team, ml.teamID as team_id, ma.ActivityID as id, ma.url as url, ma.facebook as facebook, "+
			" if(stats.invldStudents is null,0,stats.invldStudents) as size "+
			" from ministry_targetarea mt inner join ministry_activity ma on ma.fk_targetareaid=mt.targetareaid "+
			" inner join ministry_locallevel ml on ml.teamID=ma.fk_teamID "+
			" left join (select ms.fk_Activity as fk_Activity, ms.invldStudents as invldStudents from ministry_statistic ms   "+
			" inner join (select Max(lms.StatisticID) as id from ministry_statistic lms group by lms.fk_Activity ) lastStat "+
			"  on lastStat.id=ms.StatisticID ) stats on stats.fk_Activity=ma.ActivityID "+
			" "+
			" where ma.fk_teamID="+teamID+" and ma.status<>'IN'  order by size desc  ;";
			
			log.debug(query);
			ResultSet rs=stmt.executeQuery(query);
			
			return rs;
		}
		catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static ResultSet getLocationMovements(String taID){
		try{
			
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String query=" Select mt.name as location, ma.strategy as strategy, ma.status as status, "+
			" mt.city as city, mt.state as state, mt.region as region, mt.targetAreaID as location_id, "+
			" ml.name as team, ml.teamID as team_id, ma.ActivityID as id, ma.url as url, ma.facebook as facebook, "+
			" if(stats.invldStudents is null,0,stats.invldStudents) as size, "+
			" leaders.leader_id as leader_id "+
			" from ministry_targetarea mt inner join ministry_activity ma on ma.fk_targetareaid=mt.targetareaid "+
			" inner join ministry_locallevel ml on ml.teamID=ma.fk_teamID "+
			" left join (select group_concat(tm.personID separator ',') as leader_id, tm.teamID as teamID "+
			" from ministry_missional_team_member tm where tm.is_leader=1 group by tm.teamID) leaders on leaders.teamID=ml.teamID  "+
			" left join (select ms.fk_Activity as fk_Activity, ms.invldStudents as invldStudents from ministry_statistic ms   "+
			" inner join (select Max(lms.StatisticID) as id from ministry_statistic lms group by lms.fk_Activity ) lastStat "+
			"  on lastStat.id=ms.StatisticID ) stats on stats.fk_Activity=ma.ActivityID "+
			" "+
			" where ma.fk_targetAreaId="+taID+" and ma.status<>'IN' order by size desc ;";
			
			log.debug(query);
			ResultSet rs=stmt.executeQuery(query);
			
			return rs;
		}
		catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static Section getTeamMembers(String teamID){
		try{
			Section c=new Section();
			c.setType("Person");
			c.setName("Missional Team Members");
			
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String query="SELECT ministry_missional_team_member.personID as personID, ministry_person.firstName as firstName,"+
			" ministry_missional_team_member.is_leader as is_leader, "+
			" ministry_missional_team_member.is_people_soft as is_people_soft, "+
			" ministry_person.preferredName as preferredName, ministry_person.lastName as lastName, max(mna1.email) as emailCurrent,  max(mna2.email) as emailPermanent,"+
			" ministry_person.accountNo as accountNo, max(mna1.city) as city, max(mna1.state) as state "+
			" FROM (ministry_missional_team_member inner join ministry_person "+
			" on ministry_person.personID=ministry_missional_team_member.personID Left JOIN ministry_newaddress mna1 "+
			" ON (ministry_person.personID = mna1.fk_PersonID and mna1.addressType='current' )Left JOIN ministry_newaddress mna2"+
			" ON (ministry_person.personID = mna2.fk_PersonID and mna2.addressType='permanent' )) " +
			" WHERE ministry_missional_team_member.teamID ='"+teamID+"'  and not(isSecure<=>'T') group by ministry_person.personID order by lastName, firstName;";
			log.debug(query);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()){
				Hashtable<String,Object> h=new Hashtable<String,Object>();
				h.put("id",rs.getString("personID")+"");
				h.put("is_leader",rs.getString("is_leader")==null?false:rs.getString("is_leader").equals("1"));
				h.put("is_people_soft",rs.getString("is_people_soft")==null?false:rs.getString("is_people_soft").equals("1"));
				h.put("accountNo",rs.getString("accountNo")+"");
				h.put("city",rs.getString("city")+"");
				h.put("state",rs.getString("state")+"");
				h.put("name", rs.getString("firstName")+" ("+rs.getString("preferredName")+") "+rs.getString("lastName")+"");
				h.put("firstName",rs.getString("firstName")+"");
				h.put("lastName",rs.getString("lastName")+"");
				h.put("preferredName",rs.getString("preferredName")+"");
				String email=(((rs.getString("emailCurrent")==null)||(rs.getString("emailCurrent").equals("")))?
						(((rs.getString("emailPermanent")==null)||(rs.getString("emailPermanent").equals("")))?
								""
								:
								rs.getString("emailPermanent"))
						:
						rs.getString("emailCurrent"));

				h.put("email",email);
				c.addRow(h);
			}
			return c;
		}
		catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static Boolean isTeamLeader(Person person,LocalLevel ll)throws Exception
    {
    	
        String personID = person.getPersonID()+"";
       String llid=ll.getLocalLevelId();
       Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		String query="SELECT max(ministry_missional_team_member.is_leader) as is_leader "+
		" FROM ministry_missional_team_member  WHERE ministry_missional_team_member.teamID ="+llid+
		" and ministry_missional_team_member.personID="+personID+" group by ministry_missional_team_member.teamID, ministry_missional_team_member.personID  ; ";
		log.debug(query);
		ResultSet rs = stmt.executeQuery(query);
		if (rs.next()){
		if(rs.getString("is_leader")==null){
			 return false;
		} else {
			return rs.getString("is_leader").equals("1");
		}
		}
		return false;
    }

	public static Section listTeamsForPerson(String personID){
		try{
			Section t=new Section();
			t.setType("Team");
			t.setName("Missional Teams");
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String query="SELECT ministry_missional_team_member.teamID, ministry_locallevel.name as name, "+
			" ministry_locallevel.city as city, ministry_locallevel.state as state, "+
			" ministry_locallevel.region as region, ministry_locallevel.lane as strategy "+
			" FROM (ministry_missional_team_member inner join ministry_locallevel "+
			" on ministry_missional_team_member.teamID=ministry_locallevel.teamID) " +
			" WHERE ministry_missional_team_member.personID ='"+personID+"' order by ministry_locallevel.name;";
			log.debug(query);
			ResultSet rs = stmt.executeQuery(query);
			Hashtable<String,Object> h=new Hashtable<String,Object>();
			while (rs.next()){
				h=new Hashtable<String,Object>();
				h.put("id", rs.getString("teamID"));
				h.put("name", rs.getString("name"));
				h.put("city", rs.getString("city"));
				h.put("state", rs.getString("state"));
				h.put("region", rs.getString("region"));
				h.put("strategy", rs.getString("strategy"));
				t.addRow(h);
			}
			return t;
		}
		catch (Exception e) {
			log.error(e, e);
			return null;
		}
		
	}
}