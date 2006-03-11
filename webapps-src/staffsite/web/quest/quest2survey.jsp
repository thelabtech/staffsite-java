<%@ page language="java" %>
<jsp:useBean id="qb" class="org.alt60m.rd.QuestBean"/>
<%@ page import="java.util.*,java.awt.*,java.sql.*" %>
<%!

boolean haveSession(HttpSession thisSession) {
	if ((String)thisSession.getValue("version")!=null){ 
		return true;
	}
	else { return false; }
}
%>
<%!
int cutOffPercentage		= 1;
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
%>
<%
String iSubmit	= request.getParameter("submit");
int    del		= 0;
String tableName			= "Quest2";		//name of the table in the database
String tableSeqName			= "Quest2_Seq";	//database table sequence name
String resultString			= "";	//standard and error output
String value				= "";
String tempString			= "";
String campus				= "";
HttpSession mySession		= request.getSession();

if (iSubmit == null){ iSubmit="";}

if (!haveSession(mySession)){	// jumped into site?
%>Not sure how you got here. Please do not bookmark this page. It will not get you very far.<p>Click <a href="./">HERE</a> to return to the main page.<%
}
else {			//-------------------------- Authorized to use page
campus=(String)mySession.getValue("campus") + " [" +(String)mySession.getValue("region") + "]";

if (!iSubmit.equals("")) {	//  add submited info
	try {
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();

		String q1	= request.getParameter("age");
		String q2	= request.getParameter("ethnicity");
		String q3	= request.getParameter("gender");
		String q4	= request.getParameter("discussion");
		String q5	= request.getParameter("bridge");
		String q6	= request.getParameter("relBackground");
		String q7	= request.getParameter("relIdentity");
		String q8	= request.getParameter("word1");
		String q9	= request.getParameter("word2");
		String q10	= request.getParameter("word3");
		String q11	= request.getParameter("whoIsGod");
		String q12	= request.getParameter("expGodHow");
		String q13	= request.getParameter("scale");
		String q14	= request.getParameter("conductedby");
		String q15	= request.getParameter("campus");
		String q16	= request.getParameter("notes");
		String q17	= (String) session.getValue("yeartaken");

		String sqlCommand= "Insert into " + tableName + " (ID,AGEPROFILE,ETHNICITY,GENDER,ONGOINGDISCUSS,BRIDGEQUESTION,RELIGBACKGROUND,RELIGIDENTITY,WORDONE,WORDTWO,WORDTHREE,WHOISGOD,EXPGODHOW,DESIRESCALE,CONDUCTEDBY,CAMPUS,NOTES,YEARTAKEN) values (" + tableSeqName +".NEXTVAL,'" + q1 + "', '" + q2 + "', '" + q3 + "', '" + q4 + "', '" + q5 + "', '" + q6 + "', '" + q7 + "', '" + q8 + "', '" + q9 + "', '" + q10 + "', '" + q11 + "', '" + q12 + "', '" + q13 + "', '" + q14 + "', '" + q15 + "', '" + q16 + "', '" + q17 + "')";

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

<% String pageTitle = "Quest 2 Survey"; %>
<%@ include file="style.jspf"%>
<%@ include file="header_normal.jspf"%>

<center><font size="2" face="arial" color="#444499"> <%= resultString %> </center><p>

<% /*-------------------------------- THE SURVEY ---------------------------------------------*/ %>
<form method="post" action="quest2.jsp">
<table width="100%">
<tr valign="top" bgcolor="#f5f5f5"><td><font size="2" face="arial"><b>1.</b> What was your religious background as a child?</td>
	<td><select name="relBackground">
		<option value='1' selected>-Not Answered</option>
		<option value='85'>Agnostic</option>
		<option value='84'>Atheist</option>
		<option value='65'>Buddhist</option>
		<option value='22'>Catholic</option>
		<option value='73'>Christian (unspecified)</option>
		<option value='66'>Christian Education</option>
		<option value='141'>Church</option>
		<option value='121'>Cult (Christian Roots)</option>
		<option value='87'>Hindu</option>
		<option value='88'>Islam</option>
		<option value='86'>Judaism</option>
		<option value='68'>None</option>
		<option value='122'>Protestant (unspecified)</option>
		<option value='62'>Protestant - Baptist</option>
		<option value='72'>Protestant - Charismatic</option>
		<option value='81'>Protestant - Episcopal</option>
		<option value='69'>Protestant - Lutheran</option>
		<option value='64'>Protestant - Methodist</option>
		<option value='82'>Protestant - Non-denomination</option>
		<option value='71'>Protestant - Other</option>
		<option value='101'>Protestant - Pentacostal</option>
		<option value='63'>Protestant - Presbyterian</option>
	</select>
</td></tr>

<tr valign="top"><td><font size="2" face="arial"><b>2.</b> How do you identify yourself now with respect to religion?</td>
	<td><select name="relIdentity">
		<option value='1' selected>-Not Answered</option>
		<option value='21'>Agnostic</option>
		<option value='47'>Atheist</option>
		<option value='24'>Believe in God</option>
		<option value='51'>Buddhist</option>
		<option value='27'>Catholic</option>
		<option value='26'>Christian (unspecified)</option>
		<option value='25'>Christian Education</option>
		<option value='101'>Cult (Christian Roots)</option>
		<option value='50'>Hindu</option>
		<option value='61'>Important/Meaningful</option>
		<option value='39'>Independant Thinker</option>
		<option value='43'>Indifferent</option>
		<option value='40'>Involved with Church/Christian Groups</option>
		<option value='49'>Islam</option>
		<option value='48'>Jewish</option>
		<option value='45'>None</option>
		<option value='62'>Not Practicing/Less Involved</option>
		<option value='81'>Protestant (unspecified)</option>
		<option value='28'>Protestant - Baptist</option>
		<option value='29'>Protestant - Charismatic</option>
		<option value='36'>Protestant - Episcopal</option>
		<option value='30'>Protestant - Lutheran</option>
		<option value='31'>Protestant - Methodist</option>
		<option value='35'>Protestant - Non-denomination</option>
		<option value='32'>Protestant - Other</option>
		<option value='33'>Protestant - Pentacostal</option>
		<option value='34'>Protestant - Presbyterian</option>
		<option value='23'>Relativism</option>
		<option value='38'>Saved/Strong Christian</option>
		<option value='37'>Seeking</option>
		<option value='46'>Spiritual/Religious</option>
	</select>
</td></tr>

<tr valign="top" bgcolor="#f5f5f5"><td><font size="2" face="arial"><b>3.</b> What three words would you use to describe your religious experience?</td>
	<td><select name="word1">
		<option value='41' selected>-Not Answered</option>
		<option value='81'>Backslide/Inconsistent</option>
		<option value='101'>Belief/Faith/Hope</option>
		<option value='102'>Church</option>
		<option value='103'>Forgiving/Grace</option>
		<option value='116'>Helpful</option>
		<option value='104'>Important/Priority</option>
		<option value='105'>Intimate/Loving/Friend</option>
		<option value='106'>Learning</option>
		<option value='107'>Negative</option>
		<option value='108'>None/Non-existant</option>
		<option value='109'>Other</option>
		<option value='110'>Positive/Good</option>
		<option value='117'>Powerful</option>
		<option value='111'>Pressure/Stressful</option>
		<option value='112'>Questioning/Confusing</option>
		<option value='113'>Ritual/Tradition</option>
		<option value='114'>Saved/Strong Christian</option>
		<option value='118'>Spiritual</option>
		<option value='115'>Thankful/Grateful</option>
</select>
<select name="word2">
		<option value='41' selected>-Not Answered</option>
		<option value='81'>Backslide/Inconsistent</option>
		<option value='101'>Belief/Faith/Hope</option>
		<option value='102'>Church</option>
		<option value='103'>Forgiving/Grace</option>
		<option value='116'>Helpful</option>
		<option value='104'>Important/Priority</option>
		<option value='105'>Intimate/Loving/Friend</option>
		<option value='106'>Learning</option>
		<option value='107'>Negative</option>
		<option value='108'>None/Non-existant</option>
		<option value='109'>Other</option>
		<option value='110'>Positive/Good</option>
		<option value='117'>Powerful</option>
		<option value='111'>Pressure/Stressful</option>
		<option value='112'>Questioning/Confusing</option>
		<option value='113'>Ritual/Tradition</option>
		<option value='114'>Saved/Strong Christian</option>
		<option value='118'>Spiritual</option>
		<option value='115'>Thankful/Grateful</option>
</select>
<select name="word3">
		<option value='41' selected>-Not Answered</option>
		<option value='81'>Backslide/Inconsistent</option>
		<option value='101'>Belief/Faith/Hope</option>
		<option value='102'>Church</option>
		<option value='103'>Forgiving/Grace</option>
		<option value='116'>Helpful</option>
		<option value='104'>Important/Priority</option>
		<option value='105'>Intimate/Loving/Friend</option>
		<option value='106'>Learning</option>
		<option value='107'>Negative</option>
		<option value='108'>None/Non-existant</option>
		<option value='109'>Other</option>
		<option value='110'>Positive/Good</option>
		<option value='117'>Powerful</option>
		<option value='111'>Pressure/Stressful</option>
		<option value='112'>Questioning/Confusing</option>
		<option value='113'>Ritual/Tradition</option>
		<option value='114'>Saved/Strong Christian</option>
		<option value='118'>Spiritual</option>
		<option value='115'>Thankful/Grateful</option>
</select>
</td></tr>

<tr valign="top"><td><font size="2" face="arial"><b>4.</b> Who or what is God to you?</td>
	<td><select name="whoIsGod">
		<option value='1' selected>-Not Answered</option>
		<option value='21'>All Knowing/All Powerful/Always There</option>
		<option value='22'>Counselor</option>
		<option value='23'>Creator/Source of Life</option>
		<option value='24'>Father/Grandfather Figure</option>
		<option value='25'>Forgiving/Grace</option>
		<option value='27'>God of the Bible</option>
		<option value='28'>Good</option>
		<option value='29'>Guide/Help</option>
		<option value='30'>Higher Power</option>
		<option value='31'>Important Figure</option>
		<option value='32'>Intimate/Loving/Friend</option>
		<option value='33'>Intimidating/Scary/Unknown</option>
		<option value='34'>Judge</option>
		<option value='35'>Other</option>
		<option value='41'>Nothing/Does Not exist</option>
		<option value='36'>Pantheistic Concept</option>
		<option value='37'>Protector</option>
		<option value='38'>Ruler of All</option>
		<option value='39'>Unsure</option>
	</select>
</td></tr>

<tr valign="top" bgcolor="#f5f5f5"><td><font size="2" face="arial"><b>5.</b> Have you ever experienced God? If so, how?</td>
	<td><select name="expGodHow">
		<option value='42' selected>-Not Answered</option>
		<option value='63'>Answered Prayer/Help</option>
		<option value='81'>Being a good person</option>
		<option value='82'>Believe in God</option>
		<option value='61'>Church Involvement</option>
		<option value='83'>Death/Near Death Situation</option>
		<option value='68'>Do Not Know/Not Yet</option>
		<option value='84'>Everyday/Everything</option>
		<option value='69'>Family/Friends</option>
		<option value='66'>Feelings</option>
		<option value='70'>Miracle/Healing</option>
		<option value='41'>No</option>
		<option value='85'>Other</option>
		<option value='64'>Personal/Family Crisis</option>
		<option value='67'>Salvation</option>
		<option value='62'>Yes</option>
	</select>
</td></tr>

<tr valign="top"><td><font size="2" face="arial"><b>6.</b> On a scale from 1 to 10, rate your desire to know God:<br> &nbsp; <font size="1">(1 is low, 10 is high)</td>
<td><font size="1" face="arial">
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
		<option value='21' selected>-Not Answered</option>
		<option value='41'>College Freshman</option>
		<option value='42'>Other Undergraduate</option>
		<option value='43'>Grad Student</option>
		<option value='44'>High School Student</option>
		<option value='45'>Young Adult</option>
		<option value='46'>Older Adult</option>
	</select>
	</td>
	<td><font size="2" face="arial">Ethnicity:</td>
	<td><select name="ethnicity">
		<option value='175' selected>-Not Answered</option>
		<option value='218'>African American</option>
		<option value='217'>Asian</option>
		<option value='102'>Caucasian</option>
		<option value='219'>Hispanic</option>
		<option value='215'>International (foreign citizen)</option>
		<option value='238'>Native American</option>
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
	<a href="quest2.jsp">Clear Survey</a><br>
	<a href="entrance.jsp">Main Page</a>
</center>

<% } %>
<p> &nbsp;
<p> &nbsp;
<%@ include file="footer.jspf" %>