<% String pageTitle = "Select an Opportunity"; %>
<%@ include file="../header.jspf" %>
<%@ page import="org.alt60m.servlet.*" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/MSController");
	}
	Collection wsnProjects = ar.getCollection("WsnProjects");
%>
<TABLE BORDER="0" WIDTH="100%">
	<TR>
		<td valign="top"><IMG src="../hr_ms/images/USA.gif" border=0></TD>
		<TD>
			<%
			if (wsnProjects != null) {
				out.println("<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\">");
				out.println("\t\t\t<tr>");
				out.println("\t\t\t<td width=\"82\" align=\"center\"><b>Region</b></td>");
				out.println("\t\t\t<td width=\"152\"><b>Project</b></td>");
				out.println("\t\t\t<td width=\"161\"><b>Duration</b></td></tr>");
				Iterator i = wsnProjects.iterator();
				while (i.hasNext()) {
					Hashtable project = (Hashtable)i.next();
					out.println("\t\t\t<tr>");
					out.println("\t\t\t\t<td width=\"82\" align=\"center\">"+project.get("PartnershipRegion")+"</td>");
					out.println("\t\t\t\t<td width=\"152\"><a href=\"MSController?action=goToPage&page=info&WsnProjectID="+
						project.get("WsnProjectID")+"\">"+project.get("Name")+"</a></td>");
					out.println("\t\t\t\t<td width=\"161\">"+project.get("StartDate")+" - "+project.get("StopDate")+"</td>");
					out.println("\t\t\t</tr>");
				}
				out.println("</table>");
			} else {
				out.println("There were no WSN Summer Projects found to display. That probably means there was an error somewhere.");
			}
			%>
		</TD>
	</TR>
</TABLE>
<%@ include file="../footer.jspf" %>
</BODY>
</HTML>