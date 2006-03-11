<HTML>
<HEAD>
<TITLE>Password reset form</TITLE>
<STYLE>
<!--

body
{
	font-family: Arial;
	font-size: 10pt;
	color: #336699;
}

td
{
	font-family: Arial;
	font-size: 10pt;
	color: #000000;
}

input
{
	border-style: solid;
	border-width: 1;
	border-color: #336699;
	background-color: #FFFFFF;
	color: #000000;
}
.button
{
	font-size: 8pt;
}
.bar
{
	font-family: Arial;
	font-size: 4pt;
	background-color: #336699;
}
-->
</STYLE>
</HEAD>
<BODY BGCOLOR="#FFFFFF">
To reset your password, simply give us your username.  A random password will be assigned to you and e-mailed to your USCM mailbox.
<P ALIGN="CENTER">
<FORM NAME="passwordResetForm" ACTION="performReset.jsp" METHOD="post">
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR><TD BGCOLOR="#000000">

<TABLE BORDER="0" CELLPADDING="3" CELLSPACING="1">
<TR><TD COLSPAN="2" CLASS="bar">&nbsp;</TD></TR>
<TR><TD BGCOLOR="#EFEFEF" ALIGN="RIGHT">User Name:</TD><TD BGCOLOR="#F4F4F4"><INPUT TYPE="text" NAME="userName" VALUE="firstname.lastname"></TD></TR>
<TR><TD BGCOLOR="#EFEFEF" ALIGN="CENTER" COLSPAN="2"><INPUT TYPE="submit" CLASS="button" VALUE="Reset password"></TD></TR>
<TR><TD COLSPAN="2" CLASS="bar">&nbsp;</TD></TR>

</TABLE>
</TD></TR></TABLE>
</FORM>
