<%@ include file="/style.jspf"%>

<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />
<jsp:useBean id="box" class="org.alt60m.html.Box"/>

<HTML>
<HEAD>
<TITLE>Campus Crusade Login Help</TITLE>

<SCRIPT LANGUAGE="JavaScript"><!--
function popupWindow(cUrl,cName,cFeatures) {
	var xWin = window.open(cUrl,cName,cFeatures)
}
//--></SCRIPT>

</HEAD>
<body>

<center>

<table width="60%" border=0><tr>
	<tr><td rowspan=5>

		<TABLE WIDTH=276 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
		  <TR>
				<TD><IMG SRC="/images/spacer.gif" WIDTH=71 HEIGHT=1></TD>
				<TD><IMG SRC="/images/spacer.gif" WIDTH=49 HEIGHT=1></TD>
				<TD><IMG SRC="/images/spacer.gif" WIDTH=79 HEIGHT=1></TD>
				<TD><IMG SRC="/images/spacer.gif" WIDTH=4 HEIGHT=1></TD>
				<TD><IMG SRC="/images/spacer.gif" WIDTH=49 HEIGHT=1></TD>
				<TD><IMG SRC="/images/spacer.gif" WIDTH=24 HEIGHT=1></TD>
			</TR>
			<TR>
				<TD><IMG SRC="/images/login_01.gif" WIDTH=71 HEIGHT=100></TD>
				<TD COLSPAN=2><IMG SRC="/images/login_02.gif" WIDTH=128 HEIGHT=100></TD>
				<TD COLSPAN=3><IMG SRC="/images/login_03.gif" WIDTH=77 HEIGHT=100></TD>
			</TR>
		</TABLE>

</td><td rowspan=5> &nbsp; </td><td> &nbsp; </td></tr>
	<tr><td><p>

		<% String errorCode = (String)session.getValue("ErrorCode"); %>
		<% if (errorCode == null) errorCode = "unknown"; // default error %>
		
		<!-- No profile was found -->
		<% if (errorCode.equalsIgnoreCase("noprofile")) { %>
		
			<%=fontHLXL%><b>Access Denied</b></font><p>
			<%=fontXL%>
			The username you entered was not found on the staff site.<p>
			If you think you may have entered it incorrectly, <a href="JavaScript: history.go(-1)">try again</a>. 
			<BR><BR>Then, if you are unable to login, click <A HREF="JavaScript: popupWindow('/help/help_logging_in.jsp', 'loginhelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">here for help.</a></font>
		
		<!-- Bad password --> 
		<% } else if (errorCode.equalsIgnoreCase("notauthorized")) { %>
			<%=fontHLXL%><b>Access Denied</b></font><p>
			<%=fontXL%>
			The username and password you entered are not authorized to access the site.<p>
			If you think you may have entered them incorrectly, <a href="/servlet/StaffController">try again</a>. 
			<BR><BR>Then, if you are unable to login, click <A HREF="JavaScript: popupWindow('/help/help_logging_in.jsp', 'loginhelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">here for help.</a></font>

		<!-- Not Verified --> 
		<% } else if (errorCode.equalsIgnoreCase("gcxnotverified")) { %>
			<%=fontHLXL%><b>GCX Account Not Verified</b></font><p>
			<%=fontXL%>
			Your GCX account has not yet been verified.<p>
			<a href="/servlet/StaffController?action=verifyGCX">Verify GCX Account</a>. 
			<BR><BR>Then, if you are unable to login, click <A HREF="JavaScript: popupWindow('/help/help_logging_in.jsp', 'loginhelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">here for help.</a></font>
		
		<% } else if (errorCode.equalsIgnoreCase("ssmUserAlreadyExists")) { %>
			<%=fontHLXL%><b>Your GCX account name is in conflict with an existing staffsite account</b></font><p>
			<%=fontXL%>
			<%=(String)session.getValue("ErrorMessage") %>
			<br><br>Please email <a href="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</a> for assistance with this problem.
		
		<!-- Some other kind of error -->
		<% } else { %>
			<%=fontHLXL%><b>Site Unavailable</b></font><p>
			<%=fontXL%>
			Sorry, the site appears to be unavailable at the moment.<p>
			Please <a href="JavaScript: history.go(-1)">try again</a> in a moment. 
			<BR><BR>Click <A HREF="JavaScript: popupWindow('/help/help_logging_in.jsp', 'loginhelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">here for help.</a></font>

		<% } %>			
	</td></tr>
</table>
<P>
<br><br>

</center>

</BODY>
</HTML>
