<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>
<HTML>
<HEAD>
<SCRIPT LANGUAGE="javascript">
<!--
function closeWindow() {
	window.close();
}
function validSubmit(form) {
	var login = form.accountno.value;
	var password = form.password.value;
	if((login.length > 0) && (password.length > 0))
		form.submit();
	else
		alert("Sorry, we are unable to access this tool without your PeopleSoft information. Please type in your PeopleSoft username and password then hit \"submit.\"");
}
// -->
</SCRIPT>
<TITLE>Campus Staff Site - Email Setup</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
</HEAD>
<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy");
	int curr_tab=3;
%>
<%@ include file="/headersmall.jspf" %>
<%
	ActionResults results = ActionResults.getActionResults(session);
%>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%"> <!--Whole page table-->
    <TR>
        <TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB5%><B>Save Password</B></FONT></TD>
	</TR>
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

	<form method="POST" action="/servlet/StaffController?action=setupPS" NAME="submitForm">
	<TR>
		<TD <%=bgcolorG%> COLSPAN="2">
		<%=fontB%>
		<BLOCKQUOTE>
		The page you are trying to access requires a PeopleSoft username and password.  This is the username and password that you use when you check your staff account information on the Staff Web (staff.ccci.org).  Please enter your PeopleSoft username and password here:
		</BLOCKQUOTE>
		<P>
		<TABLE ALIGN="CENTER" BORDER="0" CELLPADDING="0" CELLSPACING="0"><input type="hidden" name="SSOAction" value="Yes" tabindex="1">
		<TR><TD ALIGN="RIGHT"><%=fontB%>
		Username:&nbsp;</FONT></TD>
		<TD ALIGN="LEFT"><input type="text" name="accountno" size="20" value="<%
			if (results.getValue("accountno") != null) {
				out.print(results.getValue("accountno"));
			}
		
		%>"></TD>
		</TR><TR>
		<TD ALIGN="RIGHT"><%=fontB%>Password:&nbsp;</FONT></TD><TD ALIGN="LEFT">
		<input type="password" name="password" size="20">
		</TD></TR></TABLE>
		</FONT></TD>
	</TR>
	<TR>
		<TD <%=bgcolorG%> ALIGN="CENTER" COLSPAN="2"><A HREF="JavaScript: validSubmit(document.submitForm)" onMouseOver="document.nextbutton.src='/images/submit_bon.gif';" onMouseOut="document.nextbutton.src='/images/submit_boff.gif';"><IMG NAME="nextbutton" SRC="/images/submit_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
	</TR>
</form>
  <TR>
	  <TD COLSPAN="2"><%=fontB%><BLOCKQUOTE>These will be stored so that you won't have to enter them on this site in the future.
If you don't currently have a PeopleSoft user account and would like to request one, click <A HREF="/servlet/StaffController?action=loginStaffWeb&staffwebpath=ps/accounthelp.html" target='_blank'>here</A>.
<P>
If you have a PeopleSoft user account but don't remember your username or password, you can email <A HREF="mailto:desktopservices@ccci.org">Staff Services</A> (desktopservices@ccci.org), or call them at (407) 826-2948 to request help with this. If you email Staff Services, please include your full name, staff account number, and your desired password.</BLOCKQUOTE>
	<P ALIGN="CENTER">
	<TABLE WIDTH="100%" BORDER=0 CELLSPACING=0 CELLPADDING=0><TR><FORM ACTION="javascript: popupWindow('/help/help_general.jsp#box', 'StaffSiteHelp',
 'height=550,width=600,dependent=yes,scrollbars=yes,resizable');"><TD ALIGN="CENTER" WIDTH="50%">
	<INPUT TYPE="SUBMIT" VALUE="More Info..."></TD></FORM><FORM onSubmit="javascript: closeWindow();"><TD ALIGN="CENTER" WIDTH="50%"><INPUT TYPE="SUBMIT" VALUE="Close"></TD></FORM></TR></TABLE>
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