<% String pageTitle = "Campus Crusade for Christ - User Account Password Management"; %>
<%@ include file="/general/header.jspf" %>
<%
	// Create object containing values passed from the controller.
	String username = "", loginPage = "";
	if(ar!=null){
		username = (String)ar.getValue("username");
		loginPage = (String)ar.getValue("loginPage");
	}
	if (loginPage == null) loginPage = "/accounts/genericLogin.jsp";
%>
<form name="registrationForm" action="/servlet/AccountController" method=post>
<input type="hidden" name="action" value="lookupQuestion">
<input type="hidden" name="loginPage" value="<%=loginPage%>">
Email Address: <input type=text name="username" size=30 maxlength="80"<% if(username != null && !username.equals("")) out.println(" value="+username); %>><br>
<br>
Enter your email address and we'll ask you the secret question you entered during registration. Once you answer that question, we will email you a new password.
<center><input type="submit" class="button" value="Look Up Question"></center>
<hr>
</form>
<%@ include file="/general/footer.jspf" %>