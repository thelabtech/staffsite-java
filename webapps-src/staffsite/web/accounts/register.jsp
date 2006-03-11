<% String pageTitle = "Campus Crusade for Christ - User Account Creation"; %>
<%@ include file="/general/header.jspf" %>
<%
	String username = "", password = "", loginPage = "", destinationPage = "";
	if(ar!=null) {
		username = (String)ar.getValue("username");
		password = (String)ar.getValue("password");
		loginPage = (String)ar.getValue("loginPage");
		System.out.println("\n***** lp2: "+loginPage+"\n");
	}
	if (loginPage == null) loginPage = "/accounts/genericLogin.jsp";
	// 01-15-04 kl: Summer Projects required email field process for account creation page
/*	String pageRedirect = "registerUsername";
	String msEmailRequired = "false";
	if (loginPage.equals("/hr_ms/applicant/login.jsp")) msEmailRequired = "true";
	if (loginPage.equals("/hr_si/applicant/login.jsp")) msEmailRequired = "true";
	if (msEmailRequired.equals("true")) pageRedirect = "registerUsernameMS";*/
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function validate(){
		if(document.registrationForm.username.value != document.registrationForm.usernameVerify.value){
			alert("Your email addresses do not match.");
			return false;
		} else if(document.registrationForm.password.value != document.registrationForm.passwordVerify.value){
			alert("Your passwords do not match.");
			return false;
		} else{
			return true;
		}
	}
//-->
</SCRIPT>
<form name="registrationForm" action="/servlet/AccountController" method=post> <!--onSubmit="return validate()">-->
<table cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top">
<input type="hidden" name="action" value="register">
<input type="hidden" name="registerUsername" value="false">
<input type="hidden" name="registerUsernameMS" value="false">
<input type="hidden" name="loginPage" value="<%=loginPage%>">
<input type=text name="username" size=30 maxlength="80"<%= username == null? "" : " value=\""+username+"\""%>><br>
Email Address*<p>
<input type=text name="usernameVerify" size=30 maxlength="80"><br>
Confirm Email Address<p>
<input type="password" name="password" size=30 maxlength="30"><br>
Password<p>
<input type="password" name="passwordVerify" size=30 maxlength="30"><br>
Confirm Password<p>
<input type="text" name="passwordQuestion" size=30 maxlength="30"><br>
Secret Question<br><span class="note">(Please enter a question that ONLY YOU know the answer to. This question will be used to verify your identity if you forget your password.)</span><p>
<input type="password" name="passwordAnswer" size=30 maxlength="30"><br />
Answer to your Secret Question<br /><span class="note">(If you ever forget your password, you will need to be able to type the answer to the question above exactly as you type it here.)</span><p>
</td>
<td valign="top"><span class="note"><b><u>A Note About Passwords:</u></b><br>
Passwords
<div class="indent">
<nobr>- must be at least 8 characters long.</nobr><br>
<nobr>- cannot contain the word &quot;password.&quot;</nobr><br>
<nobr>- cannot contain your username.</nobr><br>
<nobr>- must have at least two of the following:</nobr>
<div class="indent">
<nobr>* Lower-case letters.</nobr><br>
<nobr>* Upper-case (capital) letters.</nobr><br>
<nobr>* Numbers.</nobr><br>
<nobr>* Special characters </nobr>
<div class="indent"><nobr>(e.g., punctuation like &quot;!@#$%^&amp;*?/,.\|&quot;)</nobr>
</div></div></div>
</td>
</tr>
</table>
<center><input type="submit" class="button" value="Create User Account"></center>
<hr>
Your <%= clk ? "Conference Registration Tool" : "Campus Crusade for Christ"%> personal login account 
will be used to store your contact information (so you won't have to enter it more than once), 
to register for conferences and events, and to enter and track the status of 
online applications for summer projects, internships, or staff.<br>
<hr>
<!--<hr />
<a name="note">*</a>Your email address will be your username. If you do not have an email address or you do not want to use your email address as your username or you share an email address with someone else who already has a CCC account, <a href="/servlet/AccountController?action=goToPage&page=<%//=pageRedirect%>&loginPage=<%//=java.net.URLEncoder.encode(loginPage)%>">click here.</a>
-->
</form>
<%@ include file="/general/footer.jspf" %>