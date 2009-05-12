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
	public static Vector getLocalLevelTeamsByRegionExclusive(String region) {
		LocalLevel ll = new LocalLevel();
		Vector v = ll.selectList(" (region = '" + region + "' AND isActive = 'T') ORDER BY name");
		return v;
	}
	
	public static Vector getActiveLocalLevelTeams() {
		LocalLevel ll = new LocalLevel();
		Vector v = ll.selectList("isActive = 'T' ORDER BY name");
		return v;
	}
	  
	public static ResultSet getSearchResults(String type,String name,String city,String state,String region)throws Exception{
		Vector<Object>result=new Vector<Object>();
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String tables="";
		String select="";
		String conditions="";
		String typeConditions="";
		String nameExp="";
		if (type.equals("person")){
			tables=" ministry_person mp left join ministry_newaddress ma on (ma.fk_PersonID=mp.personID and ma.addressType='current') ";
			select=" Select concat(mp.firstName,' (',mp.preferredName,') ',mp.lastName) as name, "+
					" ma.city as city, ma.state as state, mp.region as region, mp.personID as id, mp.accountNo as accountNo ";
			nameExp=" concat(mp.firstName,' (',mp.preferredName,') ',mp.lastName) ";
		}else if (type.equals("team")){
			tables=" ministry_locallevel ml ";
			select=" Select ml.name as name, "+
					" ml.city as city, ml.state as state, ml.region as region, ml.teamID as id ";
			nameExp=" ml.name ";
			
		}else { //if (type.equals("campus")) is our default
			tables=" ministry_targetarea mt ";
			select=" Select mt.name as name, "+
					" mt.city as city, mt.state as state, mt.region as region, mt.targetAreaID as id ";
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
		if (!city.equals("")&&city!=null){
			conditions +=" and upper(city) like '%"+city.toUpperCase().replaceAll("[ \t\n\f\r]+", "% %")+"%' ";
		}
		if (!state.equals("")&&state!=null){
			conditions +=" and upper(state) like '%"+state.toUpperCase().replaceAll("[ \t\n\f\r]+", "% %")+"%' ";
		}
		if (!region.equals("")&&region!=null){
			conditions +=" and upper(region) = '"+region.toUpperCase().replaceAll("[ \t\n\f\r]+", "% %")+"' ";
		}
		if(conditions.equals("")){conditions=" and false ";}
		String qry=select + " from "+tables+" where true "+conditions+typeConditions+" order by name asc;";
		log.debug(qry);
		return stmt.executeQuery(qry);
		
	}
	static public Vector<Hashtable<String,String>> getBadHistories()throws Exception {
		  Vector<Hashtable<String,String>>result=new Vector<Hashtable<String,String>>();
		  Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String qry="SELECT MAX(ministry_targetarea.name) as campusName, MAX(ministry_targetarea.isSecure) as isSecure, "+
			" ministry_activity.status as realStatus, lastStatus.status as status,  MAX(ministry_activity.strategy) as strategy, "+
			" MAX(ministry_locallevel.name) as teamName, MAX(ministry_locallevel.teamID) as teamID, "+
			" MAX(ministry_targetarea.targetAreaID) as campusID, ministry_activity.ActivityID as activity_id, "+
			" MAX(ministry_targetarea.region) as region, MAX(ministry_targetarea.city) as city,  MAX(ministry_targetarea.state) as state, "+
			" MAX(ministry_targetarea.country) as country  FROM (ministry_activity INNER JOIN ministry_targetarea ON "+
			" ministry_activity.fk_targetAreaID = ministry_targetarea.targetAreaID)  INNER JOIN ministry_locallevel ON "+
			" ministry_activity.fk_teamID = ministry_locallevel.teamID  LEFT JOIN "+
			" (SELECT ministry_activity_history.activity_id as activity_id, ministry_activity_history.to_status as status, "+
			" ministry_activity_history.period_begin as periodBegin FROM	(	SELECT ministry_activity_history.activity_id as activity_id, "+
			" MAX(ministry_activity_history.id) as id  FROM ministry_activity_history WHERE  (ministry_activity_history.period_begin<='2008/8/31') "+
			" AND (ministry_activity_history.toStrategy Is Null)  GROUP BY ministry_activity_history.activity_id ) lastDates "+
			" INNER JOIN ministry_activity_history  ON (lastDates.activity_id=ministry_activity_history.activity_id AND "+
			" lastDates.id=ministry_activity_history.id)) lastStatus  ON ministry_activity.ActivityID=lastStatus.activity_id  "+
			" WHERE  ministry_activity.strategy in ('FS', 'GK', 'WS', 'CL', 'AA', 'KC', 'BR', 'OT', 'IN', 'II', 'VL', 'IE', 'ID') "+
			" and  (ministry_activity.status<>lastStatus.status) and lastStatus.status in ('AC','TR','LA','PI','KE','FR','IN')  "+
			" GROUP BY   ministry_activity.ActivityID  ORDER BY campusName, strategy;";
				
				ResultSet rs = stmt.executeQuery(qry);
			while (rs.next()){
				Hashtable<String,String> entry=new Hashtable<String,String>();
				entry.put("activity",rs.getString("activity_id"));
				entry.put("status", rs.getString("realStatus"));
				result.add(entry);
			}
			conn.close();
			return result;
	    }
	public static String getCampusesForStaffTeam(String accountno) throws Exception {
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		
		String qry = "SELECT name FROM ministry_targetarea ta " +
						"INNER JOIN ministry_activity act ON act.fk_targetAreaID=ta.TargetAreaID " +
						"INNER JOIN ministry_staff staff ON staff.fk_teamID=act.fk_teamID " +
						"WHERE staff.accountNo='"+accountno+"'";
						
		ResultSet rs = stmt.executeQuery(qry);

		return TextUtils.listToCommaDelimitedQuotedString(rs, "'");
	}
	
	public static Hashtable<String,Hashtable<String,Double>>getZipsLatLong()throws Exception{
		Hashtable<String,Hashtable<String,Double>>result=new Hashtable<String,Hashtable<String,Double>>();
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		String qry = "Select truncate(lat_long_by_zip_code.lat,1) as latitude, truncate(lat_long_by_zip_code.long,1) as longitude, lat_long_by_zip_code.zip as zip from lat_long_by_zip_code ;";
		log.debug(qry);				
		ResultSet rs = stmt.executeQuery(qry);
		while(rs.next()){
			Hashtable<String,Double>coords=new Hashtable<String,Double>();
			coords.put("latitude",rs.getBigDecimal("latitude").doubleValue());
			coords.put("longitude",rs.getBigDecimal("longitude").doubleValue());
			result.put(rs.getString("zip"), coords);
		}
		return result;
	}
	public static Vector<Hashtable<String,Object>> getEnrollmentForLatLong()throws Exception{
		Hashtable<String, Object> points=new Hashtable<String, Object>();
		Vector<Hashtable<String,Object>>result=new Vector<Hashtable<String,Object>>();
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		
		String qry = "Select substring(ta.zip,1,5) as zip, ta.enrollment from ministry_targetarea ta ;";
		log.debug(qry);				
		ResultSet rs = stmt.executeQuery(qry);
		while (rs.next()){
			points=new Hashtable<String, Object>();
			points.put("zip",rs.getString("zip")==null?"":rs.getString("zip"));
			points.put("enrollment",rs.getInt("enrollment"));
			result.add(points);
		}
		
		conn.close();
		return result;
	}
	public static Vector getRegionalStats(String region, Date periodBegin, Date periodEnd) {
				
		RegionalTeam rt = new RegionalTeam();
		rt.setAbbrv(region);
		rt.select();
		String regionalTeamId = rt.getRegionalTeamId();
		
		RegionalStat stat = new RegionalStat();
		return stat.selectList("fk_RegionalTeamID = '" + regionalTeamId + "'"+
						   " AND periodBegin > '" + org.alt60m.util.DateUtils.toSQLDate(periodBegin) + "'"+
						   " AND periodEnd < '" + org.alt60m.util.DateUtils.toSQLDate(periodEnd) + "'"+
						   " ORDER BY periodEnd ASC");		
	}

	public static RegionalTeam getRegionalTeam(String region) {
		RegionalTeam rt = new RegionalTeam();
		rt.setRegion(region);
		rt.select();
		return rt;
	}
	
	public static Vector listStaffByLastName(String subString) {
		subString = subString.replaceAll("'", "''");  // Takes care of problem apostrophes in subString
		Staff s = new Staff();
		return s.selectList("UPPER(lastName) like '"+subString.toUpperCase()+"%' AND (removedFromPeopleSoft='N') ORDER BY lastName, firstName");
	}
	
	public static Collection listStaffHashByRegion(String region) {
		try {
			return org.alt60m.util.ObjectHashUtil.list(listStaffByRegion(region));
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static Collection shortListStaffHashByRegion(String region) {
		try {
			return org.alt60m.util.ObjectHashUtil.list(shortListStaffByRegion(region));
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static Collection shortListPersonHashByRegion(String region) {
		try {
			return org.alt60m.util.ObjectHashUtil.list(shortListPersonByRegion(region));
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	public static Collection<Staff> listStaffByRegion(String region) {
		try {
			Staff s = new Staff();
			return (Collection<Staff>) s.selectList("region = '" + region.toUpperCase() + "' AND (removedFromPeopleSoft='N') ORDER BY lastName");
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static Collection<ShortStaff> shortListStaffByRegion(String region) {
		try {
			ShortStaff s = new ShortStaff();
			return (Collection<ShortStaff>) s.selectList("region = '" + region.toUpperCase() + "' AND (removedFromPeopleSoft='N') ORDER BY lastName");
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static Collection<Person> shortListPersonByRegion(String region) {
		try {
			Person p=new Person();
			Vector <Person> collPerson=new Vector<Person>();
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String qry = "SELECT personID, preferredName, lastName  FROM ministry_person " +
							"WHERE lastName='"+region+"' and not(isSecure<=>'T') ";
							
			ResultSet rs = stmt.executeQuery(qry);
			while(rs.next()){
				p.setPersonID(rs.getInt("personID"));
				p.setPreferredName(rs.getString("preferredName"));
				p.setLastName(rs.getString("lastName"));
				collPerson.add(p);
				p=new Person();
			}
			return (Collection)collPerson;	} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static Collection<Hashtable<String, Object>> listStaffHashByLastName(String lastName) {
		try {
			Staff s = new Staff();
			return org.alt60m.util.ObjectHashUtil.list(s.selectList("UPPER(lastName) like '" + lastName.toUpperCase() + "%' AND (removedFromPeopleSoft='N') ORDER BY lastName, firstName"));
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
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
	public static Vector listStaffAndContactsByLastName(String search) {
		try {
			int bumpup=0;
			String key="";
			TreeMap<String,Contact>c=new TreeMap<String,Contact>();
			StringBuffer identities=new StringBuffer();
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String query2="SELECT ministry_staff.accountNo, ministry_staff.person_id as personID, ministry_staff.firstName, "
				+"ministry_staff.preferredName, ministry_staff.lastName, "
				+"ministry_staff.email, ministry_address.address1, ministry_address.address2, ministry_address.address3, "
				+"ministry_address.city, ministry_address.address4, ministry_address.state, ministry_address.zip, "
				+"ministry_address.country"
				+" FROM ministry_staff INNER JOIN ministry_address ON ministry_staff.fk_primaryAddress = ministry_address.AddressID " 
				
				+" WHERE UPPER(ministry_staff.lastName) like '" + search.toUpperCase() + "%' and not(ministry_staff.isSecure<=>'T') and ministry_staff.removedFromPeopleSoft='N'  ;";
			log.debug(query2);
			ResultSet rs2 = stmt2.executeQuery(query2);
			while (rs2.next()){
				
				Contact contact= new Contact();
				contact.setPersonID(rs2.getInt("personID"));
				contact.setAccountNo(rs2.getString("accountNo"));
				contact.setFirstName(rs2.getString("firstName"));
				contact.setLastName(rs2.getString("lastName"));
				contact.setPreferredName(rs2.getString("preferredName")==null?"":rs2.getString("preferredName"));
				contact.setEmail(rs2.getString("email"));
				if (contact.getPersonID()!=0){
					identities.append(" '"+contact.getPersonID()+"', ");
					}
				if(rs2.getString("lastName")!=null&&rs2.getString("firstName")!=null){
					bumpup=0;
					key=rs2.getString("lastName")+" "+rs2.getString("firstName")+bumpup;
					while(c.keySet().contains(key)){
					bumpup++;
					key=rs2.getString("lastName")+" "+rs2.getString("firstName")+bumpup;
					}
					c.put(key,contact);
				}
				}
			identities.append("''");
			
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String query="SELECT ministry_person.personID as personID, ministry_person.firstName as firstName,"+
			" ministry_person.preferredName as preferredName, ministry_person.lastName as lastName, max(mna1.email) as emailCurrent,  max(mna2.email) as emailPermanent"+
			" FROM (ministry_person Left JOIN ministry_newaddress mna1 "+
			" ON (ministry_person.personID = mna1.fk_PersonID and mna1.addressType='current' )Left JOIN ministry_newaddress mna2"+
			" ON (ministry_person.personID = mna2.fk_PersonID and mna2.addressType='permanent' )) " +
			" inner join simplesecuritymanager_user ssm on ministry_person.fk_ssmUserId=ssm.userID "+
			" WHERE (ministry_person.personID not in ("+identities.toString()+")) and not(ministry_person.isSecure<=>'T') and UPPER(ministry_person.lastName) like '" + search.toUpperCase() + "%' and ssm.userID is not null and ssm.userID<>'' group by ministry_person.personID ;";
			log.debug(query);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()){
				Contact contact= new Contact();
				contact.setPersonID(rs.getInt("personID"));
				contact.setFirstName(rs.getString("firstName"));
				contact.setLastName(rs.getString("lastName"));
				contact.setPreferredName(rs.getString("preferredName")==null?"":rs.getString("preferredName"));
				contact.setEmail(((rs.getString("emailCurrent")==null)||(rs.getString("emailCurrent").equals("")))?
						(((rs.getString("emailPermanent")==null)||(rs.getString("emailPermanent").equals("")))?
								""
								:
								rs.getString("emailPermanent"))
						:
						rs.getString("emailCurrent"));
				if(rs.getString("lastName")!=null&&rs.getString("firstName")!=null&&!contact.getEmail().equals("")){
					bumpup=0;
					key=rs.getString("lastName")+" "+rs.getString("firstName")+bumpup;
					while(c.keySet().contains(key)){
					bumpup++;
					key=rs.getString("lastName")+" "+rs.getString("firstName")+bumpup;
					}
					c.put(key,contact);
				}
				}
			
			
			Vector<Contact>result=new Vector<Contact>();
			Iterator iter=c.keySet().iterator();
			while(iter.hasNext()){
				result.add(c.get(iter.next()));
			}
			
			return result;
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	public static Vector<Statistic> listStatsForTargetArea(String targetAreaId, Date start, Date end) {
		Activity a = new Activity();
		a.setTargetAreaId(targetAreaId);
		Vector activityList = a.selectList("fk_targetAreaID IN (" + targetAreaId + ")");
		List<String> activityIdList = new Vector<String>();
		for (Iterator i = activityList.iterator(); i.hasNext();) {
			Activity act = (Activity)i.next();
			activityIdList.add(act.getActivityId()); 
		}
		String activityIdString = org.alt60m.util.TextUtils.listToCommaDelimitedQuotedString(activityIdList);
		Statistic stat = new Statistic();
		Vector<Statistic> v = (Vector<Statistic>) stat.selectList("fk_Activity IN (" + activityIdString + ") "
										+ "AND periodBegin >= '" + org.alt60m.util.DateUtils.toSQLDate(start) + "' "
										+ "AND periodEnd <= '" + org.alt60m.util.DateUtils.toSQLDate(end) + "' "
										+ "ORDER BY periodEnd");
		return  v;
	}
	
	@SuppressWarnings("unchecked")
	public static Vector listStatsForTargetArea(String targetAreaId, Date start, Date end, String strategy){
		Activity a = new Activity();
		Vector activityList = a.selectList("fk_targetAreaID = " + targetAreaId + " " +
											"AND strategy ='"+strategy+"'");
		List<String> activityIdList = new Vector<String>();
		for (Iterator i = activityList.iterator(); i.hasNext();) {
			Activity act = (Activity)i.next();
			activityIdList.add(act.getActivityId()); 
		}
		String activityIdString = org.alt60m.util.TextUtils.listToCommaDelimitedQuotedString(activityIdList);
		Statistic stat = new Statistic();
 		Vector<Statistic> v = (Vector<Statistic>) stat.selectList("fk_Activity IN (" + activityIdString + ") "
										+ "AND periodBegin >= '" + org.alt60m.util.DateUtils.toSQLDate(start) + "' "
										+ "AND periodEnd <= '" + org.alt60m.util.DateUtils.toSQLDate(end) + "' "
										+ "ORDER BY periodEnd");
 		return  v;
	}
	
	public static Vector listBridgesStatsForTargetArea(String targetAreaId, Date start, Date end, String strategy, String peopleGroup){
		
		String pgQueryBit="";
		if (!strategy.equals("BR"))//no lookup by peopleGroup for non-Bridges
		{
			pgQueryBit="";
		}
		else if ((peopleGroup.equals("null"))||(peopleGroup==null)||(peopleGroup.equals(""))||(peopleGroup.equals("(Other Internationals)")))//many to many equivalence for blanks
		{
			pgQueryBit= "AND ((peopleGroup is Null) or (peopleGroup='') or (peopleGroup='null') or (peopleGroup='(Other Internationals)'))";
		}
		else //we have a specific name
		{
			pgQueryBit="AND peopleGroup = '"+peopleGroup+"'";
		}
		
		Activity a = new Activity();
		Vector activityList = a.selectList("fk_targetAreaID = " + targetAreaId + " " +
											"AND strategy ='" + strategy+"'" );
		List<String> activityIdList = new Vector<String>();
		for (Iterator i = activityList.iterator(); i.hasNext();) {
			Activity act = (Activity)i.next();
			activityIdList.add(act.getActivityId()); 
		}
		String activityIdString = org.alt60m.util.TextUtils.listToCommaDelimitedQuotedString(activityIdList);
		Statistic stat = new Statistic();
 		Vector<Statistic> v = (Vector<Statistic>) stat.selectList("fk_Activity IN (" + activityIdString + ") "
										+ "AND periodBegin >= '" + org.alt60m.util.DateUtils.toSQLDate(start) + "' "
										+ "AND periodEnd <= '" + org.alt60m.util.DateUtils.toSQLDate(end) + "' "
										+pgQueryBit+" "
										+ "ORDER BY periodEnd");
 		return  v;
	}
	
	public static int getActivityCount() {
		try{
			Activity act = new Activity();
			String qry = "SELECT count(*) from ministry_activity WHERE status in ('AC', 'PI', 'KE', 'LA', 'TR')";
			return org.alt60m.util.ObjectHashUtil.countIt(act, qry);
		} catch (Exception e) {
			log.error(e, e);
			return 0;
		}
	}
	public static int getActivityCountCurrent() {
		try{
			Activity act = new Activity();
			String qry = "SELECT count(*) from ministry_activity WHERE status in ('AC', 'LA', 'TR')";
			return org.alt60m.util.ObjectHashUtil.countIt(act, qry);
		} catch (Exception e) {
			log.error(e, e);
			return 0;
		}
	}
	
	public static int getReportedCnt(Date since) {
		try{
			Activity act = new Activity();
			String qry = "SELECT count(*) from ministry_activity WHERE periodBegin > '" + org.alt60m.util.DateUtils.toSQLDate(since) + "'";
			return org.alt60m.util.ObjectHashUtil.countIt(act, qry);
		} catch (Exception e) {
			log.error(e, e);
			return 0;
		}
	}
	
	public static Vector getAllTargetAreasByRegion(String region) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(region) like '%"+region.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) ORDER BY name");
	}
	public static Vector getAllTargetAreasByState(String state) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(state) like '%"+state.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) ORDER BY name");
	}
	
	
	public static Vector getAllTargetAreasByStateAndZip(String state, int number) {
		TargetArea ta = new TargetArea();
		
		//prints out the rest of the CA area besides San Fransisco Bay and LA / San Diego Area
		if(state.equals("CA") && number == 3){
			return ta.selectList("UPPER(state)like '%"+state.toUpperCase()+"%' "
				+ " and (zip <= " + getHigherBoundZipCode(state, number)
				+ " and zip > " + getLowerBoundZipCode(state, number)
 				+ ") OR (zip <= " + getHigherBoundZipCode(state, number+1)
				+ " and zip > " + getLowerBoundZipCode(state, number+1)
				+ ")and (isClosed<> 'T' or isClosed is NULL) ORDER BY name");
		}
		
		//prints out the rest of the New York Area (besides Metro)
		else if(state.equals("NY") && number == 2) {
			
			return ta.selectList("UPPER(state)like '%"+state.toUpperCase()+"%' "
					+ " and zip <= " + getHigherBoundZipCode(state, number)
					+ " and zip > " + getLowerBoundZipCode(state, number)
					+ "and (isClosed<> 'T' or isClosed is NULL) ORDER BY name");
		}
	
		//works for all test cases
		else {
			return ta.selectList("UPPER(state)like '%"+state.toUpperCase()+"%' "
					+ " and zip <= " + getHigherBoundZipCode(state, number)
					+ " and zip > " + getLowerBoundZipCode(state, number)
					+ "and (isClosed<> 'T' or isClosed is NULL) ORDER BY name");
		}
	}
	public static Hashtable<String,Integer> getActivityCountByParametersAndStrategies(String type, String region, String teamID, String targetAreaID, Collection<String> strategies,String periodEnd) {
		try{
			Hashtable<String,Integer> result=new Hashtable<String,Integer>();
		
			
			String queryPortion=" lastStatus.status in ('AC','TR','LA')  and ministry_activity.strategy in (";
			Iterator strategIt=strategies.iterator();
			while(strategIt.hasNext())
			{
			queryPortion+="'"+strategIt.next()+"'";
			if (strategIt.hasNext()) {queryPortion+=", ";}
			else {queryPortion+=") ";}
			}
			if(type.equals("targetarea")){
				queryPortion+=" and ministry_targetarea.targetAreaID = '"+targetAreaID+"'";
				}
			else if (type.equals("national")){
				queryPortion+="";
				
				}
			else if (type.equals("regional")){
				queryPortion+=" and ministry_targetarea.region = '"+region+"'";
				}
			else if (type.equals("locallevel")){
				queryPortion+=" and ministry_locallevel.teamID = '"+teamID+"'";
				}
			
			
			
			
			String movementsQuery =" select count(rows.id) as counted from (SELECT ministry_activity.ActivityID as id  FROM "+
			" (ministry_activity INNER JOIN ministry_targetarea ON ministry_activity.fk_targetAreaID = ministry_targetarea.targetAreaID) "+
			" INNER JOIN ministry_locallevel ON ministry_activity.fk_teamID = ministry_locallevel.teamID  LEFT JOIN  "+
			" (SELECT ministry_activity_history.activity_id as activity_id, ministry_activity_history.to_status as status, "+
			" ministry_activity_history.period_begin as periodBegin FROM	(	SELECT ministry_activity_history.activity_id as activity_id, "+
			" MAX(ministry_activity_history.period_begin) as periodBegin  FROM ministry_activity_history WHERE "+
			" (ministry_activity_history.period_begin<="+periodEnd+" and ministry_activity_history.toStrategy Is Null)   GROUP BY ministry_activity_history.activity_id ) lastDates "+
			" INNER JOIN ministry_activity_history  ON (lastDates.activity_id=ministry_activity_history.activity_id AND "+
			" lastDates.periodBegin=ministry_activity_history.period_begin)) lastStatus  ON ministry_activity.ActivityID=lastStatus.activity_id  "+
			" WHERE  "+queryPortion+"   GROUP BY ministry_targetarea.targetAreaID,  ministry_activity.strategy )rows;";
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement movementsStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			
			log.debug("movementsQuery: "+movementsQuery);
			ResultSet movementsRS = movementsStmt.executeQuery(movementsQuery);
			result.put("movements",0 );
			if(movementsRS.next()){
				result.put("movements", movementsRS.getInt("counted"));
			}
			String enrollmentQuery = " SELECT max(ministry_targetArea.enrollment)  FROM "+
			" (ministry_activity INNER JOIN ministry_targetarea ON ministry_activity.fk_targetAreaID = ministry_targetarea.targetAreaID) "+
			" INNER JOIN ministry_locallevel ON ministry_activity.fk_teamID = ministry_locallevel.teamID  LEFT JOIN  "+
			" (SELECT ministry_activity_history.activity_id as activity_id, ministry_activity_history.to_status as status, "+
			" ministry_activity_history.period_begin as periodBegin FROM	(	SELECT ministry_activity_history.activity_id as activity_id, "+
			" MAX(ministry_activity_history.period_begin) as periodBegin  FROM ministry_activity_history WHERE "+
			" (ministry_activity_history.period_begin<="+periodEnd+" and ministry_activity_history.toStrategy Is Null)  GROUP BY ministry_activity_history.activity_id ) lastDates "+
			" INNER JOIN ministry_activity_history  ON (lastDates.activity_id=ministry_activity_history.activity_id AND "+
			" lastDates.periodBegin=ministry_activity_history.period_begin)) lastStatus  ON ministry_activity.ActivityID=lastStatus.activity_id  "+
					" WHERE  "+queryPortion+" group by ministry_targetArea.targetAreaID ;";
			Statement enrollmentStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			log.debug("enrollmentQuery: "+enrollmentQuery);
			ResultSet enrollmentRS = enrollmentStmt.executeQuery(enrollmentQuery);
			result.put("enrollment", 0);
			while(enrollmentRS.next()){
				result.put("enrollment", result.get("enrollment")+enrollmentRS.getInt(1));
			}
			return result;
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	
	public static Hashtable<String,Integer> getActivityCountByRegionAndStrategies(String region, Collection<String> strategies) {//will be deprecated by getActivityCountByParametersAndStrategies  
		try{
			String queryToMatch=" ministry_activity.strategy in ('FS', 'GK', 'WS', 'CL', 'AA', 'KC', 'BR', 'OT', 'IN', 'II', 'VL', 'IE', 'ID') and  lastStatus.status in ('AC','TR','LA')  and ministry_targetarea.region = 'NW' ";
			String queryPortion=" lastStatus.status in ('AC','TR','LA')  and ministry_activity.strategy in (";
			Iterator strategIt=strategies.iterator();
			while(strategIt.hasNext())
			{
			queryPortion+="'"+strategIt.next()+"'";
			if (strategIt.hasNext()) queryPortion+=", ";
			}
			queryPortion+=") and ministry_targetarea.region in (";
			if(!region.equals("National")){
				queryPortion+="'"+region+"'";
			}
			else
			{
				queryPortion+="'NE', 'SW', 'SE', 'NW', 'UM', 'GL', 'GP', 'RR', 'MA', 'MS'";
			}
			queryPortion+=")";
			
			
			String movementsQuery =" select count(rows.id) from (SELECT ministry_activity.ActivityID as id FROM "+
			" (ministry_activity INNER JOIN ministry_targetarea ON ministry_activity.fk_targetAreaID = ministry_targetarea.targetAreaID) "+
			" INNER JOIN ministry_locallevel ON ministry_activity.fk_teamID = ministry_locallevel.teamID  LEFT JOIN  "+
			" (SELECT ministry_activity_history.activity_id as activity_id, ministry_activity_history.to_status as status, "+
			" ministry_activity_history.period_begin as periodBegin FROM	(	SELECT ministry_activity_history.activity_id as activity_id, "+
			" MAX(ministry_activity_history.period_begin) as periodBegin  FROM ministry_activity_history WHERE "+
			" ministry_activity_history.toStrategy Is Null  GROUP BY ministry_activity_history.activity_id ) lastDates "+
			" INNER JOIN ministry_activity_history  ON (lastDates.activity_id=ministry_activity_history.activity_id AND "+
			" lastDates.periodBegin=ministry_activity_history.period_begin)) lastStatus  ON ministry_activity.ActivityID=lastStatus.activity_id  "+
			" WHERE  "+queryPortion+"   GROUP BY ministry_targetarea.targetAreaID,  ministry_activity.strategy )rows;";
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement movementsStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			log.debug(movementsQuery);
			ResultSet movementsRS = movementsStmt.executeQuery(movementsQuery);
			Hashtable<String,Integer> result=new Hashtable<String,Integer>();
			result.put("movements", 0);
			while(movementsRS.next()){
				result.put("movements", result.get("movements")+movementsRS.getInt(1));
			}
			
			String enrollmentQuery = "SELECT Max(enrollment) from ministry_activity INNER JOIN ministry_targetarea on ministry_activity.fk_targetAreaID=ministry_targetarea.targetAreaID WHERE status in ('AC', 'LA', 'TR') "+queryPortion+" group by targetAreaID ;";
			Statement enrollmentStmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet enrollmentRS = enrollmentStmt.executeQuery(enrollmentQuery);
			result.put("enrollment", 0);
			while(enrollmentRS.next()){
				result.put("enrollment", result.get("enrollment")+enrollmentRS.getInt(1));
			}
			
			return result;
			
		} catch (Exception e) {
			log.error(e, e);
			return null;
		}
	}
	public static String getLowerBoundZipCode(String state, int number) {
		if(state.equals("CA")) {
			if(number == 1) {return "'94000'";}//san fransisco bay area
			if(number == 2) {return "'90000'";}//LA / San Diego Area
			if(number == 3) {return "'93000'";}//other area
			if(number == 4) {return "'95000'";}//other area
		}
		
		if(state.equals("NY")) {
			if(number == 1) {return "'10000'";}//New York City Metro
			if(number == 2) {return "'12700'";}//area for non metro
		}
		
		return null;
	}

	public static String getHigherBoundZipCode(String state, int number) {	
		if(state.equals("CA")) {
			if(number == 1) {return "'94999'";}//san fransisco bay area
			if(number == 2) {return "'92999'";}//LA / San Diego Area
			if(number == 3) {return "'93999'";}//other area
			if(number == 4) {return "'95999'";}//other area
		}
		
		if(state.equals("NY")) {
			if(number == 1) {return "'12699'";}//New York City Metro
			if(number == 2) {return "'14999'";}//area for non metro
		}
		
		return null;
		
	}
	
	
	public static Vector getAllTargetAreasByName(String name) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(name) like '%"+name.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) ORDER BY name");
	}
	public static Vector getAllTargetAreasByCity(String city) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(city) like '%"+city.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) ORDER BY city");
	}
	public static Vector getAllTargetAreasByZip(String zip) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(zip) like '%"+zip.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) ORDER BY zip");
	}
	public static Vector getAllTargetAreasByCountry(String country) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(country) like '%"+country.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) ORDER BY country");
	}
	public static Vector getNonSecureTargetAreasByRegion(String region) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(region) like '%"+region.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) and isSecure = 'F' ORDER BY name");
	}
	public static Vector getNonSecureTargetAreasByState(String state) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(state) like '%"+state.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) and isSecure = 'F' ORDER BY name");
	}
	public static Vector getNonSecureTargetAreasByName(String name) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(name) like '%"+name.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) and isSecure = 'F' ORDER BY name");
	}

	public static Vector getNonSecureTargetAreasByCity(String city) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(city) like '%"+city.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) and isSecure = 'F' ORDER BY city");
	}
	public static Vector getNonSecureTargetAreasByZip(String zip) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(zip) like '%"+zip.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) and isSecure = 'F' ORDER BY zip");
	}
	public static Vector getNonSecureTargetAreasByCountry(String country) {
		TargetArea ta = new TargetArea();
		return ta.selectList("UPPER(country) like '%"+country.toUpperCase()+"%' "
				+ "and (isClosed<> 'T' or isClosed is NULL) and isSecure = 'F' ORDER BY country");
	}
	public static Vector getTargetAreasByRegion(String region, boolean showSecureCampuses, boolean showNeedsApproval) {
		TargetArea ta = new TargetArea();
		return ta.selectList("region = '" + region + "'" +
								(showSecureCampuses ? " AND isSecure = 'T'" : "") +
								(showNeedsApproval ? "" : " AND isApproved = 'T'") +
								"and (isClosed<> 'T' or isClosed is NULL) ORDER BY name");
	}
	public static Vector getTargetAreasByRegion(String region) {
		return getTargetAreasByRegion(region, false, false);
	}
	public static Vector<Hashtable<String,String>>getTargetAreasByRegionWithoutStrategy(String region, String strategy) throws Exception{
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String qry="select mta.targetAreaId as id, concat(mta.name,' (',if(mta.city is not null,mta.city,''),if(mta.state is not null and not(mta.state<=>'') ,concat(',',mta.state),if(mta.country is not null and not(mta.country<=>''),concat(',',mta.country),'')),')') as name from ministry_targetArea mta left join "+
					"(Select ma.fk_targetAreaId as id  from ministry_activity ma "+
					" where ma.strategy = '"+strategy+"' and ma.status <> 'IN'  group by ma.fk_targetAreaId) bad "+
					" on mta.targetAreaId=bad.id where bad.id is null and mta.name is not null and mta.region='"+
					region+"' and mta.name<>'' and not(mta.isClosed<=>'T') and (mta.eventType is Null or mta.eventType<=> '') and mta.isSecure='F' order by mta.name ;";
					
		log.debug(qry);
		ResultSet rs = stmt.executeQuery(qry);
		Vector<Hashtable<String,String>>tas=new Vector<Hashtable<String,String>>();
		while(rs.next()){
			Hashtable ta=new Hashtable<String,String>();
			
			ta.put("targetareaid", rs.getString("id"));
			ta.put("name", rs.getString("name"));
			tas.add(ta);
		}
		return tas;
	}
	public static Vector getActivityForTargetAreaByStrategy(String targetAreaId, String strategy) {
		Activity a = new Activity();
		a.setTargetAreaId(targetAreaId);
		a.setStrategy(strategy);
		return a.selectList();
	}
	
	public static boolean doesStrategyExistForTargetArea(String targetAreaId, String strategy) {
		Activity a = new Activity();
		a.setTargetAreaId(targetAreaId);
		a.setStrategy(strategy);
		Vector v1 = a.selectList();
		if(!v1.isEmpty()) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public static boolean doesStatusExistForTargetArea(String targetAreaId, String status) {
		Activity a = new Activity();
		a.setTargetAreaId(targetAreaId);
		a.setStatus(status);
		Vector v1 = a.selectList();
		if(!v1.isEmpty()) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public static int isCampusActive(Hashtable h) {
		
		   if(doesStrategyExistForTargetArea( (String)h.get("TargetAreaID"),"CA")){
			   if(    doesStatusExistForTargetArea( (String)h.get("TargetAreaID"),"TR")
				   || doesStatusExistForTargetArea( (String)h.get("TargetAreaID"),"LA") 
				   || doesStatusExistForTargetArea( (String)h.get("TargetAreaID"),"KE")      ){
				   
				   return 1; }
		   }

		   else if(doesStatusExistForTargetArea( (String)h.get("TargetAreaID"),"AC")){
			   if(    doesStrategyExistForTargetArea( (String)h.get("TargetAreaID"),"SC")
				   || doesStrategyExistForTargetArea( (String)h.get("TargetAreaID"),"II")
				   || doesStrategyExistForTargetArea( (String)h.get("TargetAreaID"),"IE")
				   || doesStrategyExistForTargetArea( (String)h.get("TargetAreaID"),"ID")   ){
				   
				   return 1; }
			   
		
		   }
		   
		   return 0;
		   
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
			" ms.invldStudents as size "+
			" from ministry_targetarea mt inner join ministry_activity ma on ma.fk_targetareaid=mt.targetareaid "+
			" inner join ministry_movement_contact mmc on mmc.ActivityID=ma.ActivityID "+
			" inner join ministry_locallevel ml on ml.teamID=ma.fk_teamID "+
			" inner join ministry_statistic ms  on ms.fk_Activity=ma.ActivityID "+
			" inner join (select Max(lms.StatisticID) as id from ministry_statistic lms group by lms.fk_Activity ) lastStat "+
			"  on lastStat.id=ms.StatisticID "+
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
			" ms.invldStudents as size "+
			" from ministry_targetarea mt inner join ministry_activity ma on ma.fk_targetareaid=mt.targetareaid "+
			" inner join ministry_locallevel ml on ml.teamID=ma.fk_teamID "+
			" inner join ministry_statistic ms  on ms.fk_Activity=ma.ActivityID "+
			" inner join (select Max(lms.StatisticID) as id from ministry_statistic lms group by lms.fk_Activity ) lastStat "+
			"  on lastStat.id=ms.StatisticID "+
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
			" ms.invldStudents as size "+
			" from ministry_targetarea mt inner join ministry_activity ma on ma.fk_targetareaid=mt.targetareaid "+
			" inner join ministry_locallevel ml on ml.teamID=ma.fk_teamID "+
			" inner join ministry_statistic ms  on ms.fk_Activity=ma.ActivityID "+
			" inner join (select Max(lms.StatisticID) as id from ministry_statistic lms group by lms.fk_Activity ) lastStat "+
			"  on lastStat.id=ms.StatisticID "+
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
	
	public static void savePersonContact (String personID, String activityId){
		try 
		{
			if(!(new Person(personID)).getIsSecure()){
			Connection conn = DBConnectionFactory.getDatabaseConn();
			
			String query="INSERT INTO ministry_movement_contact (personID, ActivityID) VALUES ("+personID+","+activityId+");";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
			}
			else
			{
				log.debug("Not saved as movement contact: secure person record");
			}
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}
	public static void saveTeamMember (String personID, String teamID){
		try 
		{
			if(!(new Person(personID)).getIsSecure()){
			Connection conn = DBConnectionFactory.getDatabaseConn();
			String query="INSERT INTO ministry_missional_team_member (personID, teamID) VALUES ("+personID+","+teamID+");";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
			}
			else
			{
				log.debug("Not saved as team member: secure person record");
			}
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}
	public static void removePersonContact( String personID,String activityId){
		try 
		{
			Connection conn = DBConnectionFactory.getDatabaseConn();
			String query=" DELETE FROM ministry_movement_contact "+
			" WHERE ministry_movement_contact.personID="+personID+" AND ministry_movement_contact.ActivityID="+activityId+";";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}
	public static void removeTeamMember( String personID,String teamID){
		try 
		{
			Connection conn = DBConnectionFactory.getDatabaseConn();
			String query=" DELETE FROM ministry_missional_team_member "+
			" WHERE ministry_missional_team_member.personID="+personID+" AND ministry_missional_team_member.teamID="+teamID+";";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
	}
	public static void removeAllTeamAssociations( String personID,String teamID){
		try 
		{
			Connection conn = DBConnectionFactory.getDatabaseConn();
			String query=" DELETE FROM ministry_missional_team_member "+
			" WHERE ministry_missional_team_member.personID="+personID+";";
			log.debug(query);
			Statement stmt=conn.prepareStatement(query);
			stmt.executeUpdate(query);
		}
		catch (Exception e) 
		{
			log.error(e, e);
		}
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