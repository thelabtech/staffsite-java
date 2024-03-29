<% String pageTitle = "Campus Crusade for Christ - User Account Password Management"; %>
<%@ include file="/general/header.jspf" %>
<form name="passwordChangeForm" action="/servlet/AccountController" method="post">
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top">
<input type="hidden" name="action" value="changePassword">
<input type=text name="username" size=30 maxlength="80"><br />
Username<br /><span class="note">&nbsp;&nbsp;(usually your email address)</span><br /><br />
<input type="password" name="password" size=30 maxlength="30"><br />
Old Password<br /><br />
<input type="password" name="newPassword" size=30 maxlength="30"><br />
New Password<br /><br />
<input type="password" name="newPasswordVerify" size=30 maxlength="30"><br />
Confirm New Password<br />
</td>
<td valign="top"><span class="note"><b><u>A Note About Passwords:</u></b><br />
Passwords
<div class="indent">
<nobr>- must be at least 8 characters long.</nobr><br>
<nobr>- must include upper and lower case letters</nobr><br>
</div>
</td>
</tr>
</table>
<center><input type="submit" class="button" value="Change Password"></center>
<hr />
</form>
<%@ include file="/general/footer.jspf" %>