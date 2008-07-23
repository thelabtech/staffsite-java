<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
%>
<% String pageTitle="Success Criteria Reports"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>
<TABLE width="100%">
	<TR>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Success Criteria Reports</a></font></TD>
	</TR>
</TABLE>

<CENTER>
<% box.setStyle("Classic"); %>
<% box.setTitle("Movement Count Report - Current Totals"); %>
<% box.setWidth("75%"); %>
<%= box.printTop() %>
	<center>
	<%=fontB3%>Number of movements the Campus Ministry<br> is involved with (current <I>and</I> in planning stages):</font><br>
	<%=fontB%><I>(two strategies on the same campus,<br>such as ICR Impact and Staffed Campus,<br>would be counted as two movements)</I></font><p>
	<%=fontB5%><b><%= ar.getValue("activitycount") %></b></font><p>
	<%=fontB3%>Number of ACTIVE movements (excludes those in planning stages):</font><br>
	<%=fontB%><I>(two strategies on the same campus,<br>such as ICR Impact and Staffed Campus,<br>would be counted as two movements)</I></font><p>
	<%=fontB5%><b><%= ar.getValue("activitycountcurrent") %></b></font><p>
  <%=fontB3%># of movements added in the last 365 days:<p>
	<%=fontB5%><b><%= ar.getValue("reportedcount") %></b></font><p>
<%= box.printBottom() %>
</center>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>