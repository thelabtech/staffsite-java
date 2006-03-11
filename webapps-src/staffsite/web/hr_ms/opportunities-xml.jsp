<% 	String thePage = "opportunities"; %><%--
--%><jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/><%--
--%><%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition, org.alt60m.util.*" %><%--
--%><%	Collection usProjects = infoBean.getCurrentProjectsByType('u');
	Collection wsnProjects = infoBean.getCurrentProjectsByType('w');
	Collection solProjects = infoBean.getCurrentProjectsByType('s');
	Collection regionalProjects = infoBean.getCurrentProjectsByType('r');
	Collection ibsProjects = infoBean.getCurrentProjectsByType('i');
	Collection partnershipProjects = infoBean.getCurrentProjectsByType('p');
	Hashtable project = new Hashtable();%><%--
--%><%!
private String projectsInfoXML(Collection projects, String title) {
	String returnString = "";
	if (projects != null) {
		Iterator itr = projects.iterator();
		if (itr.hasNext()) {
			returnString += "\n<projectList id=\""+title+"\">";
			while (itr.hasNext()) {
				Hashtable project = (Hashtable)itr.next();
				project.put("StudentStartDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentStartDate")).toString());
				project.put("StudentEndDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentEndDate")).toString());
				returnString += "\n<project id=\""+Escape.textToXML((String)project.get("WsnProjectID"))+"\" partner=\""+ Escape.textToXML((String)project.get("PartnershipRegion")) +"\">";
				returnString += "\n\t<projectName>"+Escape.textToXML((String)project.get("Name"))+"</projectName>";
				returnString += "\n\t<startDate>"+Escape.textToXML((String)project.get("StudentStartDate"))+"</startDate>";
				returnString += "\n\t<endDate>"+Escape.textToXML((String)project.get("StudentEndDate"))+"</endDate>";
				returnString += "\n</project>";
			}
			returnString += "\n</projectList>";
		}
	}
	return returnString;
}
%><%--
--%><% response.setContentType("text/xml"); %><%--
--%><?xml version="1.0" encoding="iso-8859-1" ?> 
<summerProjects>
<%=projectsInfoXML(usProjects, "us")%>
<%=projectsInfoXML(wsnProjects, "wsn")%>
<%=projectsInfoXML(solProjects, "sol")%>
<%=projectsInfoXML(regionalProjects, "regional")%>
<%=projectsInfoXML(ibsProjects, "ibs")%>
<%=projectsInfoXML(partnershipProjects, "partnership")%>
</summerProjects>