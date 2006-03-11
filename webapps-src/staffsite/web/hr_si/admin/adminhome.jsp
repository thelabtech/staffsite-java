<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.hr.si.model.dbio.*" %>

<%
	ActionResults ar = ActionResults.getActionResults(session);
	String serverName = request.getServerName();
	String addProjectLink = Boolean.valueOf(ar.getValue("showAddProjectLink")).booleanValue() == true?
		"\n<a href=\"http://"+serverName+"/servlet/SIController?action=adminEditProject\">Add a project</a><br />": "";
	String addAdministratorLink = Boolean.valueOf(ar.getValue("showAddAdministratorLink")).booleanValue() == true?
		"\nAdd a STINT/Internship role to a staff member.<br />": "";
	String listProjectsLink = Boolean.valueOf(ar.getValue("showListProjectsLink")).booleanValue() == true?
		"\nList current STINT/Internship locations.<br />": "";
	String administrateProjectsLink = Boolean.valueOf(ar.getValue("showAdministrateProjectsLink")).booleanValue() == true?
		"\nAdministrate your STINT/Internship location(s).<br />": "";
%>

<HTML>
<HEAD>
<TITLE>STINT / Internship Tool</TITLE>
</HEAD>

<%@ include file="adminheader.jspf" %>

<% out.println(addProjectLink+addAdministratorLink+listProjectsLink+administrateProjectsLink); %>

<%@ include file="adminfooter.jspf" %>

</HTML>