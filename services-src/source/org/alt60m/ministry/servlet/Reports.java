package org.alt60m.ministry.servlet;

import java.util.*;

import org.alt60m.ministry.model.dbio.*;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import org.alt60m.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Reports {
	private static Log log = LogFactory.getLog(InfoBaseController.class);
	
	//the following strings are for getSuccessCriteriaReport() method. 
	private static String  conditionsPortion(String type, String region, String periodEnd, String periodBegin, String strategyList, String localLevelId, String targetAreaID){
		String queryPortion="";
		queryPortion="WHERE ("+
			" ministry_statistic.periodEnd < "+periodEnd+
			" AND ministry_statistic.periodEnd >="+periodBegin+
			" and ministry_activity.Strategy in ("+strategyList+") ";
			if (type.equals("locallevel")){
				queryPortion+=" and ministry_locallevel.teamID = '" + localLevelId + "' ";
			}
			else if (type.equals("regional")){
				queryPortion+=" and ministry_targetarea.region = '" + region+ "' ";
			}
			else if (type.equals("national"))
			{
				queryPortion+=" and (ministry_targetarea.region is not null) AND (ministry_targetarea.region <> '') ";
			}
			else if (type.equals("targetarea"))
			{
				queryPortion+=" and (ministry_targetarea.targetAreaID = '" + targetAreaID+ "') ";
			}
			queryPortion+=") "; 
			return queryPortion;
	}
	private static String groupPortion(String type){ 
		if(type.equals("national"))
		{
			return " GROUP BY ministry_targetarea.region ORDER BY ministry_targetarea.region";
		}
		else if(type.equals("targetarea"))
		{
			return " GROUP BY ministry_targetarea.name, ministry_activity.strategy, ministry_statistic.periodEnd, ministry_statistic.peopleGroup ORDER BY ministry_targetarea.name, ministry_activity.strategy, ministry_statistic.periodEnd, ministry_statistic.peopleGroup";
		}
		else
		{
		return " GROUP BY ministry_targetarea.name, ministry_activity.strategy, ministry_statistic.peopleGroup"+
				" ORDER BY ministry_targetarea.name, ministry_activity.strategy, ministry_statistic.peopleGroup ";
		}
	}
	private static String summingFieldsPortion(String type){
		String queryPortion="";
		queryPortion="SELECT "+
		
		" ministry_activity.ActivityID as activityID,"+
		" CAST(ministry_activity.periodBegin AS DATE) as activityPeriodBegin,"+
		" CAST(ministry_statistic.periodEnd AS DATE) as statPeriodEnd,"+
		" CAST(ministry_statistic.periodBegin AS DATE) as statPeriodBegin,"+
		" ministry_locallevel.teamID as localLevelId,"+
		" ministry_targetarea.region, "+
		" SUM(ministry_statistic.exposuresViaMedia) as exposuresViaMedia,"+
		" SUM(ministry_statistic.evangelisticOneOnOne) as evangelisticOneOnOne, "+
		" SUM(ministry_statistic.evangelisticGroup) as evangelisticGroup,"+
		" SUM(ministry_statistic.decisions) as decisionSum,"+
		" SUM(ministry_statistic.decisionsHelpedByOneOnOne) as decisionsPersonalEvangelismExposures, "+
		" SUM(ministry_statistic.decisionsHelpedByGroup) as decisionsGroupEvangelismExposures, "+
		" SUM(ministry_statistic.decisionsHelpedByMedia) as decisionsMediaExposures, "+
		" SUM(ministry_statistic.holySpiritConversations) as holySpirit, "+
		" SUM(ministry_statistic.laborersSent) as laborersSent, " +
		" ministry_statistic.peopleGroup, ";
		
		if (type.equals("targetarea")){					
			queryPortion+=" ministry_activity.status as status, "+
				
				
				" MAX(ministry_targetarea.TargetAreaID) targetAreaID,"+
				" MAX(ministry_targetarea.name) campusName,"+
				" ministry_activity.strategy, "+
				" ministry_statistic.periodEnd as rowid, "+
				" MAX(ministry_targetarea.enrollment) enrollment ";
		}
		
		else if (!type.equals("national")){					
			queryPortion+=" ministry_activity.status as status, "+
				
				
				" MAX(ministry_targetarea.TargetAreaID) targetAreaID,"+
				" MAX(ministry_targetarea.name) campusName,"+
				" ministry_activity.strategy, "+
				" ministry_activity.ActivityID as rowid,"+
				" MAX(ministry_targetarea.enrollment) enrollment ";
		}
		else
		{
			queryPortion+=" '' as status, "+
				
				
				" '' as targetAreaID, "+
				" '' as campusName,"+
				" 'CA' as strategy, "+
				" ministry_targetarea.region as rowid,"+
				" ''  as enrollment ";
		}
		
		return queryPortion;		
	}
	private static String summingTablesPortion=" from ministry_statistic left join "+
							" ministry_activity on (ministry_statistic.fk_Activity = ministry_activity.ActivityID) left join "+
							" ministry_locallevel on (ministry_locallevel.TeamID = ministry_activity.fk_TeamID) LEFT JOIN "+
							" ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID ";

	private static String demographicFieldsPortion(String type) { 
		String queryPortion="";
		if(type.equals("targetarea")){
			queryPortion="SELECT ministry_statistic.peopleGroup,"+
							" ministry_statistic.periodEnd as rowid, "+
							
							" ministry_targetarea.region,"+
							" ministry_targetarea.targetAreaID, "+
							" ministry_targetarea.name, "+
							" ministry_statistic.multipliers, "+
							" ministry_statistic.invldStudents, "+
							" ministry_statistic.ongoingEvangReln as Seekers,"+
							" ministry_statistic.studentLeaders, "+
							" ministry_statistic.periodEnd, "+
							" ministry_locallevel.region ";
		}
		else if(!type.equals("national")){
			queryPortion="SELECT ministry_statistic.peopleGroup,"+
							" ministry_activity.ActivityID as rowid, "+
							
							" ministry_targetarea.region,"+
							" ministry_targetarea.targetAreaID, "+
							" ministry_targetarea.name, "+
							" ministry_statistic.multipliers, "+
							" ministry_statistic.invldStudents, "+
							" ministry_statistic.ongoingEvangReln as Seekers,"+
							" ministry_statistic.studentLeaders, "+
							
							" ministry_locallevel.region ";
		}
		else
		{
			queryPortion="SELECT ministry_statistic.peopleGroup, "+
							" ministry_targetarea.region as rowid, "+
							" ministry_targetarea.region,"+
							" ministry_targetarea.targetAreaID, "+
							" ministry_targetarea.name, "+
							" SUM(ministry_statistic.multipliers) multipliers, "+
							" SUM(ministry_statistic.invldStudents) invldStudents, "+
							" SUM(ministry_statistic.ongoingEvangReln) as Seekers, "+
							" SUM(ministry_statistic.studentLeaders) studentLeaders,"+
							" ministry_locallevel.region ";
							
		}
		
				return queryPortion;
		}
	private static String demographicTablesPortion(String type, String periodEnd, String periodBegin) {
		return "FROM ministry_statistic INNER JOIN "+
					(!type.equals("targetarea")? //we skip this step for targetarea, since all weeks are shown
							" (SELECT ministry_statistic.peopleGroup as peopleGroup, "+
						" ministry_statistic.fk_Activity AS fk_Activity, "+
						" MAX(ministry_statistic.periodEnd) AS lastDate "+
						" FROM ministry_statistic WHERE ministry_statistic.periodEnd < " + periodEnd + 
						" AND ministry_statistic.periodEnd >= " + periodBegin + 
						" GROUP BY fk_Activity, ministry_statistic.peopleGroup) LastActivities"+
					" ON ministry_statistic.fk_Activity = LastActivities.fk_Activity "+
						" AND ministry_statistic.periodEnd = LastActivities.lastDate "+
						" and (((ministry_statistic.peopleGroup is null) and (LastActivities.peopleGroup is null)) "+
							" or (ministry_statistic.peopleGroup=LastActivities.peopleGroup)) LEFT JOIN "
						:
							"")+
			" ministry_activity on ministry_statistic.fk_Activity = ministry_activity.ActivityID LEFT JOIN "+
			" ministry_locallevel on ministry_locallevel.teamID = ministry_activity.fk_teamID LEFT JOIN "+
			" ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID ";
	}

	private static ReportRow statResultSet2ReportRow(ResultSet sums, ResultSet demos)throws Exception 
	{
			try{
		ReportRow row=new ReportRow();
		row.setRowid(sums.getString("rowid"));
		row.setActivityID(sums.getString("activityID"));
		row.setCampusName(sums.getString("campusName"));
		row.setStrategy(sums.getString("strategy"));
		row.setRegion(sums.getString("region"));
		row.setPeopleGroup(sums.getString("peopleGroup"));
		row.setStatus(sums.getString("status"));
		row.setTargetAreaID(sums.getString("targetAreaID"));
		row.setLocalLevelId(sums.getString("localLevelId"));
		row.setActivityPeriodBegin(sums.getString("activityPeriodBegin"));
		row.setStatPeriodEnd(sums.getString("statPeriodEnd"));
		row.setStatPeriodBegin(sums.getString("statPeriodBegin"));
		row.setPeopleGroup(sums.getString("peopleGroup"));
		row.setEnrollment(sums.getString("enrollment"));
		
		
		
		row.setEvangelisticOneOnOne(sums.getInt("evangelisticOneOnOne"));
		row.setEvangelisticGroup(sums.getInt("evangelisticGroup"));
		
		row.setExposuresViaMedia(sums.getInt("exposuresViaMedia"));
		row.setHolySpirit(sums.getInt("holySpirit"));
		
		row.setDecisions(sums.getInt("decisionSum"));
		row.setDecisionsPersonalEvangelismExposures(sums.getInt("decisionsPersonalEvangelismExposures"));
		row.setDecisionsGroupEvangelismExposures(sums.getInt("decisionsGroupEvangelismExposures"));
		
		row.setDecisionsMediaExposures(sums.getInt("decisionsMediaExposures"));
		row.setLaborersSent(sums.getInt("laborersSent"));
		
		row.setMultipliers(demos.getInt("multipliers"));
		row.setInvldStudents(demos.getInt("invldStudents"));
		row.setSeekers(demos.getInt("seekers"));
		row.setStudentLeaders(demos.getInt("studentLeaders"));
		return row;
	}catch (Exception e) {
		log.error("Failed to perform Reports.resultSet2ReportRow().", e);
        throw new Exception(e);
    }
	}
	
	private static String lastStatus(String periodEnd){
		return " (SELECT ministry_activity_history.activity_id as activity_id, ministry_activity_history.to_status as status"+
			" FROM	("+
			"	SELECT ministry_activity_history.activity_id as activity_id, MAX(ministry_activity_history.period_end) as periodEnd "+
			" FROM ministry_activity_history WHERE "+
			" (ministry_activity_history.period_end<='"+periodEnd+"') AND (ministry_activity_history.toStrategy Is Null) "+
			" GROUP BY ministry_activity_history.activity_id ) lastDates INNER JOIN ministry_activity_history "+
			" ON (lastDates.activity_id=ministry_activity_history.activity_id AND lastDates.periodEnd=ministry_activity_history.period_end)) lastStatus ";
	}
	private static String processedOrder( Vector<String> order){
		String processedOrder="";	
		Hashtable<String,String> orderCodes=new Hashtable<String,String>();
		
		orderCodes.put("strategy","strategy");
		orderCodes.put("status","field((if(lastStatus.status is null,ministry_activity.status,lastStatus.status)),'AC','TR','LA','KE','PI','FR') ");
		orderCodes.put("team","teamName");
		orderCodes.put("campus","campusName");
		orderCodes.put("city","country, state, city ");
		for (String o : order){
				if (orderCodes.keySet().contains(o)){
					processedOrder+=orderCodes.get(o)+", ";
				}
			}
		processedOrder=processedOrder.substring(0,processedOrder.length()-2);//trim final comma 
		return processedOrder;
	}
	
	private static String countReportQuery(String type, String region, String strategyList, String periodEnd, Vector<String> order){
		String group="";
		String address="";
		if (type.equals("movement")){
			group="ministry_targetarea.targetAreaID,  ministry_activity.strategy ";
			 address=" MAX(ministry_targetarea.city) as city,  MAX(ministry_targetarea.state) as state, MAX(ministry_targetarea.country) as country ";
		}
		else if (type.equals("location")){
			group="ministry_targetarea.targetAreaID ";
			 address="MAX(ministry_targetarea.city) as city,  MAX(ministry_targetarea.state) as state, MAX(ministry_targetarea.country) as country ";
		}
		else if (type.equals("team")){
			group="ministry_locallevel.teamID ";
			 address="MAX(ministry_locallevel.city) as city,  MAX(ministry_locallevel.state) as state, MAX(ministry_locallevel.country) as country ";
		}
		
		
		return "SELECT MAX(ministry_targetarea.name) as campusName, MAX(ministry_targetarea.isSecure) as isSecure,"+
			" MAX(ministry_targetarea.region) as region, if(lastStatus.status IS NULL, MAX(ministry_activity.status), MAX(lastStatus.status)) as status, "+
			" MAX(ministry_activity.strategy) as strategy, "+
			" MAX(ministry_locallevel.name) as teamName, MAX(ministry_locallevel.teamID) as teamID, MAX(ministry_targetarea.targetAreaID) as campusID, "+
			address+ //this portion of query generated based on type of report requested
			" FROM (ministry_activity INNER JOIN ministry_targetarea ON ministry_activity.fk_targetAreaID = ministry_targetarea.targetAreaID) "+
			" INNER JOIN ministry_locallevel ON ministry_activity.fk_teamID = ministry_locallevel.teamID "+
			" LEFT JOIN "+lastStatus(periodEnd)+" ON ministry_activity.ActivityID=lastStatus.activity_id "+
			" WHERE "+ 
			" ministry_activity.strategy in ("+strategyList+") and "+
			" ((ministry_activity.status in ('AC','TR','LA','KE','PI','FR')AND(lastStatus.status IS NULL)) OR (lastStatus.status in ('AC','TR','LA','KE','PI','FR'))) "+
			((!(region.equals(""))&& (!(region.toLowerCase().equals("national"))))? " and ministry_targetarea.region = '"+region+"' ":"")+
			" GROUP BY "+group+
			" ORDER BY "+ processedOrder( order)+
			";";
	}
	private static String convertStatus(String code){
		Hashtable<String,String> codes=new Hashtable<String,String>();
		codes.put("IN","Inactive");
		codes.put("FR","Forerunner");
		codes.put("PI","Pioneering");
		codes.put("KE","Key Contact");
		codes.put("LA","Launched");
		codes.put("AC","Active");
		codes.put("TR","Transformational");
		if(codes.keySet().contains(code.toUpperCase())){
			return codes.get(code);
		}
		else
		{
			return "Other";
		}
	}
	public static Vector<ReportRowStatless> getMuster(String type, String region, String strategyList, String periodEnd, Vector<String> order) throws Exception{
		try{
			Vector<ReportRowStatless> result=new Vector<ReportRowStatless>();
			String query="";
			Connection conn = DBConnectionFactory.getDatabaseConn();
			Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			query=countReportQuery( type, region,  periodEnd, strategyList, order);
			log.debug(query);
			ResultSet resultSet = stmt1.executeQuery(query);
			ReportRowStatless row=new ReportRowStatless();
			row.setFunction("top");
			if (type.equals("movement")){
				row.setLabel("List of Movements");
			}
			else if (type.equals("location")){
				row.setLabel("List of Ministry Locations");
			}
			else if (type.equals("team")){
				row.setLabel("List of Missional Teams");
			}
			result.add(row);
			int rows=0;
			while (resultSet.next()){
				row=new ReportRowStatless();
				row.setRegion(resultSet.getString("region"));
				row.setCity(resultSet.getString("city"));
				row.setState(resultSet.getString("state"));
				row.setCountry(resultSet.getString("country"));
				row.setTargetAreaID(resultSet.getString("campusID"));
				row.setIsSecure(!(resultSet.getString("isSecure").equals("F")));//if it isn't explicitly false we consider it secure.
				row.setCampusName(resultSet.getString("campusName"));
				row.setStrategy(resultSet.getString("strategy"));
				row.setStatus(convertStatus(resultSet.getString("status")));
				row.setLocalLevelId(resultSet.getString("teamID"));
				row.setTeamName(resultSet.getString("teamName"));
				
				if (type.equals("movement")){
					row.setLabel(row.getCampusName()+" - "+org.alt60m.ministry.Strategy.expandStrategy(row.getStrategy()));
				}
				else if (type.equals("location")){
					row.setLabel(row.getCampusName());
				}
				else if (type.equals("team")){
					row.setLabel(row.getTeamName());
				}
				result.add(row);
				rows++;
			}
			row=new ReportRowStatless();
			row.setFunction("bottom");
			if (type.equals("movement")){
				row.setLabel(rows+ " Movements Listed");
			}
			else if (type.equals("location")){
				row.setLabel(rows+ " Ministry Locations Listed");
			}
			else if (type.equals("team")){
				row.setLabel(rows+ " Missional Teams Listed");
			}
			result.add(row);
			return result;
		}
		catch (Exception e) {
		log.error("Failed to perform getMuster().", e);
        throw new Exception(e);
    	}
	}
	// Returns stats for various Success Criteria Reports
	public static Vector<ReportRow> getSuccessCriteriaReport(String type, String region, String strategyList, String periodEnd, String periodBegin, String localLevelId, String targetAreaId) throws Exception{
		try{		
		String sumsQuery=summingFieldsPortion(type)+summingTablesPortion+
						conditionsPortion(type, region,  periodEnd, periodBegin,  strategyList, localLevelId, targetAreaId)+
						groupPortion(type);
		String demographicQuery=demographicFieldsPortion(type)+demographicTablesPortion(type, periodEnd, periodBegin)+
						conditionsPortion(type, region, periodEnd, periodBegin, strategyList, localLevelId, targetAreaId)+groupPortion(type);
				
		Vector<ReportRow> report=new Vector<ReportRow>();
		Connection conn = DBConnectionFactory.getDatabaseConn();
		Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		Statement stmt2 = conn.createStatement();
		log.debug(sumsQuery);
		
		ResultSet sums = stmt1.executeQuery(sumsQuery);
		
		log.debug(demographicQuery);
		ResultSet demos = stmt2.executeQuery(demographicQuery);
		
		ReportRow row=new ReportRow();
		ReportRow summingRow=new ReportRow(); //for within Bridges movements
		ReportRow runningTotal=new ReportRow(); //for totals at report bottoms
		String lastRowId="";
		String lastStrategy="";
		if (sums.isBeforeFirst()){
		while (sums.next()){
			
			demos.next();
			row=new ReportRow();
			if (sums.getString("rowid").equals(demos.getString("rowid"))){
				row=statResultSet2ReportRow(sums,demos);
				
				if (type.equals("national")){
					row.setLabel(org.alt60m.ministry.Regions.expandRegion(row.getRegion()));
					}
					else if (type.equals("targetarea"))
					{
					row.setLabel((row.getStatPeriodBegin().replace("-","/")+" - "+row.getStatPeriodEnd().replace("-","/")));
					}
					else 
					{
					row.setLabel(row.getCampusName()+" - "+org.alt60m.ministry.Strategy.expandStrategy(row.getStrategy())+" ("+row.getEnrollment()+" enrolled)");
					}
			
				if((!lastRowId.equals(row.getRowid()))&&(lastStrategy.equals("BR"))){ //new activity or week after a run of Bridges; the order is important for these functional rows
					
					//put end row on if after Bridges rows, since we are now in new activity
						ReportRow endRow=summingRow; //we have been totaling the previous Bridges rows, now we dump them into final row
						endRow.setFunction("end"); 
						endRow.setLabel(summingRow.getLabel());
						log.debug(endRow);
						report.add(endRow);
						
						}
				
				if ((!lastStrategy.equals(row.getStrategy()))&&(type.equals("targetarea"))&&(!(lastStrategy.equals("")||(lastStrategy==null)))){ // before the top row of each strategy  we also insert a totals row for the bottom of each strategy
						ReportRow bottom=new ReportRow(runningTotal);
						bottom.setFunction("bottom");
						log.debug(bottom);
						report.add(bottom);
						runningTotal=new ReportRow();
						
					}
					
				if (((!lastStrategy.equals(row.getStrategy()))&&(type.equals("targetarea")))||((lastStrategy.equals("")||(lastStrategy==null)))){	//always at top and between strategies for targetarea
					ReportRow top=new ReportRow(row);
					top.setFunction("top");
					log.debug(top);
					report.add(top);
					
					}
				
				
				
				
			if ((!lastRowId.equals(row.getRowid()))&&(row.getStrategy().equals("BR"))){// is new activity and also Bridges; start toggling rows
				row.setFunction("detail");
				ReportRow startRow=new ReportRow();
				startRow.setFunction("start"); 
				startRow.setRowGroup(row.getRowid());
				startRow.setStrategy(row.getStrategy());
				startRow.setCampusName(row.getCampusName());
				startRow.setEnrollment(row.getEnrollment());
				startRow.setLabel(row.getLabel());
				log.debug(startRow);
				report.add(startRow);
			}
			
			else if (row.getStrategy().equals("BR"))//row within split activity
			{
				row.setFunction("detail"); 
				
			}
			
			if((!lastRowId.equals(row.getRowid()))&&(row.getStrategy().equals("BR"))){//new activity and it's Bridges
				summingRow=new ReportRow();	//we have been totaling the previous Bridges rows, now we clear them before starting a new summing session
				}
			
			if (row.getStrategy().equals("BR")){ // we sum for Bridges rows only
				summingRow.addToTotal(row);
			}
			
			runningTotal.addToTotal(row);
			log.debug(row);	
			report.add(row);
			}
			else
			{
				throw new Exception("Rows do not match in Reports.getSuccessCriteriaReport()") ;
			}
			lastStrategy=row.getStrategy();
			lastRowId=row.getRowid();
		}
		if (lastStrategy.equals("BR")){//put end row on if last activity was Bridges
			ReportRow endRow=summingRow; //we have been totaling the previous Bridges rows, now we dump them
			endRow.setFunction("end"); 
			log.debug(endRow);
			report.add(endRow);
		}
		ReportRow bottom=new ReportRow(runningTotal);
		bottom.setFunction("bottom");
		log.debug(bottom);
		report.add(bottom);
		runningTotal=new ReportRow();
		}//resultset had data, otherwise return no rows in Vector<ReportRow> 'report'
		
		return report;
		}
		catch (Exception e) {
			log.error("Failed to perform getSuccessCriteriaReport().", e);
            throw new Exception(e);
        }
	}
}