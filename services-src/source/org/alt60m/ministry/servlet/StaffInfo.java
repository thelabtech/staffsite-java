package org.alt60m.ministry.servlet;

import org.alt60m.ministry.model.dbio.*;
import org.alt60m.util.DBConnectionFactory;
import org.alt60m.util.DBHelper;
import org.alt60m.util.ObjectHashUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.*;
import java.sql.*;

public class StaffInfo {
    private static Log log = LogFactory.getLog(StaffInfo.class);
	
    private final String STAFF_TABLE = "ministry_staff";

    public Collection listStaffByLastName(String subString) throws Exception {
	    return InfoBaseQueries.listStaffByLastName(subString);
    }
    
    public Collection listStaffHashByLastName(String subString) throws Exception {
	    return InfoBaseQueries.listStaffHashByLastName(subString);
    }
    
    public Collection listStaffByRegion(String region) throws Exception {
		return InfoBaseQueries.listStaffByRegion(region);
    }

    public Collection getCampusHRRDs(String region) throws Exception {
	    Staff s = new Staff();
	    s.setPosition("Regional Director");
	    s.setStrategy("HR");
	    s.setRegion(region);
		s.setMinistry("Campus Ministry");
		s.setRemovedFromPeopleSoft("N");
	    return s.selectList();
    }

    public Collection getCampusHRNDs() throws Exception {
		Staff s = new Staff();
		s.setPosition("National Director");
		s.setStrategy("HR");
		s.setMinistry("Campus Ministry");
		s.setRemovedFromPeopleSoft("N");
		return s.selectList();
    }

    public boolean isHumanResources(String id) throws Exception {
		Staff s = new Staff();
		s.setAccountNo(id);
		if ((id!=null) && (!s.isPKEmpty())&&(s.select())) 
			if("HR".equalsIgnoreCase(s.getStrategy())) return true;
			else return false;
		else return false;
    }

    public String[] getAllAccountNumbers() throws Exception {
	    Staff s = new Staff();
	    List staffList = s.selectSQLList("SELECT accountNo as accountNo from "+STAFF_TABLE+" as staff WHERE (removedFromPeopleSoft='N') ORDER BY lastName");
	    int staffSize = staffList.size();
	    String[] results = new String[staffSize];
	    Iterator staff = staffList.iterator();
	    for(int cnt=0;cnt<staffSize;cnt++) {
			results[cnt]=(((Staff)staff.next()).getAccountNo());
	    }
	    return results;
    }

    public String[] getAccountNumbers(String condition) throws Exception {
		Staff s = new Staff();
		List staffList = s.selectSQLList("SELECT accountNo as accountNo from "+STAFF_TABLE+" as staff WHERE "+ condition + " AND (removedFromPeopleSoft='N') ORDER BY lastName");
	    String[] results = new String[staffList.size()];
	    Iterator staffIterator = staffList.iterator();
	    for(int cnt=0;cnt<staffList.size();cnt++) {
			results[cnt]=((Staff) staffIterator.next()).getAccountNo();
	    }
	    return results;
    }

    public String[] getDistinctFieldValues(String field) throws Exception {
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt1 = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		String query = "SELECT distinct " + field + " from "+ STAFF_TABLE + " WHERE (removedFromPeopleSoft='N') AND " + field + " is not null order by "+field;
		ResultSet distinctFields = stmt1.executeQuery(query);
		ResultSet count = stmt2.executeQuery("SELECT count(distinct " + field + ") from "+ STAFF_TABLE+" WHERE (removedFromPeopleSoft='N')");
		count.next();
	    String[] results = new String[count.getInt(1)];
		for(int cnt=0;distinctFields.next();cnt++) {
			results[cnt]= distinctFields.getString(field);
	    }
	    count.close();
	    distinctFields.close();
		stmt1.close();
		stmt2.close();
	    conn.close();
	    return results;
    }
    
	// 2/5/2003 AS Looks up a list of possible staff members for the application reference page
	public Collection getReferenceFindStaff(String firstName, String preferredName, String lastName, String city, String state) {
		Vector v = new Vector();
		Collection c = v;
		log.debug("info.getReferenceFindStaff(first=" + firstName + ", pref=" + preferredName + ", last=" + lastName + ", city=" + city + ", state=" + state + ")");

		try {
			if (lastName == null || "".equals(lastName)) {
				return c;
			}
			// if either name has an apostrophe in it, change to '' instead.
			firstName = DBHelper.escape(firstName);
			preferredName = DBHelper.escape(preferredName);
			lastName = DBHelper.escape(lastName);
			city = DBHelper.escape(city);

			// find matching staff, but be sure to exclude "secure" staff (those in closed countries)
			// also exclude people removed from peoplesoft (old records) to avoid duplicates like before marriage
			// This should be working the same as the FindStaff on the Payment pages.
			Staff staff = new Staff();
			Iterator staffiter = staff.selectList("isSecure <> 'T' AND removedFromPeopleSoft<>'Y' AND firstname like '" + firstName + "%' AND lastname like '" + lastName + "%' AND preferredname like '" + preferredName + "%' ORDER BY lastname").iterator();
			while (staffiter.hasNext()) {
				staff = (Staff) staffiter.next();
				if (staff.getPrimaryAddress() != null) {
					OldAddress address = staff.getPrimaryAddress();
					if (address.getCity().startsWith(city) && address.getState().startsWith(state)) {
						Hashtable staffHash = ObjectHashUtil.obj2hash(staff);
						staffHash.put("City", address.getCity());
						staffHash.put("State", address.getState());
						c.add(staffHash);
					}
				}
			}
			return c;
		} catch (Exception e) {
			log.error(e);
			return null;
		}
	}
	
	public static String doubleApostrophe(String target, int fromIndex) {
		return target.replace("'", "''").replace("\\", "\\\\");
	}

}
