package org.alt60m.ministry.servlet.modules.person;

import java.text.SimpleDateFormat;
import java.util.*;

import org.alt60m.ministry.model.dbio.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import org.alt60m.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PersonQueries extends org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries {
	private static Log log = LogFactory.getLog(PersonController.class);
	public static Vector<Hashtable<String,Object>>getRegionalSpecialties(String region) throws SQLException{
		Vector<Hashtable<String,Object>>result=new Vector<Hashtable<String,Object>>();
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String qry="SELECT ministry_staff.person_id as personID, ministry_staff.accountNo as accountNo, "+
		" ministry_staff.region as region, if(ministry_staff.strategy in ('FLD','Staffed','Catalytic'),'FLD',ministry_staff.strategy) as strategy, ministry_staff.jobTitle as title, ministry_staff.firstName as firstName,"+
		" ministry_staff.preferredName as preferredName, ministry_staff.lastName as lastName, ministry_staff.email as email,"+
		" ministry_staff.workPhone as workPhone, ministry_staff.mobilePhone as cellPhone "+
		" FROM ministry_staff  "+
		" WHERE (((ministry_staff.jobStatus)='Full Time Staff') AND ((ministry_staff.ministry)='Campus Ministry') AND ((ministry_staff.removedFromPeopleSoft)='N')) "+
		" and (((ministry_staff.jobTitle) Not In ('Director (Direct Ministry)','Team Leader (Direct Ministry)','Team Member - Mom','Field Staff In Training','Raising Support Full Time','Seminary Staff','Field Staff','Local Leader'))) "+
		" and ministry_staff.region='"+region+"' "+
		" Order by field(if(ministry_staff.strategy in ('FLD','Staffed','Catalytic'),'FLD',ministry_staff.strategy),'National Director','Operations','HR','Fund Dev','FLD','ESM','DES','EPI','NTN','BRD','WSN','R&D','SR','SV','SSS','JPO','LHS','') asc, ministry_staff.jobTitle; ";
		ResultSet rs = stmt.executeQuery(qry);
		while (rs.next()){
			Hashtable<String,Object> h=new Hashtable<String,Object>();
			h.put("id",rs.getString("personID")+"");
			h.put("accountNo",rs.getString("accountNo")+"");
			h.put("name", (rs.getString("preferredName")!=null?rs.getString("preferredName"):rs.getString("firstName"))+" "+rs.getString("lastName")+"");
			h.put("firstName",rs.getString("firstName")+"");
			h.put("lastName",rs.getString("lastName")+"");
			h.put("preferredName",rs.getString("preferredName")+"");
			h.put("email",rs.getString("email")+"");
			h.put("title",rs.getString("title")+"");
			h.put("strategy",rs.getString("strategy")+"");
			h.put("workPhone",rs.getString("workPhone")+"");
			h.put("cellPhone",rs.getString("cellPhone")+"");
			log.debug(h.toString());
			result.add(h);
		}
		return result;
	}
}