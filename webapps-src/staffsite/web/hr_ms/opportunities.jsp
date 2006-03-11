<% 	String thePage = "opportunities"; %>
<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%
	Collection usProjects = infoBean.getCurrentProjectsByType('u');
	Collection wsnProjects = infoBean.getCurrentProjectsByType('w');
	Collection solProjects = infoBean.getCurrentProjectsByType('s');
	Collection regionalProjects = infoBean.getCurrentProjectsByType('r');
	Collection ibsProjects = infoBean.getCurrentProjectsByType('i');
	Collection partnershipProjects = infoBean.getCurrentProjectsByType('p');
	Hashtable project = new Hashtable();
%>
<%!
private String prettyPrintProjects(Collection projects, String title) {
	String returnString = "";
	if (projects != null) {
		Iterator itr = projects.iterator();
		if (itr.hasNext()) {
			returnString += "\n<div style=\"text-align:center\">\n<table>\n\t<tr>";
			returnString += "\n\t\t<td colspan=\"4\" style=\"text-align=center;\"><font size=\"-1\"><b>"+title+"</b><BR>Click project name to see availability<hr style=\"height:1px; width:100%; color: #0066cc;\"></font></td></tr>";
			returnString += "\n\t<tr>\n\t\t<td><font size=\"-1\"><b>Project</b></font></td>";
			returnString += "\n\t\t<td><font size=\"-1\">&nbsp;</font></td>";
			returnString += "<td><div style=\"text-align:center;\"><font size=\"-1\"><b>Dates</b></font></div></td>";
			returnString += "\n\t\t<td><font size=\"-1\">&nbsp;</font></td>\n\t</tr>";
			while (itr.hasNext()) {
				Hashtable project = (Hashtable)itr.next();
				project.put("StudentStartDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentStartDate")).toString());
				project.put("StudentEndDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentEndDate")).toString());
				returnString += "\n\t<tr>\n\t\t<td><font size=\"-1\"><a href=\"/servlet/MSController?action=getProject&url=/hr_ms/info.jsp&projectID="+project.get("WsnProjectID")+"\">"+project.get("Name")+"</a></font></td>";
				returnString += "\n\t\t<td><font size=\"-1\">"+project.get("StudentStartDate")+"</font></td>";
				returnString += "\n\t\t<td><font size=\"-1\"><div style=\"text-align:center;\">-</div></font></td>";
				returnString += "\n\t\t<td><font size=\"-1\">"+project.get("StudentEndDate")+"</font></td>\n\t</tr>";
			}
			returnString += "\n</table><br /></div>";
		}
	}
	return returnString;
}
%>
<%@ include file="/hr_ms/homePageHeader.jspf" %>
<!-- CONTENT GOES HERE!!! -->
<center>
	<% box.setTitle("<b>Summer Project Opportunities</b>");%>
	<% box.setWidth("70%");%>
	<% box.setTableInside(false);%>
	<%=box.printTop()%>
<%=prettyPrintProjects(usProjects, "U.S. Summer Projects")%>
<%=prettyPrintProjects(wsnProjects, "W.S.N. Summer Projects")%>
<%=prettyPrintProjects(solProjects, "School of Leadership Summer Projects")%>
<%=prettyPrintProjects(regionalProjects, "Regional Summer Projects")%>
<%=prettyPrintProjects(ibsProjects, "Institute of Biblical Studies Summer Projects")%>
<%=prettyPrintProjects(partnershipProjects, "Partnership Ministry")%>
<%=box.printBottom()%>
</center>
<!-- OKAY, NO MORE OF THIS CONTENT NONSENSE!!! -->
<%@ include file="/hr_ms/homePageFooter.jspf" %>