<%@ page language="java" %>
<jsp:useBean id="qb" class="org.alt60m.rd.QuestBean"/>
<%@ page import="java.util.*,java.awt.*,java.sql.*" %>
<%!
int returnComplicatedCount (String tableNames, String restrictions){
	int temp=-9999;
	try{
		rs= stmt.executeQuery("SELECT COUNT(*) FROM " + tableNames + " WHERE " + restrictions);
		rs.next();
		temp = rs.getInt(1);
	}
	catch (Exception e){
		System.out.println(e);
	}
	return temp;
}

/* ---------------------------------------------------------------------------------- */
String doStatsTable (String quest, String statTitle, String primaryColumn, String whereString, String cutOff ) throws SQLException {
	String temp = "<table border='1'>\r\n <tr><td align='center'>\r\n";
	temp = temp + "<font size='3' face='arial'><b>" +  statTitle + "</td></tr>\r\n<tr><td>\r\n<table>";
	String 	secondaryTable = "";
	int tempCounter = 0;
	if (cutOff.equals("")){		cutOffPercentage=0; }
	else { cutOffPercentage=Integer.parseInt(cutOff); }
	Statement statmt;
	ResultSet rst;

	if (primaryColumn.equalsIgnoreCase("ageprofile")){
		secondaryTable = "Q2_ageprofile";
		}
	else if (primaryColumn.equalsIgnoreCase("ethnicity")){
		secondaryTable = "Q_ethnicity";
		}
	else if (primaryColumn.equalsIgnoreCase("singlething")){		//q1
		secondaryTable = "Q1_singlething";
		}
	else if (primaryColumn.equalsIgnoreCase("afterdeath")){			//q1
		secondaryTable = "Q1_afterdeath";
		}
	else if (primaryColumn.equalsIgnoreCase("howtox")){				//q1
		secondaryTable = "Q1_howtox";
		}
	else if ((primaryColumn.equalsIgnoreCase("relBackground"))||(primaryColumn.equalsIgnoreCase("religBackground"))){
		primaryColumn = "religBackground";
		secondaryTable = "Q2_relBackground";
		}
	else if ((primaryColumn.equalsIgnoreCase("relIdentity"))||(primaryColumn.equalsIgnoreCase("religIdentity"))){
		primaryColumn = "religIdentity";
		secondaryTable = "Q2_relIdentity";
		}
	else if ((primaryColumn.equalsIgnoreCase("expGod"))||(primaryColumn.equalsIgnoreCase("howExpGod"))){
		primaryColumn = "expGodhow";
		secondaryTable = "Q2_expGodHow";
		}
	else if ((primaryColumn.equalsIgnoreCase("whoIsGod"))||(primaryColumn.equalsIgnoreCase("whowhat"))){
		primaryColumn = "whoIsGod";
		secondaryTable = "Q2_whoIsGod";
		}

	if (!whereString.equals("")){	whereString = " AND " + whereString;	}

	if (primaryColumn.equalsIgnoreCase("words")){
		String tString="";
		String tString2="";
		if (quest.equalsIgnoreCase("quest1")) { tString2="q1_describelife"; }
		else if (quest.equalsIgnoreCase("quest2")) { tString2="q2_relexpword"; }

		tString=getNA(tString2);
		tempCounter=returnComplicatedCount(quest,"(wordOne !='" + tString + "' OR wordTwo !='" + tString + "' OR wordThree !='" + tString + "')" + whereString);
		if (tempCounter > 0){
			statmt = con.createStatement();
			rst= statmt.executeQuery("Select * from " + tString2 + " WHERE ID != '" + tString + "' order by value");
			while(rst.next()){
				String restriction = rst.getString("ID");
				int records=returnComplicatedCount(quest,"(wordOne ='" + restriction + "' OR wordTwo ='" + restriction + "' OR wordThree ='" + restriction + "')" + whereString);
				if (((records*100)/(tempCounter)) > cutOffPercentage) {
					temp=temp+"<tr><td><font size='2' face='arial'>" + rst.getString("value") + "</td>		<td> &nbsp; </td>	<td><img src='/quest/images/reddot.gif' height='10' width='" + (records*100)/tempCounter + "'></td><td> <font size='2' face='arial'>" + (records*100)/tempCounter + "." + ((records*1000)/tempCounter)%10 + "<font size='1'>% </td></tr>";
				}
			}
			statmt.close();		
		}
		else { 	temp=temp+"<tr><td colspan = '2'><font size='2' face='arial'>No records to display</td></tr>";}
	}
	else if (primaryColumn.equalsIgnoreCase("desirescale")){
		tempCounter=returnComplicatedCount(quest,"(desirescale != 0)" + whereString);
				if (tempCounter > 0){
		int tempCounter2=0;
			for (int cnt=10 ; cnt>0 ; cnt--){
				int records=returnComplicatedCount(quest,"desirescale = " + Integer.toString(cnt) + "" + whereString);
				temp=temp+"<tr><td nowrap><font size='2' face='arial'>Desire " + cnt + ":</td>		<td> &nbsp; </td>	<td><img src='/quest/images/reddot.gif' height='10' width='" + (records*100)/tempCounter + "'></td><td> <font size='2' face='arial'>" + (records*100)/tempCounter + "." + ((records*1000)/tempCounter)%10 + "<font size='1'>% </td></tr>";
				tempCounter2=tempCounter2+(records*cnt);
			}
			temp=temp+"<tr><td><font size='2' face='arial'><b>Average:</td>	<td> &nbsp; </td>	<td> &nbsp; </td><td> <font size='2' face='arial'><b>" + (tempCounter2)/tempCounter + "." + ((tempCounter2*10)/tempCounter)%10 + "</td></tr>";
		}
		else { 	temp=temp+"<tr><td colspan = '2'><font size='2' face='arial'>No records to display</td></tr>";}
	}
	else if (secondaryTable != ""){
		String tString="";
		statmt = con.createStatement();
		
		tString=getNA(secondaryTable);

		tempCounter=returnComplicatedCount(quest,"(" + primaryColumn + " !='" + tString + "')" + whereString);
		if (tempCounter>0) {
			statmt = con.createStatement();
			rst= statmt.executeQuery("Select * from " + secondaryTable + " WHERE ID != '" + tString + "' order by value");
						while(rst.next()){
				String restriction = rst.getString("ID");
				int records=returnComplicatedCount(quest,"(" + primaryColumn + " = '" + restriction + "')" + whereString);
				if (((records*100)/(tempCounter)) > cutOffPercentage) {
					temp=temp+"<tr><td><font size='2' face='arial'>" + rst.getString("value") + "</td>		<td> &nbsp; </td>	<td><img src='/quest/images/reddot.gif' height='10' width='" + (records*100)/tempCounter + "'></td><td> <font size='2' face='arial'>" + (records*100)/tempCounter + "." + ((records*1000)/tempCounter)%10 + "<font size='1'>% </td></tr>";
								}
			}
			statmt.close();
		}
		else { 	temp=temp+"<tr><td colspan = '2'><font size='2' face='arial'>No records to display</td></tr>";}
	}
	else {
		temp = temp + "<tr><td><font size='2' face='arial'><b>Sorry! Survey statistic <i>" + primaryColumn + "</i> not available.</td></tr>";
	}

	temp=temp+"</table>\n\r</td></tr>\n\r<tr><td><font size='1' face='arial'> Total Responses: " + tempCounter + "</td></tr>\n\r</table>\r\n";
	return temp;
}

