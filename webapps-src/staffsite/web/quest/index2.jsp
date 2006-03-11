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
%><%

//HttpSession mySession	= request.getSession();
//mySession.invalidate();
//HttpSession session	= request.getSession();
session.invalidate();
%>
<html>
<head><title>QUEST INDEX PAGE-<%= session.getId() %></title></head>

<body bgcolor="#FFFFFF">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr valign="bottom" bgcolor="#ddddee">
	<td> &nbsp; </td>
</tr>
</table>

<img src="/quest/images/questlogo.gif">

<font face="arial" size="2">

<font size="3"><center><b>Welcome to the <font color="#333399"><i>online</i></font> <font size="4">QuEST Research Project</font></b></center></font><br>
<table align="center" width="80%" cellpadding="15">
<tr valign="top"><td>This site was created to facilitate the tabulation of the QuEST surveys. If you only want to look at the basic national statistics click either <a href="qstats1.jsp"><img src='/quest/images/q1small.gif' border='0'></a> or <a href="qstats2.jsp"><img src='/quest/images/q2small.gif' border='0'></a>
		<p>
		Before you go on, we need some information about you and your campus. Please fill out the fields below before pressing continue. For additional information see the notes at the bottom of this page. 
	</td>
	<td width="20%"> &nbsp;</td>
</tr>
</table><br>
<table width="100%">
<tr><td>
	<form method="post" action="entrance.jsp" name="entrance_form">
	<font face="arial" size="1"><b>Please select your region: </b></td>
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
	<td><font face="arial" size="1"><b>Campus Name:</b> <br>[Please enter the full name of the school without abbreviations, ampersands or apostrophes]</font><a href="#note"><font color="#ff0000">*</a></td><td>
	<input type="text" name="campus" size="35">
</td>
</tr>
	<td><font face="arial" size="1"><b>Which version of QuEST are you entering today?</b></font></td>
	<td><select name="version">
		<option value="-"> - Select One - </option>
		<option value="1">QuEST 1.0</option>
		<option value="2">QuEST 2.0</option>
	</select></td>
</tr>
</table>
<center><input type="submit" name="submit" value="Continue"></center>
</form>
<p> &nbsp;
<p>
 &nbsp;<font color="#ff0000"><a name="note">*</a> <font size="1"><b>Campus:</b> Do not include ampersands or apostrophes. Incorrectly entering your campus may prevent you from receiving accurate statistics, cause male pattern baldness, solar flares, and other unwelcome events.<br>

<%@ include file="footer.jspf" %>