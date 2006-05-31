<%@ page import="java.util.*" %>
<%
//try {
//TODO: 
//fix no records logic

  String urlAppend = new String();
  String targetAreaName = new String();
  String targetAreaID = request.getParameter("targetareaid");
  String region = new String();
  
  java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yy");
  String pageTitle="Success Criteria Reports";

  String reportTitle = "Campus Report: " + targetAreaName;
    String periodBegin = request.getParameter("fromyear") + "/" + request.getParameter("frommonth") + "/01";
    int tomonth = Integer.parseInt(request.getParameter("tomonth"));
    // tomonth/12 returns 1, if december. (tomonth+1)%12 returns the next month, providing for december.
    String periodEnd = (Integer.parseInt(request.getParameter("toyear"))+(tomonth/12)) + "/" + Integer.toString((tomonth%12)+1) + "/01";
//  String periodEnd = request.getParameter("toyear") + "/" + Integer.toString(Integer.parseInt(request.getParameter("tomonth")) + 1) + "/01";
  String[] _abbrevStrategy = new String[] { "CA", "SC", "IE", "ID", "II", "WI", "WS", "BR" };
  String[] _expandStrategy = new String[] {"Catalytic", "Staffed Campus", "ESM-Epic", "ESM-Destino", "ESM-Impact", "WSN ICS", "WSN STInt", "Bridges"};
  Hashtable strategyPairs = new Hashtable();
  strategyPairs.put("CA", "Catalytic");
  strategyPairs.put("SC", "Staffed Campus");  
  strategyPairs.put("IE", "ESM-Epic");  
  strategyPairs.put("ID", "ESM-Destino");  
  strategyPairs.put("II", "ESM-Impact");  
  strategyPairs.put("BR", "Bridges");  
  strategyPairs.put("WI", "WSN ICS");  
  strategyPairs.put("WS", "WSN STInt");

  Vector strategyNames = new Vector();
  Vector strategyAbbrevs = new Vector();
  String strategyList = new String();
  String qStrategyList = new String();

  //strategyNames.add(_expandStrategy[0]);
  //strategyAbbrevs.add(_abbrevStrategy[0]);
  //strategyList += _expandStrategy[0];
  //qStrategyList += "'" + _abbrevStrategy[0] + "'"; 
  //urlAppend += "&" + _abbrevStrategy[0] + "=true";

  int totExposures, totMediaExposures, totIndividualPresentations, totGroupPresentations, totOngoingRelationships, totDecisions,  totOngoingDecisions, totMediaDecisions, totIndividualDecisions, totGroupDecisions, totAttended, totNewBlvrs, totStudents, totfreshmen, totSophomores, totJuniors, totSeniors, totGrads, totStudentLeaders, totVols, totStaff, totNonStaffStint, totStaffStint;
  totExposures = totMediaExposures = totIndividualPresentations = totGroupPresentations = totOngoingRelationships = totDecisions =  totOngoingDecisions = totMediaDecisions = totIndividualDecisions = totGroupDecisions = totAttended = totNewBlvrs = totStudents = totfreshmen = totSophomores = totJuniors = totSeniors = totGrads = totStudentLeaders = totVols = totStaff = totNonStaffStint = totStaffStint = 0;

  for (int i = 0; i < _abbrevStrategy.length; i++) {
    if (request.getParameter(_abbrevStrategy[i]) != null) {
      strategyNames.add(_expandStrategy[i]);
      strategyAbbrevs.add(_abbrevStrategy[i]);
      strategyList += ", " + _expandStrategy[i];
      qStrategyList += ", " + "'" + _abbrevStrategy[i] + "'"; 
      urlAppend += "&" + _abbrevStrategy[i] + "=true";
    }
  }
  if(qStrategyList.length() > 1) {
	qStrategyList = qStrategyList.substring(2, qStrategyList.length());
	strategyList = strategyList.substring(2, strategyList.length());
  }


  java.sql.Connection conn = org.alt60m.util.DBConnectionFactory.getDatabaseConn();

  java.sql.Statement tastmt = conn.createStatement();
  java.sql.ResultSet tars = tastmt.executeQuery("SELECT name, region FROM ministry_targetarea WHERE targetareaid = "+ targetAreaID);
  tars.next();
  targetAreaName = tars.getString(1);
  region = tars.getString(2);

  String qry = "SELECT ministry_statistic.*, ministry_activity.strategy ";
  qry += "FROM ministry_statistic INNER JOIN ministry_activity ON ministry_statistic.fk_activity = ministry_activity.activityid ";
  qry += "WHERE ministry_activity.strategy in (" + qStrategyList + ") ";
  qry += "AND ministry_statistic.periodend < '" + periodEnd + "' ";
  qry += "AND ministry_activity.fk_targetareaid = '" + targetAreaID + "' ";
  qry += "AND ministry_statistic.periodbegin >= '" + periodBegin + "' ";
  qry += "ORDER BY strategy, ministry_statistic.periodend";

  java.sql.Statement stmt = conn.createStatement();
  java.sql.ResultSet rs = stmt.executeQuery(qry);

