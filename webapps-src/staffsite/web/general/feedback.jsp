<%
	String pageTitle = "Campus Crusade for Christ | Help Request";
	session.putValue("ignore_AR_Error","true");
%>
<jsp:useBean id="email" class="org.alt60m.util.SendMessage" />
<%@ page import="java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>
<%		String errorMessage = request.getParameter("errorMessage"); %>
<%		String system = request.getParameter("system"); %>
<html>
<head>
<title><%=pageTitle%></title>
<META HTTP-EQUIV="CacheControl" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="stylesheet" href="/general/branding.css" type="text/css">
<script language="JavaScript"><!--
function popupWindow(cUrl,cName,cFeatures) {
	var xWin = window.open(cUrl,cName,cFeatures);
}
// --></script>
</head>
<body>
<center>
<table width="600" border="0" cellpadding="10" cellspacing="5">
	<tr>
		<td colspan="2">
			<center><span class="pageheading"><%=pageTitle%></span></center>
			<% if ((errorMessage != null) && !(errorMessage.trim().equals(""))) out.println("<div class=\"warning\">"+errorMessage+"</div>"); %>
		</td>
	</tr>
	<tr>
		<td valign="top"><table cellpadding="0" cellspacing="0" border="0">
<% try {
	if(request.getParameter("send")==null) {
%>
<form name="registrationForm" action="/general/feedback.jsp" method=post>
<tr>
<td colspan=2>
So that we can assist you promptly and efficiently, please fill out this form in as much detail as possible. We will contact you via phone or email within 24 hours (or the next business day, if today is Friday, Saturday or Sunday) to respond to your inquiry.<br /><br />
<b>Before filling out this form:</b><br />
Please note that our web applications currently work best with Internet Explorer on Windows. If you are using a different browser or operating system, this might be why you are experiencing difficulties.  Please try with Internet Explorer and Windows, and then contact us if you continue to have problems.
</td>
</tr>
<tr>
<td valign="top">
<input type="hidden" name="remoteAddr" value="<%=request.getRemoteAddr()%>">
<input type="hidden" name="remoteHost" value="<%=request.getRemoteHost()%>">
<input type="hidden" name="userAgent" value="<%=request.getHeader("User-Agent")%>">
<input type="hidden" name="referralPage" value="<%=request.getHeader("Referrer")%>">
<input type="hidden" name="clientEmail" value="<%=request.getHeader("From")%>">

<br />
Your First Name:<br />
<input type="text" name="firstname" size=30 maxlength="80"><br /><br />
Your Last Name:<br />
<input type="text" name="lastname" size=30 maxlength="80"><br /><br />
Your Email Address:<br />(Please be sure to type your email address accurately. Otherwise, we will not be able to contact you due to an invalid email address.)<br>
<input type=text name="emailFrom" size=30 maxlength="80"><br /><br />
Subject:<br />
<input type=text name="subject" size=30 maxlength="80"><br /><br />
<!-- Type of Feedback<br />
<select name="feedbackType">
	<option value="General Comments">General Comments</option>
	<option value="General Question">General Questions</option>
	<option value="Help Request">Help Request</option>
	<option value="Broken Link Report">Broken Link Report</option>
	<option value="Bug Report">Bug Report</option>
	<option value="Other">Other</option>
</select><br /><br />
-->
Which system, if any, is this regarding?<br /><span class="note">(<i>e.g.</i> Conference Registration System, Summer Project Application, Personal Information Update Forms,  InfoBase / Success Criteria, <i>etc.</i>)</span><br />
<input type="text" name="regardingSystem" size=30 maxlength="80" value="<%=((system!=null)? system:"")%>"><br /><br />
If you were trying to register for a conference, which conference was it?<br /><span class="note">(Please note: this form is only for reporting technical difficulties with the conference registration website.  If you have questions about the conference itself, please call or email the contact person for that conference.)</span><br />
<input type="text" name="regardingConference" size=30 maxlength="80"><br /><br />
Which page is this regarding (if any)?<br />
<input type="text" name="regardingPage" size=30 maxlength="80"><br /><br />
Best phone number to reach you at?<br />
<input type="text" name="phoneNumber" size=30 maxlength="80">
</td>
<td valign="top">
<!--<% if ((system!=null)&&(system.equals("Conference Registration System"))) {%>
	Which conference are you trying to register for? (Please be specific, as many of our conferences occur in multiple locations simultaneously)<br>
	<input type="text" name="regardingConference" size=30 maxlength="80" value="<%=((system!=null)? system:"")%>"><br /><br />
<% } %>-->
<br />
If you are reporting an error or letting us know that something isn't working correctly,  where were you on the site and what were you trying to do?<br>
<textarea rows="5" cols="60" name="doing"></textarea><br><br>
If you were filling out a form, what was the specific information that you entered into the blanks?
<textarea rows="5" cols="60" name="forms"></textarea><br><br>
Please copy any error message on the page and paste it here:
<textarea rows="20" cols="60" name="errormessage"></textarea><br><br>
Please tell us about any circumstances that may have influenced this problem, and how the problem can be re-created:
<textarea rows="5" cols="60" name="reproduce"></textarea><br><br>
If you have additional questions or comments, please type them here:<br>
<textarea rows="5" cols="60" name="comments"></textarea>
</td>
</tr>
<tr>
<td colspan="2"><center><input type="submit" class="button" name="send" value="Submit"></center></td>
</tr>
</form>
<%
	} else {
		if ((request.getParameter("emailFrom") == null) || (request.getParameter("emailFrom").trim().equals("")))
			throw new javax.mail.internet.AddressException();
		try { javax.mail.internet.InternetAddress.parse(request.getParameter("emailFrom")); }
		// in order to use parsing that more closely conforms to RFC822 rules, use the following instead
		// javax.mail.internet.InternetAddress.parse(request.getParameter("emailFrom"), true);
		catch (javax.mail.internet.AddressException ae) {
			response.sendRedirect("/general/feedback.jsp?errorMessage=We detected that the email address you entered was not valid. In order to reduce the possibilty and frequency of prank email and spam, we require a valid email address to send your feedback.");
			return;
		} 
		String body = //"This message was generated from user data via web-based feedback form."+
			(new SimpleDateFormat("'\nMessage generated on' MMMM d yyyy, 'at' h:mm:ss a.")).format(new Date())+
			//"\n\n-------------------- Details --------------------"+
			"\n\nThis message was initiated by: "+request.getParameter("firstname")+" "+request.getParameter("lastname")+
			//"\nThe user specified their email address as: "+request.getParameter("emailFrom")+
			"\nThe user specified their phone number as: "+request.getParameter("phoneNumber")+
			//"\nSubject: "+request.getParameter("subject")+
			//"\nType of feedback: "+request.getParameter("feedbackType")+
			"\n\nSystem this message applies to: "+request.getParameter("regardingSystem")+
			"\n\nPage this message is regarding: "+request.getParameter("regardingPage")+
			"\n\n-------------------- User Comments --------------------"+
			"\n\nRegistering for conference:"+request.getParameter("regardingConference")+
			"\n\nWhat they were doing:"+request.getParameter("doing")+
			"\n\nInfo inputted to form:"+request.getParameter("forms")+
			"\n\nError message:"+request.getParameter("errormessage")+
			"\n\nSteps to reproduce:"+request.getParameter("reproduce")+
			"\n\nComments:"+request.getParameter("comments")+
			"\n\n-------------------- Technical Info --------------------"+
			"\n(This info is automatically generated, if available)\n"+
			"\nremoteAddr: "+request.getRemoteAddr()+
			"\nremoteHost: "+request.getRemoteHost()+
			"\nuserAgent: "+request.getHeader("User-Agent")+
			"\nreferralPage: "+request.getHeader("Referrer")+
			"\nclientEmail: "+request.getHeader("From");
		email.setTo("help@campuscrusadeforchrist.com");
		email.setFrom(request.getParameter("emailFrom"));
		email.setSubject(/*"Feedback / Help Form: "+*/request.getParameter("subject"));
		email.setBody(body);
		email.send();
		%>
		<tr><td>
		<center>
			Thank you for your feedback. Your comments were sent successfully and will be considered promptly.
		</center>
		<%
	}
} catch(Exception e) {
	e.printStackTrace();
	response.sendRedirect("/general/feedback.jsp?errorMessage=There was an error processing your request, and your feedback was *not* sent. We apologize for the inconvenience.");
	return;
}
%>
</table>
<hr>
</form>
<%@ include file="footer.jspf" %>