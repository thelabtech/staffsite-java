<%@ page language="java" %>
<%@ page import="java.util.*,java.awt.*,java.sql.*" %>
<%!

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

String headerTitleBar(String pageTitle, String pageName) {
	return "<HTML>\r<HEAD>\r<TITLE>" + pageTitle + "</TITLE>\r</HEAD>\r<BODY BGCOLOR='#FFFFFF'>\r<table cellpadding='0' cellspacing='0' border='0' width='100%'>\r<tr valign='bottom' bgcolor='#ddddee'>\r<td>\r<font size='3' face='arial'><b>Research and Development<p>\r	</td>\r	<td align='right'>\r	<font size='2' face='arial'><b>Quest Tablespace admin tool (beta v0.75)<p></font>\r	</td>\r</tr>\r<tr align='center' valign='bottom' bgcolor='#ddddee'><td>	<font size='2' face='arial'><b><i>" + pageTitle + "</td><td align='right'><a href='" + pageName + "'><img src='/quest/images/refresh.gif' alt='refresh' border='0'></a> <a href='./admin.jsp'><img src='/quest/images/home.gif' alt='home' border='0'></a></td></tr></table><!-- ---------------endofheader-------------- -->";
}

String normalPageHeader(String pageTitle) {
	return "<html><head><title>" + pageTitle + "</title></head>\r<body><table cellpadding='0' cellspacing='0' border='0' width='100%'> <tr valign='bottom' bgcolor='#ddddee'>	<td align='right'><font face='arial' size='1'><b> " + pageTitle + " </td></tr></table> \r <a href='entrance.jsp'><img src='/quest/images/questlogo.gif' border='0'></a><font face='arial'><p><font size='2'><center>";
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
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
%>
<%
String iSubmit	= request.getParameter("submit");
int    del		= 0;
String tableName			= "Quest1";		//name of the table in the database
String tableSeqName			= "Quest1_Seq";	//database table sequence name
String resultString			= "";	//standard and error output
String value				= "";
String tempString			= "";
String campus				= "";
HttpSession mySession		= request.getSession();

if (iSubmit == null){ iSubmit="";}

if (!haveSession(mySession)){ 
%>Not sure how you got here. Please do not bookmark this page. It will not get you very far.<p>Click <a href="./">HERE</a> to return to the main page.<%
}
else {			//-------------------------- Authorized to use page
campus=(String)mySession.getValue("campus") + " [" +(String)mySession.getValue("region") + "]";

/*---------------------------   insert a record ------------------------------------*/
if (!iSubmit.equals("")) {	//  add submited info
	try {
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();

		String q1	= request.getParameter("age");
		String q2	= request.getParameter("ethnicity");
		String q3	= request.getParameter("gender");
		String q4	= request.getParameter("discussion");
		String q5	= request.getParameter("bridge");
		String q6	= request.getParameter("singlething");
		String q7	= request.getParameter("afterdeath");
		String q8	= request.getParameter("word1");
		String q9	= request.getParameter("word2");
		String q10	= request.getParameter("word3");
		String q11	= request.getParameter("howtox");
		String q13	= request.getParameter("scale");
		String q14	= request.getParameter("conductedby");
		String q15	= request.getParameter("campus");
		String q16	= request.getParameter("notes");

		String sqlCommand= "Insert into " + tableName + " (ID,AGEPROFILE,ETHNICITY,GENDER,ONGOINGDISCUSS,BRIDGEQUESTION,SINGLETHING,AFTERDEATH,WORDONE,WORDTWO,WORDTHREE,HOWTOX,DESIRESCALE,CONDUCTEDBY,CAMPUS,NOTES) values (" + tableSeqName +".NEXTVAL,'" + q1 + "', '" + q2 + "', '" + q3 + "', '" + q4 + "', '" + q5 + "', '" + q6 + "', '" + q7 + "', '" + q8 + "', '" + q9 + "', '" + q10 + "', '" + q11 + "', '" + q13 + "', '" + q14 + "', '" + q15 + "', '" + q16 + "')";

		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		resultString= "Survey Accepted!";
	}
	catch (Exception e) {
		System.out.println(e);
		resultString= "WARNING: Survey entry error!<p>";
	}
}
%>

<%= normalPageHeader("Quest 1 Survey")%>

<center><font size="2" face="arial" color="#444499"> <%= resultString %> </center><p>

<% /*-------------------------------- THE SURVEY ---------------------------------------------*/ %>
<form method="post" action="quest1.jsp">

<table width="100%">
<tr valign="top"><td><font size="2" face="arial"><b>1.</b> What three words would you use to describe your life?</td>
	<td><select name="word1">
		<% tempString = getOptionsList("select * from Q1_describeLife ORDER BY value", mySession, "q1wordList");%>
		<%= tempString %>
	</select>
	<select name="word2">
		<%= tempString %>
	</select>
	<select name="word3">
		<%= tempString %>
	</select>
</td></tr>

<tr valign="top" bgcolor="#f5f5f5"><td><font size="2" face="arial"><b>2.</b> What single thing do you want to make absolutely sure you do during your lifetime, if at all possible?</td>
	<td><select name="singlething">
	<%= getOptionsList("select * from Q1_singlething ORDER BY value", mySession, "singlethingList")%>
	</select>
</td></tr>

<tr valign="top"><td><font size="2" face="arial"><b>3.</b> What happens after death?</td>
	<td><select name="afterdeath">
	<%= getOptionsList("select * from Q1_afterdeath ORDER BY value", mySession, "afterdeathList") %>
	</select>
</td></tr>

<tr valign="top" bgcolor="#f5f5f5"><td><font size="2" face="arial"><b>4.</b> Your best friend comes to you and says, <i>"I want to become a Christian, but I do not know how."</i> What would you tell your friend? <font size="1">(Assume your friend wants you to answer and not to be sent to a priest, minister, ...)</font></td>
	<td><select name="howtox">
	<%= getOptionsList("select * from Q1_howtox ORDER BY value", mySession, "howtoxList") %>
	</select>
</td></tr>

<tr valign="top"><td><font size="2" face="arial"><b>5.</b> On a scale from 1 to 10, rate your desire to know God:<br> &nbsp; <font size="1">(1 is low, 10 is high)</td>
<td nowrap><font size="1" face="arial">
NA<input type="radio" name="scale" value="0"> &nbsp;
1<input type="radio" name="scale" value="1"> &nbsp;
2<input type="radio" name="scale" value="2"> &nbsp;
3<input type="radio" name="scale" value="3"> &nbsp;
4<input type="radio" name="scale" value="4"> &nbsp;
5<input type="radio" name="scale" value="5"> &nbsp;
6<input type="radio" name="scale" value="6"> &nbsp;
7<input type="radio" name="scale" value="7"> &nbsp;
8<input type="radio" name="scale" value="8"> &nbsp;
9<input type="radio" name="scale" value="9"> &nbsp;
10<input type="radio" name="scale" value="10" checked>

</td></tr>

<tr bgcolor="#eeeeff"><td colspan="2"> <font size="2" face="arial"><b>Interviewer: </td></tr>
</table>
<table width="100%">

<tr valign="top"><td><font size="2" face="arial">Campus: <input type="text" name="campus" value="<%= campus %>"></td>

<td nowrap><font size="2" face="arial">Conducted by: &nbsp;
	<font size="1" face="arial">
	Not Answered <input type="radio" name="conductedby" value="-" checked> &nbsp;
	Student	<input type="radio" name="conductedby" value="Student"> &nbsp;
	Staff	<input type="radio" name="conductedby" value="Staff"> &nbsp;
	Volunteer<input type="radio" name="conductedby" value="Volunteer"> &nbsp;
	</td>
</tr>

<tr bgcolor="#eeeeff"><td colspan="2"> <font size="2" face="arial"><b>Interview Conducted With: </td></tr>
</table>
<table width="100%">
<tr valign="top"><td><font size="2" face="arial">Gender:</td>
	<td><select name="gender">
			<option value="N" selected>Not Answered</option>
			<option value="M">Male</option>
			<option value="F">Female</option>
		</select></td>
	<td><font size="2" face="arial">Age:</td>
	<td><select name="age">
	<%= getOptionsList("select * from Q2_ageProfile ORDER BY ID", mySession, "ageList") %>
	</select>

</td>
	<td><font size="2" face="arial">Ethnicity:</td>
	<td><select name="ethnicity">
	<%= getOptionsList("select * from Q_Ethnicity ORDER BY value", mySession, "ethnicityList") %>
	</select>
</td>
</tr>
</table>
<table width="100%">
<tr bgcolor="#eeeeff" valign="top"><td colspan="2"> <font size="2" face="arial"><b>Ongoing Discussion: </td></tr>
</table>


<table width="100%">
<tr valign="top"><td><font size="2" face="arial">Was there significant gospel interaction in the subsequent discussion?</td>
	<td align="right"><select name="discussion">
			<option value="-" selected>Not Answered</option>
			<option value="Y">Yes</option>
			<option value="N">No</option>
			<option value="F">Arranged</option>
		</select></td>
</tr>
<tr valign="top" bgcolor="#f5f5f5"><td><font size="2" face="arial">Which question provided the bridge to gospel interaction?</td>
	<td align="right" nowrap><font size="1" face="arial">
	Not Answered<input type="radio" name="bridge" value="-" checked> &nbsp;
	None<input type="radio" name="bridge" value="0"> &nbsp;
	1<input type="radio" name="bridge" value="1"> &nbsp;
	2<input type="radio" name="bridge" value="2"> &nbsp;
	3<input type="radio" name="bridge" value="3"> &nbsp;
	4<input type="radio" name="bridge" value="4"> &nbsp;
	5<input type="radio" name="bridge" value="5"> &nbsp;
	6<input type="radio" name="bridge" value="6">
	</td>
</tr>
<tr valign="top"><td><font size="2" face="arial">Dialogue Notes:<br>
 &nbsp; &nbsp; <i><font size="1" color="FF0000"> <b>Do not include any apostrophes or ampersands.</b></i></td>
	<td><textarea cols=30 rows=4 name="notes">-</textarea></td>
</tr>
</table>

<p>
<center>
<input type="submit" name="submit" value="Record"> &nbsp; <input type="reset" name="mybutton" value="Reset">

</form>

<font size="2" face="arial">
	<a href="quest1.jsp">Clear Survey</a><br>
	<a href="entrance.jsp">Main Page</a>
</center>

<% } %>

<p> &nbsp;
<p> &nbsp;
<%@ include file="footer.jspf" %>