<%@ page language="java" %>
<%@ page import="java.util.*,java.awt.*,java.sql.*" %>
<jsp:useBean id="qb" class="org.alt60m.rd.QuestBean"/>
<%!

boolean haveSession(HttpSession thisSession) {
	if ((String)thisSession.getValue("version")!=null){ 
		return true;
	}
	else { return false; }
}
%>
<% 
String iSubmit = request.getParameter("submit");
String campus = request.getParameter("campus");
String region = request.getParameter("region");
String version= request.getParameter("version");
String yeartaken= request.getParameter("yeartaken");
boolean error = false;

if (iSubmit == null) { iSubmit = ""; }
if (region == null)  { region  = ""; }
if (campus == null)	 { campus  = ""; }
if (version == null) { version = "-"; }
if (yeartaken == null) { yeartaken = "2001"; }
%>

<% String pageTitle = "Main Entrance"; %>
<%@ include file="style.jspf"%>
<%@ include file="header_normal.jspf"%>

<%
if (iSubmit.equals("Continue")) {
	session.putValue("version", version);
	session.putValue("region", region);
	session.putValue("campus", campus);
	session.putValue("yeartaken", yeartaken);
}
else if (haveSession(session)){ 
	campus=(String)session.getValue("campus");
	version=(String)session.getValue("version");
	region=(String)session.getValue("region");
	yeartaken=(String)session.getValue("yeartaken");
	iSubmit="Continue";
}
if (!iSubmit.equals("Continue")) {
		%><META http-equiv="refresh" content="2; URL=index.jsp">
			<body>Not sure how you got here. Your session may have timed out.<br>Please do not bookmark this page. It will not get you very far.<p></body></html><%
		error = true;
		}
else {
	if (region.equals("")){
		%>You Must Specify a Region.<p><%
		error = true;
		}
	if ((campus.equals("")) && (!region.equals("-"))){
		%>You Must Specify a Campus.<p><%
		error = true;
		}
	if (version.equals("-")){
		%>You Must Specify a Version of Quest to Enter.<p><%
		error = true;
		}
}
if (error) {
	%>Click <a href="./">HERE</a> to return to the main page.<%
}

else{	%>

<font size="3"><center><b>Welcome to the <font size="4">QuEST Research Project</font></b></center></font><br>
<table align="center" width="70%" cellpadding="15">
<tr valign="top"><td>This site was created to facilitate the tabulation of the QuEST surveys.
		<p>
		Thanks for coming to tell us how you have used Quest at <%= campus %>.
		<p>
		At the top left of each page is the QuEST logo which you can click on to come back to this page.
		<p>

	</td>
	<td>

	<table align="center" width="70%" cellpadding="15">
	<tr>
			<td align="center" bgcolor="#f5f5ff"><font size="1"><b><a href="quest<%=version%>survey.jsp">Quest <%=version%> for <%=yeartaken%></a></b></td>	
			<td align="center"><font size="1"><b>Insert Quest <%=version%><br></td>	
	</tr>
	<tr align="center">
			<td bgcolor="#f5f5ff" nowrap><font size="1"><b><a href="qstats<%=version%>.jsp">QuEST <%=version%> Stats</a></td>
			<td><font size="1"><b>Current Stats for Quest <%=version%></td>
	</tr>
	</table>

	</td></tr>
</table>

<%}	//end of good display
%>

<p> &nbsp;
<%@ include file="footer.jspf" %>