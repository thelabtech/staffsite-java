<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />

<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
String region = new String (request.getParameter("region"));
regions.setName("region");
regions.setCurrentValue(region);

String pageTitle = regions.display() + " Teams"; %>

<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<% box.setTitle("Teams in this Region"); %>
<% box.setStyle("Classic"); %>
<% box.setWidth(""); %>
<P ALIGN="CENTER">
<%= box.printTop() %>
<%=fontText%>Click on a team to view information such as, what campuses it is on, which staff are on it, contact info, and success
criteria.
<BR><BR>

<% 
Iterator metros = ar.getCollection("teams").iterator();
while(metros.hasNext()) {
	Hashtable metro = (Hashtable)metros.next();
%>
	&nbsp;<a href="/servlet/InfoBaseController?action=showTeam&locallevelid=<%=metro.get("LocalLevelId")%>"><%=metro.get("Name")%></a>
	<br>
<%
}
%>

<center><a href="/servlet/InfoBaseController?action=editTeam&mode=add&region=<%=region%>&from=localLevelMetros">[Create a new team to add to this region]</a>

</font>
<%= box.printBottom() %>

<!-- <%=ar.toHTML()%> -->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>