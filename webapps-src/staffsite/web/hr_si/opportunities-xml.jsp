<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/><%--
--%><%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition, org.alt60m.util.*" %><%--
--%><%
	Collection national = infoBean.getCurrentProjectsByType('n');
	Collection regionalSTINT = infoBean.getCurrentProjectsByType('s');
	Collection regionalInternships = infoBean.getCurrentProjectsByType('i');
	Hashtable project = new Hashtable();
%><%!
private String projectsInfoXML(Collection projects, String title) {
	String returnString = "";
	if (projects != null) {
		Iterator itr = projects.iterator();
		if (itr.hasNext()) {
			returnString += "\n<projectList id=\""+title+"\">";
			while (itr.hasNext()) {
				Hashtable project = (Hashtable)itr.next();
				if (project.get("StudentStartDate") == null)
				{
					project.put("StudentStartDate", "Unavailable");
				} else {
					project.put("StudentStartDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentStartDate")).toString());
				}
				if (project.get("StudentEndDate") == null)
				{
					project.put("StudentEndDate", "Unavailable");
				} else {
					project.put("StudentEndDate", new SimpleDateFormat("MMM d yyyy").format(project.get("StudentEndDate")).toString());
				}
				returnString += "\n<project id=\""+Escape.textToXML(((Integer)project.get("SIProjectID")).toString())+"\" ";
				returnString += "partner=\""+ Escape.textToXML((String)project.get("PartnershipRegion")) +"\">";
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
<internships>
<%=projectsInfoXML(national, "National STINT/Internship Locations")%>
<%=projectsInfoXML(regionalSTINT, "Regionally Associated STINT Locations")%>
<%=projectsInfoXML(regionalInternships, "Regionally Assosciated Internship Locations")%>
</internships>