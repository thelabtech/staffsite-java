<%@ page import="org.alt60m.servlet.*, java.util.Date" %>
<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<% String pageTitle = "Confirm Application Submission"; %>
<%@ include file="../../header.jspf" %>
<%
	// Make sure user is logged in
	//if (session.getValue("userLoggedIn") == null || session.getValue("userLoggedIn") == "" || session.isNew())
		//response.sendRedirect("/hr_ms/applicant/login.jsp");

	box.setTableInside(false);
	box.setWidth("100%");
%>

<form name="appForm" action="MSController" method="post">
<input type="hidden" name="as" value="student">
<input type="hidden" name="page">
<!-- Data Persistence Values -->
<input type="hidden" name="id" value="">
<!-- End persistence values -->
<center>
<% box.setTitle(pageTitle); %>
<%=box.printTop() %>
	<TR>
		<TD CLASS="app" VALIGN="TOP" colspan="2">
			Are you sure you're finished with the application? Once you have submitted your application, you will not be able to edit the information in your application (except for your personal information, your school information, and your reference information).
		</td>
	</tr>
		<td>
			<div WIDTH="33%" CLASS="button"><A CLASS="button" HREF="/servlet/MSController?action=goToPage&page=app1" CLASS="button">Return to the Application</A></div>
		</TD>
		<td>
			<div WIDTH="33%" CLASS="button"><A CLASS="button" HREF="/servlet/MSController?action=submitApplication&id=010010001081103235771062700002" CLASS="button">Submit Application</A></div>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
<%@ include file="../../footer.jspf" %>
