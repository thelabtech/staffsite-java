<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="states" class="org.alt60m.html.SelectState" />
<jsp:useBean id="countries"  class="org.alt60m.html.SelectCountry" />

<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);

String pageTitle="Update Ministry";
String mode = new String (request.getParameter("mode"));
String targetareaid = new String();
Hashtable h = new Hashtable();
String noncccminid = new String();
%>
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
	isValid = verifyInput(document.MinistryInfoForm.Ministry, document.MinistryInfoForm.WorkPhone);
	if(!isValid) {
		alert("You must provide the ministry's name and work phone number.");
	}
	return isValid;
}
// -->
</SCRIPT>

<br>
<center>
<% 
	box.setTitle("Ministry Info");	
	box.setColor(colorL);
	box.setWidth("400");
	box.setStyle("Classic");
%>
<%=box.printTop()%>
	<table align="center" border="0" cellspacing="0" cellpadding=3>
	<form method="post" name="MinistryInfoForm" action="/servlet/InfoBaseController" onSubmit="return noncccminVerify()">
	<input type="hidden" name="action" value="saveNonCCCMin">
	<input type="hidden" name="mode" value="<%=mode%>">
	<%
	if (mode.equals("update")) {
		h = ar.getHashtable("ministry");
		noncccminid = request.getParameter("noncccminid");
		%><input type=hidden name="noncccminid" value="<%=noncccminid%>"><%
	}
	if (mode.equals("add")) {
		//helper.create");
		targetareaid = request.getParameter("targetareaid");
		%>
		<input type=hidden name="targetareaid" value="<%=targetareaid%>">
		<input type=hidden name="justset" value="true">
		<%
	}	
	%>
		<tr <%=bgcolorL%>> 
			<td> 
			</td>
			<td>
				<%=fontB1%>(* = Required field)</font>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Ministry Name:</font></div>
			</td>
			<td>
				<input type="text" name="Ministry" value="<%=h.get("Ministry") != null ? h.get("Ministry") : ""%>" size="27" maxlength=100>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>First name of contact person:</font></div>
			</td>
			<td>
				<input type="text" name="FirstName" value="<%=h.get("FirstName") != null ? h.get("FirstName") : ""%>" size="27" maxlength=100>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Last name:</font></div>
			</td>
			<td>
				<input type="text" name="LastName" value="<%=h.get("LastName") != null ? h.get("LastName") : ""%>" size="27" maxlength=100>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Address 1:</font></div>
			</td>
			<td>
				<input type="text" name="Address1" value="<%=h.get("Address1") != null ? h.get("Address1") : ""%>" size="27" maxlength=35>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Address 2:</font></div>
			</td>
			<td>
				<input type="text" name="Address2" value="<%=h.get("Address2") != null ? h.get("Address2") : ""%>" size="27" maxlength=35>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>City:</font></div>
			</td>
			<td>
				<input type="text" name="City" value="<%=h.get("City") != null ? h.get("City") : ""%>" size="27" maxlength=30>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>State:</font></div>
			</td>
			<td>
				<%
				states.setName("State");
				if(h.get("State")!=null)states.setCurrentValue((String)h.get("State"));
				%>
				<%=states.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>ZIP:</font></div>
			</td>
			<td>
				<input type="text" name="Zip" value="<%=h.get("Zip") != null ? h.get("Zip") : ""%>" size="10" maxlength=10>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Country:</font></div>
			</td>
			<td>
				<%
				countries.setName("Country");
				if(h.get("Country")!=null)countries.setCurrentValue((String)h.get("Country"));
				%>
				<%=countries.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%> Home Phone:</font></div>
			</td>
			<td>
				<input type="text" name="HomePhone" value="<%=h.get("HomePhone") != null ? h.get("HomePhone") : ""%>" size="27" maxlength=24>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%> *Work Phone:(if same as home phone, enter home phone here also)</font></div>
			</td>
			<td>
				<input type="text" name="WorkPhone" value="<%=h.get("WorkPhone") != null ? h.get("WorkPhone") : ""%>" size="27" maxlength=24>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%> Pager:</font></div>
			</td>
			<td>
				<input type="text" name="Pager" value="<%=h.get("Pager") != null ? h.get("Pager") : ""%>" size="27" maxlength=24>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Fax:</font></div>
			</td>
			<td>
				<input type="text" name="Fax" size="27" value="<%=h.get("Fax") != null ? h.get("Fax") : ""%>" maxlength=24>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%><a href="mailto:<%=h.get("Email") != null ? h.get("Email") : ""%>">Email:</a></font></div>
			</td>
			<td>
				<input type="text" name="Email" size="27" value="<%=h.get("Email") != null ? h.get("Email") : ""%>" maxlength=50>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td>
				<div align="right"><a href="<%=h.get("Url") != null ? h.get("Url") : ""%>"><%=fontB%>Ministry Webpage:</font></a></div>
			</td>
			<td>
				<%=fontB1%>(ex: http://www.und.edu/ccc)</font><BR><input type="text" name="Url" size="27" value="<%=h.get("Url") != null ? h.get("Url") : ""%>" maxlength=255>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Note:<br>(max. of <br>255 <br>characters)</font></div>
			</td>
			<td>
				<textarea name="Note" cols="22" rows="5" wrap="VIRTUAL"><%=h.get("Note") != null ? h.get("Note") : ""%></textarea>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td colspan="2"> 
				<center><br><INPUT TYPE="SUBMIT" VALUE="Update"><!--<a href="javascript: document.MinistryInfoForm.submit()">Update ministry info</a>--></center>
			</td>
		</tr>
	</form>
	</table>
<%=box.printBottom()%>
</center>
<br>

<%@ include file="/infobase/ibfooter.jspf" %>
</html>