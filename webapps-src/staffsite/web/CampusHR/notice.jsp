<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<HTML>
<HEAD>
<TITLE>Campus Staff Site - Notice</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
<%@ include file="hrheader.jspf" %>
</HEAD>
<% String pageTitle = "Warning"; %>


<%
	ActionResults ar = ActionResults.getActionResults(session);
%>
Warning:<BR>
<%=ar.getValue("exceptionText")%>
<BR>
<P ALIGN="CENTER">
<A HREF="/servlet/HRUpdateController" >HR Tool Home</A>
<BR>&nbsp;
<%@ include file="hrfooter.jspf" %>
</HTML>				