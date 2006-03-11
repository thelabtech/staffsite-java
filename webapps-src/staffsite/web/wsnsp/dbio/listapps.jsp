<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "People Listing"; %>

<%@ include file="wsnspheader.jspf" %>

<p align='right'>
<table width='50%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr align='center' valign='center'><td><%=fontTextL%><b>Available Tools:</td><td>
<form method='post' action='/wsnsp/dbio/filterlistapps.jsp'>
<input type='submit' value='Search'></form></td><td>
</table>
</P>

<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr><th><%=fontS%>result</th><th><%=fontS%>view</th><th><%=font%>Name</th><th><%=font%>Accepted</th><th><%=font%>App. Submitted</th><th><%=font%>Account#</th><th><%=font%>City, State</th><th><%=font%>E-mail</th><th><%=font%>Phone</th><th><%=font%>Assignment</th></tr>
	<%
	if (!h.containsKey("0")) {
		%>
		<TH colspan="9"><%=font%>There are currently no entries matching your search criteria.</font></TH>
		<%
	} else {
		Integer counter= new Integer(0);
		while (h.containsKey(counter.toString())){
			Hashtable app = (Hashtable)h.get(counter.toString());
			%>
			<tr align=center>
				<td><%=fontS%><b><%=counter.intValue()+1%></td>
				<td>
					<a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=app.get("WsnApplicationID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a>
				</td>
				<td><%=fontText%><%=app.get("Name")%>&nbsp;</td>
				<td><%=fontTextS%><%=app.get("Status")%>&nbsp;</td>
				<td><%=fontTextS%><%=app.get("SubmittedDate")%>&nbsp;</td>
				<td><%=fontTextS%><%=app.get("ApplAccountNo")%>&nbsp;</td>
				<td><%=fontTextS%><%=app.get("CurrentCity")%>, <%=app.get("CurrentState")%>&nbsp;</td>
				<td><%=fontTextS%><a href='mailto:<%=app.get("CurrentEmail")%>'><%=app.get("CurrentEmail")%>&nbsp;</a></td>
				<td><%=fontTextS%><%=app.get("CurrentPhone")%>&nbsp;</td>
				<td><%=fontTextS%><%=app.get("Project")%>&nbsp;</td>
			</tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
	}
	%>
</table>
<p align='right'>
<table width='50%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr align='center' valign='center'><td><%=fontTextL%><b>Available Tools:</td><td>
<form method='post' action='/wsnsp/dbio/filterlistapps.jsp'>
<input type='submit' value='Search'>
</form></td><td>
</table>
</P>

<p> &nbsp;
<%@ include file="wsnspfooter.jspf" %>