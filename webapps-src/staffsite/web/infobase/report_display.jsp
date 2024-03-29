<%@ page import="org.alt60m.servlet.*, java.util.*, java.sql.*" %>

<%
ActionResults ar;
ar = ActionResults.getActionResults(session);
	Log log = LogFactory.getLog("org.alt60m.infobase.jsp.report_display");
	
	String[] _abbrevRegion = new String[] { "NE", "MA", "MS", "SE", "GL", "UM", "GP", "RR", "NW", "SW", "NC", " " };
	String[] _expandRegion = new String[] { "Northeast", "Mid-Atlantic", "MidSouth", "Southeast", "Great Lakes", "Upper Midwest", "Great Plains Int'l", "Red River", "Greater Northwest", "Pacific Southwest", "National Campus Office", "No Region Specified" };

	java.sql.Connection conn = org.alt60m.util.DBConnectionFactory.getDatabaseConn();
	java.sql.Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	java.sql.Statement stmt2 = conn.createStatement();
	
	
	
	String urlAppend = "";
	String displayList = "";
	
	String pageTitle="Success Criteria Reports";
	String reportTitle = "To Do: Title Report";

	String fromMonth = request.getParameter("frommonth");
	if(fromMonth.length() == 1)
		fromMonth = "0" + fromMonth;

    String sqlFrom =  request.getParameter("fromyear") + "/" +request.getParameter("frommonth") + "/01";
    int tomonth = Integer.parseInt(request.getParameter("tomonth"));
    // tomonth/12 returns 1, if december. (tomonth+1)%12 returns the next month, providing for december.
    String sqlTo = (Integer.parseInt(request.getParameter("toyear"))+(tomonth/12)) + "/" + Integer.toString((tomonth%12)+1) + "/01";

	String displayFrom = request.getParameter("frommonth") + "/" + request.getParameter("fromyear");
	String displayTo = request.getParameter("tomonth") + "/" + request.getParameter("toyear");

	String sumsQuery = "";
	String demosQuery = "";
	String enrollmentQuery = "";
	String movementsQuery = "";
	
	int enrollmentSum = 0;
	int exposuresViaMediaSum = 0;
	int evangelisticOneOnOneSum = 0;
	int evangelisticGroupSum = 0;
	int decisionSum = 0;
	int holySpiritSum = 0;
	int laborersSentSum = 0;
	int multipliersSum = 0;
	int invldStudentsSum = 0;
	int seekersSum = 0;
	int studentLeadersSum = 0;
	int activeEnrollment = 0;
	int activeMovements = 0;
	
	
	int bridgesExposuresViaMediaSum = 0;
	int bridgesEvangelisticOneOnOneSum = 0;
	int bridgesEvangelisticGroupSum = 0;
	int bridgesDecisionSum = 0;
	int bridgesHolySpiritSum = 0;
	int bridgesLaborersSentSum = 0;
	int bridgesMultipliersSum = 0;
	int bridgesInvldStudentsSum = 0;
	int bridgesSeekersSum = 0;
	int bridgesStudentLeadersSum = 0;
	

	String areaname = null;
	String strategyList = "";


	for (Strategy strategy : Strategy.campusStrategies()) {
		String strategyAbbreviation = strategy.toString();
		if("true".equals(ar.getValue(strategyAbbreviation))) {
			strategyList += "'" + strategyAbbreviation +"',";
			urlAppend += "&strategies[" + strategyAbbreviation + "]="+strategyAbbreviation;
			displayList += strategy.getName() + ", ";
		}
		
	}
	
	if(strategyList.length() > 1) {
		strategyList = strategyList.substring(0, strategyList.length() - 1);
		displayList = displayList.substring(0, displayList.length() - 2);
	}

	else {
		displayList = "{none}";
	}

	if(request.getParameter("type").equals("locallevel")){

		sumsQuery = "SELECT ministry_statistic.peopleGroup, ministry_activity.ActivityID as rowid, ministry_activity.status, ministry_activity.periodBegin, MAX(ministry_targetarea.TargetAreaID) targetAreaID, MAX(ministry_targetarea.name) campusName, MAX(ministry_targetarea.enrollment) enrollment, ministry_activity.strategy, SUM(ministry_statistic.exposuresViaMedia) as exposuresViaMediaSum, SUM(ministry_statistic.evangelisticOneOnOne) as evangelisticOneOnOneSum, SUM(ministry_statistic.evangelisticGroup) as evangelisticGroupSum, SUM(ministry_statistic.decisions) as decisionSum, SUM(ministry_statistic.holySpiritConversations) as holySpiritSum, SUM(ministry_statistic.laborersSent) as laborersSentSum from ministry_statistic left join ministry_activity on (ministry_statistic.fk_Activity = ministry_activity.ActivityID) left join ministry_locallevel on (ministry_locallevel.TeamID = ministry_activity.fk_TeamID) LEFT JOIN ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_locallevel.teamID = '" + request.getParameter("locallevelid") + "' and ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "' and ministry_activity.Strategy in (" + strategyList + ")) GROUP BY ministry_activity.ActivityID, ministry_statistic.peopleGroup ORDER BY campusName, ministry_activity.ActivityID, ministry_statistic.peopleGroup";

		demosQuery = "SELECT ministry_statistic.peopleGroup, ministry_activity.ActivityID as rowid, ministry_targetarea.targetAreaID, ministry_targetarea.name, ministry_statistic.invldNewBlvrs, ministry_statistic.invldStudents, ministry_statistic.ongoingEvangReln as Seekers, ministry_statistic.multipliers, ministry_statistic.studentLeaders, ministry_locallevel.region FROM ministry_statistic INNER JOIN (SELECT ministry_statistic.peopleGroup as peopleGroup, ministry_statistic.fk_Activity AS fk_Activity, MAX(ministry_statistic.periodEnd) AS lastDate FROM ministry_statistic WHERE ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "' GROUP BY fk_Activity, ministry_statistic.peopleGroup) LastActivities ON ministry_statistic.fk_Activity = LastActivities.fk_Activity AND ministry_statistic.periodEnd = LastActivities.lastDate and ( ((ministry_statistic.peopleGroup is null) and (LastActivities.peopleGroup is null)) or (ministry_statistic.peopleGroup=LastActivities.peopleGroup)) LEFT JOIN ministry_activity on ministry_statistic.fk_Activity = ministry_activity.ActivityID LEFT JOIN ministry_locallevel on ministry_locallevel.teamID = ministry_activity.fk_teamID LEFT JOIN ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "' and ministry_locallevel.teamID = '" + request.getParameter("locallevelid") + "') and ministry_activity.Strategy in (" + strategyList + ") ORDER BY ministry_targetarea.name, ministry_activity.ActivityID, ministry_statistic.peopleGroup";

	} else if(request.getParameter("type").equals("national")){

		sumsQuery = "SELECT ministry_activity.strategy, ministry_statistic.peopleGroup, ministry_targetarea.region as rowid, 0 as enrollment, ministry_targetarea.region, SUM(ministry_statistic.exposuresViaMedia) as exposuresViaMediaSum, SUM(ministry_statistic.evangelisticOneOnOne) as evangelisticOneOnOneSum, SUM(ministry_statistic.evangelisticGroup) as evangelisticGroupSum, SUM(ministry_statistic.decisions) as decisionSum,  SUM(ministry_statistic.holySpiritConversations) as holySpiritSum, SUM(ministry_statistic.laborersSent) as laborersSentSum from ministry_statistic left join ministry_activity on (ministry_statistic.fk_Activity = ministry_activity.ActivityID) left join ministry_targetarea on (ministry_targetarea.TargetAreaID = ministry_activity.fk_targetAreaID) WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "' and ministry_activity.Strategy in (" + strategyList + ")) and region is not null AND (ministry_targetarea.region <> '')GROUP BY ministry_targetarea.region ORDER BY ministry_targetarea.region";

		demosQuery = "SELECT ministry_activity.strategy, ministry_statistic.peopleGroup, ministry_targetarea.region as rowid, ministry_targetarea.region, SUM(ministry_statistic.invldNewBlvrs) as invldNewBlvrs, SUM(ministry_statistic.invldStudents) invldStudents, SUM(ministry_statistic.ongoingEvangReln) as Seekers,  SUM(ministry_statistic.studentLeaders) studentLeaders, SUM(ministry_statistic.multipliers) multipliers FROM ministry_statistic INNER JOIN (SELECT ministry_statistic.fk_Activity AS fk_Activity, MAX(ministry_statistic.periodEnd) AS lastDate FROM ministry_statistic WHERE ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "' GROUP BY fk_Activity) LastActivities ON ministry_statistic.fk_Activity = LastActivities.fk_Activity AND ministry_statistic.periodEnd = LastActivities.lastDate LEFT JOIN ministry_activity on ministry_statistic.fk_Activity = ministry_activity.ActivityID LEFT JOIN ministry_targetarea on ministry_targetarea.TargetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "') and ministry_activity.Strategy in (" + strategyList + ") and region is not null AND (ministry_targetarea.region <> '') GROUP BY ministry_targetarea.region ORDER BY ministry_targetarea.region";
		reportTitle = "National Report";

	} else if(request.getParameter("type").equals("regional")){

		sumsQuery = "SELECT ministry_statistic.peopleGroup, ministry_activity.ActivityID as rowid, ministry_activity.status, ministry_activity.periodBegin, MAX(ministry_targetarea.TargetAreaID) targetAreaID, MAX(ministry_targetarea.name) campusName, MAX(ministry_targetarea.enrollment) enrollment, ministry_activity.strategy, SUM(ministry_statistic.exposuresViaMedia) as exposuresViaMediaSum, SUM(ministry_statistic.evangelisticOneOnOne) as evangelisticOneOnOneSum, SUM(ministry_statistic.evangelisticGroup) as evangelisticGroupSum, SUM(ministry_statistic.decisions) as decisionSum,  SUM(ministry_statistic.holySpiritConversations) as holySpiritSum, SUM(ministry_statistic.laborersSent) as laborersSentSum from ministry_statistic left join ministry_activity on (ministry_statistic.fk_Activity = ministry_activity.ActivityID) left join ministry_locallevel on (ministry_locallevel.TeamID = ministry_activity.fk_TeamID) LEFT JOIN ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_targetarea.region = '" + request.getParameter("region") + "' and ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "' and ministry_activity.Strategy in (" + strategyList + ")) GROUP BY ministry_activity.ActivityID, ministry_statistic.peopleGroup ORDER BY campusName, ministry_activity.ActivityID, ministry_statistic.peopleGroup";
		demosQuery = "SELECT ministry_statistic.peopleGroup, ministry_activity.ActivityID as rowid, ministry_targetarea.targetAreaID, ministry_targetarea.name, ministry_statistic.invldNewBlvrs, ministry_statistic.multipliers, ministry_statistic.invldStudents, ministry_statistic.ongoingEvangReln as Seekers,  ministry_statistic.studentLeaders FROM ministry_statistic INNER JOIN (SELECT ministry_statistic.peopleGroup as peopleGroup, ministry_statistic.fk_Activity AS fk_Activity, MAX(ministry_statistic.periodEnd) AS lastDate FROM ministry_statistic WHERE ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "' GROUP BY fk_Activity, ministry_statistic.peopleGroup) LastActivities ON ministry_statistic.fk_Activity = LastActivities.fk_Activity AND ministry_statistic.periodEnd = LastActivities.lastDate and (((ministry_statistic.peopleGroup is null) and (LastActivities.peopleGroup is null)) or (ministry_statistic.peopleGroup=LastActivities.peopleGroup)) LEFT JOIN ministry_activity on ministry_statistic.fk_Activity = ministry_activity.ActivityID LEFT JOIN ministry_locallevel on ministry_locallevel.teamID = ministry_activity.fk_teamID LEFT JOIN ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodEnd >= '" + sqlFrom + "' and ministry_targetarea.region = '" + request.getParameter("region") + "') and ministry_activity.Strategy in (" + strategyList + ") ORDER BY ministry_targetarea.name, ministry_activity.ActivityID, ministry_statistic.peopleGroup";
		
	}

	// temporary (or maybe permanent) fix for duplicate data entries - removes dupes!

	//Note: This doesn't run under MySql.  Not sure why, and it's a gnarly query to debug, so we're going to hope that since this was written in 2002, we don't have duplicate problems anymore.  We're acting in faith, right?
	//stmt1.executeUpdate("delete from ministry_statistic where statisticID in (SELECT ministry_statistic.StatisticID FROM ministry_statistic WHERE (((ministry_statistic.periodBegin) In (SELECT periodBegin FROM ministry_statistic As Tmp GROUP BY periodBegin, periodEnd, fk_Activity HAVING Count(*)>1  And periodEnd = ministry_statistic.periodEnd And fk_Activity = ministry_statistic.fk_Activity)))) and statisticID not in (SELECT MAX(ministry_statistic.StatisticID) FROM ministry_statistic WHERE (((ministry_statistic.periodBegin) In (SELECT periodBegin FROM ministry_statistic As Tmp GROUP BY periodBegin, periodEnd, fk_Activity HAVING Count(*)>1  And periodEnd = ministry_statistic.periodEnd And fk_Activity = ministry_statistic.fk_Activity))) group by ministry_statistic.fk_Activity)");

	if("regional".equals(request.getParameter("type"))) {
		reportTitle = "Regional Report: " + org.alt60m.util.TextUtils.translate(_abbrevRegion, _expandRegion, request.getParameter("region"));
	}
	
	if("locallevel".equals(request.getParameter("type"))) {
		ResultSet llInfo = stmt1.executeQuery("SELECT name from ministry_locallevel where teamID=" + request.getParameter("locallevelid"));
		llInfo.next();
		String teamName = llInfo.getString("name");
		reportTitle = "Local Level Report: " + teamName;
	}

	log.debug("sums query: " + sumsQuery);
	log.debug("demos query: " + demosQuery);

	
	java.sql.ResultSet sums = stmt1.executeQuery(sumsQuery);
	java.sql.ResultSet demos = stmt2.executeQuery(demosQuery);
	log.debug("queries ran fine");
