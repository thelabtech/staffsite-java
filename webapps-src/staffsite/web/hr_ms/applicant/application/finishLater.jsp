<%
	// NOTE: This page does not include "header.jspf" because we don't want all the automatic menus, etc.
	// It does inlcude the ../../header although
%>
<% String pageTitle = "Application Saved!"; %>
<%
	// Make sure user is logged in
	if (session.getValue("userLoggedIn") == null || session.getValue("userLoggedIn") == "" || session.isNew())
		response.sendRedirect("/hr_ms/applicant/login.jsp");
%>
<%@ include file="../../header.jspf" %>
<input type="hidden" name="action" value="save">
	<% box.setTitle("Finish Later");%>
	<% box.setWidth("70%");%>
	<CENTER>
	<%=box.printTop()%>
	<BR>
	All the information you have entered has been saved.<BR>
	Please return later at a time convenient for you to finish your application.<BR>
	<P>
	<CENTER><A CLASS="BUTTON" HREF="/servlet/MSController?action=appFormEdit">Return to Application</A> <A CLASS="BUTTON" HREF="/servlet/MSController?action=ssmUserLogout">Logout</A></CENTER>
	<BR>
	&nbsp;
	<%=box.printBottom()%>
<%@ include file="../../footer.jspf" %>
</BODY>
</HTML>