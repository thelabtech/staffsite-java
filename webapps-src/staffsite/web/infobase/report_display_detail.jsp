<%@ page import="java.util.*" %>
<%
//try {
//TODO: 
//fix no records logic

  Log log = LogFactory.getLog("org.alt60m.infobase.jsp.report_display_detail");

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
  

  Vector strategyNames = new Vector();
  Vector strategyAbbrevs = new Vector();
  String strategyList = new String();
  String qStrategyList = new String();

  //strategyNames.add(_expandStrategy[0]);
  //strategyAbbrevs.add(_abbrevStrategy[0]);
  //strategyList += _expandStrategy[0];
  //qStrategyList += "'" + _abbrevStrategy[0] + "'"; 
  //urlAppend += "&" + _abbrevStrategy[0] + "=true";

  int totMediaExposures = 0;
  int totIndividualPresentations = 0;
  int totGroupPresentations = 0;
  int totDecisions = 0;
  int totLaborersSent = 0;
  int totNewBlvrs = 0; 
  int totMultipliers = 0; 
  int totStudents = 0; 
  int totStudentLeaders = 0;

  
	for (Strategy strategy : Strategy.campusStrategies()) {
		String strategyAbbreviation = strategy.toString();
		if("true".equals(request.getParameter(strategyAbbreviation))) {
		      strategyNames.add(strategy.getName());
		      strategyAbbrevs.add(strategyAbbreviation);
		      strategyList += ", " + strategy.getName();
		      qStrategyList += ", " + "'" + strategyAbbreviation + "'"; 
		      urlAppend += "&" + strategyAbbreviation + "=true";
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

  log.debug("Query: " + qry);
  java.sql.Statement stmt = conn.createStatement();
  java.sql.ResultSet rs = stmt.executeQuery(qry);

%>
<%@page import="org.alt60m.ministry.Strategy"%>
<%@page import="org.apache.commons.logging.Log"%>
<%@page import="org.apache.commons.logging.LogFactory"%>
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
  if (rs.first()) {
	  
	rs.beforeFirst();
    boolean printHeader = false;
    boolean printFooter = false;
    boolean firstTime = true;
    String currentStrategy = "initial";
    int counter = 1;

    while (rs.next()) {
      String strategy = new String();
      Date periodbegin = new Date();
      Date periodend = new Date();
      
      periodbegin = rs.getDate("periodBegin");
      periodend = rs.getDate("periodEnd");
      int exposuresViaMedia = rs.getInt("exposuresViaMedia");
      int evangelisticOneOnOne = rs.getInt("evangelisticOneOnOne");
      int evangelisticGroup = rs.getInt("evangelisticGroup");
      int decisions = rs.getInt("decisions");
      int laborersSent = rs.getInt("laborersSent");
      int multipliers = rs.getInt("multipliers");
      int newBlvrs = rs.getInt("invldNewBlvrs");
      int students = rs.getInt("invldStudents");
      int studentLeaders = rs.getInt("studentLeaders");
      strategy = rs.getString("strategy");

      if (!strategy.equals(currentStrategy)) {
          currentStrategy = strategy;
        
        if (firstTime) {
          firstTime = false;
%>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0"><TR><TD BGCOLOR="<%= color1 %>">&nbsp;<B><%= font4 %><%=Strategy.valueOf(currentStrategy).getName() %></B><BR>

	<table width="860px" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>

		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>From</td>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>To</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Personal Evangelism</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Group Evangelism</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Media Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Laborers Sent</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Multipliers</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Leaders</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Involved</td>
	</tr>
<%
        } else {
%>

	<tr <%=bgcolorL%>>
          <td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Summary</B></td>

		<td ALIGN="CENTER"><%=fontB1%><%=totIndividualPresentations%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totGroupPresentations%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totMediaExposures%></td>         
		<td ALIGN="CENTER"><%=fontB1%><%=totDecisions%></td>          
		<td ALIGN="CENTER"><%=fontB1%><%=totLaborersSent%></td>       
		<td COLSPAN="3" ALIGN="CENTER">&nbsp;</td></TR>
	<TR <%=bgcolorL%>>
	<td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="5">&nbsp;</TD>
		<td ALIGN="CENTER"><%=fontB1%><%=totMultipliers%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=totStudentLeaders%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStudents%></td>
	</tr>

</TABLE>
</TD></TR></TABLE><BR>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0"><TR><TD BGCOLOR="<%= color1 %>">&nbsp;<B><%= font4 %><%=Strategy.valueOf(currentStrategy).getName() %></B><BR>

	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>From</td>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>To</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Personal Evangelism</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Group Evangelism</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Media Exposures</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Decisions</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Laborers Sent</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Multipliers</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Leaders</td>
		<td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>Students Involved</td>
	</tr>

<%
        }


        totMediaExposures = 0;
        totIndividualPresentations = 0;
        totGroupPresentations = 0;
        totDecisions = 0;
        totLaborersSent = 0;
        totNewBlvrs = 0; 
        totMultipliers = 0; 
        totStudents = 0; 
        totStudentLeaders = 0;
   } //end of ctrl-break

        //display and total data
	totMediaExposures += exposuresViaMedia;
	totIndividualPresentations += evangelisticOneOnOne;
	totGroupPresentations += evangelisticGroup;
	totDecisions += decisions;
	totLaborersSent += laborersSent;

	totNewBlvrs = newBlvrs;
	totMultipliers = multipliers;
	totStudents = students;
	totStudentLeaders = studentLeaders;

        boolean tempBool = true;
        if(counter%2 == 0) tempBool = false;
	boolean tempBool2 = false;
%>
		<tr>
			<td <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="8%" align=center><%=fontB1%><%=dateFormatter.format(periodbegin)%></td>
			<td  <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="8%" align=center><%=fontB1%><%=dateFormatter.format(periodend)%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=evangelisticOneOnOne%></td>
	 	<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=evangelisticGroup%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=exposuresViaMedia%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=decisions%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=laborersSent%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=multipliers%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=studentLeaders%></td>
		<td <%= (tempBool2 = !tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=students%></td>
		</tr>
<%
	counter++;



    } //end of while rs
%>
	<tr <%=bgcolorL%>>
          <td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Summary</B></td>

		<td ALIGN="CENTER"><%=fontB1%><%=totIndividualPresentations%></td> 
	 	<td ALIGN="CENTER"><%=fontB1%><%=totGroupPresentations%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totMediaExposures%></td>     
		<td ALIGN="CENTER"><%=fontB1%><%=totDecisions%></td>       
		<td ALIGN="CENTER"><%=fontB1%><%=totLaborersSent%></td>
		<td COLSPAN="3" ALIGN="CENTER">&nbsp;</td></TR>
	<TR <%=bgcolorL%>>
	<td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<TD COLSPAN="5">&nbsp;</TD>
		<td ALIGN="CENTER"><%=fontB1%><%=totMultipliers%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=totStudentLeaders%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totStudents%></td>   
	</tr>
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
