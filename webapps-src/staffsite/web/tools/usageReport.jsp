<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);

//Hashtable usage = ar.getHashtable("usage");

%>

<html>
<head>
<title>Usage Report</title>
</head>

<% out.println(ar.toHTML());%>

</html>