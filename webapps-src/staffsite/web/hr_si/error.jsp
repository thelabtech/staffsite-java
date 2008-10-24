<% String pageTitle = "Mobilizing System Error Page"; %>
<%@ include file="siMainHeader.jspf" %>
<%@ page import="org.alt60m.servlet.*" %>
<%
	String errorString = (String)session.getValue("ErrorString");
%>
Sorry, but an error occured.<br />
<% if (errorString != null) out.println(errorString); %>
<div align="center" CLASS="small">
<i>© 2002 Campus Crusade for Christ International
</i><br>
</div>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>