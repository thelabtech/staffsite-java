<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/><%--
--%><%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition, org.alt60m.util.*" %><%--
--%><%
String _project = request.getParameter("project");
int projectInt = 0;
try {
	projectInt = new Integer(_project).intValue();
} catch (NumberFormatException e) {
	projectInt = 0;
}
Hashtable project = infoBean.getSIProjectHash(projectInt);
try {
	//ActionResults ar = ActionResults.getActionResults(session);
	//Hashtable project = ar.getHashtable("project");
	//if (project == null) { response.sendRedirect("http://localhost/hr_si/opportunities.jsp"); return; }
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
	String studentCost = project.get("StudentCost") == null ? "TBA" : "$"+project.get("StudentCost").toString();
	String dates = (studentStartDate == null || ((String)studentStartDate).equals("")) && (studentEndDate == null || ((String)studentEndDate).equals(""))? "TBA" : studentStartDate+" - "+studentEndDate;
%><%--
--%><% response.setContentType("text/xml"); %><%--
--%><?xml version="1.0" encoding="iso-8859-1"?>
<project>
	<name><%=Escape.textToXML(name)%></name>
	<startDate><%=Escape.textToXML(studentStartDate)%></startDate>
	<endDate><%=Escape.textToXML(studentEndDate)%></endDate>
	<location><%=Escape.textToXML(displayLocation)%></location>
	<cost><%=Escape.textToXML(studentCost)%></cost>
	<details><%=Escape.textToXML(details)%></details>
</project><% } catch (Exception e) { e.printStackTrace(); } %>