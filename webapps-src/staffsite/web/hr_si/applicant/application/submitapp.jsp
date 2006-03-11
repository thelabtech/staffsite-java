<%
	// NOTE: This page does not include "header.jspf" because we don't want all the automatic menus, etc.
	// It does include the ../../header although
%>
<% String pageTitle = "Application Submitted!"; %>
<%
	// Make sure user is logged in
	if (session.getValue("userLoggedIn") == null || session.getValue("userLoggedIn") == "" || session.isNew())
		response.sendRedirect("/hr_ms/applicant/login.jsp");
%>
<%@ include file="../../header.jspf" %>
<input type="hidden" name="action" value="save">
	<% box.setTitle("Application Submitted");%>
	<% box.setWidth("70%");%>
	<CENTER>
	<%=box.printTop()%>
	<BR>
	<CENTER>Thank you for submitting your application.  It has been accepted for processing.<BR>
	<P>
	<CENTER><A CLASS="BUTTON" HREF="SIController?action=goToPage&page=apphome">Return to Application</A> <A CLASS="BUTTON" HREF="SIController?action=goToPage&page=login">Logout</A></CENTER>
	<BR>
	&nbsp;
	<%=box.printBottom()%>
<%@ include file="../../footer.jspf" %>
</BODY>
</HTML>