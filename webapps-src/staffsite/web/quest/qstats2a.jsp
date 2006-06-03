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
	if (cutOff.equalsIgnoreCase("")){		cutOffPercentage=0; }
	else { cutOffPercentage=Integer.parseInt(cutOff); }
	Statement statmt;
	ResultSet rst;

	if (primaryColumn.equalsIgnoreCase("ageprofile")){
		secondaryTable = "Q2_ageprofile";
		}
	else if (primaryColumn.equalsIgnoreCase("ethnicity")){
		secondaryTable = "Q_ethnicity";
		}
	else if (primaryColumn.equalsIgnoreCase("religBackground")){
		secondaryTable = "Q2_relBackground";
		}
	else if (primaryColumn.equalsIgnoreCase("religIdentity")){
		secondaryTable = "Q2_relIdentity";
		}
	else if (primaryColumn.equalsIgnoreCase("expGodHow")){
		secondaryTable = "Q2_expGodHow";
		}
	else if (primaryColumn.equalsIgnoreCase("whoIsGod")){
		secondaryTable = "Q2_whoIsGod";
		}

	if (!whereString.equalsIgnoreCase("")){	whereString = " AND " + whereString;	}

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
String iSubmit			= "";
String iValue			= "";
String cutOff			= "";
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

try {
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		con = DriverManager.getConnection(url,user,password);
		stmt = con.createStatement();
}
catch (Exception e) {
				System.out.println(e);
}
%>

<%
iSubmit	= request.getParameter("submit");
iValue	= request.getParameter("value");
cutOff	= request.getParameter("cutOff");
tempString=request.getParameter("stat");
if (tempString==null){ tempString=""; }
statLevel=request.getParameter("level");
HttpSession mySession = request.getSession();

if (cutOff == null) { cutOff = "0"; }

//---------------------------------------- GET THE NUMBER OF SURVEYS SO FAR --------------------
	rs= stmt.executeQuery("Select COUNT(*) from Quest2");
	rs.next();
	mainCounter = rs.getInt(1);

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
%>

<% String pageTitle = "QuEST 2.0 Advanced Statistics Engine"; %>
<%@ include file="style.jspf"%>
<%@ include file="header_normal.jspf"%>

<font size="2" face="arial">
<p align = "right">Total number of Quest2 surveys: <b><%= mainCounter %></b><br>
<% if (aSession){ 	%>Total number in your Region: <b><%= regionCounter %></b><br>Total number on <%= campus %>: <b><%= campusCounter %></b><br>
<% } %>
<font size="1"><i>(make sure to the read individual stats<br> for the number of responses to a question)</i></p>