/////////////////////////////////////////////////////////////////////////////
//	returns the ID in tableName where we have entered '-Not Answered'
//	else we return 1 in the hopes that it was the first entry
/////////////////////////////////////////////////////////////////////////////

String getNA(String tableName) {
	if (tableName.equalsIgnoreCase("q1_AfterDeath")){	return "1";	}
	else
	if (tableName.equalsIgnoreCase("q1_DescribeLife")){	return "1";	}
	else
	if (tableName.equalsIgnoreCase("q1_howToX")){		return "1";	}
	else
	if (tableName.equalsIgnoreCase("q1_singleThing")){	return "1";	}
	else
	if (tableName.equalsIgnoreCase("q2_relBackground")){	return "1";	}
	else
	if (tableName.equalsIgnoreCase("q2_relIdentity")){	return "1";	}
	else
	if (tableName.equalsIgnoreCase("q2_relexpword")){	return "41";	}
	else
	if (tableName.equalsIgnoreCase("q2_whoIsGod")){		return "1";	}
	else
	if (tableName.equalsIgnoreCase("q2_expGodHow")){	return "42";	}
	else
	if (tableName.equalsIgnoreCase("q2_ageprofile")){	return "21";	}
	else
	if (tableName.equalsIgnoreCase("q_ethnicity")){		return "175";	}
	else return "1";
}

