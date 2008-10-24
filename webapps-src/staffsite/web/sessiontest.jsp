<%@ page import="java.util.*" %>
<HTML>
<HEAD>
<TITLE>Session Test</TITLE>
</HEAD>
<body>
<hr>
<% 
	out.println("<b>isNew?</b> " + session.isNew() + "<br>");
	out.println("<b>SessionID</b> " + session.getId() + "<br>");
	out.println("<b>MaxInactiveInterval</b> " + session.getMaxInactiveInterval() + "<br>");
	out.println("<b>CreationTime</b> " + session.getCreationTime() + "<br>");
	out.println("<b>LastAccessedTime</b> " + session.getLastAccessedTime() + "<br>");
	out.println("<b>SessionContext</b> " + session.getSessionContext() + "<br>");
	%><hr><%
     String[] v = session.getValueNames();
     for (int i = 0; i < v.length; i++) {
	 out.println( "<b>" + v[i] + "</b>&nbsp;" + session.getValue(v[i]) + "<br>");
     }
%>
<hr>
<applet code="TimerApplet.class" WIDTH=80 HEIGHT=15 border=1></applet>
<%@ include file="/headers/google_analytics.jspf"%>
</body>
</html>