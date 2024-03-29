<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />

<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
String region = new String (request.getParameter("region"));
regions.setName("region");
regions.setCurrentValue(region);

String pageTitle = regions.display() + " Missional Teams"; %>

<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<% box.setTitle("Missional Teams in this Region"); %>
<% box.setStyle("Classic"); %>
<% box.setWidth(""); %>
<P ALIGN="CENTER">
<%= box.printTop() %>
<%=fontText%>Click on a Missional Team to view information such as, what Ministry Locations it is reaching, which staff are on it, contact info, and success
criteria.

<table>

<% 
Iterator metros = ar.getCollection("teams").iterator();
while(metros.hasNext()) {
	Hashtable metro = (Hashtable)metros.next();
%><tr><td><%=fontB %>
<A style="text-decoration:none;font-style:italic;color:black;font-size:10px;" HREF="/servlet/InfoBaseController?action=saveTeamMember&teamID=<%=metro.get("LocalLevelId") %>&locallevelid=<%=metro.get("LocalLevelId") %>&personID=<%= ar.getValue("personID") %>">(Join)&nbsp;</A>
	
</td><td><%=fontB %>
	&nbsp;<a href="/servlet/InfoBaseController?action=showTeam&locallevelid=<%=metro.get("LocalLevelId")%>"><%=metro.get("Name")%></a>&nbsp;
</td></tr>
<%
}
%>
</table>
<center><a href="/servlet/InfoBaseController?action=proposeNewLocalLevel">[Request to add a new Missional Team to this region]</a>

</font>
<%= box.printBottom() %>

<!-- <%=ar.toHTML()%> -->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>