<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, org.alt60m.util.*, org.alt60m.wsn.sp.model.dbio.*, java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%
	String _region = request.getParameter("region");
	String _type = request.getParameter("type");
	String _title = request.getParameter("title");
	Collection regionalWsnProjects = infoBean.getCurrentWsnProjectsByRegion(_region, _type);
	Hashtable project = new Hashtable();
%>
<%!
private String prettyPrintProjects(Collection projects, String title, String region, String type) {
	String returnString = "";
	if (projects != null) {
		Iterator itr = projects.iterator();
		if (itr.hasNext()) {
			returnString += "\n\t<div style=\"text-align:left\">\n\t<table cellpadding=\"0\" cellspacing=\"0\">\n\t\t<tr>";
			returnString += "\n\t\t\t<td colspan=\"4\" style=\"text-align=left;\"><font color=\"#F78F3C\" face=\"Arial, Helvetica, sans-serif\"><b>"+title+"</b></font></td></tr>\n\t\t<tr><td>&nbsp;</td></tr>";
			returnString += "\n\t\t<tr>\n\t\t\t<td><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\"><b>Project</b></font></td>";
			returnString += "\n\t\t\t<td colspan=\"3\"><div style=\"text-align:center;\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\"><b>Dates</b></font></div></td>\n\t\t</tr>\n";
			while (itr.hasNext()) {
				WsnProjectLight proj = (WsnProjectLight)itr.next();
				Hashtable project = ObjectHashUtil.obj2hash(proj);
				project.put("StudentStartDate", new SimpleDateFormat("MMMM d, yyyy").format((Date)project.get("StudentStartDate")));
				project.put("StudentEndDate", new SimpleDateFormat("MMMM d, yyyy").format((Date)project.get("StudentEndDate")));
				returnString += "\t\t<tr><td align=\"left\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\"><a href=\"/servlet/MSController?action=getProject&region="+region+"&type="+type+"&title="+title+"&url=/hr_ms/regionalSPdetail.jsp&projectID="+project.get("WsnProjectID")+"\">"+project.get("Name")+"</a></font></td>\n";
				returnString += "\t\t\t<td align=\"left\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\">&nbsp;&nbsp;"+project.get("StudentStartDate")+"</font></td>\n";
				returnString += "\t\t\t<td align=\"center\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\">&nbsp;&nbsp;-&nbsp;&nbsp;</font></td>\n";
				returnString += "\t\t\t<td align=\"left\"><font color=\"#FFFFFF\" face=\"Arial, Helvetica, sans-serif\">"+project.get("StudentEndDate")+"</font></td>\n\t\t</tr>";
			}
			returnString += "\n\t</table>";
		}
	}
	return returnString;
}
%>
<html>
<title><%=_title%></title>
<head>
</head>
<body bgcolor="#000000" text="#FFFFFF" leftmargin="10" topmargin="10" marginwidth="0" marginheight="0" bgproperties="fixed" background="http://www.thisiswhereilive.info/graphics/pages/sp-main.jpg" style="background-repeat: repeat-y; background-attachment: fixed;" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
	<TR><TD>
		<%=prettyPrintProjects(regionalWsnProjects, _title, _region, _type)%>
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
