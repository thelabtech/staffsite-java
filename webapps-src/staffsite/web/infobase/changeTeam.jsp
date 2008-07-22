<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%

%>
<% String pageTitle="How To Change Your Team"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<br><br>
<%=font2 %><center>We have recently changed the way HR information is updated in the Campus Ministry. <br>
Missional Team assignment is a special case that is not maintained by CCCI Personnel Records. <br>
To change your Missional Team assignment, use the <A HREF="/servlet/InfoBaseController">InfoBase</A> to navigate to the Missional Team you would like to join.<br>
If you are not already assigned to that Missional Team , a link will be displayed under the current Missional Team members<br>
inviting you to "Move to this team." Click it, and you will be the newest member of that Missional Team !<br>
<A HREF="/servlet/InfoBaseController">Go to the InfoBase</A></center></font><br><br>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>