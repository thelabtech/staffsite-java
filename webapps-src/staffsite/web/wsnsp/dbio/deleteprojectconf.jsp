<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Project Information"; %>

<%@ include file="wsnspheader.jspf" %>

<center><%=fontXL%><b>***<%=request.getParameter("name")%>***</b></font></center>

<%=fontTextXL%><b>WARNING</font>:<p>

<ul><ul>
	You are about to delete the <%=fontXL%><b><%=request.getParameter("name")%></b></font> Summer Project from the database.
	All information on the project will be lost and all the applicants will
	be returned to the global applicant pool.
<p>
	Are you sure you want to do this?
<p>

</ul></ul>
<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="deleteProj">
<input type="hidden" name="view" value="adminprojects">
<input type="hidden" name="region" value="<%=request.getParameter("region")%>">
<input type="hidden" name="id" value="<%=request.getParameter("id")%>">

<center><input type="submit" value="Delete the Project"></form> &nbsp; <form action="/servlet/WsnSpController" method="post"><input type="hidden" name="view" value="adminprojects"><input type="hidden" name="action" value="showMainProj"><input type="submit" value="Cancel"></center>

<%@ include file="wsnspfooter.jspf" %>

</HTML>