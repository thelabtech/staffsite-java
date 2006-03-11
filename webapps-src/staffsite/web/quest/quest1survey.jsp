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
		String q17	= (String) session.getValue("yeartaken");

		String sqlCommand= "Insert into " + tableName + " (ID,AGEPROFILE,ETHNICITY,GENDER,ONGOINGDISCUSS,BRIDGEQUESTION,SINGLETHING,AFTERDEATH,WORDONE,WORDTWO,WORDTHREE,HOWTOX,DESIRESCALE,CONDUCTEDBY,CAMPUS,NOTES,YEARTAKEN) values (" + tableSeqName +".NEXTVAL,'" + q1 + "', '" + q2 + "', '" + q3 + "', '" + q4 + "', '" + q5 + "', '" + q6 + "', '" + q7 + "', '" + q8 + "', '" + q9 + "', '" + q10 + "', '" + q11 + "', '" + q13 + "', '" + q14 + "', '" + q15 + "', '" + q16 + "', '" + q17 + "')";

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

<% String pageTitle = "Quest 1 Survey"; %>
<%@ include file="style.jspf"%>
<%@ include file="header_normal.jspf"%>

<center><font size="2" face="arial" color="#444499"> <%= resultString %> </center><p>

<% /*-------------------------------- THE SURVEY ---------------------------------------------*/ %>
<form method="post" action="quest1.jsp">

<table width="100%">
<tr valign="top"><td><font size="2" face="arial"><b>1.</b> What three words would you use to describe your life?</td>
	<td><select name="word1">
		<option value='1' selected>-Not Answered</option>
		<option value='30'>Adventurous, Fun</option>
		<option value='63'>Boring, Monotonous, Expected</option>
		<option value='21'>Busy, Hectic, Stressful</option>
		<option value='62'>Challenging, Demanding</option>
		<option value='65'>Complex/Confusing</option>
		<option value='64'>Despair, Frustration, Lonely</option>
		<option value='24'>Exciting</option>
		<option value='61'>Family, Friends</option>
		<option value='28'>Fulfilled</option>
		<option value='29'>Funny, Entertaining</option>
		<option value='41'>Future/Goal/Optimistic</option>
		<option value='27'>Good, Happy</option>
		<option value='25'>Interesting</option>
		<option value='42'>Other Negative</option>
		<option value='43'>Other Positive</option>
		<option value='66'>Unpredictable/Rocky</option>
		<option value='26'>Wild, Crazy, Dangerous</option>
	</select>
	<select name="word2">
		<option value='1' selected>-Not Answered</option>
		<option value='30'>Adventurous, Fun</option>
		<option value='63'>Boring, Monotonous, Expected</option>
		<option value='21'>Busy, Hectic, Stressful</option>
		<option value='62'>Challenging, Demanding</option>
		<option value='65'>Complex/Confusing</option>
		<option value='64'>Despair, Frustration, Lonely</option>
		<option value='24'>Exciting</option>
		<option value='61'>Family, Friends</option>
		<option value='28'>Fulfilled</option>
		<option value='29'>Funny, Entertaining</option>
		<option value='41'>Future/Goal/Optimistic</option>
		<option value='27'>Good, Happy</option>
		<option value='25'>Interesting</option>
		<option value='42'>Other Negative</option>
		<option value='43'>Other Positive</option>
		<option value='66'>Unpredictable/Rocky</option>
		<option value='26'>Wild, Crazy, Dangerous</option>
	</select>
	<select name="word3">
		<option value='1' selected>-Not Answered</option>
		<option value='30'>Adventurous, Fun</option>
		<option value='63'>Boring, Monotonous, Expected</option>
		<option value='21'>Busy, Hectic, Stressful</option>
		<option value='62'>Challenging, Demanding</option>
		<option value='65'>Complex/Confusing</option>
		<option value='64'>Despair, Frustration, Lonely</option>
		<option value='24'>Exciting</option>
		<option value='61'>Family, Friends</option>
		<option value='28'>Fulfilled</option>
		<option value='29'>Funny, Entertaining</option>
		<option value='41'>Future/Goal/Optimistic</option>
		<option value='27'>Good, Happy</option>
		<option value='25'>Interesting</option>
		<option value='42'>Other Negative</option>
		<option value='43'>Other Positive</option>
		<option value='66'>Unpredictable/Rocky</option>
		<option value='26'>Wild, Crazy, Dangerous</option>
	</select>
</td></tr>

<tr valign="top" bgcolor="#f5f5f5"><td><font size="2" face="arial"><b>2.</b> What single thing do you want to make absolutely sure you do during your lifetime, if at all possible?</td>
	<td><select name="singlething">
		<option value='1' selected>-Not Answered</option>
		<option value='30'>Attain a Particular Career/Job</option>
		<option value='25'>Be Happy</option>
		<option value='22'>Be Successful/Achieve Something</option>
		<option value='29'>Graduate from College/Earn a Certain Degree</option>
		<option value='31'>Live Life to the Fullest</option>
		<option value='61'>Live by Golden Rule/morally</option>
		<option value='27'>Make Money/Financial success</option>
		<option value='28'>Make a Difference in Others Lives</option>
		<option value='21'>Marriage and Family</option>
		<option value='24'>Other</option>
		<option value='26'>Responses around God, Jesus, etc.</option>
		<option value='23'>Travel</option>
	</select>
</td></tr>

<tr valign="top"><td><font size="2" face="arial"><b>3.</b> What happens after death?</td>
	<td><select name="afterdeath">
		<option value='1' selected>-Not Answered</option>
		<option value='22'>Heaven (no mention of Hell)</option>
		<option value='21'>Heaven and Hell</option>
		<option value='23'>Heaven with No Hell</option>
		<option value='28'>Heaven, Hell, and Purgatory</option>
		<option value='41'>Judgement</option>
		<option value='26'>Nothing</option>
		<option value='29'>Other</option>
		<option value='27'>Reincarnation</option>
		<option value='24'>Some Form of Afterlife</option>
		<option value='25'>Unknown, Unsure</option>
	</select>
</td></tr>

<tr valign="top" bgcolor="#f5f5f5"><td><font size="2" face="arial"><b>4.</b> Your best friend comes to you and says, <i>"I want to become a Christian, but I do not know how."</i> What would you tell your friend? <font size="1">(Assume your friend wants you to answer and not to be sent to a priest, minister, ...)</font></td>
	<td><select name="howtox">
		<option value='1' selected>-Not Answered</option>
		<option value='30'>Be Baptized/Confirmed</option>
		<option value='23'>Believe In/Receive Jesus</option>
		<option value='25'>Believe in God</option>
		<option value='27'>Believe/Trust</option>
		<option value='28'>Discover for Yourself</option>
		<option value='24'>Do Not Know</option>
		<option value='29'>Live a Good Life/Be Moral</option>
		<option value='31'>Other</option>
		<option value='26'>Pray</option>
		<option value='22'>Read the Bible</option>
		<option value='21'>Take/Send Them to Church</option>
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
	<a href="quest1.jsp">Clear Survey</a><br>
	<a href="entrance.jsp">Main Page</a>
</center>

<% } %>

<p> &nbsp;
<p> &nbsp;
<%@ include file="footer.jspf" %>