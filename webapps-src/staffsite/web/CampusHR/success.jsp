<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<HTML>
<HEAD>
<TITLE>Campus Staff Site - Success</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
<%@ include file="hrheader.jspf" %>
</HEAD>
<% String pageTitle = "Success"; %>



Success:
<BR>This information requires the approval of your HR team. If approved, it should be updated by the next pay cycle.
If your request is not approved, you will be contacted by a Human Resources team member.

<P ALIGN="CENTER">
<A HREF="/servlet/HRUpdateController" >HR Tool Home</A>
<BR>&nbsp;
<%@ include file="hrfooter.jspf" %>
</HTML>				
