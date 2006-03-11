<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*, java.util.Date" %>
<%@ include file="../style.jspf" %>
<%String pageTitle="Receive Payment Finished.";%>


<HTML>
<HEAD>
<TITLE>Receive Payment Done</TITLE>
</HEAD>
<BODY  <%=noMargins%> <%=backColor%> <%=colorLinks%>>
<%=fontA%>
<%@ include file="header.jspf" %>
<%	
ActionResults ar = ActionResults.getActionResults(session);
String error = (String) ar.getValue("ErrorMessage");
%>
Thank you for helping to fulfill the Great Commission!
<BR><BR>
<%
if (error!=null)
{
%><B>Message:</B> <%=error%>
<%
}
%>

<BR><BR><BR><HR>
<%@ include file="footer.jspf" %>
</BODY>
</HTML>