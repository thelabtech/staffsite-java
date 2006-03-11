<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>

<%@ include file="/validate.js" %>
<SCRIPT LANGUAGE="JavaScript"><!--
	function validate() {

		failed = false;
		errorMessage = "You cannot continue for the following reasons:\n";

		emptyCheck(document.myForm.LegalFirstName,"You must enter the person's legal first name.");
		emptyCheck(document.myForm.LegalLastName,"You must enter the person's legal last name.");
		selectedCheck(document.myForm.Region,"You must specify the person's region.");
		selectedCheck(document.myForm.MaritalStatus,"You must specify the person's marital status.");
		emptyCheck(document.myForm.CurrentAddress,"You must enter the person's current address.");
		emptyCheck(document.myForm.CurrentCity,"You must enter the person's current city.");
		//emptyCheck(document.myForm.CurrentState,"You must enter the person's current state.");
		emptyCheck(document.myForm.CurrentZip,"You must enter the person's current zip code.");
		emptyCheck(document.myForm.CurrentPhone,"You must enter the person's current phone number.");
		emptyCheck(document.myForm.CurrentEmail,"You must enter the person's current e-mail address.");
		emptyCheck(document.myForm.ApplAccountNo,"You must enter the person's staff account number.");
		selectedCheck(document.myForm.Role,"You must specify the person's role.");

		if (document.myForm.ApplAccountNo.value=="child") {
			failed=false;
		}
		
		if (document.myForm.MaritalStatus.value=="M") {
			selectedCheck(document.myForm.Child,"You indicated that the applicant is married.  You must also indicate if the applicant has children that are going.");
		}

		/*
		if (!isDateMMDDYYYY(document.myForm.DateAddressGoodUntil.value)) {
			errorMessage = errorMessage + "\n" + "You need to enter dates in the form of mm/dd/yyyy";
			failed = true;
			document.myForm.DateAddressGoodUntil.focus();
		}
*/
		if (failed) {
			alert(errorMessage);
			return false;
		} else {
			return true;
		}
	}    
	//-->
</SCRIPT>

</HEAD>

<% String pageTitle = "Add a Site User"; %>

<%@ include file="wsnspheader.jspf" %>
<p> &nbsp;
<%=fontTextXL%>Add WSN Site User</font>
<p>

<form name="myForm" method="post" action="/servlet/WsnSpController" onSubmit="return validate()">
<input type="hidden" name="action" value="adminSave">
<!--  if no id then add person without surferid and notify us  -->


<p>
Please set the leader's role and verify the basic info for accuracy. 
<p>

