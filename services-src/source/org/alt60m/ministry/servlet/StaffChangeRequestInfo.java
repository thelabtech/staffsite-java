package org.alt60m.ministry.servlet;

import org.alt60m.ministry.model.dbio.*;
import java.util.Collection;

public class StaffChangeRequestInfo {

    public StaffChangeRequest getStaffChangeRequestObject(String id) throws  Exception {
    	return new StaffChangeRequest(id);
    }

    public Collection getPendingRequests(java.sql.Date adate) throws Exception {
	    StaffChangeRequest scr = new StaffChangeRequest();
	    return  scr.selectList("effectiveDate <= '"+org.alt60m.util.DateUtils.toSQLDate(adate)+"' AND appliedDate IS NULL");
    }
}
