<script language="JavaScript"><!--
    var timeOutClockDisabled = 1;
// --></script>
<% 	String thePage = "opportunities"; %>
<%@ include file="/hr_si/homePageHeader.jspf" %>
<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%
	Collection national = infoBean.getCurrentProjectsByType('n');
	Collection regionalSTINT = infoBean.getCurrentProjectsByType('s');
	Collection regionalInternships = infoBean.getCurrentProjectsByType('i');
	Hashtable project = new Hashtable();
%>
<%!
private String prettyPrintProjects(Collection projects, String title) {
	String returnString = "";
	Iterator itr = projects.iterator();
	if (itr.hasNext()) {
		returnString += "\n<div style=\"text-align:center\">\n<table>\n\t<tr>";
		returnString += "\n\t\t<td colspan=\"4\" style=\"text-align=center;\"><font size=\"-1\"><b>"+title+"</b><hr style=\"height:1px; width:100%; color: #0066cc;\"></font></td></tr>";
		returnString += "\n\t<tr>\n\t\t<td><div style=\"text-align=center;\"><font size=\"-1\"><b>Location</b></font></div></td>";
		returnString += "\n\t\t<td><font size=\"-1\">&nbsp;</font></td>";
		returnString += "<td><div style=\"text-align:center;\"><font size=\"-1\"><b>Dates</b></font></div></td>";
		returnString += "\n\t\t<td><font size=\"-1\">&nbsp;</font></td>\n\t</tr>";
		while (itr.hasNext()) {
			Hashtable project = (Hashtable)itr.next();
			project.put("StudentStartDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentStartDate")).toString());
			project.put("StudentEndDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentEndDate")).toString());
			returnString += "\n\t<tr>\n\t\t<td><div style=\"text-align:left;\"><font size=\"-1\"><nobr><a href=\"/hr_si/info.jsp?SIProjectID="+project.get("SIProjectID")+"\" style=\"width: 100%\">"+project.get("DisplayLocation")+"</a></nobr></font></div></td>";
			returnString += "\n\t\t<td><div style=\"text-align:right;\"><font size=\"-1\"><nobr>"+project.get("StudentStartDate")+"</nobr></font></div></td>";
			returnString += "\n\t\t<td><div style=\"text-align:center;\"><font size=\"-1\"><nobr>-</nobr></font></div></td>";
			returnString += "\n\t\t<td><div style=\"text-align:left;\"><font size=\"-1\"><nobr>"+project.get("StudentEndDate")+"</nobr></font></div></td>\n\t</tr>";
		}
		returnString += "\n</table><br /></div>";
	}
		return returnString;
}
%>
<!-- CONTENT GOES HERE!!! -->
<center>
	<% box.setTitle("<b>STINT Project Opportunities</b>");%>
	<% box.setWidth("70%");%>
	<% box.setTableInside(false);%>
	<%=box.printTop()%>
<%=prettyPrintProjects(national, "National STINT/Internship Locations")%>
<%=prettyPrintProjects(regionalSTINT, "Regionally Associated STINT Locations")%>
<%=prettyPrintProjects(regionalInternships, "Regionally Assosciated Internship Locations")%>
<%=box.printBottom()%>
</center>
<!-- OKAY, NO MORE OF THIS CONTENT NONSENSE!!! -->
<%@ include file="/hr_si/homePageFooter.jspf" %>