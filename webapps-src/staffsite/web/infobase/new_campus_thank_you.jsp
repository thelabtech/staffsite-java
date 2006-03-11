<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
  Hashtable error = ar.getHashtable("error");
	Boolean IsError = (Boolean)error.get("IsError");
	String ErrorString = (String)error.get("ErrorString");
	String teamActive;
%>
<% String pageTitle="Add Campus Results"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>

<%
if(IsError.booleanValue())	{ %>
	<%=fontR%><b>Error.</b> You didn't enter the following required fields: <%=ErrorString%></font>
	<br><br>
	<%=fontB%>Please click your BACK button to correct the error.</font>
<%
} else {
%>
<%=fontB%><b>Success.</b> The campus has been saved.  Thank you.</font>
<%
}	
%>
<%=fontB%><%=ar.toHTML()%>
<%@ include file="/infobase/ibfooter.jspf" %>
</html> 