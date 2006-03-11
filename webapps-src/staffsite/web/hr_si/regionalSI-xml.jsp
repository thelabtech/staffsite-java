<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/><%--
--%><%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition, org.alt60m.util.*" %><%--
--%><%
	String _region = request.getParameter("region");
	String _type = request.getParameter("type");
	String _title = request.getParameter("title");
	Collection regionalSIProjects = infoBean.getCurrentProjectsByRegion(_region, _type);
	Hashtable project = new Hashtable();
%><%!
private String regionalProjectsInfoXML(Collection projects, String title, String region, String type) {
	String returnString = "";
	Iterator itr = projects.iterator();
	if (itr.hasNext()) {
		returnString += "<projectList id=\""+title+"\">";
		while (itr.hasNext()) {
			Hashtable project = (Hashtable)itr.next();
			project.put("StudentStartDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentStartDate")).toString());
			project.put("StudentEndDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentEndDate")).toString());
			returnString += "\n<project id=\""+Escape.textToXML(((Integer)project.get("SIProjectID")).toString())+"\" ";
			returnString += "partner=\""+ Escape.textToXML((String)project.get("PartnershipRegion")) +"\">";
			returnString += "\n\t<projectName>"+Escape.textToXML((String)project.get("DisplayLocation"))+"</projectName>";
			returnString += "\n\t<startDate>"+Escape.textToXML((String)project.get("StudentStartDate"))+"</startDate>";
			returnString += "\n\t<endDate>"+Escape.textToXML((String)project.get("StudentEndDate"))+"</endDate>";
			returnString += "\n</project>";
		}
		returnString += "\n</projectList>";
	}
	return returnString;
}
%><%--
--%><% response.setContentType("text/xml"); %><%--
--%><?xml version="1.0" encoding="iso-8859-1" ?> 
<internships>
<%=regionalProjectsInfoXML(regionalSIProjects, _title, _region, _type)%>
</internships>
