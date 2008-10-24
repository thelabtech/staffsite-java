<%@ page import="java.util.*" %>
<% 
	Hashtable tub = (Hashtable)session.getValue("tub");
%>

<HTML>
<HEAD>
<TITLE>Swap a Resource</TITLE>
<%@ include file="/validate.js"%>
<SCRIPT LANGUAGE="JavaScript"><!--
	function validate() {
		failed = false;
		errorMessage = "You didn't enter the following required fields:\n"

		emptyCheck(document.fileForm.fileName,"A file.");

		if (failed) {
			alert(errorMessage);
			return false;
		} else {
			return true;
		}
	}   
	//-->
</script>
</HEAD>

<%@ include file="/cms/popupheader.jspf"%>
<br><br>
<%=font%>&nbsp;&nbsp;Select the new file you would like to upload as this resource.</font><br>
<center>
<FORM NAME="fileForm" ACTION="/servlet/CmsController?action=replaceResource" METHOD="POST" ENCTYPE="multipart/form-data"  onSubmit="return validate()">
	<input type=hidden name="id" value="<%=tub.get("CmsFileID")%>">
	<input type=hidden name="catReturnTo" value="<%=tub.get("CatReturnTo")%>">
	<input type=hidden name=Submitter value="<%=profile.get("FirstName")%> <%=profile.get("LastName")%>">
	<TABLE BORDER="0" CELLPADDING="3" WIDTH="90%" CELLSPACING="0">
		<tr>
			<TD><%=fontB%>File to Upload</FONT></TD>
			<td>
				<input type=hidden name="action" value="replaceResource">
				<INPUT TYPE="FILE" NAME="fileName" SIZE="40">
			</td>
		</tr>
		<TR>
			<td></td>
			<TD align=right>
				<input type="submit" name="action" value="Add">
			</TD>
		</TR>
	</TABLE>
</FORM>
</center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>