<table width='100%' border='0'>
<tr valign='top'><td colspan='3'><td rowspan='6' valign='top'>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*First Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LegalFirstName" SIZE=40 MAXLENGTH=40 VALUE="<% if (h.get("LegalFirstName")!=null) {%><%=formHelp.value((String)h.get("LegalFirstName"))%><%}%>" ></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Last Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LegalLastName" SIZE=40 MAXLENGTH=40 VALUE="<% if (h.get("LegalLastName")!=null) {%><%=formHelp.value((String)h.get("LegalLastName"))%><%}%>" ></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Street</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentAddress" SIZE=40 MAXLENGTH=49 VALUE="<%=formHelp.value((String)h.get("CurrentAddress"))%>" ></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Street 2</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentAddress2" SIZE=40 MAXLENGTH=34 VALUE="<%=formHelp.value((String)h.get("CurrentAddress2"))%>" ></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*City, *State, *Zip</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentCity" SIZE=20 MAXLENGTH=34 VALUE="<%=formHelp.value((String)h.get("CurrentCity"))%>"><% selState.setName("CurrentState"); if (h.get("CurrentState")!=null){ selState.setCurrentValue((String)h.get("CurrentState"));}%><%=selState.print()%><INPUT TYPE=Text NAME="CurrentZip" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("CurrentZip"))%>" ></FONT></TD></tr>
<!-- <tr valign='top'><td><%=font%><b>&nbsp;&nbsp;At This Address Until</b></font></TD><td><%=font%><INPUT TYPE=Text NAME="DateAddressGoodUntil" onBlur="checkDate(this)" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("DateAddressGoodUntil"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr> -->
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Telephone</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentPhone" SIZE=15 MAXLENGTH=20 VALUE="<%=formHelp.value((String)h.get("CurrentPhone"))%>" ></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Email</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentEmail" SIZE=30 MAXLENGTH=50 VALUE="<% if (h.get("CurrentEmail")!=null) {%><%=formHelp.value((String)h.get("CurrentEmail"))%><%}%>" ></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Campus Region</b></FONT></TD><td><%=font%><% selRegion.setName("Region"); if (h.get("Region")!=null){ selRegion.setCurrentValue((String)h.get("Region"));} %><%=selRegion.print()%></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Is Staff?</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("IsStaff"); selBoolean.setCurrentValue("1");%><%=selBoolean.print()%></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Gender</b></FONT></TD><td><%=font%><% selGender.setName("Gender"); if (h.get("Gender")!=null){ selGender.setCurrentValue((String)h.get("Gender"));} %><%=selGender.print()%></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Marital Status</b></FONT></TD><td><%=font%><select name="MaritalStatus">
	<option value=""></option>
	<option value="S" <%=formHelp.select((String)h.get("MaritalStatus"),"S")%>>Single</option>
	<option value="M" <%=formHelp.select((String)h.get("MaritalStatus"),"M")%>>Married</option>
	<option value="D" <%=formHelp.select((String)h.get("MaritalStatus"),"D")%>>Divorced</option>
	<option value="P" <%=formHelp.select((String)h.get("MaritalStatus"),"P")%>>Separated</option>
	<option value="W" <%=formHelp.select((String)h.get("MaritalStatus"),"W")%>>Widowed</option></select></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;*Children Going?</b></FONT></TD><td><%=font%>
	<% selBoolean.setLabels("Yes","No"); selBoolean.setName("Child"); selBoolean.setCurrentValue("");%><%=selBoolean.print()%> <%=fontTextS%> *Required field for married couples.</TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Account Number (7 digits)<br></b>&nbsp;&nbsp;</FONT></TD><td><%=font%><input type=text name="ApplAccountNo" size="10" maxlength="10" value="<% if (h.get("ApplAccountNo")!=null) {%><%=h.get("ApplAccountNo")%><%}%>">(do NOT include the "S" for wives)</TD></tr>
<tr valign='top'><td><%=fontXL%><b>&nbsp;&nbsp;*Administrative Role</b></FONT></TD>
	<td><%=font%>
	<select name="Role">
		<option value=""></option>
		<option value="4">Project Coordinator</option>
		<option value="3">Project Director</option>
		<option value="2">Associate Project Director</option>
		<option value="7">Operations Project Director</option>
		<option value="5">WSN Tool User</option>
		</select>
	</TD></tr>
<%  
if (!h.get("Fk_StaffSiteProfileID").equals("null")){
	%>	
	<input type="hidden" name="Fk_StaffSiteProfileID" value="<%=h.get("Fk_StaffSiteProfileID")%>"><!-- Since they have to be surfers now this will never be null 12-20-01 -->
	<%}
else{%>
	<input type="hidden" name="Fk_StaffSiteProfileID" value="new">
	<%}%>

<INPUT type="hidden" NAME="Ssn" VALUE="<% if (h.get("Ssn")!=null) {%><%=formHelp.value((String)h.get("Ssn"))%><%}%>" >
<tr valign='top'><td colspan='1'></td>
	<td><input type='submit' value='Next'><BR>
</tr>
</TABLE>

<p>
<%=hr%>&nbsp; &nbsp; &nbsp; &nbsp; 

<p>
</form>
<%@ include file="wsnspfooter.jspf" %>

<%
//for (Enumeration e = h.keys(); e.hasMoreElements();) {
//	String k = (String) e.nextElement();
//	out.println("key: " + k + " value: " + h.get(k) + " <br>");
//}
%>


</HTML>