%>
<%@page import="org.alt60m.ministry.Strategy"%>
<%@page import="org.apache.commons.logging.Log"%>
<%@page import="org.apache.commons.logging.LogFactory"%>
<html>
<head>

<title><%= pageTitle %></title>
<!--% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yy"); %-->
<style type="text/css">
div.bridges_split
{
width:auto;
height:auto;
border:none;
margin:none;
padding:none;
display:none;
}
div.bridges_sum
{
width:auto;
height:auto;
border:none;
margin:none;
padding:none;
display:block;
}
</style>
<script type="text/javascript" language="javascript">
function toggle(x)
{

document.getElementById(x).style.display="inline";
document.getElementById(x+'_sum').style.display="none";
}
function untoggle(x)
{
document.getElementById(x).style.display="none";
document.getElementById(x+'_sum').style.display="inline";
}
</script>
<%@ include file="/infobase/ibheader.jspf" %>
<TABLE width="100%">
	<TR>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Success Criteria Reports</a></font></TD>
	</TR>
</TABLE>

	<br>
	<%=fontB3%><B><%= reportTitle %></b></font><BR>
	<%=fontB%>
	For dates: <%=displayFrom%> to <%=displayTo%><br>
	Including strategies: <%=displayList%><br>
	<P>
	</font>
	<CENTER>
