<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%
	String _region = request.getParameter("region");
	String _type = request.getParameter("type");
	String _title = request.getParameter("title");
	Collection regionalSIProjects = infoBean.getCurrentProjectsByRegion(_region, _type);
	Hashtable project = new Hashtable();
%>
<%!
private String prettyPrintProjects(Collection projects, String title, String region, String type) {
	String returnString = "";
	Iterator itr = projects.iterator();
	if (itr.hasNext()) {
		returnString += "\n\t<div style=\"text-align:left\">\n\t<table cellpadding=\"0\" cellspacing=\"0\">\n\t\t<tr>";
		returnString += "\n\t\t\t<td colspan=\"4\" style=\"text-align=left;\"><font color=\"#F78F3C\" face=\"Arial, Helvetica, sans-serif\"><b>"+title+"</b></font></td></tr>\n\t\t<tr><td>&nbsp;</td></tr>";
		returnString += "\n\t\t<tr>\n\t\t\t<td><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\"><b>Location</b></font></td>";
		returnString += "\n\t\t\t<td colspan=\"3\"><div style=\"text-align:center;\"><font color=\"#FFFFFF\"  face=\"Arial, Helvetica, sans-serif\"><b>Dates</b></font></div></td>\n\t\t</tr>\n";
		while (itr.hasNext()) {
			Hashtable project = (Hashtable)itr.next();
			project.put("StudentStartDate", new SimpleDateFormat("MMM d, yyyy").format((Date)project.get("StudentStartDate")));
			project.put("StudentEndDate", new SimpleDateFormat("MMM d, yyyy").format((Date)project.get("StudentEndDate")));
			returnString += "\n\t<tr>\n\t\t<td><div style=\"text-align:left;\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\"><nobr><a href=\"/hr_si/regionalSIdetail.jsp?region="+region+"&type="+type+"&title="+title+"&SIProjectID="+project.get("SIProjectID")+"\" style=\"width: 100%\">"+project.get("DisplayLocation")+"</a>&nbsp;&nbsp;</nobr></font></div></td>";
			returnString += "\n\t\t<td><div style=\"text-align:left;\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\"><nobr>"+project.get("StudentStartDate")+"</nobr></font></div></td>";
			returnString += "\n\t\t<td><div style=\"text-align:center;\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\"><nobr>&nbsp;&nbsp;-&nbsp;&nbsp;</nobr></font></div></td>";
			returnString += "\n\t\t<td><div style=\"text-align:left;\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\"><nobr>"+project.get("StudentEndDate")+"</nobr></font></div></td>\n\t</tr>";
		}
		returnString += "\n\t</table></div>";
	}
		return returnString;
}
%>
<html>
<title><%=_title%></title>
<head>
</head>
<body bgcolor="#000000" text="#FFFFFF" leftmargin="10" topmargin="10" marginwidth="0" marginheight="0" bgproperties="fixed" background="http://www.thisiswhereilive.info/graphics/pages/stint-main.jpg" style="background-repeat: repeat-y; background-attachment: fixed;" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
	<TR><TD>
		<%=prettyPrintProjects(regionalSIProjects, _title, _region, _type)%>
	</TD></TR>
</TABLE>
<%@ include file="/headers/google_analytics.jspf"%>
</body>
</html>
