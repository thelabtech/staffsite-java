<%@ page import="java.util.*, org.alt60m.servlet.*" %>


<%
	// Iterator i = ((Collection)session.getValue("tub")).iterator(); 
	Iterator i = ActionResults.getActionResults(session).getCollection("campusinfo").iterator();
%>

<html>
<head><title>Campus Crusade for Christ</title></head>

	<%
		String pageTitle = "Search results for ";
		if (request.getParameter("searchby").equals("all")) {
			pageTitle = pageTitle + " all campuses";
		} else if (request.getParameter("searchby").equals("region")) {
			pageTitle = pageTitle + " region:&nbsp;&nbsp;" + request.getParameter("searchstring");
		} else if (request.getParameter("searchby").equals("city")) {
			pageTitle = pageTitle + " city:&nbsp;&nbsp;" + request.getParameter("searchstring");
		} else if (request.getParameter("searchby").equals("state")) {
			pageTitle = pageTitle + " state:&nbsp;&nbsp;" + request.getParameter("searchstring");					
		} else if (request.getParameter("searchby").equals("name")) {
			pageTitle = pageTitle + " name containing:&nbsp;&nbsp;" + request.getParameter("searchstring");
		} else if (request.getParameter("searchby").equals("zip")) {
			pageTitle = pageTitle + " zip code:&nbsp;&nbsp;" + request.getParameter("searchstring");
		} else if (request.getParameter("searchby").equals("country")) {
			pageTitle = pageTitle + " Country:&nbsp;&nbsp;" + request.getParameter("searchstring");	
		} else {
//			pageTitle = pageTitle + " Country:&nbsp;&nbsp;" + request.getParameter("searchstring");
			pageTitle = pageTitle + " Movement:&nbsp;&nbsp;" + request.getParameter("searchby");
		}
	
	%>
	<%@ include file="/infobase/ibheader.jspf" %>
	<hr color="#FFFFFF">

	<table width="100%" border="0" cellpadding="3" cellspacing="2" align="center" <%=bgcolorW%>>
		<tr <%=bgcolorB%>>
			<td><%=fontW%><b><b>Campus name</b></font></td>
			<td><%=fontW%><b><b>Team / Strategy (<i>status</i>)</b></font></td>
			<td><%=fontW%><b><b>Region</b></font></td>
			<td><%=fontW%><b><b>City</b></font></td>
			<td><%=fontW%><b><b>State</b></font></td>
			<td><%=fontW%><b><b>Zip</b></font></td>

		</tr>
		
		<%
		//loop through each record
		while(i.hasNext()) {
			Hashtable h = (Hashtable)i.next();
		%>
		<tr <%=bgcolorL%>>
			<td><a href="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=h.get("TargetAreaId")%>"><%=fontB%><%=h.get("Name")%></font></a></td>
 <!-- what if status is blank like it should be for non cat campuses? Should we add if statement of the formHelper -->
			<td><%=fontB%><a href="/servlet/InfoBaseController?action=showTeam&locallevelid=<%=h.get("LocalLevelId")%>"><%=h.get("TeamName")%></a></font><%=fontText%> <%=h.get("Strategy")%><% if((!h.get("Status").equals("")) && (!h.get("Status").equals("Active"))) { %> <i>(<%=h.get("Status")%>)</i> <% } %></font></td>
			<td><%=fontB%><%=h.get("Region")%>&nbsp;</font></td>
			<td><%=fontB%><%=h.get("City")%>&nbsp;</font></td>
			<td><%=fontB%><%=h.get("State")%>&nbsp;</font></td>
			<td><%=fontB%><%=h.get("Zip")%>&nbsp;</font></td>
		</tr>
		<%
		}
	%> 
	</table>
	<table width="100%" border="0" cellspacing="0" align="center">
		<tr <%=bgcolorB%>><td height="19" <%=bgcolorB%> colspan=7></td></tr>
		<tr><td><br><a href="/servlet/InfoBaseController?action=proposeNewTargetArea"><%=fontB%>Can't find your campus?  Propose one to be entered here.</font></a></td></tr>
	</table>
	<br>
	<%@ include file="/infobase/ibfooter.jspf" %>
	</html>
