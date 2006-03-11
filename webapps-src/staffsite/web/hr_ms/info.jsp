<% 	String thePage = "opportunities"; %>
<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%@ include file="/hr_ms/homePageHeader.jspf" %>
<!-- CONTENT GOES HERE!!! -->
<%
try {
	ActionResults ar = ActionResults.getActionResults(session);
	Hashtable project = ar.getHashtable("project");
	if (project == null) { response.sendRedirect("http://localhost/hr_ms/opportunities.jsp"); return; }
	String projectID = (String)project.get("WsnProjectID");
	/* This uses String()s, not actual Date()s from the database, via an SQL query. If it's ever turned into an OQL
	   query, switch which lines are commented out (umm, and update this comment). */
	if (project.get("StudentStartDate")!= null) {
		project.put("StudentStartDate", new SimpleDateFormat("MMMM d").format(project.get("StudentStartDate")).toString());
		//project.put("StudentStartDate",new SimpleDateFormat("MMMM d").format((Date)project.get("StudentStartDate")));
	}
	if (project.get("StudentEndDate")!= null) {
		project.put("StudentEndDate", new SimpleDateFormat("MMMM d").format(project.get("StudentEndDate")).toString());
		//project.put("StudentEndDate",new SimpleDateFormat("MMMM d, yyyy").format((Date)project.get("StudentEndDate")));
	}
	String studentStartDate = project.get("StudentStartDate") == null ? "TBA" : (String)project.get("StudentStartDate");
	String studentEndDate = project.get("StudentEndDate") == null ? "TBA" : (String)project.get("StudentEndDate");
	String name = project.get("Name") == null || ((String)project.get("Name")).trim().equals("") ? "Summer Project #"+projectID : (String)project.get("Name");
	String displayLocation = project.get("DisplayLocation") == null || ((String)project.get("DisplayLocation")).trim().equals("") ? "TBA" : (String)project.get("DisplayLocation");
	String details = project.get("Details") == null || ((String)project.get("Details")).trim().equals("") ? "TBA" : (String)project.get("Details");
	String studentCost = project.get("StudentCost") == null || ((String)project.get("StudentCost")).trim().equals("") ? "TBA" : "$"+(String)project.get("StudentCost");
	String dates = (studentStartDate == null || ((String)studentStartDate).equals("")) && (studentEndDate == null || ((String)studentEndDate).equals(""))? "TBA" : studentStartDate+" - "+studentEndDate;
    Hashtable projcetAvailInfo = infoBean.getProjectAvailability(projectID);
    String men = "True".equals(projcetAvailInfo.get("Men"))?"This project is still accepting applications":"This project is no longer accepting applications";
    String women = "True".equals(projcetAvailInfo.get("Women"))?"This project is still accepting applications":"This project is no longer accepting applications";
%>
<p align="center">
<% box.setTitle((String)project.get("Name"));%>
<% box.setWidth("70%");%>
<% box.setTableInside(true);%>
<%=box.printTop()%>
	<tr><td valign="top"><font size="-1"><b>Dates:</b></font></td><td><font size="-1"><%=dates%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Location:</b></font></td><td><font size="-1"><%=displayLocation%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Cost:</b></font></td><td><font size="-1"><%=studentCost%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Men:</b></font></td><td><font size="-1"><%=men%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Women:</b></font></td><td><font size="-1"><%=women%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Details:</b></font></td><td><font size="-1"><%=details%></font></td></tr>
	<tr>
		<td class="button"><a class="button" href="/hr_ms/opportunities.jsp">Back</a></td>
		<td align="right" class="button"><a class="button" href="/servlet/MSController?action=goToPage&page=login">Apply Online</a></td>
	</tr>
<%=box.printBottom()%>
<% } catch (Exception e) { e.printStackTrace(); } %>
<!-- OKAY, NO MORE OF THIS CONTENT NONSENSE!!! -->
<%@ include file="/hr_ms/homePageFooter.jspf" %>