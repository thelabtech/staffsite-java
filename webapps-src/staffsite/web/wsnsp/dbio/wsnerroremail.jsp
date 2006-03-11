<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Error Email"; %>

<%@ include file="wsnspheader.jspf" %>

<p>
<table width='100%' border='0'>
<TR VALIGN=TOP>
	<td> &nbsp; </td>
	<td> <%=fontTextXL%>Error</font> </TD>
	<td> &nbsp; </td>

</tr>
<TR VALIGN=TOP>
	<td>
		&nbsp;
	</TD>
	<td>
	<%=font%>There was an error. Your email was not sent.  One of the email addresses may have been invalid.  Hit the back button and make sure all address that the email is being sent to and being sent from are correct.</FONT>
	</td>
	<td>
		&nbsp;
	</td>
</tr>


</table>
<p> &nbsp;

<%@ include file="wsnspfooter.jspf" %>

</HTML>