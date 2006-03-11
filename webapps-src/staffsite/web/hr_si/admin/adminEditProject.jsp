<%@ page import="java.util.*,java.text.SimpleDateFormat, org.alt60m.servlet.*, org.alt60m.hr.si.model.dbio.*, org.alt60m.hr.si.servlet.dbio.*" %>
<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>
<jsp:useBean id="selAOA" class="org.alt60m.html.SelectAoA"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<%
	ActionResults ar = ActionResults.getActionResults(session);
	String SIProjectID = ar.getValue("SIProjectID");
	SIProject project = new SIProject(SIProjectID);
	String DATE_FORMAT = "MM/dd/yyyy";
%>

<% String highlightYellow = "style=\"background-color: #FFFF00\""; %>

<HTML>
<HEAD>
<TITLE>STINT / Internship Location Information</TITLE>

<%@ include file="/validate.js" %>
<SCRIPT LANGUAGE="JavaScript"><!--
	function validate() {

		failed = false;
		badDate = false;
		errorMessage = "You cannot continue for the following reasons:\n";
		badDateMessage = "\n\nRules for valid dates:\n\tDates must be in the form of mm/dd/yyyy.\n\tYears must be in the range from 1900 - 2099.";

		if (!isDateMMDDYYYY(document.myForm.StaffStartDate.value)) {
			errorMessage = errorMessage + "\nThe date you entered for Staff Start Date is not valid";
			failed = true;
			badDate = true;
			document.myForm.StaffStartDate.focus();
		}

		if (!isDateMMDDYYYY(document.myForm.StaffEndDate.value)) {
			errorMessage = errorMessage + "\nThe date you entered for Staff End Date is not valid";
			failed = true;
			badDate = true;
			document.myForm.StaffEndDate.focus();
		}

		if (!isDateMMDDYYYY(document.myForm.StudentStartDate.value)) {
			errorMessage = errorMessage + "\nThe date you entered for Student Start Date is not valid";
			failed = true;
			badDate = true;
			document.myForm.StudentStartDate.focus();
		}

		if (!isDateMMDDYYYY(document.myForm.StudentEndDate.value)) {
			errorMessage = errorMessage + "\nThe date you entered for Student End Date is not valid";
			failed = true;
			badDate = true;
			document.myForm.StudentEndDate.focus();
		}

		if (!isDateMMDDYYYY(document.myForm.DepartDateFromGateCity.value)) {
			errorMessage = errorMessage + "\nThe date you entered for Date of Departure from the US is not valid";
			failed = true;
			badDate = true;
			document.myForm.DepartDateFromGateCity.focus();
		}

		if (!isDateMMDDYYYY(document.myForm.ArrivalDateAtGatewayCity.value)) {
			errorMessage = errorMessage + "\nThe date you entered for Date of Return to the US is not valid";
			failed = true;
			badDate = true;
			document.myForm.ArrivalDateAtGatewayCity.focus();
		}

		if (failed) {
			if (badDate)
				errorMessage += badDateMessage;
			alert(errorMessage);
			return false;
		} else {
			return true;
		}
	}

	//-->
</SCRIPT>

</HEAD>

<% String pageTitle = "Project Information"; %>

<%@ include file="/hr_si/evaluator/sitoolheader.jspf" %>

<form name="myForm" method="post" action="/servlet/SIController" onSubmit="return validate()">
	<input type="hidden" name="SIProjectID" value="<%=project.getSIProjectID()%>"><!-- new if a totally new project, the number of the record if we are editing -->
	<input type="hidden" name="action" value="adminSaveProject">
	<input type="hidden" name="siYear" value="<%=SIUtil.CURRENT_SI_YEAR%>">
<p> 

<table width='100%' border='0'>
<TR><td colspan='2'><%=fontText%><b>Basic Location Information</b><br />(<span <%=highlightYellow%>>Yellow</span> background indicates text will be displayed publicly on websites.)</td>
<td colspan='2'>&nbsp;  </td>

<!-- ------------TOOL BOX---------- -->
<%@ include file="/hr_si/evaluator/sisidemenu.jspf"%>
</tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Project Name</b></FONT></TD><td><INPUT TYPE=Text NAME="Name" SIZE=30 MAXLENGTH=255 VALUE="<%=project.getName()%>" <%=highlightYellow%>></TD></tr>

