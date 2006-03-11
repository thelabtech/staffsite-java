<%@ page import="org.alt60m.security.dbio.importer.LoginResetAndEmail" %>
<%

	boolean failed = false;
	String err = "";
	LoginResetAndEmail lrae = new LoginResetAndEmail();
	String username = request.getParameter("userName")+"@uscm.org";
	String email = "";
	try {
		email = lrae.resetRequest(username);
	}
	catch (Exception e) {
		failed = true;
		if (e.getMessage()!=null) {
                    err = e.getMessage();
                } else {
                    err = e.toString();
                }
	}

if(failed && !err.startsWith("The username that you entered does not exist")) {
%>
<HTML>
<HEAD>
<TITLE>Error</TITLE>
</HEAD>
<STYLE>
<!--

body
{
	font-family: Arial;
	font-size: 10pt;
	color: #336699;
}
-->
</STYLE>
<BODY>
There was an error resetting your password.  Please contact <A HREF="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</A> for further assistance.  Include the following error(s) in your email:
<P>
<PRE>
-----------------------------------------------
<%= err %>
-----------------------------------------------
</PRE>
</BODY>
</HTML>
<%
}
else  if (failed && err.startsWith("The username that you entered does not exist"))  {
%>
<HTML>
<HEAD>
<TITLE>Error</TITLE>
</HEAD>
<STYLE>
<!--

body
{
	font-family: Arial;
	font-size: 10pt;
	color: #336699;
}
-->
</STYLE>
<BODY>
<%= err %>
<P>
<A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A>&nbsp;

</BODY>
</HTML>
<%
} else {
%>
<HTML>
<HEAD>
<TITLE>Success</TITLE>
</HEAD>
<STYLE>
<!--

body
{
	font-family: Arial;
	font-size: 10pt;
	color: #336699;
}
-->
</STYLE>
<BODY>
Your password change was successful!  Your new password was sent to <I><%= email %></I>.  <A HREF="javascript:window.close()">Click here</A> to close this window.
</BODY>
</HTML>
<%
}
%>