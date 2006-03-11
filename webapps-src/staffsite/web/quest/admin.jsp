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

<%=qb.printAdminBanner("MAIN INDEX PAGE", "admin.jsp")%>

<font face="arial" size="2">

<table align="center" width="70%" cellpadding="15">
<tr><td><font size="1"><b> &nbsp; </td>	<td> &nbsp; </td></tr>
<tr><td align="center" bgcolor="#f5f5ff"><font size="1"><b><a href="quest1.jsp">Quest 1</a></b></td>			<td align="center"><font size="1"><b>Insert Quest 1 data<br></td>	
<td rowspan="10" bgcolor="#eeeeff"><font size="2">
<center><b>Welcome to the Quest Tablespace Admin Tool</b></center><br>
<font size="1">
This page was built to help administer the Quest survey database. To your left you will see the various options available. <b>Quest 1 and 2</b> are the actual survey entry forms. <b>Question Tables</b> is the drop down lists that are available for the surveys.
<p>
At the top right of each page are two icons that you can use to navigate. One is to refresh a page, the other is to come back to this page.
<p>
In order to speed up general survey entry, the drop down options are stored in memory. As a result, any changes that are made to the tables will not be available on the surveys until you close all your web browsers and return to this page.
<p>
The campus input box has the format of : <b>full campus name [RA]</b> with RA being the regional abbreviation. For other categories use a - instead of a regional abbreviation. <i>(eg. Cornell University [NE], or PCB [-])</i>
<p>
<font color="#FF0000">Do not use ampersands or apostrophes in any of the text boxes.</font></td></tr>

<tr align="center"><td bgcolor="#f5f5ff"><font size="1"><b><a href="quest2.jsp">Quest 2</a></td>			<td><font size="1"><b>Insert Quest 2 data<br></td>		</tr>
<tr align="center"><td bgcolor="#f5f5ff"><font size="1"><b><a href="table.jsp">The Tables</a></b></td>	<td><font size="1"><b>View/Edit the drop down lists</td></tr>
<tr align="center"><td bgcolor="#f5f5ff"><font size="1"><b><a href="q1stats.jsp">QuEST 1 Stats</a></td>	<td><font size="1"><b>Stats for the Q1 Survey</td></tr>
<tr align="center"><td bgcolor="#f5f5ff"><font size="1"><b><a href="q2stats.jsp">QuEST 2 Stats</a></td>	<td><font size="1"><b>Stats for the Q2 Survey</td></tr>
<tr align="center"><td bgcolor="#f5f5ff"><font size="1"><b> &nbsp; </td>	<td> &nbsp; </td></tr>
</table>

<p> &nbsp;
<p> &nbsp;
<%@ include file="footer.jspf" %>