<%
if (iSubmit != null) {	//  process the request
if (iSubmit.equalsIgnoreCase("Stat")) {
%>

<p>
<table width="100%" align="center">
<tr><td align="center">
<!-------------------------------------------------------------------------------------- -->
<!---------------------------------The Request as Best as I Can Figure ----------------- -->
<!-------------------------------------------------------------------------------------- -->
<% 
	String primary	 =	request.getParameter("primary");
	String ethnicity =	request.getParameter("ethnicity");
	String age =	request.getParameter("age");
	String gender =	request.getParameter("gender");
	String yeartaken =	request.getParameter("yeartaken");
	String primaryNice = "";
	String secondary = "";
	String whereString = "";
	String tString1 = "";
	String tString2 = "";

if (primary.equalsIgnoreCase("religBackground")) { primaryNice = "1: Religious Background ("; }
else if (primary.equalsIgnoreCase("religIdentity")) { primaryNice = "2: Current Religious Identity ("; }
else if (primary.equalsIgnoreCase("desireScale")) { primaryNice = "6: Desire to Know God ("; }
else if (primary.equalsIgnoreCase("whoIsGod")) { primaryNice = "4: Who is God ("; }
else if (primary.equalsIgnoreCase("expGodHow")) { primaryNice = "5: Experience of God ("; }
else if (primary.equalsIgnoreCase("words")) { primaryNice = "3: Words to Describe Religious Experience (";	}

	tString1 = getNA("Q2_ageprofile");
	tString2 = getNA("Q_ethnicity");

if ((!gender.equalsIgnoreCase("-")) || (!age.equalsIgnoreCase(tString1)) || (!ethnicity.equalsIgnoreCase(tString2))){
	if ((primary.equalsIgnoreCase("whoIsGod")) || (primary.equalsIgnoreCase("expGodHow"))) {	secondary = secondary + " for "; }
	else {	secondary = secondary + " of "; }
}
else { %>You did not specify a reduced search item. Please go back to try again. <%
return;
}
if (!age.equalsIgnoreCase(tString1)){
	String tString3 = "";
	rs= stmt.executeQuery("Select value from q2_ageprofile where id='" + age + "'");
	rs.next();
	tString3 = rs.getString(1);
	secondary = secondary + " " + tString3;
	whereString = "AGEPROFILE = '" + age + "'";
}
if (!ethnicity.equalsIgnoreCase(tString2)){
	String tString3 = "";
	rs= stmt.executeQuery("Select value from q_ethnicity where id='" + ethnicity + "'");
	rs.next();
	tString3 = rs.getString(1);

	secondary = secondary + " " + tString3;
	if (gender.equalsIgnoreCase("-")) { secondary = secondary + "s"; }	//plural if necessary
	if (!age.equalsIgnoreCase(tString1)) { whereString = whereString + " AND "; }
	whereString = whereString + "ETHNICITY = '" + ethnicity + "'";
}
if (!gender.equalsIgnoreCase("-")){
	String genderString = "";
	if (gender.equalsIgnoreCase("M")){	genderString = "Males"; }
	if (gender.equalsIgnoreCase("F")){	genderString = "Females"; }
	secondary = secondary + " " + genderString;
	if ((!age.equalsIgnoreCase(tString1)) || (!ethnicity.equalsIgnoreCase(tString2))) { whereString = whereString + " AND "; }
	whereString = whereString + "GENDER = '" + gender + "'";
}
secondary= secondary + " )";

if (!yeartaken.equalsIgnoreCase("-")){
	secondary = secondary + " in " + yeartaken;
	if ((!age.equalsIgnoreCase(tString1)) || (!gender.equalsIgnoreCase("-")) || (!ethnicity.equalsIgnoreCase(tString2))) { whereString = whereString + " AND "; }
	whereString = whereString + "YEARTAKEN = '" + yeartaken + "'";
}

if (statLevel==null){ statLevel=""; }
else{
	if (statLevel.equals("1")){				// national stats so no whereString
		statLevel="Nationally";
	}
	else if (statLevel.equals("2")){		// regional level, build whereString
		whereString = whereString + "and campus like '%" + region + "'";
		statLevel="Regionally "+ region + "";
	}
	else if (statLevel.equals("3")){				// campus level, build whereString
		whereString = whereString + "and campus like '" + campus + "%'";
		statLevel="On " + campus;
	}
}
%>
<%= doStatsTable("quest2",primaryNice + " " + secondary, primary, whereString, cutOff) %><br>
<%=statLevel%>

</td></tr>
</table>
<!-------------------------------------------------------------------------------------- -->
<!-------------------------------------------------------------------------------------- -->
<%
}
/*---------------------------------------------------------------------------------------------*/
else if (iSubmit.equalsIgnoreCase("campus")){
/*---------------------------------------------------------------------------------------------*/
%>
<p>
<table border="1" align="center"><tr><td align="center">
	<font size="3" face="arial"><b>Campuses That Have Used the Survey:</td></tr>
<tr><td><table><tr><td><font size="1" face="arial">
	<%
	rs= stmt.executeQuery("Select DISTINCT campus from Quest2 where campus != '-' order by campus");
	while(rs.next()){
		%>
		<li><%= rs.getString("campus") %></li>
	<%}
	%>
	</td></tr></table></td></tr></table></td></tr>
<%}

/*---------------------------------------------------------------------------------------------*/
else if (iSubmit.equalsIgnoreCase("notes")) {
/*---------------------------------------------------------------------------------------------*/
%>
<p>
<table border="1" align="center"><tr><td align="center">
	<font size="3" face="arial"><b>Notes that have been entered:</td></tr>
<tr><td><table><tr><td><font size="1" face="arial">
	<%
	rs= stmt.executeQuery("Select notes from Quest2 where notes != '-'");
	while(rs.next()){
		%>
		<li><%= rs.getString("notes") %></li>
	<%}
	%>
	</td></tr></table></td></tr></table></td></tr>
<%}

}
/*---------------------------------------------------------------------------------------------*/
else {		//display the statistics crunching options
/*---------------------------------------------------------------------------------------------*/
%>

<p>
<form method="post" action="qstats2a.jsp" name="the_form">
<font size="2" face="arial"><b>Select
<select name='primary'>
<option value="religBackground">1: Religious Background</option>
<option value="religIdentity">2: Religious Identity</option>
<option value="words">3: Words to Describe Religious Exp.</option>
<option value="whoIsGod">4: Who is God</option>
<option value="expGodHow">5: Experience of God</option>
<option value="desireScale">6: Desire to Know God</option>
</select>

from Quest2 where<p></b>
<table>

<tr><td><font size="1" face="arial">Ethnicity:</td>
<td><select name="ethnicity">
	<option value='175' selected>-</option>
	<option value='218'>African American</option>
	<option value='217'>Asian</option>
	<option value='102'>Caucasian</option>
	<option value='219'>Hispanic</option>
	<option value='215'>International (foreign citizen)</option>
	<option value='238'>Native American</option>	</select>
</td>
</tr>
<tr><td><font size="1" face="arial">Age Profile:</td>
<td><select name="age">
	<option value='21' selected>-</option>
	<option value='41'>College Freshman</option>
	<option value='43'>Grad Student</option>
	<option value='44'>High School Student</option>
	<option value='46'>Older Adult</option>
	<option value='42'>Other Undergraduate</option>
	<option value='45'>Young Adult</option>	</select>
</td>
</tr>
<tr><td><font size="1" face="arial">Gender:</td>
	<td><select name="gender">
			<option value="-" selected>-</option>
			<option value="M">Male</option>
			<option value="F">Female</option>
		</select></td>
</tr>
<tr><td><font size="1" face="arial">Year Taken:</td>
	<td><select name="yeartaken">
			<option value="-" selected>-</option>
			<option value="2001">2001</option>
			<option value="2000">2000</option>
			<option value="1999">1999</option>
		</select></td>
</tr>
<% if (aSession) { %>
	<tr><td colspan=1>
	<font size="1" face="arial">Level:</td><td><font size="1" face="arial">&nbsp; National<input type="radio" name="level" value="1"> &nbsp;
	Regional<input type="radio" name="level" value="2"> &nbsp;
	Campus<input type="radio" name="level" value="3" checked></td></tr>
<%}%>

</table>
<br>Limit resulting display to values <input type="text" name="cutOff" value="5" size="2" maxlength=2>% or higher
<p>
<input type="submit" name="submit" value="Stat">
</form>
<div align=left>
<font size="2" face="arial"><b>Other Information Collected:</b><br>
<font size="1">What campuses are using the survey?
click <a href="qstats2a.jsp?submit=campus">here</a>.<br>
<font size="1">What were the notes collected?
click <a href="qstats2a.jsp?submit=notes">here</a>.<br>
</div>
<% } %>

<p>
<font size="2" face="arial">
	<a href="qstats2a.jsp">Generate different Stats</a><br>
	<a href="qstats2.jsp">Back to simple Stats</a><br>
</center>

<p> &nbsp;
<p> &nbsp;
<% 	stmt.close();
	con.close();
%>
<%@ include file="footer.jspf" %>