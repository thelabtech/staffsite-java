<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/><%--
--%><%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition, org.alt60m.util.*" %><%--
--%><%
String _project = request.getParameter("project");
Hashtable project = infoBean.getWsnProjectHash(_project);

try {
	//if (project == null) { response.sendRedirect("http://localhost/hr_ms/opportunities.jsp"); return; }
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
	
	// PD application ID is in the project record - get the application record to get pd info (name & email)
	Hashtable pdApp = infoBean.getProjectDirector(projectID);
	String pdNameStr=null;
	String pdName= null;
	String pdEmail= null;
	Boolean secure=(Boolean)project.get("Secure");
	if(pdApp!=null && secure.booleanValue())
	{
		pdNameStr = (String) pdApp.get("LegalFirstName")+" "+(String) pdApp.get("LegalLastName");
		pdName = (" ".equals(pdNameStr))? "TBA" : pdNameStr;
		pdEmail = (String) pdApp.get("CurrentEmail");
	}
	String displayLocation = project.get("DisplayLocation") == null || ((String)project.get("DisplayLocation")).trim().equals("") ? "TBA" : (String)project.get("DisplayLocation");
	String details = project.get("Details") == null || ((String)project.get("Details")).trim().equals("") ? "TBA" : (String)project.get("Details");
	String studentCost = project.get("StudentCost") == null || ((String)project.get("StudentCost")).trim().equals("") ? "TBA" : "$"+(String)project.get("StudentCost");
	String dates = (studentStartDate == null || ((String)studentStartDate).equals("")) && (studentEndDate == null || ((String)studentEndDate).equals(""))? "TBA" : studentStartDate+" - "+studentEndDate;
    Hashtable projectAvailInfo = infoBean.getProjectAvailability(projectID);
    String men = "True".equals(projectAvailInfo.get("Men"))?"TRUE":"NULL";
    String women = "True".equals(projectAvailInfo.get("Women"))?"TRUE":"NULL";
%><%--
--%><% response.setContentType("text/xml"); %><%--
--%><?xml version="1.0" encoding="iso-8859-1"?>
<project>
	<name><%=Escape.textToXML(name)%></name>
<%
	if(pdName!=null)
	{
%>	<pdName><%=Escape.textToXML(pdName)%></pdName>
<%
		if(pdEmail!=null)
		{
%>	<pdEmail><%=Escape.textToXML(pdEmail)%></pdEmail><%
		}
	}
	%>
	<startDate><%=Escape.textToXML(studentStartDate)%></startDate>
	<endDate><%=Escape.textToXML(studentEndDate)%></endDate>
	<location><%=Escape.textToXML(displayLocation)%></location>
	<cost><%=Escape.textToXML(studentCost)%></cost>
	<acceptApps men="<%=Escape.textToXML(men)%>" women="<%=Escape.textToXML(women)%>">
	</acceptApps>
	<details><%=Escape.textToXML(details)%></details>
</project>
<% } catch (Exception e) { e.printStackTrace(); } %>