boolean haveSession(HttpSession thisSession) {
	if ((String)thisSession.getValue("version")!=null){ 
		return true;
	}
	else { return false; }
}
%>
<%!
int cutOffPercentage		= 1;
String tempString		= "";
int mainCounter			= 0;
int imageScale			= 10;
String stat				= "";
int regionCounter		= 0;
int campusCounter		= 0;
String region			= "";
String campus			= "";
String statLevel		= "";
String whereString		= "";
boolean aSession			= false;
%>
<% String pageTitle = "Quest 2 Stats"; %>
<%@ include file="style.jspf"%>
<%@ include file="header_normal.jspf"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

tempString=request.getParameter("stat");
if (tempString==null){ tempString=""; }
statLevel=request.getParameter("level");
try {
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		con = DriverManager.getConnection(url,user,password);
		stmt = con.createStatement();
}
catch (Exception e) {
				System.out.println(e);
}
if (haveSession(session)){	// jumped into site?
	region = "[" +(String)session.getValue("region") + "]";
	campus = (String)session.getValue("campus");
	rs= stmt.executeQuery("Select COUNT(*) from Quest2 where campus like '%" + region + "'");
	rs.next();
	regionCounter = rs.getInt(1);
	rs= stmt.executeQuery("Select COUNT(*) from Quest2 where campus like '" + campus + "%'");
	rs.next();
	campusCounter = rs.getInt(1);
	aSession = true;
}
if (statLevel==null){ statLevel=""; }
else{
	if (statLevel.equals("1")){				// national stats so no whereString
		whereString = "";
		statLevel="Nationally";
	}
	else if (statLevel.equals("2")){		// regional level, build whereString
		whereString = "campus like '%" + region + "'";
		statLevel="Regionally "+ region + "";
	}
	else if (statLevel.equals("3")){				// campus level, build whereString
		whereString = "campus like '" + campus + "%'";
		statLevel="On " + campus;
	}
}

//---------------------------------------- GET THE NUMBER OF SURVEYS SO FAR --------------------
	rs= stmt.executeQuery("Select COUNT(*) from Quest2");
	rs.next();
	mainCounter = rs.getInt(1);
%>

<font size="2" face="arial">
<p align = "right">Total number of Quest2 surveys: <b><%= mainCounter %></b><br>
<% if (aSession){ 	%>Total number in your Region: <b><%= regionCounter %></b><br>Total number on <%= campus %>: <b><%= campusCounter %></b><br>
<% } %>
<font size="1"><i>(make sure to the read individual stats<br> for the number of responses to a question)</i></p>

