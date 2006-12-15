<%@ page import="org.alt60m.servlet.*" %>
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />
<jsp:useBean id="states" class="org.alt60m.html.SelectState" />
<jsp:useBean id="countries"  class="org.alt60m.html.SelectCountry" />
<jsp:useBean id="lanes" class="org.alt60m.html.SelectLane" />
<%
ActionResults ar = ActionResults.getActionResults(session);

String val = ar.getValue("admin");
boolean admin = (val != null && val.equalsIgnoreCase("true")) ? true : false;

%>

<% String pageTitle="Proposal for a New Team"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<SCRIPT LANGUAGE="JavaScript">
<!--
function verifyInput() {
	var returnVal = true;
	for(var i=0; i<verifyInput.arguments.length; i++) {
		returnVal = (returnVal && ((verifyInput.arguments[i].value != null) && (verifyInput.arguments[i].value.length != 0)));
	}
	return returnVal;
}

function teamVerify() {
	var isValid = true;
	isValid = verifyInput(document.TeamInfoForm.Name, document.TeamInfoForm.Lane, document.TeamInfoForm.Region, document.TeamInfoForm.Country);
	if(!isValid) {
		alert("You must provide the team name, lane, region, and country.");
	}
	return isValid;
}
// -->
</SCRIPT>

<%@ include file="/infobase/ibheader.jspf" %>

<br>

<!-- Team Info table -->
<table width="75%" border="0" cellspacing="0" cellpadding=3 align=center <%=bgcolorL%>>
	<form method="post"  name="TeamInfoForm" action="/servlet/InfoBaseController" onSubmit="return teamVerify()">
	<input type=hidden name="action" value="submitNewLocalLevelRequest">
	<input type="hidden" name="to" value="Yvonne.Rivera@uscm.org">
	<input type="hidden" name="subject" value="New Team Proposal">
	<input type="hidden" name="admin" value="<%=admin%>">
		<tr <%=bgcolorB%>><td colspan="2"><%=fontW3%><b>Team Info:</b></font></td></tr>
		<tr <%=bgcolorL%>> 
			<td colspan="2"><%=fontText%>&nbsp;
<%= !admin		? 
				"This form will be submitted to an administrator who will email you when the team has been added to the InfoBase."
				:
				"<B>Notice to Administrator</B>: <font color=red>Immediately</font> after submitting this form, the new team will be available."
%>
			</font>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td>&nbsp; 
			</td>
			<td>
				<%=fontB1%>(* = Required field)</font>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Name:</font></div>
			</td>
			<td>
				<input type="text" name="Name" size="27" maxlength=100>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Lane:</font></div>
			</td>
			<td>
				<% lanes.setName("Lane"); %>
				<%=lanes.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Region:</font></div>
			</td>
			<td>
				<% regions.setName("Region"); %>
				<%=regions.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Address 1:</font></div>
			</td>
			<td>
				<input type="text" name="Address1" size="27" maxlength=35>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Address 2:</font></div>
			</td>
			<td>
				<input type="text" name="Address2" size="27" maxlength=35>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>City:</font></div>
			</td>
			<td>
				<input type="text" name="City" size="27" maxlength=30>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>State:</font></div>
			</td>
			<td>
				<% states.setName("State"); %>
				<%=states.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>ZIP:</font></div>
			</td>
			<td>
				<input type="text" name="Zip" size="10" maxlength=10>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Country:</font></div>
			</td>
			<td>
				<% countries.setName("Country"); %>
				<%=countries.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Phone:</font></div>
			</td>
			<td>
				<input type="text" name="Phone" size="27" maxlength=24>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Fax:</font></div>
			</td>
			<td>
				<input type="text" name="Fax" size="27" maxlength=24>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Email:</font></div>
			</td>
			<td>
				<input type="text" name="Email" size="27" maxlength=50>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td>
				<div align="right"><%=fontB%>CCC Webpage:</font></div>
			</td>
			<td>
				<%=fontB1%>(ex: http://www.und.edu/ccc)</font><BR><input type="text" name="Url" size="27" maxlength=255>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Is this team Active? </font></div>
			</td>
			<td><%=fontB%>
				<input type="radio" name="IsActive" value="TRUE" checked>Yes 
				<input type="radio" name="IsActive" value="FALSE">No
				</font>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Note:<br>(max. of <br>255 <br>characters)</font></div>
			</td>
			<td>
				<textarea name="Note" cols="22" rows="5" wrap="VIRTUAL"></textarea>
			</td>
		</tr>
<%
if(!admin){
%>
	<tr <%=bgcolorL%>> 
		<td>
			<div align="right"><%=fontB%>*Your email address:</a></font></div>
		</td>
		<td>
			<input type="text" name="from" size="27" maxlength=50>
		</td>
	</tr>
<%
} else {
%>
	<input type="hidden" name="from" value="n/a">
<%
}
%>
	<tr>
		<td>&nbsp;</td>
		<td><input type="submit" value="<%=admin?"Create New Team" :"Submit Proposal"%>"></td>
	</tr>


</table>
</form>


<%@ include file="/infobase/ibfooter.jspf" %>
</html>