<TR><td><%=font%><b>&nbsp;&nbsp;Location Type</b></font></TD><td><% String pt = project.getProjectType() == null? "-" : project.getProjectType(); %>
	<select NAME="ProjectType">
		<option value="n"<%=pt.equalsIgnoreCase("n")? " selected=\"selected\"":""%>>National (Non-Regionally-Assosciated) Internship</option>
		<option value="s"<%=pt.equalsIgnoreCase("s")? " selected=\"selected\"":""%>>Regionally-Assosciated STINT</option>
		<option value="i"<%=pt.equalsIgnoreCase("i")? " selected=\"selected\"":""%>>Regionally-Assosciated Internship</option>
		<option<%=pt.equals("-")? " selected=\"selected\"":""%> value="">Please select an option.</option>
	</select>
</td></tr>

<TR><td><%=font%><b>&nbsp;&nbsp;Staff Start Date</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="StaffStartDate" SIZE=12 MAXLENGTH=10 VALUE="<%=project.getStaffStartDate() == null? "" : new SimpleDateFormat(DATE_FORMAT).format(project.getStaffStartDate())%>" ></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Staff End Date</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="StaffEndDate" SIZE=12 MAXLENGTH=10 VALUE="<%=project.getStaffEndDate() == null? "" : new SimpleDateFormat(DATE_FORMAT).format(project.getStaffEndDate())%>" ></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Student Start Date</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="StudentStartDate" SIZE=12 MAXLENGTH=10 VALUE="<%=project.getStudentStartDate() == null? "" : new SimpleDateFormat(DATE_FORMAT).format(project.getStudentStartDate())%>" <%=highlightYellow%>></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Student End Date</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="StudentEndDate" SIZE=12 MAXLENGTH=10 VALUE="<%=project.getStudentEndDate() == null? "" : new SimpleDateFormat(DATE_FORMAT).format(project.getStudentEndDate())%>" <%=highlightYellow%>></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;City</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="City" SIZE=20 MAXLENGTH=255 VALUE="<%=formHelp.value(project.getCity())%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Country</b></FONT></TD><td><%=font%><% selCountry.setName("Country"); if (project.getCountry()!=null){ selCountry.setCurrentValue(project.getCountry());}%><%=selCountry.print()%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Display Location</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="DisplayLocation" SIZE=50 MAXLENGTH=255 VALUE="<%=formHelp.value(project.getDisplayLocation())%>" <%=highlightYellow%>></FONT><br /><%=fontTextS%><nobr>&nbsp;&nbsp;&nbsp;(ie. "Ocean City, NJ", "Middle East", etc.)</nobr></font></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Country Status</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Closed","Open"); selBoolean.setName("Secure"); selBoolean.setCurrentValue(project.getSecure());%><%=selBoolean.printBoolean()%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Sending Region</b></FONT></TD><td><%=font%><% selRegion.setName("PartnershipRegion"); if (project.getPartnershipRegion()!=null){ selRegion.setCurrentValue(project.getPartnershipRegion());} %><%=selRegion.print()%></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Only Accepting Students from Sending Region</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("PartnershipRegionOnly"); selBoolean.setCurrentValue(project.getPartnershipRegionOnly());%><%=selBoolean.printBoolean()%></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;AOA</b></FONT></TD><td><%=font%><% if (project.getAOA()!=null){ selAOA.setCurrentValue(project.getAOA());} %><% selAOA.setName("AOA");%><%=selAOA.print()%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Details</b></FONT></TD><td><%=font%><TEXTAREA NAME="Details" ROWS=4 COLS=30 <%=highlightYellow%>><%=project.getDetails() == null? "" : project.getDetails()%></TEXTAREA></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;History</b></FONT></TD><td><%=font%><TEXTAREA NAME="History" ROWS=4 COLS=30><%=formHelp.value(project.getHistory())%></TEXTAREA></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Scholarship Acct#</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="ScholarshipAccountNo" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value(project.getScholarshipAccountNo())%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Operating Acct#</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="OperatingAccountNo" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value(project.getOperatingAccountNo())%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Staff Cost</b></FONT></TD><td><%=font%>$<INPUT TYPE=Text NAME="StaffCost" SIZE=6 MAXLENGTH=5 VALUE="<%=formHelp.value(Integer.toString(project.getStaffCost()))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Intern Cost</b></FONT></TD><td><%=font%>$<INPUT TYPE=Text NAME="InternCost" SIZE=6 MAXLENGTH=5 VALUE="<%=formHelp.value(Integer.toString(project.getInternCost()))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Student Cost</b><br /><%=fontTextS%><nobr>&nbsp;&nbsp;&nbsp;(enter $0 if this is not yet determined)</nobr></font></FONT></TD><td><%=font%>$<INPUT TYPE=Text NAME="StudentCost" SIZE=6 MAXLENGTH=5 VALUE="<%=formHelp.value(Integer.toString(project.getStudentCost()))%>" <%=highlightYellow%>></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Student Cost Explanation</b></FONT></TD><td><%=font%><TEXTAREA NAME="StudentCostExplaination" ROWS=4 COLS=30 <%=highlightYellow%>><%=formHelp.value(project.getStudentCostExplaination())%></TEXTAREA></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;On Hold</b><br /><%=fontTextS%><nobr>&nbsp;&nbsp;&nbsp;(won't display publicly as a project option)</nobr></font></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("OnHold"); selBoolean.setCurrentValue(project.getOnHold());%><%=selBoolean.printBoolean()%></TD></tr>

