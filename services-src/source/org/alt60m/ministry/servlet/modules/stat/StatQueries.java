package org.alt60m.ministry.servlet.modules.stat;

import java.text.SimpleDateFormat;
import java.util.*;

import org.alt60m.ministry.model.dbio.*;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import org.alt60m.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StatQueries extends org.alt60m.ministry.servlet.modules.InfoBaseModuleQueries {
	private static Log log = LogFactory.getLog(StatController.class);
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
}