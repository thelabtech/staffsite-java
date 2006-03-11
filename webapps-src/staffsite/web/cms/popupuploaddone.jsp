<%@ page import="java.util.*,org.alt60m.servlet.*" %>

<%
	Hashtable tub = (Hashtable)session.getValue("tub");
%>

<HTML>
<HEAD>
<TITLE>Submit a Resource</TITLE>
<script language="JavaScript"><!--
function supressError() {
    return true;
}

function goBrowse(){ 
    window.onerror = supressError;
	<%
		try {
			if (tub.get("View")!=null) {
				out.println("opener.window.location.href = '"+(String)tub.get("View")+"'");
			} else {
				out.println("opener.location.reload();");
			}
		} catch (NullPointerException e) {
			out.println("opener.location.reload();");
		}
	%>
    setTimeout('self.close()',1000);
}
//--></script>

</HEAD>

<% String pageTitle = "Submit a resource"; %>
<%@ include file="/cms/popupheader.jspf"%>

<center>

<FORM NAME="closer" ACTION="" METHOD="POST">
	<TABLE BORDER="0" CELLPADDING="3" WIDTH="90%" CELLSPACING="0">
		<tr>
			<TD colspan=2><%=fontL%><B>Your file has been successfully uploaded.</B></FONT><br><br></TD>
		</tr>
		<TR>
			<TD WIDTH="20%"><%=font%>Submitted By</FONT></TD>
			<TD><%=font%><%=profile.get("FirstName")%> <%=profile.get("LastName")%></FONT></TD>
		</TR>
		 <TR>
			<TD><%=font%>Author(s)</FONT></TD>
			<td><%=font%><%=tub.get("Author")%></td>
		</TR>
		<TR>
			<TD><%=font%>Title</FONT></TD>
			<td><%=font%><%=tub.get("Title")%></td>
		</TR>
		<TR>
			<TD><%=font%>Keywords</FONT></TD>
			<td><%=font%><%=tub.get("Keywords")%></td>
		</TR>
		<TR>
			<TD><%=font%>Summary</FONT></TD>
			<td><%=font%><%=tub.get("Summary")%></td>
		</TR>
		<TR>
			<TD><%=font%>Message to<BR>Moderator</FONT></FONT></TD>
			<td><%=font%><%=tub.get("ModMsg")%></td>
		</TR>
		<TR>
			<td></td>
			<TD align=right>
				<A HREF="JavaScript:goBrowse();"  onMouseOver="document.closebutton.src='/images/close_bon.gif';" onMouseOut="document.closebutton.src='/images/close_boff.gif';"><IMG  NAME="closebutton" SRC="/images/close_boff.gif" BORDER="0" ALIGN="TOP"></A>
				</A>
			</TD>
		</TR>
	</TABLE>
</FORM>
</center>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</BODY>
</HTML>