<%

		if(sums.isBeforeFirst()) {
			%>
<TABLE id="main" WIDTH="99%" BORDER="0" CELLPADDING="1" CELLSPACING="0"><TR><TD BGCOLOR="<%= color1 %>">
	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>
<%

	if(request.getParameter("type").equals("regional") || request.getParameter("type").equals("locallevel")){

%>
		<td width="20%" align=LEFT VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Campus (enrollment) - Strategy</td>
<%
	} else if(request.getParameter("type").equals("national")){
		
%>
		<td width="20%" align=LEFT VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Region</td>
<%
	}

%>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Personal Evangelism</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Group Evangelism</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Media Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Holy Spirit Pres. 
			<%if(( (Integer.parseInt(request.getParameter("frommonth"))<=8)&&(Integer.parseInt(request.getParameter("fromyear"))==2008))||(Integer.parseInt(request.getParameter("fromyear"))<2008))
			{out.print("<br>(Starting 8/1/2008)");}
			%></td>
	 	<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Laborers Sent</td>
	 	
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Multipliers</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Leaders</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Involved</td>
		<%if("true".equals(ar.getValue("BR"))){
			%><td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%><i>Seekers (Bridges)</i></td><%
			
			}%>
		
	</tr></table>
<%
	
String dateTag="";	
String lastRow="";
boolean tempBool=true;
boolean sameRow=true;
boolean tempBool2 = false;
boolean afterBridges=false;
String lastStrategy="";
String holdLabel="";
String lastSumsRowID="";
String sumsRowID = "";
String demosRowID = "";
String strategy="";
	Boolean splitStat=false;
	while(sums.next()){
		
		 tempBool2 = false;
		demos.next();
		
		strategy=sums.getString("strategy");
		
		String peopleGroup=sums.getString("peopleGroup");
		peopleGroup=(peopleGroup==null)? "Stats prior to 4/23/2008":peopleGroup;
		if (!(request.getParameter("type").equals("national"))){
			dateTag=sums.getDate("periodBegin")!=null?sums.getDate("periodBegin").toString():"";
		}
		else
		{
			dateTag="";
		}
		
		
		sumsRowID = sums.getString("rowid");
		demosRowID = demos.getString("rowid");
		if (! sumsRowID.equals(demosRowID)) {
			throw new RuntimeException("Sums query is mismatched with demos query; sumsRowID: " + sumsRowID + "; demosRowID: " + demosRowID);
		}
		log.debug(lastStrategy+"  "+lastRow+"  "+sumsRowID+dateTag);
		afterBridges=((lastStrategy.equals("BR"))&&(!lastRow.equals(sumsRowID+dateTag)))?true:false;
		log.debug(afterBridges);
		lastStrategy=strategy;
		if(afterBridges&&(!(request.getParameter("type").equals("national")))){
			log.debug("not national; new Bridges movement");
			%>
			</div><div class="bridges_sum" id="<%= lastSumsRowID+"_sum"%>">
			<table WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0">
			<tr class="bridges_sum">
			<td width=20% <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="16%" align=LEFT><%=holdLabel %><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href="javascript:toggle('<%=lastSumsRowID %>');">(+)</A></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesEvangelisticOneOnOneSum)%></td>
		 	<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesEvangelisticGroupSum)%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesExposuresViaMediaSum)%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesDecisionSum)%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesHolySpiritSum)%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesLaborersSentSum)%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesMultipliersSum)%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesStudentLeadersSum)%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesInvldStudentsSum)%></td>
			<%if(("true".equals(ar.getValue("BR")))){
			%><td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><i><%=Integer.toString(bridgesSeekersSum)%></i></td>
			<%}else{ %>
			<% tempBool2 = !tempBool2;}%>
			</tr>
			</table>
			</div>
			<%
			}
		else if ((request.getParameter("type").equals("national"))){log.debug("is national report");}
		else {log.debug("is not national report but no new Bridges row detected.");}
		
		
		
		if (lastRow.equals(sumsRowID+dateTag)){splitStat=true;}
		else
		{		
		tempBool = !tempBool;
		splitStat=false;
		}
		
		
		exposuresViaMediaSum += sums.getInt("exposuresViaMediaSum");
		evangelisticOneOnOneSum += sums.getInt("evangelisticOneOnOneSum");
		evangelisticGroupSum += sums.getInt("evangelisticGroupSum");
		decisionSum += sums.getInt("decisionSum");
		holySpiritSum += sums.getInt("holySpiritSum");
		laborersSentSum += sums.getInt("laborersSentSum");

		%>
		<%if((strategy.equals("BR"))&&(!splitStat)&&(!(request.getParameter("type").equals("national")))){%><div class="bridges_split" id="<%= sumsRowID%>"> <%} %>
		<table WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0">
		<tr >
		<%
		
		invldStudentsSum += demos.getInt("invldStudents");
		seekersSum += demos.getInt("Seekers");
		multipliersSum += demos.getInt("multipliers");
		studentLeadersSum += demos.getInt("studentLeaders");
		
		if(request.getParameter("type").equals("regional") || request.getParameter("type").equals("locallevel")){

			%>
			<td width=20% <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="16%" align=LEFT>
			<%=fontB1%>
			<%if(!splitStat){ 
			holdLabel=fontB1+"<A HREF=\"/servlet/InfoBaseController?action=showReport&type=targetarea&frommonth="+request.getParameter("frommonth")
					+"&fromyear="+request.getParameter("fromyear")+"&tomonth="+request.getParameter("tomonth")+"&toyear="
					+request.getParameter("toyear")+"&targetareaid="+sums.getString("targetAreaID")+ urlAppend +"\">"+sums.getString("campusName")
					+"</A>"+fontB1+"("+(((sums.getString("enrollment")==null)||(sums.getString("enrollment").equals("")))?"0":sums.getString("enrollment")
					+") - "+Strategy.valueOf(sums.getString("strategy")).getName())+"</font>";
					
			 if (sums.getString("status").equals("IN")) {
				 holdLabel+=" (active starting at "+(sums.getDate("periodBegin"))+")";
				
			}
			else
			{
				if ((sums.getString("status").equals("AC"))||(sums.getString("status").equals("LA")) ||(sums.getString("status").equals("TR")) ) {
				activeMovements++;
				}
			}
			out.print(holdLabel+((strategy.equals("BR"))? "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href=\"javascript:untoggle('"+sumsRowID+"');\">(-)</A><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+peopleGroup:"")); 
			}
			else
			{
				
				out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+peopleGroup);
			}
			%>
			 </td>
			<%
		}
		else if(request.getParameter("type").equals("national")){

			%>
			<td width=20% <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="16%" align=LEFT><%=fontB1%><A HREF="/servlet/InfoBaseController?action=showReport&region=<%=sums.getString("region")%>&type=regional&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB1%><%=org.alt60m.util.TextUtils.translate(_abbrevRegion, _expandRegion, sums.getString("region"))%></A></TD>
			<%
		}

		%>

		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("evangelisticOneOnOneSum"))%></td>
	 	<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("evangelisticGroupSum"))%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("exposuresViaMediaSum"))%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("decisionSum"))%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("holySpiritSum"))%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("laborersSentSum"))%></td>
		
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("multipliers"))%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("StudentLeaders"))%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldStudents"))%></td>
		<%if("true".equals(ar.getValue("BR"))&&(strategy.equals("BR"))){
			%><td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><i><%=Integer.toString(demos.getInt("Seekers"))%></i></td>
			<%}else if ("true".equals(ar.getValue("BR"))){%>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%>&nbsp;</td>
			
			<%}else{%>
			<% tempBool2 = !tempBool2;}%>
		</tr>
		</table>
		<%
		
		if(splitStat){
			
			bridgesExposuresViaMediaSum += sums.getInt("exposuresViaMediaSum");
			bridgesEvangelisticOneOnOneSum += sums.getInt("evangelisticOneOnOneSum");
			bridgesEvangelisticGroupSum += sums.getInt("evangelisticGroupSum");
			bridgesDecisionSum += sums.getInt("decisionSum");
			bridgesHolySpiritSum += sums.getInt("holySpiritSum");
			bridgesLaborersSentSum += sums.getInt("laborersSentSum");
			bridgesMultipliersSum += demos.getInt("multipliers");
			bridgesInvldStudentsSum += demos.getInt("InvldStudents");
			bridgesSeekersSum += demos.getInt("Seekers");
			bridgesStudentLeadersSum += demos.getInt("StudentLeaders");
		}
		else if (strategy.equals("BR"))
		{
			
			bridgesExposuresViaMediaSum = sums.getInt("exposuresViaMediaSum");
			bridgesEvangelisticOneOnOneSum = sums.getInt("evangelisticOneOnOneSum");
			bridgesEvangelisticGroupSum = sums.getInt("evangelisticGroupSum");
			bridgesDecisionSum = sums.getInt("decisionSum");
			bridgesHolySpiritSum = sums.getInt("holySpiritSum");
			bridgesLaborersSentSum = sums.getInt("laborersSentSum");
			bridgesMultipliersSum = demos.getInt("multipliers");
			bridgesInvldStudentsSum = demos.getInt("InvldStudents");
			bridgesSeekersSum = demos.getInt("Seekers");
			bridgesStudentLeadersSum = demos.getInt("StudentLeaders");
		}
		else
		{
			afterBridges=false;
			bridgesExposuresViaMediaSum =0;
			bridgesEvangelisticOneOnOneSum =0;
			bridgesEvangelisticGroupSum =0;
			bridgesDecisionSum =0;
			bridgesHolySpiritSum =0;
			bridgesLaborersSentSum =0;
			bridgesMultipliersSum =0;
			bridgesInvldStudentsSum =0;
			bridgesSeekersSum = 0;
			bridgesStudentLeadersSum =0;
		}
		lastRow=sumsRowID+dateTag;
		lastSumsRowID=sumsRowID;
	}
	if((strategy.equals("BR"))&&(!(request.getParameter("type").equals("national")))){
		tempBool2 = false;
		%>
		</div><div class="bridges_sum" id="<%= sumsRowID+"_sum"%>">
		<table WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0">
		<tr >
		<td width=20% <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="16%" align=LEFT><%=holdLabel %><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A href="javascript:toggle('<%=lastSumsRowID %>');">(+)</A></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesEvangelisticOneOnOneSum)%></td>
	 	<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesEvangelisticGroupSum)%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesExposuresViaMediaSum)%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesDecisionSum)%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesHolySpiritSum)%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesLaborersSentSum)%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesMultipliersSum)%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesStudentLeadersSum)%></td>
		<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(bridgesInvldStudentsSum)%></td>
		<%if("true".equals(ar.getValue("BR"))){
			%><td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><i><%=Integer.toString(bridgesSeekersSum)%></i></td>
			<%}else{%>
			<% tempBool2 = !tempBool2;}%>
		</tr>
		</table>
		</div>
	<%}
	if(request.getParameter("type").equals("regional")){

%>
<table WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0">
	<tr>
        <td width=20% <%=bgcolorL%>></td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Personal Evangelism</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Group Evangelism</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Media Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Holy Spirit Pres.
			<%if(( (Integer.parseInt(request.getParameter("frommonth"))<=8)&&(Integer.parseInt(request.getParameter("fromyear"))==2008))||(Integer.parseInt(request.getParameter("fromyear"))<2008))
			{out.print("<br>(Starting 8/1/2008)");}
			%></td>
	 	<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Laborers Sent</td>
	 	
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Multipliers</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Leaders</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Involved</td>
		<%if("true".equals(ar.getValue("BR"))){
			%><td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%><i>Seekers (Bridges)</i></td><%
			
			}%>
	</tr>
		<%}else{%><table WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0"><%} %>
	
	<tr <%=bgcolorL%>>
 	<td width=20% ALIGN="RIGHT"><%=fontB1%><B>Summary</B></TD>
		<td width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(evangelisticOneOnOneSum)%></td>
 		<td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(evangelisticGroupSum)%></td>     
		<td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(exposuresViaMediaSum)%></td>      
		<td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(decisionSum)%></td>   
		<td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(holySpiritSum)%></td>     
		<td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(laborersSentSum)%></td> 
		<td COLSPAN="3" ALIGN="CENTER">&nbsp;</td>
		<%if("true".equals(ar.getValue("BR"))){
			%><td ALIGN="CENTER">&nbsp;</td>
			<%}%>
		</TR>
	<TR <%=bgcolorL%>>
	<td  width=20% ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="6">&nbsp;</TD>
		<td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(multipliersSum)%></td>
		<td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(studentLeadersSum)%></td>
		<td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldStudentsSum)%></td>
		<%if("true".equals(ar.getValue("BR"))){
			%><td  width="6%" ALIGN="CENTER"><%=fontB1%><%=Integer.toString(seekersSum)%></td>
			<%}%>
		
	</tr>
	<tr <%=bgcolorL%>>
	<td colspan="10" <%=bgcolorL%>><%=fontB1%><%
		if(((ar.getValue("block")==null))&&(!(ar.getHashtable("census")==null)))
			{out.print(ar.getHashtable("census").get("movements")+" Movements, <br>"+ar.getHashtable("census").get("enrollment")+" Enrollment <br>(as of today)");
			ar.putValue("block","true"); }%>
	
        							</td>
		<%if("true".equals(ar.getValue("BR"))){%>
		<td ALIGN="CENTER">&nbsp;</td>
			<%}%></tr>	
</TABLE>
</TD></TR></TABLE>
		<% } else out.print(fontB + "<B>No Results.</B></FONT>"); %>
<P>
<%
	if(request.getParameter("type").equals("locallevel")){

ResultSet gettingRegion = stmt1.executeQuery("SELECT region FROM ministry_locallevel ll WHERE teamID = "+request.getParameter("locallevelid"));
gettingRegion.next();
String region = gettingRegion.getString("region");

%>
		<%=fontB%>[<A HREF="/servlet/InfoBaseController?action=showReport&region=<%=region%>&type=regional&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB%>Zoom out to <%=region%> Region</A>]</FONT><BR>
<%
	}
%>
<%

	if(!request.getParameter("type").equals("national")){
%>
		<%=fontB%>[<A HREF="/servlet/InfoBaseController?action=showReport&type=national&region=National&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB%>Zoom out to National</A>]</FONT><BR>
<%
	}

	stmt1.close();
	stmt2.close();
	
	
	conn.close();
%>
</CENTER>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>

