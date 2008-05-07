<%@ page import="org.alt60m.servlet.*, java.util.*" %>
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
  int totHolySpirit = 0;
  int totLaborersSent = 0;
  int totNewBlvrs = 0; 
  int totMultipliers = 0; 
  int totStudents = 0; 
  int totSeekers = 0;
  int totStudentLeaders = 0;
	if(ActionResults.getActionResults(session)!=null){
		ActionResults ar;
		ar = ActionResults.getActionResults(session);
		for (Strategy strategy : Strategy.campusStrategies()) 
		{
			String strategyAbbreviation = strategy.toString();
			if("true".equals(ar.getValue(strategyAbbreviation))) 
			{
			      strategyNames.add(strategy.getName());
			      strategyAbbrevs.add(strategyAbbreviation);
			      strategyList += ", " + strategy.getName();
			      qStrategyList += ", " + "'" + strategyAbbreviation + "'"; 
			      urlAppend += "&strategies[" + strategyAbbreviation + "]="+strategyAbbreviation;
			}
		}
	}
	else
	{
			
		
  
		for (Strategy strategy : Strategy.campusStrategies()) {
			String strategyAbbreviation = strategy.toString();
			if("true".equals(request.getParameter(strategyAbbreviation))) {
			      strategyNames.add(strategy.getName());
			      strategyAbbrevs.add(strategyAbbreviation);
			      strategyList += ", " + strategy.getName();
			      qStrategyList += ", " + "'" + strategyAbbreviation + "'"; 
			      urlAppend += "&strategies[" + strategyAbbreviation + "]="+strategyAbbreviation;
			}
			
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

  String qry = "SELECT ministry_statistic.peopleGroup, ministry_activity.ActivityID, ministry_activity.strategy, " + 
  	"ministry_activity.status, ministry_activity.periodBegin as activityPeriodBegin, ministry_statistic.* ";
  qry += "FROM ministry_statistic INNER JOIN ministry_activity ON ministry_statistic.fk_activity = ministry_activity.activityid ";
  qry += "WHERE ministry_activity.strategy in (" + qStrategyList + ") ";
  qry += "AND ministry_statistic.periodend < '" + periodEnd + "' ";
  qry += "AND ministry_activity.fk_targetareaid = '" + targetAreaID + "' ";
  qry += "AND ministry_statistic.periodbegin >= '" + periodBegin + "' ";
  qry += "ORDER BY strategy, activityID, ministry_statistic.periodend, ministry_statistic.peopleGroup";

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
  if (!rs.first()) {
	out.print(fontB + "<B>No Results.</B></FONT>");
  } else { 

    int counter = 1;
    
    boolean moreTables = true;
	while (moreTables) {
		//always on first row of new table
		//get strategy name (& dates, if necessary)

		//fill variables
	    String strategy = rs.getString("strategy");
    	String status = rs. getString("status");
    	int activityID = rs.getInt("ActivityID");
    	Date activityPeriodbegin = rs.getDate("activityPeriodBegin");
//	    Date activityPeriodend = rs.getDate("activityPeriodEnd");
	    
    	//print header
	    String title = Strategy.valueOf(strategy).getName();
	    if (status.equals("IN")) {
	    	title += " (active starting from " + activityPeriodbegin + ")"; // to " + activityPeriodend + ")";
	    } 
	    %>
	    
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="0"><TR><TD BGCOLOR="<%= color1 %>">&nbsp;<B><%= font4 %><%=title %></B><BR>

	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>

		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>From</td>
		<td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%>To</td>
		<%if(strategy.equals("BR")){ %><td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=(strategy.equals("BR"))?fontB1+"People Group":""%></td><%} %>
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
		<%if(strategy.equals("BR")){
			%><td width="6%" align=center VALIGN="BOTTOM" <%=bgcolorL%>><%=fontB1%><i>Seekers (Bridges)</i></td><%
			}%>	
	</tr>
		<%
		String dateTag="";	
		String lastRow="";
		boolean tempBool=true;
		Boolean splitStat=false;
	    boolean continueTable = true;
	    while (continueTable) {
	    	//fill current statistic's variables
	    	Date periodbegin = rs.getDate("periodBegin");
		    Date periodend = rs.getDate("periodEnd");
		    int exposuresViaMedia = rs.getInt("exposuresViaMedia");
	    	int evangelisticOneOnOne = rs.getInt("evangelisticOneOnOne");
		    int evangelisticGroup = rs.getInt("evangelisticGroup");
	    	int decisions = rs.getInt("decisions");
	    	int holySpirit = rs.getInt("holySpiritConversations");
		    int laborersSent = rs.getInt("laborersSent");
	    	int multipliers = rs.getInt("multipliers");
		    int newBlvrs = rs.getInt("invldNewBlvrs");
	    	int students = rs.getInt("invldStudents");
	    	int seekers = rs.getInt("ongoingEvangReln");
		    int studentLeaders = rs.getInt("studentLeaders");
		    String peopleGroup=rs.getString("peopleGroup");
	    	// add to summary and print
	    	totMediaExposures += exposuresViaMedia;
			totIndividualPresentations += evangelisticOneOnOne;
			totGroupPresentations += evangelisticGroup;
			totDecisions += decisions;
			totHolySpirit += holySpirit;
			totLaborersSent += laborersSent;
			totNewBlvrs = newBlvrs;
			totMultipliers = multipliers;
			totStudents = students;
			totSeekers=seekers;
			totStudentLeaders = studentLeaders;

			
			
			dateTag=rs.getDate("periodBegin")!=null?rs.getDate("periodBegin").toString():"";
			boolean tempBool2 = false;
			
			if (lastRow.equals(activityID+dateTag))
			{splitStat=true;}
			else
			{
			
			lastRow=activityID+dateTag;
			tempBool = !tempBool;
			splitStat=false;
			}		
			
			
			%>
			<tr>
				
				<td <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %>  width="8%" align=center><%=fontB1%><%if(!splitStat){ %><%=dateFormatter.format(periodbegin)%><%} %></td>
				<td  <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="8%" align=center><%=fontB1%><%if(!splitStat){ %><%=dateFormatter.format(periodend)%><%} %></td>
				<%if(strategy.equals("BR")){%><td  <%= tempBool2 ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="8%" align=center><%=fontB1%><%=peopleGroup!=null?peopleGroup:"stats prior to 4/23/2008"%></td><%} %>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=evangelisticOneOnOne%></td>
		 	<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=evangelisticGroup%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=exposuresViaMedia%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=decisions%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=holySpirit%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=laborersSent%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=multipliers%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=studentLeaders%></td>
			<td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><%=students%></td>
			<%if(strategy.equals("BR")){
			%><td <% tempBool2 = !tempBool2;%><%= (tempBool2) ? (tempBool ? bgcolorW : bgcolorLG) : (tempBool ? bgcolorLG : bgcolorG) %> width="6%" align=center><%=fontB1%><i><%=seekers%></i></td><%
			}else{ tempBool2 = !tempBool2;}%>
			</tr>
			<%
			counter++;
	    	boolean more = rs.next();
	    	if (!more) {
	    		moreTables = false;
	    		continueTable = false;
	    	} else {
				int nextActivityID = rs.getInt("ActivityID");
	        	if (nextActivityID != activityID) {
	        		continueTable = false;
	        	}
	    	}
	    }
	    //print footer
	    %>

	<tr <%=bgcolorL%>>
          <td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Summary</B></td>
		<%if(strategy.equals("BR")){ %><td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>></td><%} %>
		<td ALIGN="CENTER"><%=fontB1%><%=totIndividualPresentations%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totGroupPresentations%></td>      
		<td ALIGN="CENTER"><%=fontB1%><%=totMediaExposures%></td>         
		<td ALIGN="CENTER"><%=fontB1%><%=totDecisions%></td>          
		<td ALIGN="CENTER"><%=fontB1%><%=totHolySpirit%></td>  
		<td ALIGN="CENTER"><%=fontB1%><%=totLaborersSent%></td>       
		<td COLSPAN="3" ALIGN="CENTER">&nbsp;</td>
		<%if(strategy.equals("BR")){
			%><td ALIGN="CENTER">&nbsp;</td><%
			}%>	
		</TR>
	<TR <%=bgcolorL%>>
	<td COLSPAN="2" ALIGN="RIGHT"><%=fontB1%><B>Demographics</B></TD>
	<%if(strategy.equals("BR")){ %><td width="8%" align=center VALIGN="BOTTOM" <%=bgcolorL%>></td><%} %>
	<TD COLSPAN="6">&nbsp;</TD>
		<td ALIGN="CENTER"><%=fontB1%><%=totMultipliers%></td>
		<td ALIGN="CENTER"><%=fontB1%><%=totStudentLeaders%></td>   
		<td ALIGN="CENTER"><%=fontB1%><%=totStudents%></td>
		<%if(strategy.equals("BR")){
			%><td ALIGN="CENTER"><%=fontB1%><i><%=totSeekers%></i></td><%
			}%>	
	</tr>

</TABLE>
</TD></TR></TABLE><BR>
		<%

	   	//clear summary variables

		totMediaExposures = 0;
		totIndividualPresentations = 0;
		totGroupPresentations = 0;
		totDecisions = 0;
		totLaborersSent = 0;
		totNewBlvrs = 0; 
		totMultipliers = 0; 
		totStudents = 0; 
		totStudentLeaders = 0;
	}
}
    stmt.close();
    conn.close();
%>
<P>


		<%=fontB%>[<A
			      HREF="/servlet/InfoBaseController?action=showReport&region=<%=region%>&type=regional&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB%>Zoom out to <%=region%> Region</A>]</FONT><BR>

		<%=fontB%>[<A
			      HREF="/servlet/InfoBaseController?action=showReport&region=<%=region%>&type=national&frommonth=<%=request.getParameter("frommonth")%>&fromyear=<%=request.getParameter("fromyear")%>&tomonth=<%=request.getParameter("tomonth")%>&toyear=<%=request.getParameter("toyear")%><%= urlAppend %>"><%=fontB%>Zoom out to National</A>]</FONT><BR>




</CENTER>
<%@ include file="/infobase/ibfooter.jspf" %>
<% //} catch (Exception e) {e.printStackTrace();}%>
</html>
