<%@ page import="java.util.*" %>
<% Hashtable tub = (Hashtable)session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>Error</TITLE>
</HEAD>
<% String pageTitle = "Error"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>
<br><br>

<table width="90%" align="center"><tr><td>
<%=font%>

You've had an error!

</font>
</td></tr></table>

<%@ include file="/cms/cmsfooter.jspf" %>

</BODY>
</HTML>