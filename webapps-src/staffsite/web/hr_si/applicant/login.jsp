<% 
	String pageTitle = "Apply4StintDotCom Login";
	if(request.getParameter("appType") != null && request.getParameter("appType").equals("impact")){
		pageTitle = "ImpactFellowship Login";
		session.putValue("ssurl", "/hr_si/themes/hr_si_impact.css");
		session.putValue("imgurl", "/hr_ms/images/impactheader.gif");
		session.putValue("hpurl", "http://put an url here");
		session.putValue("appType", "impact");
	}
%>
<script language="JavaScript"><!--
    var timeOutClockDisabled = 1;
	function submitForm(methodToCall, page) {
		var theform = document.loginForm;
		theform.action.value = methodToCall;
		theform.page.value = page;
		theform.submit();
	}
	function validate() {
	    if (document.loginForm.username.value == "") {
	    	alert("You must enter a Username.");
	    	return false;
	    } else {
	    	return true;
	    }
	}
// --></script>
<%@ include file="../header.jspf" %>
<%@ page import="org.alt60m.servlet.*" %>
<%
	// Create object containing values passed from the controller.
	ActionResults ar = new ActionResults();
	String username = "", password = "", errorMessage = "";
	try {
		ar = ActionResults.getActionResults(session); 
		username = (String)ar.getValue("username");
		password = (String)ar.getValue("password");
		errorMessage = (String)ar.getValue("errorMessage");
	} catch (Exception e) { }

	String destinationPage = "/servlet/SIController?action=afterLogin&page=apphome";
	String loginPage = "/hr_si/applicant/login.html";
	if(session.getValue("appType") != null)
		loginPage += "%2526appType=" + (String)session.getValue("appType");
	String registerURL = "/servlet/AccountController?action=goToPage&page=register&loginPage="+loginPage;
	String forgotPasswordURL = "/servlet/AccountController?action=goToPage&page=questionLookup&loginPage="+loginPage;
	String changePasswordURL = "/servlet/AccountController?action=goToPage&page=changePassword&loginPage="+loginPage;
%>
<form name="loginForm" method="post" action="/servlet/AccountController" onSubmit="return validate()">
<input type="hidden" name="action" value="authenticate">
<input type="hidden" name="page" value="">
<input type="hidden" name="destinationPage" value=<%=destinationPage%>>
<input type="hidden" name="loginPage" value=<%=loginPage%>>
<center>
	<% box.setTitle("Campus Crusade for Christ Campus Ministry Login");%>
	<% box.setWidth("70%");%>
	<% box.setTableInside(true);%>
	<%=box.printTop()%>
		<TR>
			<TD VALIGN="CENTER" width="145" BGCOLOR="#FFFFFF">
				<div align="center"><img src="/accounts/images/uamlogo.gif" width="127" height="293"></div>
			</TD>
			
			
			<!-- COMMENT THIS OUT WHEN APPLICATION IS CLOSED TO DISABLE LOGIN -->
			
			<td VALIGN="TOP">
				<% if (errorMessage != null)
					out.println("<span class=\"warning\">"+errorMessage+"</span><hr>");
				%>
				<center>For security reasons, please close your browser window<BR>when you are done working on your application.</center>
				<hr>
				Login to access your Internship application.<br><br>
				<INPUT type=text name="username" size=20<%= username == null? "" : " value=\""+username+"\""%>><br>
				Crusade Username<br><span class="small">(This is almost certainly your email address)</span><br>
				<br>
				<INPUT type=password name="password" size=20<%= password == null? "" : " value=\""+password+"\""%>><br>
				Password<br>
				<div class="button"><input type="submit" value="login"></div>
				<br>
				<br>
				<a href="<%=changePasswordURL%>">Click here</a> to change your password.
				<br>
				If you forgot your username or password, <A HREF="JavaScript: submitForm('goToPage','lookupQuestion')">click here.</A>
				<hr>
				Don't have an account? <A HREF="<%=registerURL%>">Click here to register for a new account.</A>
				<hr>
			</TD>
			
			<!-- ******************************************************************* -->
			
			
			<!-- ONLY HERE TO REPLACE THE LOGIN FORM WHILE THE APPLICATION IS CLOSED -->
			<!-- Comment this out when the application is open
			<TD VALIGN="TOP">
			<% if (errorMessage != null)
				out.println("<span class=\"warning\">"+errorMessage+"</span><hr>");
			%>
				<CENTER>
				<br>
				<B>Sorry!</b>
				<br><hr><br>
				The application is temporarily closed for maintenance.
				<br>
				<br>
				Please try again in a few hours.
				<br><br>
				<hr>
			</TD>
			-->
			<!-- ******************************************************************* -->
			
		</TR>
	<%=box.printBottom()%>
</center>
</form>
<script>
<!--
self.focus();
document.loginForm.username.focus()
//-->
</script>
<%@ include file="../footer.jspf" %>
</body>
</html>