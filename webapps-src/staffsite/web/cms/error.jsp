<%@ page import="java.util.*" %>
<% Hashtable tub = (Hashtable)session.getValue("tub"); %>
<% String error = (String)session.getValue("error"); %>

<HTML>
<HEAD>
<TITLE>Error</TITLE>
</HEAD>
<% String pageTitle = "Error"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>
<br><br>

<table width="90%" align="center"><tr><td>
<%=font%>

<% if (error != null) { %>
  <%= error %>
<% } else { %>
  You've had an error!
<% } %>

</font>
</td></tr></table>

<%@ include file="/cms/cmsfooter.jspf" %>

</BODY>
</HTML>