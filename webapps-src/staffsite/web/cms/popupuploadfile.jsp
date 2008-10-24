<%@ page import="java.util.*" %>
<jsp:useBean id="language" class="org.alt60m.html.SelectLanguage" />
<% 
	Hashtable tub = (Hashtable)session.getValue("tub");
%>

<HTML>
<HEAD>
<TITLE>Submit a Resource</TITLE>
<%@ include file="/validate.js"%>
<SCRIPT LANGUAGE="JavaScript"><!--
function validSubmit(form) {
	if(validate(form))
		document.fileForm.submit();
}
 
function validate() {
	failed = false;
	errorMessage = "You didn't enter the following required fields:\n"

		emptyCheck(document.fileForm.fileName,"A file to be uploaded.");
		emptyCheck(document.fileForm.Author,"Author.");
		emptyCheck(document.fileForm.Contact,"Contact Person Information.");
		emptyCheck(document.fileForm.Title,"Title.");
		emptyCheck(document.fileForm.Keywords,"Keywords.");
		emptyCheck(document.fileForm.Summary,"Summary.");

		if (failed) {
			alert(errorMessage);
			return false;
		} else {
			return true;
		}
	}

	function openWin(input){ 
		if(input == 'upload'){
			window.open("/cms/submitresource.jsp#info","SubmitAResource","resizable=no,scrollbars=yes,width=400,height=300,top=100,left=100");
		}
	}
 -->
</script>
</HEAD>

<% String pageTitle = "Submit a resource"; %>
<%@ include file="/cms/popupheader.jspf"%>

<center>
<FORM NAME="fileForm" ACTION="/servlet/CmsController?action=popupUpload" METHOD="POST" ENCTYPE="multipart/form-data" onSubmit="return validate()">
	<input type=hidden name="catId" value="<%=tub.get("CatId")%>">
	<input type=hidden name="action" value="uploadForm">
	<input type=hidden name="submitType" value="uploadFile">
	<TABLE BORDER="0" CELLPADDING="3" WIDTH="90%" CELLSPACING="0">
		<TR>
			<TD WIDTH="20%"><%=fontB%>Submitted By</FONT></TD>
			<TD><%=fontB%><%=profile.get("FirstName")%> <%=profile.get("LastName")%></FONT></TD>
			<input type=hidden name=Submitter value="<%=profile.get("FirstName")%> <%=profile.get("LastName")%>">
		</TR>
		<TR>
			<TD><%=fontB%>Resource to Upload:</FONT></TD>
			<TD><INPUT TYPE="FILE" NAME=fileName SIZE="40"><br></TD>
		</TR>
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
			<TD><TEXTAREA NAME="ModMsg" ROWS="3" COLS="50" WRAP="VIRTUAL"></TEXTAREA></TD>
		</TR>
		<TR>
			<TD><%=fontB%>Language</FONT></TD>
			<TD>
				<%
				language.setName("Language");
				%>
				<%=language.print()%>
			</TD>
		</TR>
		<TR>
			<td></td>
			<TD align=right>
				<a href="JavaScript: openWin('upload');"  onMouseOver="document.helpbutton.src='/images/help_bon.gif';" onMouseOut="document.helpbutton.src='/images/help_boff.gif';"><IMG NAME="helpbutton" SRC="/images/help_boff.gif" BORDER="0" ALIGN="TOP"></A>
				<a href="JavaScript: if(validate())document.fileForm.submit();" onMouseOver="document.addbutton.src='/images/add_bon.gif';" onMouseOut="document.addbutton.src='/images/add_boff.gif';"><IMG NAME="addbutton" SRC="/images/add_boff.gif" BORDER="0" ALIGN="TOP"></A>
			</TD>
		</TR>
	</TABLE>
</FORM>
</center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>