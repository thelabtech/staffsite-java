<% String pageTitle = "Campus Crusade for Christ - User Account Password Management"; %>
<%@ include file="/general/header.jspf" %>
<%
	String username = "", password = "", loginPage = "", destinationPage = "";
	if(ar!=null) {
		username = (String)ar.getValue("username");
		loginPage = (String)ar.getValue("loginPage");
	}
	if (loginPage == null) loginPage = "/accounts/genericLogin.jsp";
%>
<form name="passwordChangeForm" action="/servlet/AccountController" method="post">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top">
<input type="hidden" name="action" value="changePassword">
<input type="hidden" name="loginPage" value="<%=loginPage%>">
<input type=text name="username" size=30 maxlength="80"<%= username == null? "" : " value=\""+username+"\""%>><br />
Username<br><span class="note">&nbsp;&nbsp;(usually your email address)</span><p>
<input type="password" name="password" size=30 maxlength="30"><br>
Old Password<p>
<input type="password" name="newPassword" size=30 maxlength="30"><br>
New Password<p>
<input type="password" name="newPasswordVerify" size=30 maxlength="30"><br>
Confirm New Password<br>
</td>
<td valign="top"><span class="note"><b><u>A Note About Passwords:</u></b><br>
Passwords
<div class="indent">
<nobr>- must be at least 8 characters long.</nobr><br>
<nobr>- must include upper and lower case letters</nobr><br>
</div>
</td>
</tr>
</table>
<center><input type="submit" class="button" value="Change Password"></center>
<hr>
</form>
<%@ include file="/general/footer.jspf" %>