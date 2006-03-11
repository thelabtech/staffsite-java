<% String pageTitle = "Campus Ministry User Account System Error Page"; %>
<%@ include file="/general/header.jspf" %>
<%@ page import="org.alt60m.servlet.*" %>
<%
	String errorString = (String)session.getValue("ErrorString");
%>
Sorry, but an error occured.<br />
<% if (errorString != null) out.println(errorString); %>
<%@ include file="/general/footer.jspf" %>