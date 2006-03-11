<%@ page import="org.alt60m.servlet.*" %>
<% String pageTitle = "Mobilizing System"; %>
<%@ include file="../header.jspf" %>
<%
ActionResults ar = ActionResults.getActionResults(session);
if(ar==null) response.sendRedirect("/servlet/MSController");
Hashtable wsnProject = ar.getHashtable("wsnProject");

if (wsnProject != null) {
	String projectName = (String)wsnProject.get("Name");
	if (projectName == null || projectName.equals("")) projectName = "Unnamed Project";
%>
<p align="center">
<% box.setTitle((String)wsnProject.get("Name"));%>
<% box.setWidth("70%");%>
<% box.setTableInside(true);%>
<%=box.printTop()%>
	<tr>
		<td valign="TOP" align="right" width="150" class="cell2">Details:</td>
		<td valign="TOP"><%=wsnProject.get("Details")%></td>
	</tr>
	<tr>
		<td valign="TOP" align="right" class="cell2">Students From:</td>
		<td valign="TOP"><%=wsnProject.get("PartnershipRegion")%></td>
	</tr>
	<tr>
		<td align="right" class="cell2">Approx. Cost:</td>
		<td>$<%=wsnProject.get("StudentCost")%></td>
	</tr>
	<tr>
		<td align="right" class="cell2">Contact:</td>
		<td><%=wsnProject.get("InCountryContact")%></td>
	</tr>
	<tr>
		<td class="button"><a class="button" href="MSController?action=getOpportunities">Back</a></td>
		<td align="right" class="button"><a class="button" href="MSController?action=goToPage&page=login&ProjectPref1=<%=wsnProject.get("WsnProjectID")%>">Apply Online</a></td>
	</tr>
<% } else { %>
	<tr><td>There was an error retrieving the opportuniy information from the database, and no data was returned.</td></tr>
<% } %>
<%=box.printBottom()%>
</center>
<%@ include file="../footer.jspf" %>
</body>
</html>