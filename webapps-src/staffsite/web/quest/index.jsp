<%@ include file="style.jspf"%>

<%

//HttpSession mySession	= request.getSession();
//mySession.invalidate();
//HttpSession session	= request.getSession();
//session.invalidate();
%>
<html>
<head><title>QUEST INDEX PAGE</title></head>

<body bgcolor="#FFFFFF">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr valign="bottom" bgcolor="#ddddee">
	<td> &nbsp; </td>
</tr>
</table>

<img src="/quest/images/questlogo.gif">

<font face="arial" size="2">

<font size="3"><center><b>Welcome to the <%=fontL%><i>online</i></font> <font size="4">QuEST Research Project</font></b></center></font><br>
<%=font%>
You may have used the QuEST on your campus. If you have used QuEST in the past, you
probably remember how you had to gather all the interview results, sort them, count
them, send them in to the national office and wait to hear anything about those
interview results.  
<p>
The Database will change this process. By using this database: 
 <p>
<ul>
<li>	Interviews can be entered in to the database directly by you or by
	your staff. No more sending in those surveys! No more sorting and counting!
<li>	You can access instantly statistics about students on our campus after
	uploading the interview results. No more waiting for someone else to
	process all the information and send it back to you!
<li>	You can see how students on your campus match with other campuses
	in your region, as well as on a national level.
<li>	You help shape the understanding of students across the nation by
	entering your campus' QuEST interview results.  
</ul>
<p>
In the past, campus staff reported their results to the Research and Development
Team. Now, QuEST usage and results are under in the hands of local staff and local
leadership. By your contribution, staff everywhere can see what today's students are saying! 
<p>
</font>
<table align="center" width="100%">
<tr valign="top"><td>
<%=fontText%><b>Guidelines to use the QuEST Database: </b><br></font>
<%=font%>
<ul>
QuEST is a nationally sponsored research project for Campus Crusade for Christ.
&copy;2001 Campus Crusade for Christ, Inc. 
<p>
	In order to maintain the integrity of the research project, we are asking that only campus staff, or other authorized persons, be allowed access into this site. 
</ul>
</font>
<p>
<%=fontText%>
<b>QuEST Resources: </b><br></font>
<%=font%>
<ul>	Updated materials are available on the Staff Resource center (<A HREF="http://staff.campuscrusadeforchrist.com">http://staff.campuscrusadeforchrist.com</A>).
	Go to the Evangelism: Tools: QuEST folder and you will find the newest training
	materials, and the QuEST surveys themselves, available for downloading. 

</ul><p>
</font>
</td><td>
<%=fontText%><b>Tips about the QuEST Database : </b></font>
<%=font%><ul>
<li>	Please read ALL directions carefully. Not following directions completely could
		result in invalid data and error messages.
<li>	You will need to fill out your campus, region, what version of QuEST you would like
		to use and the year the survey was taken. You must enter in the	full name of your
		campus (no abbreviations please). 
<li>	When filling out the survey, choose the option that best fits the interviewee's response.
<li>	Please do not include any apostrophes. You will receive an error message and must
		go back and change any typed text. 
</ul><p>
</font>
</td></tr>
</table>
<%=hr%>


<%=fontText%>This site was created to facilitate the tabulation of the QuEST surveys. If
	you only want to look at the basic national statistics click either <a href="qstats1.jsp">
	<img src='/quest/images/q1small.gif' border='0'></a> or <a href="qstats2.jsp"><img src='/quest/images/q2small.gif' border='0'></a>
	<p>
	Before you go on, we need some information about you and your campus. Please fill
	out the fields below before pressing continue.
</font>
<table align="center" width="100%">
<tr valign="top"><td>

<tr><td>
	<form method="post" action="entrance.jsp" name="entrance_form">
	<%=fontTextS%><b>Please select your region: </b></td>
	<td><select name="region">
		<option value=""> ----- Select One -----</option>
		<option value="NE">NorthEast (NY, VT, NH, RI, CT, MA, ME)</option>
		<option value="MA">Mid-Atlanic (PA, MD, NJ, DE, VA, WV)</option>
		<option value="MS">Mid-South (KY, TN, NC, SC)</option>
		<option value="SE">Southeast (FL, GA, AL, MS)</option>
		<option value="GL">Great Lakes (IL, OH, IN, MI)</option>
		<option value="UM">Upper-Midwest (ND, SD, MN, IA, WI)</option>
		<option value="GP">Great Plains (WY, CO, NM, NE, KS, MO)</option>
		<option value="RR">Red River (OK, AR, TX, LA)</option>
		<option value="GN">Greater Northwest (WA, OR, NV, ID, UT, MT)</option>
		<option value="PS">Pacific Southwest (CA, AZ, HI)</option>
		<option value="-">Other / Not Applicable (PCB, ...)</option>
	</select>
	</td></tr>
	<tr>
	<td><%=fontTextS%><b>Campus Name:</b> <br>[Please enter the full name of the school without abbreviations, ampersands or apostrophes]</font><a href="#note"><font color="#ff0000">*</a></td><td>
	<input type="text" name="campus" size="35">
</td>
</tr>
<tr>
	<td><%=fontTextS%><b>Which version of QuEST are you entering today?</b></font></td>
	<td><select name="version">
		<option value="-"> - Select One - </option>
		<option value="1">QuEST 1.0</option>
		<option value="2">QuEST 2.0</option>
	</select></td>
</tr>
<tr>
	<td><%=fontTextS%><b>What year was the survey taken?</b></font></td>
	<td><select name="yeartaken">
		<option value="2001">2001</option>
		<option value="2000">2000</option>
		<option value="1999">1999</option>
	</select></td>
</tr>
</table>
<center><input type="submit" name="submit" value="Continue"></center>
</form>
<p> &nbsp;
<p>
 &nbsp;<font color="#ff0000"><a name="note">*</a> <font size="1"><b>Campus:</b> Do not include ampersands or apostrophes. Incorrectly entering your campus may prevent you from receiving accurate statistics, cause male pattern baldness, solar flares, and other unwelcome events.<br>

<%@ include file="footer.jspf" %>