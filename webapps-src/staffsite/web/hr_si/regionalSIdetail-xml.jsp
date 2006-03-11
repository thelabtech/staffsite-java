<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition, org.alt60m.hr.si.model.dbio.SIProject" %>
<%
try {
	ActionResults ar = ActionResults.getActionResults(session);
	Hashtable project = ar.getHashtable("project");
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
	String name = project.get("Name") == null || ((String)project.get("Name")).trim().equals("") ? "STINT/Internship #"+projectID : (String)project.get("Name");	
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
	<pdName><%=Escape.textToXML(pdName)%></pdName>
	<%
	if(pdEmail!=null)
	{
	%><pdEmail><%=Escape.textToXML(pdEmail)%></pdEmail><%
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



<%
	String _region = request.getParameter("region");
	String _type = request.getParameter("type");
	String _title = request.getParameter("title");
	int SIProjectID = Integer.parseInt(request.getParameter("SIProjectID"));
	SIProject project = infoBean.getSIProject(SIProjectID);
	if (project == null) { response.sendRedirect("http://"+request.getServerName()+"/hr_si/opportunities.jsp"); return; }
	String studentStartDate = "", studentEndDate = "";
	/* "Today, if you are not confused, you are just not thinking clearly."  -U. Peter */
	if (project.getStudentStartDate()!= null) {
		//project.put("StudentStartDate", new SimpleDateFormat("MMMM d").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse((String)project.get("StudentStartDate"), new ParsePosition(0))));
		studentStartDate = (new SimpleDateFormat("MMMM d, yyyy")).format((Date)project.getStudentStartDate());
	}
	if (project.getStudentEndDate()!= null) {
		//project.put("StudentEndDate", new SimpleDateFormat("MMMM d, yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse((String)project.get("StudentEndDate"), new ParsePosition(0))));
		studentEndDate = (new SimpleDateFormat("MMMM d, yyyy")).format((Date)project.getStudentEndDate());
	}
	String startDate = studentStartDate == null ? "TBA" : studentStartDate;
	String endDate = studentEndDate == null ? "TBA" : studentEndDate;
	String name = project.getName() == null || ((String)project.getName()).trim().equals("") ? "Summer Project #"+SIProjectID : (String)project.getName();
	String displayLocation = project.getDisplayLocation() == null || ((String)project.getDisplayLocation()).trim().equals("") ? "TBA" : (String)project.getDisplayLocation();
	String details = project.getDetails() == null || ((String)project.getDetails()).trim().equals("") ? "TBA" : (String)project.getDetails();
	String studentCost = project.getStudentCost() == 0 ? "TBA" : "$"+project.getStudentCost();
	String dates = (startDate == null || startDate.equals("")) && (endDate == null || endDate.equals(""))? "TBA" : startDate+" - "+endDate;
%>
<html>
<title><%=(String)project.getName()%> Details</title>
<head>
</head>
<body bgcolor="#000000" text="#FFFFFF" leftmargin="10" topmargin="10" marginwidth="0" marginheight="0" bgproperties="fixed" background="http://www.thisiswhereilive.info/graphics/pages/stint-main.jpg" style="background-repeat: repeat-y; background-attachment: fixed;" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
	<TR><TD ALIGN="left" NOWRAP><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b><%=(String)project.getName()%></b></font></TD></TR>
	<TR><TD>
		<div style="text-align:left">
		<table>
			<tr><td valign="top"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b>Dates:</b></font></td><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><%=dates%></font></td></tr>
			<tr><td valign="top"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b>Location:</b></font></td><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><%=displayLocation%></font></td></tr>
			<tr><td valign="top"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b>Cost:</b></font></td><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><%=studentCost%></font></td></tr>
			<tr><td valign="top"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b>Details:</b></font></td><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><%=details%></font></td></tr>
			<tr><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><a href="/hr_si/regionalSI.jsp?region=<%=_region%>&type=<%=_type%>&title=<%=_title%>">Back</a></font></td>
					<td align="right"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><a href="http://www.apply4stint.com" target="_blank">Apply Online</a></font></td>
			</tr>
		</table>
		<br>
		</div>
	</TD></TR>
</TABLE>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</body>
</html>
