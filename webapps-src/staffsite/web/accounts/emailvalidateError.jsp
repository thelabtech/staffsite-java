<% 	String pageTitle = "Verify New Account"; %>
<%@ include file="/accounts/header.jspf" %>
<jsp:useBean id="box" class="org.alt60m.html.ThemeBox"/>
<%@ page import="org.alt60m.servlet.*" %>
<%
	//ActionResults ar = new ActionResults();
	String username = "", password = "", email="";
/*	try {
		ar = ActionResults.getActionResults(session); 
		username = (String)ar.getValue("username");
		email = (String)ar.getValue("email");
	} catch (Exception e) { e.printStackTrace();}*/
%>

<form name="emailValidateForm" method="post" action="/servlet/AccountController">

<input type="hidden" name="action" value="verifyEmail">

	<% 
	//box.setTitle("Email Validation Not Complete");
	box.setWidth("80%");
	//box.setAlign("left");
	box.setTableInside(false);%>
	<%=box.printTop()%>

		<TR><TD valign="top" align="left" colspan=2>
			<B>
			We could not verify your account using the link in the email you just clicked.<BR>
			Please enter the following information from that email:<BR>
			</B>
		</TD></TR>
		<TR><TD valign="top" align="right">Enter your Username: </Td><TD><input type=text name="username" size=20 value="<%=username%>"></TD></TR>
		<TR><TD valign="top" align="right">Enter your Auth Code:<br> <i>(the number after "auth=" in the link we sent you)</i> </Td><TD><input type=text name="auth" size=20></TD></TR>
		<TR><TD/><TD>
        <input type="hidden" value="/servlet/CRSRegister" name="url" checked>
        <input type=submit name=submit value="Submit">
		</TD></TR>

	<%=box.printBottom()%>
</form><br />
<%@ include file="/accounts/footer.jspf" %>
