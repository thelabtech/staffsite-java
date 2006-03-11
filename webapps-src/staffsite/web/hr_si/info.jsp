<% 	String thePage = "opportunities"; %>
<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition, org.alt60m.hr.si.model.dbio.SIProject, java.text.DecimalFormat" %>
<%@ include file="/hr_si/homePageHeader.jspf" %>
<!-- CONTENT GOES HERE!!! -->
<%
	int SIProjectID = Integer.parseInt(request.getParameter("SIProjectID"));
	SIProject project = infoBean.getSIProject(SIProjectID);
	if (project == null) { response.sendRedirect("http://"+request.getServerName()+"/hr_si/opportunities.jsp"); return; }
	String studentStartDate = "", studentEndDate = "";
	/* "Today, if you are not confused, you are just not thinking clearly."  -U. Peter */
	if (project.getStudentStartDate()!= null) {
		//project.put("StudentStartDate", new SimpleDateFormat("MMMM d").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse((String)project.get("StudentStartDate"), new ParsePosition(0))));
		studentStartDate = (new SimpleDateFormat("MMMM d")).format((Date)project.getStudentStartDate());
	}
	if (project.getStudentEndDate()!= null) {
		//project.put("StudentEndDate", new SimpleDateFormat("MMMM d, yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse((String)project.get("StudentEndDate"), new ParsePosition(0))));
		studentEndDate = (new SimpleDateFormat("MMMM d, yyyy")).format((Date)project.getStudentEndDate());
	}
//	NumberFormat formatter = new NumberFormat();
	String startDate = studentStartDate == null ? "TBA" : studentStartDate;
	String endDate = studentEndDate == null ? "TBA" : studentEndDate;
	String name = project.getName() == null || ((String)project.getName()).trim().equals("") ? "Summer Project #"+SIProjectID : (String)project.getName();
	String displayLocation = project.getDisplayLocation() == null || ((String)project.getDisplayLocation()).trim().equals("") ? "TBA" : (String)project.getDisplayLocation();
	String details = project.getDetails() == null || ((String)project.getDetails()).trim().equals("") ? "TBA" : (String)project.getDetails();
	// String studentCost = project.getStudentCost() == 0 ? "TBA" : "$"+project.getStudentCost().applyPattern(###,##0);
	String studentCost = "";

	if (project.getStudentCost() == 0) {

		studentCost = "TBA";

	} else {

//		Locale currentLocale = new Locale("en", "US");
//		DecimalFormatSymbols currentSymbols =   new DecimalFormatSymbols(currentLocale);
		DecimalFormat currentFormat = new DecimalFormat();
		// ok now change some symobls around
		// currentSymbols.setDecimalSeparator('|');
		// currentSymbols.setGroupingSeparator('^');
		// plug symbols back in (sometimes you don't need to do this, just do it to be sure)
		// currentFormat.setDecimalFormatSymbols(currentSymbols);
		studentCost = "$" + currentFormat.format(project.getStudentCost());
		//String studentCostExplaination = project.getStudentCostExplaination() == null || ((String)project.getStudentCostExplaination()).trim().equals("") ? "Not Available" : (String)project.getStudentCostExplaination();
	}

	String studentCostExplaination = project.getStudentCostExplaination() == null || ((String)project.getStudentCostExplaination()).trim().equals("") ? "Not Available" : (String)project.getStudentCostExplaination();
	String dates = (startDate == null || startDate.equals("")) && (endDate == null || endDate.equals(""))? "TBA" : startDate+" - "+endDate;
%>
<p align="center">
<% box.setTitle((String)project.getName());%>
<% box.setWidth("70%");%>
<% box.setTableInside(true);%>
<%=box.printTop()%>
	<tr><td valign="top"><font size="-1"><b>Dates:</b></font></td><td><font size="-1"><%=dates%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Location:</b></font></td><td><font size="-1"><%=displayLocation%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Total Cost:</b></font></td><td><font size="-1"><%=studentCost%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Cost Details:</b></font></td><td><font size="-1"><%=studentCostExplaination%></font></td></tr>
	<tr><td valign="top"><font size="-1"><b>Details:</b></font></td><td><font size="-1"><%=details%></font></td></tr>
	<tr>
		<td class="button"><a class="button" href="/hr_si/opportunities.jsp">Back</a></td>
		<td>&nbsp;</td>
	</tr>
<%=box.printBottom()%>
<!-- OKAY, NO MORE OF THIS CONTENT NONSENSE!!! -->
<%@ include file="/hr_si/homePageFooter.jspf" %>