<TR><td colspan='2'><%=fontText%><b>Travel Information</b></td></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;US City you are Departing From</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="DestinationGatewayCity" SIZE=20 MAXLENGTH=255 VALUE="<%=formHelp.value(project.getDestinationGatewayCity())%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Date of Departure from the US</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="DepartDateFromGateCity" SIZE=12 MAXLENGTH=255 VALUE="<%=project.getDepartDateFromGateCity() == null? "" : formHelp.value(new SimpleDateFormat(DATE_FORMAT).format(project.getDepartDateFromGateCity()))%>" ></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Int'l City you are Flying To</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LocationGatewayCity" SIZE=20 MAXLENGTH=255 VALUE="<%=formHelp.value(project.getLocationGatewayCity())%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Date of Return to the US</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="ArrivalDateAtGatewayCity" SIZE=12 MAXLENGTH=255 VALUE="<%=project.getArrivalDateAtGatewayCity() == null? "" : formHelp.value(new SimpleDateFormat(DATE_FORMAT).format(project.getArrivalDateAtGatewayCity()))%>" ></FONT></TD></tr>

<TR><td colspan='2'><%=fontText%><b>In Country Contact</b></td></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Name and Contact Info</b></FONT></TD><td><%=font%><TEXTAREA NAME="InCountryContact" ROWS=2 COLS=30><%=formHelp.value(project.getInCountryContact())%></TEXTAREA></FONT></TD></tr>

<TR><td colspan='2'><%=fontText%><b>Other Information</b></td></tr>
<!-- <TR><td><%=font%><b>&nbsp;&nbsp;CAPS fee paid</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("CAPSFeePaid"); selBoolean.setCurrentValue(project.getCAPSFeePaid());%><%=selBoolean.printBoolean()%></FONT></TD></tr> -->
<TR><td><%=font%><b>&nbsp;&nbsp;Admin fee paid</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("AdminFeePaid"); selBoolean.setCurrentValue(project.getAdminFeePaid());%><%=selBoolean.printBoolean()%></FONT></TD></tr>

<TR><td colspan='2'><%=fontText%><b>Size Requirements</b><br /><%=fontTextS%><nobr>&nbsp;&nbsp;&nbsp;(leave the box(es) blank if you want to signify an unlimited amount <b>or</b> don’t want to set a maximum amount.)</nobr></font></td></tr>
</TABLE>
<div style="text-align: center;">
<table cellpadding="2" cellspacing="0" border="1">
<tr>
	<td>&nbsp;</td>
	<td>Single<br />Men</td>
	<td>Single<br />Women</td>
	<td>Couples</td>
	<td>Families</td>
	<td>Total<br />Adults</td>
