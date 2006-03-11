<% 	String pageTitle = "PLEASE CHECK YOUR EMAIL"; %>
<%@ include file="/accounts/header.jspf" %>
<jsp:useBean id="box" class="org.alt60m.html.ThemeBox"/>
<!-- CONTENT GOES HERE!!! -->
<%@ page import="org.alt60m.servlet.*" %>

<SCRIPT LANGUAGE="JavaScript">
<!--
	function validate(){
		if(document.emailValidateForm.newEmail.value == "") {
			alert("Please click the link in the email that was sent to you.  If your email address is incorrect, correct it here and click Go.");
			return false;
		} else {
			return true;
		}
	}
//-->
</SCRIPT>

<%
	//ActionResults ar = new ActionResults();
	String username = "", password = "", email="";
	try {
		ar = ActionResults.getActionResults(session); 
		username = (String)ar.getValue("username");
		email = (String)ar.getValue("email");

	} catch (Exception e) { e.printStackTrace();}

%>

<form name="emailValidateForm" method="post" action="/servlet/AccountController" onSubmit="return validate()">

<input type="hidden" name="action" value="postUpdateValidateEmail">

	<% 
	//box.setTitle("PLEASE CHECK YOUR EMAIL");
	box.setWidth("80%");
	//box.setAlign("left");
	box.setTableInside(false);%>
	<%=box.printTop()%>

		<TR><TD valign="top"><B>Your email address (<%=email%>) needs to be verified.</B></TD></TR>
		<TR><TD valign="top">&nbsp;</TD></TR>
		<TR><TD valign="top">
			<UL>
				<LI>An email has been sent to <B><%=email%></B>.  Please click link in email to verify.<BR><BR>
				<LI>If <B><%=email%></B> is invalid or misspelled, enter your correct email address and click "GO".  
				<input type=text name="newEmail" size=20><input type=submit name=submit value="Go">
			</UL>
		</TD></TR>



	<%=box.printBottom()%>

</form><br><br>

<!-- OKAY, NO MORE OF THIS CONTENT NONSENSE!!! -->
<%@ include file="/accounts/footer.jspf" %>



