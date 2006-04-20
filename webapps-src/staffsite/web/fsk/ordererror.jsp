<%@ page import="java.util.*" %>

<% 
Hashtable h = (Hashtable) session.getValue("tub");
%>

<html>
<head>
<title>FSK Order Error</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<% 
String pageTitle = new String();
pageTitle = "Error"; 
%>
<%@ include file="/fsk/fskheader.jspf"%>

<body>
<%=fontR%><%=h.get("error2")%>&nbsp;<%=h.get("error1")%>&nbsp;
<BR><BR><%=fontText%><B>Please hit <a href="JavaScript: history.back()">BACK</a> and update your page. The order has NOT been saved.</B>
</font>

<%@ include file="/footer.jspf" %>
</body>
</html>