</tr>
<tr>
	<td><%=font%>Max # Staff Participants</font></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStaffPMale" value="<%=project.getMaxNoStaffPMale() == 0? "" : Integer.toString(project.getMaxNoStaffPMale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStaffPFemale" value="<%=project.getMaxNoStaffPFemale() == 0? "" : Integer.toString(project.getMaxNoStaffPFemale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStaffPCouples" value="<%=project.getMaxNoStaffPCouples() == 0? "" : Integer.toString(project.getMaxNoStaffPCouples())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStaffPFamilies" value="<%=project.getMaxNoStaffPFamilies() == 0? "" : Integer.toString(project.getMaxNoStaffPFamilies())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStaffP" value="<%=project.getMaxNoStaffP() == 0? "" : Integer.toString(project.getMaxNoStaffP())%>"></td>
</tr>
<tr>
	<td><%=font%>Max # Intern Applicants</font></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternAMale" value="<%=project.getMaxNoInternAMale() == 0? "" : Integer.toString(project.getMaxNoInternAMale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternAFemale" value="<%=project.getMaxNoInternAFemale() == 0? "" : Integer.toString(project.getMaxNoInternAFemale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternACouples" value="<%=project.getMaxNoInternACouples() == 0? "" : Integer.toString(project.getMaxNoInternACouples())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternAFamilies" value="<%=project.getMaxNoInternAFamilies() == 0? "" : Integer.toString(project.getMaxNoInternAFamilies())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternA" value="<%=project.getMaxNoInternA() == 0? "" : Integer.toString(project.getMaxNoInternA())%>"></td>
</tr>
<tr>
	<td><%=font%>Max # Intern Participants</font></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternPMale" value="<%=project.getMaxNoInternPMale() == 0? "" : Integer.toString(project.getMaxNoInternPMale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternPFemale" value="<%=project.getMaxNoInternPFemale() == 0? "" : Integer.toString(project.getMaxNoInternPFemale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternPCouples" value="<%=project.getMaxNoInternPCouples() == 0? "" : Integer.toString(project.getMaxNoInternPCouples())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternPFamilies" value="<%=project.getMaxNoInternPFamilies() == 0? "" : Integer.toString(project.getMaxNoInternPFamilies())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoInternP" value="<%=project.getMaxNoInternP() == 0? "" : Integer.toString(project.getMaxNoInternP())%>"></td>
</tr>
<tr>
	<td><%=font%>Max # Student Applicants</font></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentAMale" value="<%=project.getMaxNoStudentAMale() == 0? "" : Integer.toString(project.getMaxNoStudentAMale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentAFemale" value="<%=project.getMaxNoStudentAFemale() == 0? "" : Integer.toString(project.getMaxNoStudentAFemale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentACouples" value="<%=project.getMaxNoStudentACouples() == 0? "" : Integer.toString(project.getMaxNoStudentACouples())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentAFamilies" value="<%=project.getMaxNoStudentAFamilies() == 0? "" : Integer.toString(project.getMaxNoStudentAFamilies())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentA" value="<%=project.getMaxNoStudentA() == 0? "" : Integer.toString(project.getMaxNoStudentA())%>"></td>
</tr>
<tr>
	<td><%=font%>Max # Student Participants</font></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentPMale" value="<%=project.getMaxNoStudentPMale() == 0? "" : Integer.toString(project.getMaxNoStudentPMale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentPFemale" value="<%=project.getMaxNoStudentPFemale() == 0? "" : Integer.toString(project.getMaxNoStudentPFemale())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentPCouples" value="<%=project.getMaxNoStudentPCouples() == 0? "" : Integer.toString(project.getMaxNoStudentPCouples())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentPFamilies" value="<%=project.getMaxNoStudentPFamilies() == 0? "" : Integer.toString(project.getMaxNoStudentPFamilies())%>"></td>
	<td><input type="text" size="3" maxlength="2" name="MaxNoStudentP" value="<%=project.getMaxNoStudentP() == 0? "" : Integer.toString(project.getMaxNoStudentP())%>"></td>
</tr>
</table>
</div>
<input type='Submit' value='Save'>
</form>

<%@ include file="adminfooter.jspf" %>

</HTML>