<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	Hashtable project = ar.getHashtable("project");
	String _region = request.getParameter("region");
	String _type = request.getParameter("type");
	String _title = request.getParameter("title");
	if (project == null) { response.sendRedirect("http://localhost/hr_ms/opportunities.jsp"); return; }
	String projectID = (String)project.get("WsnProjectID");
	/* This uses String()s, not actual Date()s from the database, via an SQL query. If it's ever turned into an OQL
	   query, switch which lines are commented out (umm, and update this comment). -- Changed to Date()s 7/9/2004 JCS*/
	if (project.get("StudentStartDate")!= null) {
		//project.put("StudentStartDate", new SimpleDateFormat("MMMM d").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse((String)project.get("StudentStartDate"), new ParsePosition(0))));
		project.put("StudentStartDate", new SimpleDateFormat("MMMM d").format((Date)project.get("StudentStartDate")));
	}
	if (project.get("StudentEndDate")!= null) {
		//project.put("StudentEndDate", new SimpleDateFormat("MMMM d, yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse((String)project.get("StudentEndDate"), new ParsePosition(0))));
		project.put("StudentEndDate", new SimpleDateFormat("MMMM d, yyyy").format((Date)project.get("StudentEndDate")));
	}
	String studentStartDate = project.get("StudentStartDate") == null ? "TBA" : (String)project.get("StudentStartDate");
	String studentEndDate = project.get("StudentEndDate") == null ? "TBA" : (String)project.get("StudentEndDate");
	String name = project.get("Name") == null || ((String)project.get("Name")).trim().equals("") ? "Summer Project #"+projectID : (String)project.get("Name");
	String displayLocation = project.get("DisplayLocation") == null || ((String)project.get("DisplayLocation")).trim().equals("") ? "TBA" : (String)project.get("DisplayLocation");
	String details = project.get("Details") == null || ((String)project.get("Details")).trim().equals("") ? "TBA" : (String)project.get("Details");
	String studentCost = project.get("StudentCost") == null || ((String)project.get("StudentCost")).trim().equals("") ? "TBA" : "$"+(String)project.get("StudentCost");
	String dates = (studentStartDate == null || ((String)studentStartDate).equals("")) && (studentEndDate == null || ((String)studentEndDate).equals(""))? "TBA" : studentStartDate+" - "+studentEndDate;
%>
<html>
<title><%=(String)project.get("Name")%> Details</title>
<head>
</head>
<body bgcolor="#000000" text="#FFFFFF" leftmargin="10" topmargin="10" marginwidth="0" marginheight="0" bgproperties="fixed" background="http://www.thisiswhereilive.info/graphics/pages/sp-main.jpg" style="background-repeat: repeat-y; background-attachment: fixed;" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
	<TR><TD ALIGN="left" NOWRAP><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b><%=(String)project.get("Name")%></b></font></TD></TR>
	<TR><TD>
		<div style="text-align:left">
		<table>
			<tr><td colspan="4" style="text-align=left;"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><hr style="height:1px; width:100%; color: #000000;"></font></td></tr>
			<tr><td valign="top"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b>Dates:</b></font></td><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><%=dates%></font></td></tr>
			<tr><td valign="top"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b>Location:</b></font></td><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><%=displayLocation%></font></td></tr>
			<tr><td valign="top"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b>Cost:</b></font></td><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><%=studentCost%></font></td></tr>
			<tr><td valign="top"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><b>Details:</b></font></td><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><%=details%></font></td></tr>
			<tr><td><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><a href="/hr_ms/regionalSP.jsp?region=<%=_region%>&type=<%=_type%>&title=<%=_title%>">Back</a></font></td><td align="right"><font face="Arial, Helvetica, sans-serif" color="#FFFFFF"><a href="http://staff.campuscrusadeforchrist.com/servlet/MSController" target="_blank">Apply Online</a></font></td></tr>
		</table>
		<br>
		</div>
	</TD></TR>
</TABLE>
</center>
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
