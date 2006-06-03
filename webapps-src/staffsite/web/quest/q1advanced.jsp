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
	else if (primaryColumn.equalsIgnoreCase("singlething")){		//q1
		secondaryTable = "Q1_singlething";
		}
	else if (primaryColumn.equalsIgnoreCase("afterdeath")){			//q1
		secondaryTable = "Q1_afterdeath";
		}
	else if (primaryColumn.equalsIgnoreCase("howtox")){				//q1
		secondaryTable = "Q1_howtox";
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

String removeNA (String inputString){
		int tempInt1	= inputString.indexOf(">-N");
		int tempInt2	= inputString.indexOf("</option>",tempInt1);
		String subStr1	= inputString.substring(0,tempInt1+1);
		String subStr2	= inputString.substring(tempInt2);
		String outString = "-";
		inputString = subStr1.concat("-");
		return inputString.concat(subStr2);
}

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
String user     = "randd";
String password = "quest20";
String url      = "jdbc:oracle:thin:@(description=(address=(host=hart-ca009v.net.ccci.org)(protocol=tcp)(port=1521))(connect_data=(sid=prod)))";
ResultSet rs				= null;
Statement stmt				= null;
Connection con				= null;
int cutOffPercentage		= 1;
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
%>

<%!
String tempString		= "";
int mainCounter			= 0;
int imageScale			= 10;
%><%
String iSubmit	= request.getParameter("submit");
String iValue	= request.getParameter("value");
String cutOff	= request.getParameter("cutOff");
HttpSession mySession = request.getSession();

if (cutOff == null) { cutOff = "0"; }

try {
	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	con = DriverManager.getConnection(url,user,password);
	stmt = con.createStatement();
}
catch (Exception e) {
	System.out.println(e);
}

//---------------------------------------- GET THE NUMBER OF SURVEYS SO FAR --------------------
	rs= stmt.executeQuery("Select COUNT(*) from Quest1");
	rs.next();
	mainCounter = rs.getInt(1);

%>
<%=qb.printAdminBanner("QuEST 1.0 Advanced Statistics Engine <font size='1'>v0.05", "q1advanced.jsp") %>

<font size="2" face="arial">
<p align = "right">Total number of Quest1 surveys: <b><%= mainCounter %></b></p>
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

if (primary.equalsIgnoreCase("words")) { primaryNice = "1: Words to Describe Life (";	}
else if (primary.equalsIgnoreCase("singlething")) { primaryNice = "2: Single Thing to Do in Lifetime ("; }
else if (primary.equalsIgnoreCase("afterdeath")) { primaryNice = "3: What Happens After Death ("; }
else if (primary.equalsIgnoreCase("howtox")) { primaryNice = "4: How to Become a Christian ("; }
else if (primary.equalsIgnoreCase("desireScale")) { primaryNice = "5: Desire to Know God ("; }

	tString1 = getNA("Q2_ageprofile");
	tString2 = getNA("Q_ethnicity");

if ((gender.equals("-")) && (!age.equals(tString1)) && (!ethnicity.equalsIgnoreCase(tString2))){
	%>You did not specify a reduced search item. Please go back to try again. <%
	return;
}
if (!age.equals(tString1)){
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
	if (gender.equals("-")) { secondary = secondary + "s"; }	//plural if necessary
	if (!age.equals(tString1)) { whereString = whereString + " AND "; }
	whereString = whereString + "ETHNICITY = '" + ethnicity + "'";
}
if (!gender.equals("-")){
	String genderString = "";
	if (gender.equalsIgnoreCase("M")){	genderString = "Males"; }
	if (gender.equalsIgnoreCase("F")){	genderString = "Females"; }
	secondary = secondary + " " + genderString;
	if ((!age.equals(tString1)) || (!ethnicity.equalsIgnoreCase(tString2))) { whereString = whereString + " AND "; }
	whereString = whereString + "GENDER = '" + gender + "'";
}
secondary= secondary + " )";

if (!yeartaken.equalsIgnoreCase("-")){
	secondary = secondary + " in " + yeartaken;
	if ((!age.equalsIgnoreCase(tString1)) || (!gender.equalsIgnoreCase("-")) || (!ethnicity.equalsIgnoreCase(tString2))) { whereString = whereString + " AND "; }
	whereString = whereString + "YEARTAKEN = '" + yeartaken + "'";
}
%>
	<%= doStatsTable("Quest1",primaryNice + " " + secondary, primary, whereString, cutOff) %>

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
<tr><td><table><tr><td><font size="2" face="arial">
	<%
	rs= stmt.executeQuery("Select DISTINCT campus from Quest1 where campus != '-' order by campus");
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
<tr><td><table><tr><td><font size="2" face="arial">
	<%
	rs= stmt.executeQuery("Select notes from Quest1 where notes != '-'");
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
<form method="post" action="q1advanced.jsp" name="the_form">
<font size="2" face="arial">Select
<select name='primary'>
<option value="words">1: Words to Describe Life</option>
<option value="singlething">2: Single Thing to Do</option>
<option value="afterdeath">3: What Happens After Death</option>
<option value="howtox">4: How to Become a Christian</option>
<option value="desireScale">5: Desire to Know God</option>
</select>

from Quest1 where<p>
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

</table>
<br>Limit resulting display to values <input type="text" name="cutOff" value="5" size="2">% or higher
<p>
<input type="submit" name="submit" value="Stat">
</form>

<font size="2" face="arial"><b>Other Information Collected:</b><br>
<font size="1">What campuses are using the survey?
click <a href="q1advanced.jsp?submit=campus">here</a>.<br>
<font size="1">What were the notes collected?
click <a href="q1advanced.jsp?submit=notes">here</a>.<br>
<% } %>

<p>
<font size="2" face="arial">
	<a href="q1advanced.jsp">Generate different Stats</a><br>
	<a href="q1stats.jsp">Back to simple Stats</a><br>
</center>

<p> &nbsp;
<p> &nbsp;
<% 	stmt.close();
	con.close();
%>
<%@ include file="footer.jspf" %>