<%if (tempString.equals("Desire")){ %>
<center><%= doStatsTable ("Quest2","6: Overall Desire to Know God", "desirescale",whereString,"") %></center>
<%}
else if (tempString.equals("How")){ %>
<center><%= doStatsTable ("Quest2","5: If/How People Have Experienced God", "expGod",whereString,"") %></center>
<%}
else if (tempString.equals("Back")){ %>
<center><%= doStatsTable ("Quest2","1: Most Common Religious Backgrounds", "relBackground",whereString,"") %></center>
<%}
else if (tempString.equals("Iden")){ %>
<center><%= doStatsTable ("Quest2","2: Most Common Identity with respect to Religion", "relIdentity",whereString,"") %></center>
<%}
else if (tempString.equals("Word")){ %>
<center><%= doStatsTable ("Quest2","3: Words to Describe Religious Experience", "words",whereString,"") %></center>
<%}
else if (tempString.equals("Who")){ %>
<center><%= doStatsTable ("Quest2","4: Who/What is God", "whoIsGod",whereString,"") %></center>
<%}
else if (tempString.equals("Age")){ %>
<center><%= doStatsTable ("Quest2","Overall Age Profile", "ageprofile",whereString,"") %></center>
<%}
else if (tempString.equals("Ethn")){ %>
<center><%= doStatsTable ("Quest2","Overall Ethnicity", "ethnicity",whereString,"") %></center>
<%}
else if (tempString.equals("All")) { %>
	<table width="100%">	<tr>
	<!-------------------------------------------------------------------------------------- -->
	<td align="center" valign="top">
	<%= doStatsTable ("Quest2","6: Overall Desire to Know God", "desirescale",whereString,"") %>
	<%= doStatsTable ("Quest2","5: If/How People Have Experienced God", "expGod",whereString,"") %>
	<%= doStatsTable ("Quest2","Overall Age Profile", "ageprofile",whereString,"") %>
	<%= doStatsTable ("Quest2","Overall Ethnicity", "ethnicity",whereString,"") %>
	</td>
	<!-------------------------------------------------------------------------------------- -->
	<td align="center" valign="top">
	<%= doStatsTable ("Quest2","1: Most Common Religious Backgrounds", "relBackground",whereString,"") %>
	<%= doStatsTable ("Quest2","3: Words to Describe Religious Experience", "words",whereString,"") %>
	</td>
	<!-------------------------------------------------------------------------------------- -->
	<td align="center" valign="top">
	<%= doStatsTable ("Quest2","2: Most Common Identity with respect to Religion", "relIdentity",whereString,"") %>
	<%= doStatsTable ("Quest2","4: Who/What is God", "whoIsGod",whereString,"") %>
	</td>
	<!-------------------------------------------------------------------------------------- -->
	</tr></table>
<% }
else {
/* ------------------------------------------- DEFAULT DISPLAY -------------------------- */
%>
<font size="2"><b>Please select a statistic table to display:</b><br>
<center>
<form type="post" name="q2basic" action="qstats2.jsp">
<select name="stat">	<option value="" selected> - Select one - </option>
						<option value="Desire">Desire to Know God</option>
						<option value="How">How People Have Experienced God</option>
						<option value="Back">Religious Background</option>
						<option value="Iden">Current Relgious Identity</option>
						<option value="Word">Religious Experience</option>
						<option value="Who">Who/What is God</option>
						<option value="Age">Age Distribution</option>
						<option value="Ethn">Ethnic Distribution</option>
						<option value="All">All of Them *(slow!)*</option>
</select><br>
<% if (aSession) { %>
	<b>Level:</b> &nbsp; National<input type="radio" name="level" value="1"> &nbsp;
	Regional<input type="radio" name="level" value="2"> &nbsp;
	Campus<input type="radio" name="level" value="3" checked>
<%}%>
<p>
<input type="submit" value="Get It!">
</form>
</center><p>
<%}%>
<%= statLevel %>
<p>

<p align="left"><font size="1" face="arial">
Stats are of all records where the category was answered.<br>
If you would like advanced/demographically based statistics, <br>
click <a href='qstats2a.jsp'>here</a>.</p>


<% if (!tempString.equals("")){ %><p align="right">	<a href="qstats2.jsp"><b>Get Different Stats</b></a><br> <% }%>

<p> &nbsp;
<p> &nbsp;
<% 	stmt.close();
	con.close();
%>
<%@ include file="footer.jspf" %>