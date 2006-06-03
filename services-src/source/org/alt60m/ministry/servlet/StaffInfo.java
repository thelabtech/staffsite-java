package org.alt60m.ministry.servlet;

import org.alt60m.ministry.model.dbio.*;
import org.alt60m.util.DBConnectionFactory;
import java.util.*;
import java.sql.*;

public class StaffInfo {
    
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

}
