<% String pageTitle = "Campus Crusade for Christ - User Account Login"; %>
<%@ include file="/general/header.jspf" %>
<script language="JavaScript"><!--
	function submitForm(methodToCall, page) {
		var theform = document.loginForm;
		theform.action.value = methodToCall;
		theform.page.value = page;
		theform.submit();
	}
// --></script>
<%
	String username = "", password = "";
	if(ar!=null){
		username = (String)ar.getValue("username");
		password = (String)ar.getValue("password");
	}
	String loginPage = "/accounts/genericLogin.jsp";
	String destinationPage = "/accounts/thankYouForLoggingIn.jsp";
%>
<form name="loginForm" action="/servlet/AccountController" method=post>
<input type="hidden" name="action" value="login">
<input type="hidden" name="page" value="">
<input type="hidden" name="destinationPage" value=<%=destinationPage%>>
<input type=text name="username" size=30 maxlength="80"><br />
Email Address<br />
<input type="password" name="password" size=30 maxlength="30"><br />
Password
<center><a class="button" HREF="JavaScript: submitForm('authenticate',null)">Login</a></center>
<hr>
Click <a href="/servlet//AccountsController?action=goToPage&page=changePassword&destinationPage=<%=destinationPage%>">here</a> to <a href="/servlet//AccountsController?action=goToPage&page=changePassword&destinationPage=<%=destinationPage%>">change your password</a>.<br />Forgot your password? <a href="/servlet//AccountsController?action=goToPage&page=lookupQuestion&destinationPage=<%=destinationPage%>">Click here.</a><br />
<hr />
Haven't created your personal <%= clk ? "Conference Registration Tool" : "Campus Crusade" %> User Account yet?<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/accounts/register.jsp">Click here to register.</a><br />
<hr />
Your <%= clk ? "Conference Registration Tool" : "Campus Crusade for Christ"%> personal login account will be used to store your contact information (so you won't have to enter it more than once), to register for conferences and events, and to enter and track the status of online applications for summer projects, internships, or staff.<br />
<hr />
</form>
<%@ include file="/general/footer.jspf" %>