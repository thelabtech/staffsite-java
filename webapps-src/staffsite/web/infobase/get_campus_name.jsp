<%@ page import="org.alt60m.servlet.*, java.util.*" %>

<% String pageTitle="Add Ministry Location to " + request.getParameter("ministry"); %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<SCRIPT LANGUAGE="JavaScript">
<!--
function verifyInput() {
	var returnVal = true;
	for(var i=0; i<verifyInput.arguments.length; i++) {
		returnVal = (returnVal && ((verifyInput.arguments[i].value != null) && (verifyInput.arguments[i].value.length != 0)));
	}
	return returnVal;
}

function noncccminVerify() {
	var isValid = true;
	isValid = verifyInput(document.addCampusToMinForm.partialName);
	if(!isValid) {
		alert("You must provide part of a Ministry Location's name");
	}
	return isValid;
}
// -->
</SCRIPT>
	<br>
	<table <%=tableCenterL%> border=0 cellspacing=2 cellpadding=5>
		<form method="post" name="addCampusToMinForm" action="/servlet/InfoBaseController" onSubmit="return noncccminVerify()">
		    <input type=hidden name="action" value="addCampusToMin">
			<input type=hidden name="noncccminid" value="<%=request.getParameter("noncccminid")%>">
			<input type=hidden name="ministryName" value="<%=request.getParameter("ministry")%>">
			
			<tr> 
				<td align="right"><%=fontB%>Enter part of the Ministry Location's name:</font></td>
				<td colspan="2" nowrap> 
					<input type="text" name="partialName" value="" size="27" maxlength=100>
				</td>
			</tr>

			<tr><td colspan="2"><center><br><INPUT TYPE="SUBMIT" VALUE="Submit"></center></td></tr>
		</table>
	</form>
<BR>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>