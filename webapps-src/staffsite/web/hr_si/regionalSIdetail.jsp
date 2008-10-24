<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition, org.alt60m.hr.si.model.dbio.SIProject" %>
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
<%@ include file="/headers/google_analytics.jspf"%>
</body>
</html>
