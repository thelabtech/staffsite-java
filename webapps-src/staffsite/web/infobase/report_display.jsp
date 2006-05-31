<%@ page import="org.alt60m.servlet.*, java.util.*, java.sql.*" %>

<%
	String[] _abbrevStrategy = new String[] { "CA", "SC", "IE", "ID", "II", "WI", "WS", "BR" };
	String[] _expandStrategy = new String[] {"Catalytic", "Staffed Campus", "ESM-Epic", "ESM-Destino", "ESM-Impact", "WSN ICS", "WSN STInt", "Bridges"};
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

	int enrollmentSum = 0;
	int exposureSum = 0;
	int exposuresViaMediaSum = 0;
	int evangelisticOneOnOneSum = 0;
	int evangelisticGroupSum = 0;
	int ongoingEvangRelnSum = 0;
	int decisionSum = 0;
	int decisionsHelpedByMediaSum = 0;
	int decisionsHelpedByOneOnOneSum = 0;
	int decisionsHelpedByGroupSum = 0;
	int decisionsHelpedByOngoingRelnSum = 0;
	int attendSum = 0;
	int invldNewBlvrsSum = 0;
	int invldStudentsSum = 0;
	int invldFreshmenSum = 0;
	int invldSophomoresSum = 0;
	int invldJuniorsSum = 0;
	int invldSeniorsSum = 0;
	int invldGradsSum = 0;
	int studentLeadersSum = 0;
	int volunteersSum = 0;
	int staffSum = 0;
	int nonStaffStintSum = 0;
	int staffStintSum = 0;


	String areaname = null;
	String strategyList = "";


	if("true".equals(request.getParameter("SC"))) {
		strategyList += "'SC',";
		urlAppend += "&SC=true";
		displayList += "Staffed Campus, ";
	}

	if("true".equals(request.getParameter("CA"))) {
		strategyList += "'CA',";
		urlAppend += "&CA=true";
		displayList += "Catalytic, ";
	}

	if("true".equals(request.getParameter("II"))) {
		strategyList += "'II',";
		urlAppend += "&II=true";
		displayList += "ESM-Impact, ";
	}

	if("true".equals(request.getParameter("IE"))) {
		strategyList += "'IE',";
		urlAppend += "&IE=true";
		displayList += "ESM-Epic, ";
	}

	if("true".equals(request.getParameter("ID"))) {
		strategyList += "'ID',";
		urlAppend += "&ID=true";
		displayList += "ESM-Destino, ";
	}

	if("true".equals(request.getParameter("WS"))) {
		strategyList += "'WS',";
		urlAppend += "&WS=true";
		displayList += "WSN STInt, ";
	}

	if("true".equals(request.getParameter("WI"))) {
		strategyList += "'WI',";
		urlAppend += "&WI=true";
		displayList += "WSN ICS, ";
	}

	if("true".equals(request.getParameter("BR"))) {
		strategyList += "'BR',";
		urlAppend += "&BR=true";
		displayList += "Bridges, ";
	}

	if(strategyList.length() > 1) {
		strategyList = strategyList.substring(0, strategyList.length() - 1);
		displayList = displayList.substring(0, displayList.length() - 2);
	}

	else {
		displayList = "{none}";
	}

	if(request.getParameter("type").equals("locallevel")){

		sumsQuery = "SELECT MAX(ministry_targetarea.TargetAreaID) targetAreaID, MAX(ministry_targetarea.name) campusName, MAX(ministry_targetarea.enrollment) enrollment, SUM(ministry_statistic.exposures) as exposureSum, SUM(ministry_statistic.exposuresViaMedia) as exposuresViaMediaSum, SUM(ministry_statistic.evangelisticOneOnOne) as evangelisticOneOnOneSum, SUM(ministry_statistic.evangelisticGroup) as evangelisticGroupSum, SUM(ministry_statistic.ongoingEvangReln) as ongoingEvangRelnSum, SUM(ministry_statistic.decisions) as decisionSum, SUM(ministry_statistic.decisionsHelpedByMedia) as decisionsHelpedByMediaSum, SUM(ministry_statistic.decisionsHelpedByOneOnOne) as decisionsHelpedByOneOnOneSum, SUM(ministry_statistic.decisionsHelpedByGroup) as decisionsHelpedByGroupSum, SUM(ministry_statistic.decisionsHelpedByOngoingReln) as decisionsHelpedByOngoingRelnSum, SUM(ministry_statistic.attendedLastConf) as attendSum from ministry_statistic left join ministry_activity on (ministry_statistic.fk_Activity = ministry_activity.ActivityID) left join ministry_locallevel on (ministry_locallevel.TeamID = ministry_activity.fk_TeamID) LEFT JOIN ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_locallevel.teamID = '" + request.getParameter("locallevelid") + "' and ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' and ministry_activity.Strategy in (" + strategyList + ")) GROUP BY ministry_activity.ActivityID ORDER BY campusName";

		demosQuery = "SELECT ministry_targetarea.targetAreaID, ministry_targetarea.name, ministry_statistic.invldNewBlvrs, ministry_statistic.invldStudents, ministry_statistic.invldFreshmen, ministry_statistic.invldSophomores, ministry_statistic.invldJuniors, ministry_statistic.invldSeniors, ministry_statistic.invldGrads, ministry_statistic.studentLeaders, ministry_statistic.volunteers, ministry_statistic.staff, ministry_statistic.nonStaffStint, ministry_statistic.staffStint, ministry_locallevel.region FROM ministry_statistic INNER JOIN (SELECT ministry_statistic.fk_Activity AS fk_Activity, MAX(ministry_statistic.periodEnd) AS lastDate FROM ministry_statistic WHERE ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' GROUP BY fk_Activity) LastActivities ON ministry_statistic.fk_Activity = LastActivities.fk_Activity AND ministry_statistic.periodEnd = LastActivities.lastDate LEFT JOIN ministry_activity on ministry_statistic.fk_Activity = ministry_activity.ActivityID LEFT JOIN ministry_locallevel on ministry_locallevel.teamID = ministry_activity.fk_teamID LEFT JOIN ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' and ministry_locallevel.teamID = '" + request.getParameter("locallevelid") + "') and ministry_activity.Strategy in (" + strategyList + ") ORDER BY ministry_targetarea.name";

	} else if(request.getParameter("type").equals("national")){

//		sumsQuery = "SELECT 0 as enrollment, ministry_locallevel.region, SUM(ministry_statistic.exposures) as exposureSum, SUM(ministry_statistic.exposuresViaMedia) as exposuresViaMediaSum, SUM(ministry_statistic.evangelisticOneOnOne) as evangelisticOneOnOneSum, SUM(ministry_statistic.evangelisticGroup) as evangelisticGroupSum, SUM(ministry_statistic.ongoingEvangReln) as ongoingEvangRelnSum, SUM(ministry_statistic.decisions) as decisionSum, SUM(ministry_statistic.decisionsHelpedByMedia) as decisionsHelpedByMediaSum, SUM(ministry_statistic.decisionsHelpedByOneOnOne) as decisionsHelpedByOneOnOneSum, SUM(ministry_statistic.decisionsHelpedByGroup) as decisionsHelpedByGroupSum, SUM(ministry_statistic.decisionsHelpedByOngoingReln) as decisionsHelpedByOngoingRelnSum, SUM(ministry_statistic.attendedLastConf) as attendSum from ministry_statistic left join ministry_activity on (ministry_statistic.fk_Activity = ministry_activity.ActivityID) left join ministry_locallevel on (ministry_locallevel.TeamID = ministry_activity.fk_TeamID) WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' and ministry_activity.Strategy in (" + strategyList + ")) and region is not null GROUP BY ministry_locallevel.region ORDER BY ministry_locallevel.region";

		sumsQuery = "SELECT 0 as enrollment, ministry_targetarea.region, SUM(ministry_statistic.exposures) as exposureSum, SUM(ministry_statistic.exposuresViaMedia) as exposuresViaMediaSum, SUM(ministry_statistic.evangelisticOneOnOne) as evangelisticOneOnOneSum, SUM(ministry_statistic.evangelisticGroup) as evangelisticGroupSum, SUM(ministry_statistic.ongoingEvangReln) as ongoingEvangRelnSum, SUM(ministry_statistic.decisions) as decisionSum, SUM(ministry_statistic.decisionsHelpedByMedia) as decisionsHelpedByMediaSum, SUM(ministry_statistic.decisionsHelpedByOneOnOne) as decisionsHelpedByOneOnOneSum, SUM(ministry_statistic.decisionsHelpedByGroup) as decisionsHelpedByGroupSum, SUM(ministry_statistic.decisionsHelpedByOngoingReln) as decisionsHelpedByOngoingRelnSum, SUM(ministry_statistic.attendedLastConf) as attendSum from ministry_statistic left join ministry_activity on (ministry_statistic.fk_Activity = ministry_activity.ActivityID) left join ministry_targetarea on (ministry_targetarea.TargetAreaID = ministry_activity.fk_targetAreaID) WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' and ministry_activity.Strategy in (" + strategyList + ")) and region is not null AND (ministry_targetarea.region <> '')GROUP BY ministry_targetarea.region ORDER BY ministry_targetarea.region";
		System.out.println(sumsQuery);

		demosQuery = "SELECT ministry_targetarea.region, SUM(ministry_statistic.invldNewBlvrs) as invldNewBlvrs, SUM(ministry_statistic.invldStudents) invldStudents, SUM(ministry_statistic.invldFreshmen) invldFreshmen, SUM(ministry_statistic.invldSophomores) invldSophomores, SUM(ministry_statistic.invldJuniors) invldJuniors, SUM(ministry_statistic.invldSeniors) invldSeniors, SUM(ministry_statistic.invldGrads) invldGrads, SUM(ministry_statistic.studentLeaders) studentLeaders, SUM(ministry_statistic.volunteers) volunteers, SUM(ministry_statistic.staff) staff, SUM(ministry_statistic.nonStaffStint) nonStaffStint, SUM(ministry_statistic.staffStint) staffStint FROM ministry_statistic INNER JOIN (SELECT ministry_statistic.fk_Activity AS fk_Activity, MAX(ministry_statistic.periodEnd) AS lastDate FROM ministry_statistic WHERE ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' GROUP BY fk_Activity) LastActivities ON ministry_statistic.fk_Activity = LastActivities.fk_Activity AND ministry_statistic.periodEnd = LastActivities.lastDate LEFT JOIN ministry_activity on ministry_statistic.fk_Activity = ministry_activity.ActivityID LEFT JOIN ministry_targetarea on ministry_targetarea.TargetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "') and ministry_activity.Strategy in (" + strategyList + ") and region is not null AND (ministry_targetarea.region <> '') GROUP BY ministry_targetarea.region ORDER BY ministry_targetarea.region";

		reportTitle = "National Report";


	} else if(request.getParameter("type").equals("regional")){

		sumsQuery = "SELECT MAX(ministry_targetarea.TargetAreaID) targetAreaID, MAX(ministry_targetarea.name) campusName, MAX(ministry_targetarea.enrollment) enrollment, SUM(ministry_statistic.exposures) as exposureSum, SUM(ministry_statistic.exposuresViaMedia) as exposuresViaMediaSum, SUM(ministry_statistic.evangelisticOneOnOne) as evangelisticOneOnOneSum, SUM(ministry_statistic.evangelisticGroup) as evangelisticGroupSum, SUM(ministry_statistic.ongoingEvangReln) as ongoingEvangRelnSum, SUM(ministry_statistic.decisions) as decisionSum, SUM(ministry_statistic.decisionsHelpedByMedia) as decisionsHelpedByMediaSum, SUM(ministry_statistic.decisionsHelpedByOneOnOne) as decisionsHelpedByOneOnOneSum, SUM(ministry_statistic.decisionsHelpedByGroup) as decisionsHelpedByGroupSum, SUM(ministry_statistic.decisionsHelpedByOngoingReln) as decisionsHelpedByOngoingRelnSum, SUM(ministry_statistic.attendedLastConf) as attendSum from ministry_statistic left join ministry_activity on (ministry_statistic.fk_Activity = ministry_activity.ActivityID) left join ministry_locallevel on (ministry_locallevel.TeamID = ministry_activity.fk_TeamID) LEFT JOIN ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_targetarea.region = '" + request.getParameter("region") + "' and ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' and ministry_activity.Strategy in (" + strategyList + ")) GROUP BY ministry_activity.ActivityID ORDER BY campusName";
		System.out.println(sumsQuery);
		demosQuery = "SELECT ministry_targetarea.targetAreaID, ministry_targetarea.name, ministry_statistic.invldNewBlvrs, ministry_statistic.invldStudents, ministry_statistic.invldFreshmen, ministry_statistic.invldSophomores, ministry_statistic.invldJuniors, ministry_statistic.invldSeniors, ministry_statistic.invldGrads, ministry_statistic.studentLeaders, ministry_statistic.volunteers, ministry_statistic.staff, ministry_statistic.nonStaffStint, ministry_statistic.staffStint FROM ministry_statistic INNER JOIN (SELECT ministry_statistic.fk_Activity AS fk_Activity, MAX(ministry_statistic.periodEnd) AS lastDate FROM ministry_statistic WHERE ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' GROUP BY fk_Activity) LastActivities ON ministry_statistic.fk_Activity = LastActivities.fk_Activity AND ministry_statistic.periodEnd = LastActivities.lastDate LEFT JOIN ministry_activity on ministry_statistic.fk_Activity = ministry_activity.ActivityID LEFT JOIN ministry_locallevel on ministry_locallevel.teamID = ministry_activity.fk_teamID LEFT JOIN ministry_targetarea on ministry_targetarea.targetAreaID = ministry_activity.fk_targetAreaID WHERE (ministry_statistic.periodEnd < '" + sqlTo + "' AND ministry_statistic.periodBegin >= '" + sqlFrom + "' and ministry_targetarea.region = '" + request.getParameter("region") + "') and ministry_activity.Strategy in (" + strategyList + ") ORDER BY ministry_targetarea.name, ministry_activity.ActivityID";

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

//    System.out.println(sumsQuery);
	java.sql.ResultSet sums = stmt1.executeQuery(sumsQuery);
	java.sql.ResultSet demos = stmt2.executeQuery(demosQuery);

%>
<html>
<head>
<title><%= pageTitle %></title>
<!--% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yy"); %-->

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
<TABLE WIDTH="99%" BORDER="0" CELLPADDING="1" CELLSPACING="0"><TR><TD BGCOLOR="<%= color1 %>">
	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>
<%

	if(request.getParameter("type").equals("regional") || request.getParameter("type").equals("locallevel")){

%>
		<td width="16%" align=LEFT VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Campus (enrollment)</td>
<%
	} else if(request.getParameter("type").equals("national")){

%>
		<td width="16%" align=LEFT VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Region</td>
<%
	}

%>
<!-- OLD SUCCESS CRITERIA CATEGORIES -->
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Attended Confe-<br>rences</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Involved New Believers</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Involved</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Freshmen Involved</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Sopho-<br>mores Involved</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Juniors Involved</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Seniors Involved</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Graduates Involved</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Volun-<br>teers</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Staff</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>WSN Non-staff STINT</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>WSN Staff STINT</td>

<!-- NEW SUCCESS CRITERIA CATEGORIES
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Media Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Group Presentations</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Individual Presentations</td>
	 	<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>On-Going Relationships</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Media Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Group Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Individual Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>On-going Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Involved New Believers</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Involved</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Leaders</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Volun-<br>teers</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Staff</td>
-->
	</tr>
<%
	int counter = 1;
	try {
	while(sums.next()){

		demos.next();
		// Hashtable myStat = (Hashtable)statlist.next();
		boolean tempBool = true;
		if(counter%2 == 0) tempBool = false;
		boolean tempBool2 = false;

		enrollmentSum += Integer.parseInt(((sums.getString("enrollment")==null)||(sums.getString("enrollment").equals("")))?"0":sums.getString("enrollment"));
		exposureSum += sums.getInt("exposureSum");
		exposuresViaMediaSum += sums.getInt("exposuresViaMediaSum");
		evangelisticOneOnOneSum += sums.getInt("evangelisticOneOnOneSum");
		evangelisticGroupSum += sums.getInt("evangelisticGroupSum");
		ongoingEvangRelnSum += sums.getInt("ongoingEvangRelnSum");
		decisionSum += sums.getInt("decisionSum");
		decisionsHelpedByMediaSum += sums.getInt("decisionsHelpedByMediaSum");
		decisionsHelpedByOneOnOneSum += sums.getInt("decisionsHelpedByOneOnOneSum");
		decisionsHelpedByGroupSum += sums.getInt("decisionsHelpedByGroupSum");
		decisionsHelpedByOngoingRelnSum += sums.getInt("decisionsHelpedByOngoingRelnSum");
		attendSum += sums.getInt("attendSum");

		%>
		<tr>
		<%
		invldNewBlvrsSum += demos.getInt("invldNewBlvrs");
		invldStudentsSum += demos.getInt("invldStudents");
		studentLeadersSum += demos.getInt("studentLeaders");
		invldFreshmenSum += demos.getInt("invldFreshmen");
		invldSophomoresSum += demos.getInt("invldSophomores");
		invldJuniorsSum += demos.getInt("invldJuniors");
		invldSeniorsSum += demos.getInt("invldSeniors");
		invldGradsSum += demos.getInt("invldGrads");
		volunteersSum += demos.getInt("volunteers");
		staffSum += demos.getInt("staff");
		nonStaffStintSum += demos.getInt("nonStaffStint");
		staffStintSum += demos.getInt("staffStint");

		if(request.getParameter("type").equals("regional") || request.getParameter("type").equals("locallevel")){

			%>
			<td <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="16%" align=LEFT><%=fontB1%><A HREF="/infobase/report_display_detail.jsp?type=targetarea&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%>&targetareaid=<%=sums.getString("targetAreaID")%><%= urlAppend %>"><%=sums.getString("campusName")%></A> (<%=((sums.getString("enrollment")==null)||(sums.getString("enrollment").equals("")))?"0":sums.getString("enrollment")%>)</td>
			<%
		}
		else if(request.getParameter("type").equals("national")){

			%>
			<td <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="16%" align=LEFT><%=fontB1%><A HREF="/infobase/report_display.jsp?region=<%=sums.getString("region")%>&type=regional&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB1%><%=org.alt60m.util.TextUtils.translate(_abbrevRegion, _expandRegion, sums.getString("region"))%></A></TD>
			<%
		}

		%>
<!-- OLD SUCCESS CRITERIA CATEGORIES -->
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("exposureSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("decisionSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("attendSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldNewBlvrs"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldStudents"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldFreshmen"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldSophomores"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldJuniors"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldSeniors"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldGrads"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("Volunteers"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("Staff"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("NonStaffStint"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("StaffStint"))%></td>

<!-- NEW SUCCESS CRITERIA CATEGORIES
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("exposureSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("exposuresViaMediaSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("evangelisticOneOnOneSum"))%></td>
	 	<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("evangelisticGroupSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("ongoingEvangRelnSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("decisionSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("decisionsHelpedByMediaSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("decisionsHelpedByOneOnOneSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("decisionsHelpedByGroupSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(sums.getInt("decisionsHelpedByOngoingRelnSum"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldNewBlvrs"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("InvldStudents"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("StudentLeaders"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("Volunteers"))%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=Integer.toString(demos.getInt("Staff"))%></td>
-->
		</tr>
		<%
		counter++;

	}
	}
	catch (java.sql.SQLException sqle) {
		sqle.printStackTrace();
	}
	
%>

	<tr <%=bgcolorL%>>
<%		if(request.getParameter("type").equals("regional") || request.getParameter("type").equals("locallevel")){
			%>
			<td <% if(request.getParameter("type").equals("targetarea")){ %>COLSPAN="2"<% } %> ALIGN="RIGHT"><%=fontB1%><B>Summary (<%=Integer.toString(enrollmentSum)%>)</B></td>
			<%
		}
		else if(request.getParameter("type").equals("national")){

			%>
			<td <% if(request.getParameter("type").equals("targetarea")){ %>COLSPAN="2"<% } %> ALIGN="RIGHT"><%=fontB1%><B>Summary</B></td>
			<%
		}
%>
<!-- OLD SUCCESS CRITERIA CATEGORIES -->

		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(exposureSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(decisionSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(attendSum)%></td>
		<td COLSPAN="11" ALIGN="CENTER"></td></TR>
	<TR <%=bgcolorL%>>
	<td ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="3"></TD>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldNewBlvrsSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldStudentsSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldFreshmenSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldSophomoresSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldJuniorsSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldSeniorsSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldGradsSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(volunteersSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(staffSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(nonStaffStintSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(staffStintSum)%></td>

<!-- NEW SUCCESS CRITERIA CATEGORIES

		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(exposureSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(exposuresViaMediaSum)%></td>     
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(evangelisticOneOnOneSum)%></td>
 		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(evangelisticGroupSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(ongoingEvangRelnSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(decisionSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(decisionsHelpedByMediaSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(decisionsHelpedByOneOnOneSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(decisionsHelpedByGroupSum)%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(decisionsHelpedByOngoingRelnSum)%></td>       
		<td COLSPAN="5" ALIGN="CENTER">&nbsp;</td></TR>
	<TR <%=bgcolorL%>>
	<td ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="10">&nbsp;</TD>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldNewBlvrsSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(invldStudentsSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(studentLeadersSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(volunteersSum)%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=Integer.toString(staffSum)%></td>
-->
	</tr>
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
		<%=fontB%>[<A HREF="/infobase/report_display.jsp?region=<%=region%>&type=regional&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB%>Zoom out to <%=region%> Region</A>]</FONT><BR>
<%
	}
%>
<%

	if(!request.getParameter("type").equals("national")){
%>
		<%=fontB%>[<A HREF="/infobase/report_display.jsp?type=national&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB%>Zoom out to National</A>]</FONT><BR>
<%
	}

	stmt1.close();
	stmt2.close();
	conn.close();
%>
</CENTER>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>