%>
<html>
<head>
<title><%= pageTitle %></title>

<%@ include file="/infobase/ibheader.jspf" %>

<TABLE width="100%">
  <TR>
    <td>
      <%=fontB%>Return to: <A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=targetAreaID%>"><%=targetAreaName%></A></font>
    </td>

    <TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Success Criteria Reports</a></font></TD>
    </TR>
</TABLE>

    <br>
    <%=fontB3%><B><%= reportTitle %> <%=targetAreaName%></b></font><BR>
    <%=fontB%>
    For dates: <%=periodBegin%> to <%=periodEnd%><br>
    Including strategies: <%=strategyList%><br>
    <P>
    </font>
    <CENTER>

<%
  if (true) {
    boolean printHeader = false;
    boolean printFooter = false;
    boolean firstTime = true;
    String currentStrategy = "initial";
    int counter = 1;

    while (rs.next()) {
      int exposures, exposuresViaMedia, evangelisticOneOnOne, evangelisticGroup, ongoingEvangReln, decisions, decisionsHelpedByMedia, decisionsHelpedByOneOnOne, decisionsHelpedByGroup, decisionsHelpedByOngoingReln, attended, newBlvrs, students, freshmen, sophomores, juniors, seniors, grads, studentLeaders, vols, staff, nonStaffStint, staffStint;
      String strategy = new String();
      Date periodbegin = new Date();
      Date periodend = new Date();
      
      periodbegin = rs.getDate("periodBegin");
      periodend = rs.getDate("periodEnd");
      exposures = rs.getInt("exposures");
      exposuresViaMedia = rs.getInt("exposuresViaMedia");
      evangelisticOneOnOne = rs.getInt("evangelisticOneOnOne");
      evangelisticGroup = rs.getInt("evangelisticGroup");
      ongoingEvangReln = rs.getInt("ongoingEvangReln");
      decisions = rs.getInt("decisions");
      decisionsHelpedByMedia = rs.getInt("decisionsHelpedByMedia");
      decisionsHelpedByOneOnOne = rs.getInt("decisionsHelpedByOneOnOne");
      decisionsHelpedByGroup = rs.getInt("decisionsHelpedByGroup");
      decisionsHelpedByOngoingReln = rs.getInt("decisionsHelpedByOngoingReln");
      attended = rs.getInt("attendedLastConf");
      newBlvrs = rs.getInt("invldNewBlvrs");
      students = rs.getInt("invldStudents");
      freshmen = rs.getInt("invldFreshmen");
      sophomores = rs.getInt("invldSophomores");
      juniors = rs.getInt("invldJuniors");
      seniors = rs.getInt("invldSeniors");
      grads = rs.getInt("invldGrads");
      studentLeaders = rs.getInt("studentLeaders");
      vols = rs.getInt("volunteers");
      staff = rs.getInt("staff");
      nonStaffStint = rs.getInt("nonStaffStint");
      staffStint = rs.getInt("staffStint");
      strategy = rs.getString("strategy");

      if (!strategy.equals(currentStrategy)) {
          currentStrategy = strategy;
        
        if (firstTime) {
          firstTime = false;
%>
<TABLE WIDTH="860px" BORDER="0" CELLPADDING="1" CELLSPACING="0"><TR><TD BGCOLOR="<%= color1 %>">&nbsp;<B><%= font4 %><%=strategyPairs.get(currentStrategy) %></B><BR>

	<table width="860px" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>
<!-- OLD SUCCESS CRITERIA CATEGORIES -->
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>From</td>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>To</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Attended Confer-<br>ences</td>
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
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>From</td>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>To</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Media Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Group Presentations</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Individual Presentations</td>
	 	<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>On-going Relationships</td>
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
        } else {
%>
<!-- OLD SUCCESS CRITERIA CATEGORIES -->
	<tr <%=bgcolorL%>>
          <td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Summary</B></td>

		<td ALIGN="CENTER"><%=fontB1%><%=totExposures%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totAttended%></td>
		<td COLSPAN="11" ALIGN="CENTER">&nbsp;</td></TR>
	<TR <%=bgcolorL%>>
	<td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="3">&nbsp;</TD>
		<td ALIGN="CENTER"><%=fontB1%><%=totNewBlvrs%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStudents%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totfreshmen%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totSophomores%></td> 
		<td ALIGN="CENTER"><%=fontB1%><%=totJuniors%></td>    
		<td ALIGN="CENTER"><%=fontB1%><%=totSeniors%></td>    
		<td ALIGN="CENTER"><%=fontB1%><%=totGrads%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totVols%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totStaff%></td>           
		<td ALIGN="CENTER"><%=fontB1%><%=totNonStaffStint%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStaffStint%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=totIndividualPresentations%></td> <%--Added 1/27/06 SRW - puts total for Individual Presentations on Success Criteria report --%>

	</tr>
</TABLE>
</TD></TR></TABLE><BR>

<TABLE WIDTH="860px" BORDER="0" CELLPADDING="1" CELLSPACING="0"><TR><TD BGCOLOR="<%= color1 %>">&nbsp;<B><%= font4 %><%=strategyPairs.get(currentStrategy) %></B><BR>

	<table width="860px" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>From</td>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>To</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Attended Confer-<br>ences</td>
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
	<tr <%=bgcolorL%>>
          <td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Summary</B></td>

		<td ALIGN="CENTER"><%=fontB1%><%=totExposures%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totMediaExposures%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totIndividualPresentations%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totGroupPresentations%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totOngoingRelationships%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totMediaDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totIndividualDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totGroupDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totOngoingDecisions%></td>       
		<td COLSPAN="5" ALIGN="CENTER">&nbsp;</td></TR>
	<TR <%=bgcolorL%>>
	<td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="10">&nbsp;</TD>
		<td ALIGN="CENTER"><%=fontB1%><%=totNewBlvrs%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStudents%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStudentLeaders%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totVols%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totStaff%></td>           
	</tr>

</TABLE>
</TD></TR></TABLE><BR>

<TABLE WIDTH="99%" BORDER="0" CELLPADDING="1" CELLSPACING="0"><TR><TD BGCOLOR="<%= color1 %>">&nbsp;<B><%= font4 %><%=strategyPairs.get(currentStrategy) %></B><BR>

	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>From</td>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>To</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Media Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Group Presentations</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Individual Presentations</td></tr> <%-- 1/267/06 SRW Bridges requested stat to be enabled --%>
	 	<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>On-going Relationships</td>
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
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>WSN Non-staff STINT</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>WSN Staff STINT</td>
	</tr>
-->
<%
        }

        totExposures = totDecisions = totAttended = totNewBlvrs = totStudents = totfreshmen = totSophomores = totJuniors = totSeniors = totGrads = totVols = totStaff = totNonStaffStint = totStaffStint = 0;
        totIndividualPresentations = 0; //Added 1/27/06 SRW - Bridges requested stat change, this variable needs to be reset
      } //end of ctrl-break

        //display and total data
	totExposures += exposures;
	totMediaExposures += exposuresViaMedia;
	totIndividualPresentations += evangelisticOneOnOne;
	totGroupPresentations += evangelisticGroup;
	totOngoingRelationships += ongoingEvangReln;
	totDecisions += decisions;
	totOngoingDecisions += decisionsHelpedByOngoingReln;
	totMediaDecisions += decisionsHelpedByMedia;
	totIndividualDecisions += decisionsHelpedByOneOnOne;
	totGroupDecisions += decisionsHelpedByGroup;
	totAttended += attended;
/*
	    totNewBlvrs += newBlvrs;
	    totStudents += students;
	    totfreshmen += freshmen;
	    totSophomores += sophomores;
	    totJuniors += juniors;
	    totSeniors += seniors;
	    totGrads += grads;
	    totVols += vols;
	    totStaff += staff;
	    totNonStaffStint += nonStaffStint;
	    totStaffStint += staffStint;
*/

	totNewBlvrs = newBlvrs;
	totStudents = students;
	totfreshmen = freshmen;
	totSophomores = sophomores;
	totJuniors = juniors;
	totSeniors = seniors;
	totGrads = grads;
	totStudentLeaders = studentLeaders;
	totVols = vols;
	totStaff = staff;
	totNonStaffStint = nonStaffStint;
	totStaffStint = staffStint;

        boolean tempBool = true;
        if(counter%2 == 0) tempBool = false;
	boolean tempBool2 = false;
%>
		<tr>
			<td <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="8%" align=center><%=fontB1%><%=dateFormatter.format(periodbegin)%></td>
			<td  <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="8%" align=center><%=fontB1%><%=dateFormatter.format(periodend)%></td>
<!-- OLD SUCCESS CRITERIA CATEGORIES -->
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=exposures%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=decisions%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=attended%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=newBlvrs%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=students%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=freshmen%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=sophomores%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=juniors%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=seniors%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=grads%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=vols%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=staff%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=nonStaffStint%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=staffStint%></td>

<!-- NEW SUCCESS CRITERIA CATEGORIES
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=exposures%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=exposuresViaMedia%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=evangelisticOneOnOne%></td>
	 	<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=evangelisticGroup%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=ongoingEvangReln%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=decisions%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=decisionsHelpedByMedia%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=decisionsHelpedByOneOnOne%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=decisionsHelpedByGroup%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=decisionsHelpedByOngoingReln%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=newBlvrs%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=students%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=studentLeaders%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=vols%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=staff%></td>
-->
		</tr>
<%
	counter++;



    } //end of while rs
%>
	<tr <%=bgcolorL%>>
          <td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Summary</B></td>
<!-- OLD SUCCESS CRITERIA CATEGORIES  -->

		<td ALIGN="CENTER"><%=fontB1%><%=totExposures%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totAttended%></td>
		<td COLSPAN="11" ALIGN="CENTER">&nbsp;</td></TR>
	<TR <%=bgcolorL%>>
	<td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="3">&nbsp;</TD>
		<td ALIGN="CENTER"><%=fontB1%><%=totNewBlvrs%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStudents%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totfreshmen%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totSophomores%></td> 
		<td ALIGN="CENTER"><%=fontB1%><%=totJuniors%></td>    
		<td ALIGN="CENTER"><%=fontB1%><%=totSeniors%></td>    
		<td ALIGN="CENTER"><%=fontB1%><%=totGrads%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totVols%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totStaff%></td>           
		<td ALIGN="CENTER"><%=fontB1%><%=totNonStaffStint%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStaffStint%></td>

	

<!-- NEW SUCCESS CRITERIA CATEGORIES

		<td ALIGN="CENTER"><%=fontB1%><%=totExposures%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totMediaExposures%></td>     
		<td ALIGN="CENTER"><%=fontB1%><%=totIndividualPresentations%></td> </tr>
	 	<td ALIGN="CENTER"><%=fontB1%><%=totGroupPresentations%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totOngoingRelationships%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totMediaDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totIndividualDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totGroupDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totOngoingDecisions%></td>       
		<td COLSPAN="5" ALIGN="CENTER">&nbsp;</td></TR>
	<TR <%=bgcolorL%>>
	<td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="10">&nbsp;</TD>
		<td ALIGN="CENTER"><%=fontB1%><%=totNewBlvrs%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStudents%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStudentLeaders%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totVols%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totStaff%></td>           
	</tr>
-->
</TABLE>
</TD></TR></TABLE><BR>
<% 
    stmt.close();
    conn.close();

} else out.print(fontB + "<B>No Results.</B></FONT>"); %>
<P>


		<%=fontB%>[<A
			      HREF="/infobase/report_display.jsp?region=<%=region%>&type=regional&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB%>Zoom out to <%=region%> Region</A>]</FONT><BR>

		<%=fontB%>[<A
			      HREF="/infobase/report_display.jsp?region=<%=region%>&type=national&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB%>Zoom out to National</A>]</FONT><BR>




</CENTER>
<%@ include file="/infobase/ibfooter.jspf" %>
<% //} catch (Exception e) {e.printStackTrace();}%>
</html>
