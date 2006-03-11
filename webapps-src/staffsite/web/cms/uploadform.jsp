<%@ page import="java.util.*" %>

<% 
	//Hashtable tub = (Hashtable)session.getValue("tub"); 
%>

<HTML>
<HEAD>
<TITLE>Submit a Resource</TITLE>
</HEAD>

<% String pageTitle = "Submit a resource"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>

<br><br><center>
<FORM NAME="fileForm" ACTION="/servlet/CmsController?action=rootUpload" METHOD="POST" ENCTYPE="multipart/form-data">
	<TABLE BORDER="0" CELLPADDING="3" WIDTH="90%" CELLSPACING="0">
		<TR>
			<TD WIDTH="20%"><%=fontB%>Submitted By</FONT></TD>
			<TD><%=fontB%><%=profile.get("FirstName")%> <%=profile.get("LastName")%></FONT></TD>
			<input type=hidden name=Submitter value="<%=profile.get("FirstName")%> <%=profile.get("LastName")%>">
		</TR>
		<tr>
			<TD><%=fontB%>File to Upload</FONT></TD>
			<td>
					<input type=hidden name="action" value="uploadForm">
					<INPUT TYPE="FILE" NAME="fileName" SIZE="40">
			</td>
		</tr>
		 <TR>
			<TD><%=fontB%>Author(s)</FONT></TD>
			<TD><INPUT NAME="Author" SIZE="50"></TD>
		</TR>
		<TR>
			<TD><%=fontB%>Contact Person Info</FONT></TD>
			<TD><INPUT NAME="Contact" SIZE="50"></TD>
		</TR>
		<TR>
			<TD><%=fontB%>Title</FONT></TD>
			<TD><INPUT NAME="Title" SIZE="50"></TD>
		</TR>
		<TR>
			<TD><%=fontB%>Keywords</FONT></TD>
			<TD><TEXTAREA NAME="Keywords" ROWS="2" COLS="50" WRAP="VIRTUAL"></TEXTAREA></TD>
		</TR>
		<TR>
			<TD><%=fontB%>Summary</FONT></TD>
			<TD><TEXTAREA NAME="Summary" ROWS="5" COLS="50" WRAP="VIRTUAL"></TEXTAREA></TD>
		</TR>
		<TR>
			<TD><%=fontB%>Message to<BR>Moderator</FONT></FONT></TD>
			<TD><TEXTAREA NAME="ModMsg" ROWS="5" COLS="50" WRAP="VIRTUAL"></TEXTAREA></TD>
		</TR>
		<TR>
			<TD align=left><A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/cms/images/back_bon.gif';" onMouseOut="document.backbutton.src='/cms/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/cms/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>        
			<TD align=right><A HREF="JavaScript: document.fileForm.submit()" onMouseOver="document.nextbutton.src='/cms/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/cms/images/next_boff.gif';"><IMG  NAME="nextbutton" SRC="/cms/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
		</TR>
	</TABLE>
</FORM>
</center>
<br><br>
<%@ include file="/cms/cmsfooter.jspf" %>
</BODY>
</HTML>