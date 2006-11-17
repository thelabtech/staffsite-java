<% String pageTitle = "Campus Crusade for Christ - User Account Password Management"; %>
<%@ include file="/general/header.jspf" %>
<%
	String username = "", passwordQuestion = "", loginPage = "";
	if(ar!=null){
		username = (String)ar.getValue("username");
		passwordQuestion = ar.getValue("passwordQuestion");
		loginPage = (String)ar.getValue("loginPage");
	}
	if (loginPage == null || loginPage.equals("")) loginPage = "/accounts/genericLogin.jsp";
	if (passwordQuestion == null || passwordQuestion.equals("")) { ar.putValue("errorString","An error occurred while trying to process your information. Please log-in again."); response.sendRedirect(loginPage); }
%>

<form name="registrationForm" action="/servlet/AccountController" method=post>
<input type="hidden" name="action" value="answerQuestion">
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="loginPage" value="<%=loginPage%>">
<input type="hidden" name="passwordQuestion" value="<%=passwordQuestion%>">
Your secret question was: <span class="note2"><%=passwordQuestion%></span>
<P>
Enter your Secret Answer:
<input type="password" name="passwordAnswer" size=30 maxlength="80"><br />
Enter your new password: 
<input type="password" name="newPassword" size=30 maxlength="30"><br/>
Retype your new password:
<input type="password" name="newPasswordVerify" size=30 maxlength="30"><br>
<br/>
<center><input type="submit" class="button" value="Set New Password"></center>
<span class="note"><b><u>A Note About Passwords:</u></b><br>
Passwords
<div class="indent">
<nobr>- must be at least 8 characters long.</nobr><br>
<nobr>- must include upper and lower case letters</nobr><br>
</div>
<hr />
</form>
<%@ include file="/general/footer.jspf" %>