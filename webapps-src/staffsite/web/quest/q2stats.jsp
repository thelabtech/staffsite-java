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
		if (quest.equalsIgnoreCase("quest2")) { tString2="q2_relexpword"; }

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
			temp=temp+"<tr><td><font size='2' face='arial'><b>Average:</td>	<td> &nbsp; </td>	<td> &nbsp; </d><td> <font size='2' face='arial'><b>" + (tempCounter2)/tempCounter + "." + ((tempCounter2*10)/tempCounter)%10 + "</td></tr>";
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

String getOptionsList (String sqlString, HttpSession thisSession, String thisSessionString) {
	String value				= "";
	String ID					= "";
	String tempString= "";
	tempString=(String)thisSession.getValue(thisSessionString);

	if ((tempString == null) || (tempString.length() < 2)){
		try {
			tempString	= "";
			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sqlString);
			while (rs.next()) {
				value			= rs.getString("value").trim();
				ID				= rs.getString("ID").trim();
				if (value.equals("-Not Answered")){
					tempString= tempString+ "\r<option value='" + ID + "' selected>" + value + "</option>";
				}
				else {
					tempString= tempString+ "\r<option value='" + ID + "'>" + value + "</option>";
				}
			}
			stmt.close();
			con.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
		thisSession.putValue(thisSessionString, tempString);	//dump the string into our session for faster access later
			}
	return tempString;
}
String headerTitleBar(String pageTitle, String pageName) {
	return "<HTML>\r<HEAD>\r<TITLE>" + pageTitle + "</TITLE>\r</HEAD>\r<BODY BGCOLOR='#FFFFFF'>\r<table cellpadding='0' cellspacing='0' border='0' width='100%'>\r<tr valign='bottom' bgcolor='#ddddee'>\r<td>\r<font size='3' face='arial'><b>Research and Development<p>\r	</td>\r	<td align='right'>\r	<font size='2' face='arial'><b>Quest Tablespace admin tool (beta v0.75)<p></font>\r	</td>\r</tr>\r<tr align='center' valign='bottom' bgcolor='#ddddee'><td>	<font size='2' face='arial'><b><i>" + pageTitle + "</td><td align='right'><a href='" + pageName + "'><img src='/quest/images/refresh.gif' alt='refresh' border='0'></a> <a href='./admin.jsp'><img src='/quest/images/home.gif' alt='home' border='0'></a></td></tr></table><!-- ---------------endofheader-------------- -->";
}

String getNA(String tableName) {
	String tempString = "";
	try {
		tempString	= "";
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		ResultSet rs= stmt.executeQuery("Select ID from " + tableName + " where value like '-N%'");
		rs.next();
		tempString = rs.getString("ID");
		stmt.close();
		con.close();
	}
	catch (Exception e) {
		System.out.println(e);
	}
	return tempString;
}

boolean haveSession(HttpSession thisSession) {
	if ((String)thisSession.getValue("version")!=null){ 
		return true;
	}
	else { return false; }
}
%>
<%!
String user     = "randd";
String password = "quest20";
String url      = "jdbc:oracle:thin:@(description=(address=(host=hart-ca009v.net.ccci.org)(protocol=tcp)(port=1521))(connect_data=(sid=prod)))";
ResultSet rs				= null;
Statement stmt				= null;
Connection con				= null;
int cutOffPercentage		= 1;
String tempString		= "";
int mainCounter			= 0;
int imageScale			= 10;
String stat			= "";
String whereString		= "";
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

tempString=request.getParameter("stat");
if (tempString==null){ tempString=""; }

try {
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		con = DriverManager.getConnection(url,user,password);
		stmt = con.createStatement();
}
catch (Exception e) {
		System.out.println("QuEST2 Stats Error ----------------------------------------------------");
		System.out.println(e);
}
//---------------------------------------- GET THE NUMBER OF SURVEYS SO FAR --------------------
	rs= stmt.executeQuery("Select COUNT(*) from Quest2");
	rs.next();
	mainCounter = rs.getInt(1);
%>
<%=qb.printAdminBanner("QuEST 2.0 Basic Statistics Engine", "test.jsp") %>

<font size="2" face="arial">
<p align = "right">Total number of Quest2 surveys: <b><%= mainCounter %></b><br>
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
<form type="post" name="q2basic" action="q2stats.jsp">
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
</select><p>
<input type="submit" value="Get It!">
</form>
</center><p>
<%}%>
<p>

<font size="1" face="arial">
Stats are of all records where the category was answered. Click on "Go Advanced Stats" to further refine the statistics you need.

<p align="right">	<a href="q2stats.jsp"><b>Get Different Stats</b></a><br>
					<b><a href="q2advanced.jsp">Go Advanced Stats</a></b><br>
</center>

<p> &nbsp;
<p> &nbsp;
<% 	stmt.close();
	con.close();
%>
<%@ include file="footer.jspf" %>