<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>


<HTML>
<HEAD>
<TITLE>Campus Staff Site - Email Setup</TITLE>

<SCRIPT LANGUAGE="JavaScript">
<!--
var _newWin=null;
function openIt(_form)
{
  var _str = ""
  if(_form.SSOAction[0].checked) _str="Yes";
  if(_form.SSOAction[1].checked) _str="No";
  if(_form.SSOAction[2].checked) _str="Ignore";
  _newWin=window.open("","","");
  _newWin.document.open();
  var _s ="";
      _s+="<html><body>";
	  _s+="<form method='POST' name=f1 action='/servlet/StaffController?action=setupEmail'>";
	  _s+="<input type=hidden name='SSOAction' value="+_str+" size='1'>";
	  _s+="<input type=hidden name='password' value='"+document.submitForm.password.value+"'>";
	  _s+="<"+"script>";
	  _s+="document.f1.submit();";
	  _s+="</"+"script>";
	  _s+="</form>";
	  _s+="</body></html>";
  _newWin.document.write(_s);
}
// -->
</SCRIPT>

<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
</HEAD>
<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy"); 
	int curr_tab = 3;
%>
<%@ include file="/headersmall.jspf" %>
<%
	ActionResults results = ActionResults.getActionResults(session);
	String mode = results.getValue("mode");
%>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%"> <!--Whole page table-->
<% 
	if (mode.equals("initialsetup")) {
%>
    <TR>
        <TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB5%><B>Save Password</B></FONT></TD>
	</TR>
<%
	} else if (mode.equals("updatepassword")) {
%>
    <TR>
        <TD <%=bgcolorG%> VALIGN="BOTTOM" COLSPAN="3"><%=fontB5%><B>Update Password</B></FONT></TD>
	</TR>
<%
	} else if (mode.equals("badpassword")) {
%>
    <TR>
        <TD <%=bgcolorG%> VALIGN="BOTTOM" COLSPAN="3"><%=fontR5%><B>Incorrect Password</B></FONT></TD>
	</TR>
<%
	}
%>
	<TR>
		<TD <%=bgcolorB%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="1" BORDER="0"></TD>
	</TR>
	<TR><TD ALIGN="CENTER"><BR>
	<% box.setStyle(boxStyle);	//will set it for all the following boxes until we call it again%>
	<% box.setColor(color7);%>
	<% box.setWidth("90%");%>
	<% box.setBodyColor(color7);%>
	<% box.setTableInside(true);%>
	<% box.setSubSpace("1");%>
	<%=box.printTop()%>
	<form method="POST" action="/servlet/StaffController?action=setupEmail" NAME="submitForm">
<% 
	if (mode.equals("initialsetup")) {
%>
	<TR>
		<TD <%=bgcolorG%> COLSPAN="2">
		<%=fontB%>
		<BLOCKQUOTE>
		Would you like your Outlook e-mail password to be saved here? This will allow you to access your Outlook e-mail directly from the Campus Staff Site without logging in an additional time.
<%
	} else if (mode.equals("updatepassword")) {
%>
	<TR>
		<TD <%=bgcolorG%> COLSPAN="2">
		<%=fontB%>
		<BLOCKQUOTE>
		It appears that your Outlook email password has been changed. Would you like to update your password here, so that you don't have to log in separately to your email each time you come to it from the Campus Staff site?
<%
	} else if (mode.equals("badpassword")) {
%>
	<TR>
		<TD <%=bgcolorG%> COLSPAN="2">
		<%=fontB%>
		<BLOCKQUOTE>
		Sorry. Outlook Web Access does not recognize the password you have entered.  Please try again. If you continue to experience difficulties, please contact your regional tech representative.
<%
	}
%>
		</BLOCKQUOTE>
		</FONT>
		</TD>
	</TR>
	<TR>
		<TD <%=bgcolorG%>><input type="radio" value="Yes" checked name="SSOAction" tabindex="0"></TD>
		<TD <%=bgcolorG%>><%=fontB%>Yes.  Enter your Outlook e-mail password here (note: this password is case sensitive):
		<BR><input type="password" name="password" size="20"><BR>
		<%=fontR%>
<%
	if (mode.equals("updatepassword")) {
		out.print("If you are not aware of having changed your password, please contact your regional tech representative.");
	}
%>
		</FONT>
		</FONT></TD>
	</TR>
	<TR>
		<TD <%=bgcolorG%>><input type="radio" name="SSOAction" value="No" tabindex="1"></TD>
		<TD <%=bgcolorG%>><%=fontB%>No.  (You will have to type in your Outlook username and password every time you click the "my uscm mailbox" or "check my uscm email" link from the Campus Staff Site.)</FONT></TD>
	</TR>
	<TR>
		<TD <%=bgcolorG%>><input type="radio" name="SSOAction" value="Ignore" tabindex="2"></TD>
		<TD <%=bgcolorG%>><%=fontB%>Don't show me this option again</FONT></TD>
	</TR>
	<TR>
		<TD <%=bgcolorG%> ALIGN="RIGHT" COLSPAN="2"><A HREF="JavaScript: openIt(document.submitForm)" onMouseOver="document.nextbutton.src='/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/images/next_boff.gif';"><IMG NAME="nextbutton" SRC="/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
	</TR>
</form>
<%=box.printBottom()%>
	<BR>
	</TD></TR>
	<TR>
		<TD <%=bgcolorB%> COLSPAN="3"><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="1" BORDER="0"></TD>
	</TR>
</TABLE><!--whole page table close-->
<BR>
<%@ include file="/footer.jspf" %>
</HTML>		