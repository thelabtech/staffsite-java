<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*, java.util.Date" %>

<%String pageTitle="Receive Payment Finished.";%>
<%
	// NOTE: This page does not include "header.jspf" because we don't want all the automatic menus, etc.
	// It does include the ../header although
%>

<%@ include file="../header.jspf" %>

	<% box.setTitle("Payment Complete");%>
	<% box.setWidth("70%");%>
	<CENTER>
	<%=box.printTop()%>


<%	
ActionResults ar = ActionResults.getActionResults(session);
String error = (String) ar.getValue("ErrorMessage");
%>
Your payment has been recorded for processing.  Thank you so much for helping to fulfill the Great Commission by sending laborers into the harvest!

<BR><BR>
<%
if (error!=null)
{
%><B>Message:</B> <%=error%>
<%
}
%>

<BR><BR><BR><HR>
	<%=box.printBottom()%>
<%@ include file="../../footer.jspf" %>
</BODY>
</HTML>
