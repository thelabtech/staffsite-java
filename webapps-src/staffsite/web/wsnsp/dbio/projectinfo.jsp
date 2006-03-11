<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*,java.text.SimpleDateFormat" %>
<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>
<jsp:useBean id="selAOA" class="org.alt60m.html.SelectAoA"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>
<% String highlightYellow = "style=\"background-color: #FFFF00\""; %>

<HTML>
<HEAD>
<TITLE>Add a Summer Project</TITLE>

<%@ include file="/validate.js" %>
<SCRIPT LANGUAGE="JavaScript"><!--
	function validate() {

		failed = false;
		badDate = false;
		accountFailed = false;
		badAccount = false;
		errorMessage = "You cannot continue for the following reasons:\n";
		badDateMessage = "\n\nRules for valid dates:\n\tDates must be in the form of mm/dd/yyyy.\n\tYears must be in the range from 1900 - 2099.";
		badAccountMessage = "\n\nYou a Scholarship Designation without a Chart Field combonition.  You must enter a chart field combination for Scholarship Designations.";

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

<%@ include file="wsnspheader.jspf" %>

<form name="myForm" method="post" action="/servlet/WsnSpController" onSubmit="return validate()">
<% if (h.get("WsnProjectID")!=null){%>
	<input type="hidden" name="id" value="<%=h.get("WsnProjectID")%>"><!-- new if a totally new project, the number of the record if we are editing -->
	<input type="hidden" name="action" value="adminSaveProj">
	<input type="hidden" name="view" value="showprojectinfo">
<%} else {%>
	<input type="hidden" name="id" value="new">
	<input type="hidden" name="WsnYear" value="<%=session.getValue("wsnYear")%>">
	<input type="hidden" name="action" value="adminSaveProj">
	<input type="hidden" name="view" value="addprojectconfirm">
<%}%>
<p> &nbsp;

<table width='100%' border='0'>

<A HREF="/servlet/WsnSpController?action=listQuestions&id=<%=h.get("WsnProjectID")%>">Edit Project Specific Application Questions</A><br>

<TR><td colspan='2'><%=fontText%><b>Basic Project Information</b><br />(<span <%=highlightYellow%>>Yellow</span> background indicates text will be displayed publicly on websites.)</td>
<td colspan='2'> &nbsp; </td>

<!-- ------------TOOL BOX---------- -->
<td rowspan='7' colspan='2' align='center' valign='top' nowrap>
<%=fontTextL%><b>Available Tools</font></b><br>
	<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=<%=session.getValue("MyHomeAction")%>"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=appinfo"><IMG SRC="/wsnsp/images/wsn_addapp.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Applicant"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=staffappsearch"><IMG SRC="/wsnsp/images/wsn_addstaff.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Staff"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistapps.jsp"><IMG SRC="/wsnsp/images/wsn_searchpeople.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Applicant"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistprojects.jsp"><IMG SRC="/wsnsp/images/wsn_searchproj.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Projects"></a></TD></tr>
	</TABLE>
	<%=fontTextL%><b>Links</font></b><br>
	<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top'><td colspan=2><%=fontTextM%><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><A HREF="/servlet/CmsController?action=browse&catID=1000029" target='_blank'>Resource Center</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
	</TABLE>
</td>
</tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Project Name</b></FONT></TD><td><INPUT TYPE=Text NAME="Name" SIZE=35 MAXLENGTH=30 VALUE="<%=formHelp.value((String)h.get("Name"))%>" <%=highlightYellow%>></TD></tr>

<TR><td><%=font%><b>&nbsp;&nbsp;Project Type</b></font></TD><td><% String pt = h.get("ProjectType") == null? "-" : (String)h.get("ProjectType"); %>
	<select NAME="ProjectType">
		<option value="u"<%=pt.equalsIgnoreCase("u")? " selected=\"selected\"":""%>>U.S. Summer Project</option>
		<option value="w"<%=pt.equalsIgnoreCase("w")? " selected=\"selected\"":""%>>W.S.N. Summer Project</option>
		<option value="s"<%=pt.equalsIgnoreCase("s")? " selected=\"selected\"":""%>>School of Leadership</option>
		<option value="r"<%=pt.equalsIgnoreCase("r")? " selected=\"selected\"":""%>>Regional Summer Project</option>
		<option value="i"<%=pt.equalsIgnoreCase("i")? " selected=\"selected\"":""%>>Institute of Biblical Studies (IBS)</option>
		<option value="p"<%=pt.equalsIgnoreCase("p")? " selected=\"selected\"":""%>>Partnership Ministry</option>
		<option value=""<%=pt.equals("-")? " selected=\"selected\"":""%>>Please select an option.</option>
	</select>
</td></tr>

<%
if (h.get("StudentStartDate") != null) h.put("StudentStartDate",new SimpleDateFormat("MM/dd/yyyy").format((Date)h.get("StudentStartDate")));
if (h.get("StudentEndDate") != null) h.put("StudentEndDate",new SimpleDateFormat("MM/dd/yyyy").format((Date)h.get("StudentEndDate")));

if (h.get("StaffStartDate") != null) h.put("StaffStartDate",new SimpleDateFormat("MM/dd/yyyy").format((Date)h.get("StaffStartDate")));
if (h.get("StaffEndDate") != null) h.put("StaffEndDate",new SimpleDateFormat("MM/dd/yyyy").format((Date)h.get("StaffEndDate"))); %>

<TR><td><%=font%><b>&nbsp;&nbsp;Student Start Date</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="StudentStartDate" SIZE=12 MAXLENGTH=10 VALUE="<%=h.get("StudentStartDate") == null? "":h.get("StudentStartDate")%>" <%=highlightYellow%>></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Student End Date</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="StudentEndDate" SIZE=12 MAXLENGTH=10 VALUE="<%=h.get("StudentEndDate") == null? "":h.get("StudentEndDate")%>" <%=highlightYellow%>></FONT></TD></tr>

<TR><td><%=font%><b>&nbsp;&nbsp;Staff Start Date</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="StaffStartDate" SIZE=12 MAXLENGTH=10 VALUE="<%=h.get("StaffStartDate") == null? "":h.get("StaffStartDate")%>" ></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Staff End Date</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="StaffEndDate" SIZE=12 MAXLENGTH=10 VALUE="<%=h.get("StaffEndDate") == null? "":h.get("StaffEndDate")%>" ></FONT></TD></tr>

<TR><td><%=font%><b>&nbsp;&nbsp;City</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="City" SIZE=20 MAXLENGTH=45 VALUE="<%=formHelp.value((String)h.get("City"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Country</b></FONT></TD><td><%=font%><% selCountry.setName("Country"); if (h.get("Country")!=null){ selCountry.setCurrentValue((String)h.get("Country"));}%><%=selCountry.print()%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Display Location</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="DisplayLocation" SIZE=50 MAXLENGTH=45 VALUE="<%=formHelp.value((String)h.get("DisplayLocation"))%>" <%=highlightYellow%>></FONT><br /><%=fontTextS%><nobr>&nbsp;&nbsp;&nbsp;(ie. "Ocean City, NJ", "Middle East", etc.)</nobr></font></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Country Status</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Open","Closed"); selBoolean.setName("Secure"); if (h.get("Secure")!=null){selBoolean.setCurrentValue(h.get("Secure").toString().equals("true"));}%><%=selBoolean.printBoolean()%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Sending Region</b></FONT></TD><td><%=font%><% selRegion.setName("PartnershipRegion"); if (h.get("PartnershipRegion")!=null){ selRegion.setCurrentValue((String)h.get("PartnershipRegion"));} %><%=selRegion.print()%></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Only Accepting Students from     Sending Region</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("PartnershipRegionOnly"); if (h.get("PartnershipRegionOnly")!=null){selBoolean.setCurrentValue(h.get("PartnershipRegionOnly").toString().equals("true"));}%><%=selBoolean.printBoolean()%></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;AOA</b></FONT></TD><td><%=font%><% if (h.get("AOA")!=null){ selAOA.setCurrentValue((String)h.get("AOA"));} %><% selAOA.setName("AOA");%><%=selAOA.print()%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Details</b></FONT></TD><td><%=font%><TEXTAREA NAME="Details" ROWS=4 COLS=30 <%=highlightYellow%>><%=h.get("Details") == null? "" : (String)h.get("Details")%></TEXTAREA></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;History</b></FONT></TD><td><%=font%><TEXTAREA NAME="History" ROWS=4 COLS=30><%=formHelp.value((String)h.get("History"))%></TEXTAREA></FONT></TD></tr>
<TR><td colspan="2"><%=font%><h3>&nbsp;&nbsp;Operating Account Information</h3></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Business Unit</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. CAMPS)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="OperatingBusinessUnit" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("OperatingBusinessUnit"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Operating Unit</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. NCO, K1, OEX, etc.)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="OperatingOperatingUnit" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("OperatingOperatingUnit"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Department ID</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. USSP, WSNSUMPROJ, etc.)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="OperatingDeptID" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("OperatingDeptID"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Project ID</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. SCHOLARSHIPS, 27241, TAHOE)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="OperatingProjectID" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("OperatingProjectID"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Operating Designation</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. 2XXXXXX)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="OperatingDesignation" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("OperatingDesignation"))%>"></FONT></TD></tr>
<TR><td><%=font%>&nbsp;&nbsp;</FONT></TD></tr>
<TR><td colspan="2"><%=font%><h3>&nbsp;&nbsp;Scholarship Account Information</h3></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Business Unit</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. CAMPS)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="ScholarshipBusinessUnit" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("ScholarshipBusinessUnit"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Operating Unit</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. NCO, K1, OEX, etc.)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="ScholarshipOperatingUnit" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("ScholarshipOperatingUnit"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Department ID</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. USSP, WSNSUMPROJ, etc.)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="ScholarshipDeptID" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("ScholarshipDeptID"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Project ID</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. SCHOLARSHIPS, 27241, TAHOE)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="ScholarshipProjectID" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("ScholarshipProjectID"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Scholarship Designation</b>&nbsp;&nbsp;</font><%=fontS%>(e.g. 199XXXX)</FONT></TD><td><%=font%><INPUT TYPE=Text NAME="ScholarshipDesignation" SIZE=20 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("ScholarshipDesignation"))%>"></FONT></TD></tr>
<TR><td><%=font%>&nbsp;&nbsp;</FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Staff Cost</b></FONT></TD><td><%=font%>$<INPUT TYPE=Text NAME="StaffCost" SIZE=5 MAXLENGTH=4 VALUE="<%=formHelp.value((String)h.get("StaffCost"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Intern Cost</b></FONT></TD><td><%=font%>$<INPUT TYPE=Text NAME="InternCost" SIZE=5 MAXLENGTH=4 VALUE="<%=formHelp.value((String)h.get("InternCost"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Student Cost</b></FONT></TD><td><%=font%>$<INPUT TYPE=Text NAME="StudentCost" SIZE=5 MAXLENGTH=4 VALUE="<%=formHelp.value((String)h.get("StudentCost"))%>" <%=highlightYellow%>></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;On Hold</b><br /><%=fontTextS%><nobr>&nbsp;&nbsp;&nbsp;(won't display publicly as a project option)</nobr></font></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("OnHold"); if (h.get("OnHold")!=null){selBoolean.setCurrentValue(h.get("OnHold").toString().equals("true"));}else selBoolean.setCurrentValue(false);%><%=selBoolean.printBoolean()%></TD></tr>

<TR><td colspan='2'><%=fontText%><b>Travel Information</b></td></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;US City you are Departing From</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="DestinationGatewayCity" SIZE=20 MAXLENGTH=30 VALUE="<%=formHelp.value((String)h.get("DestinationGatewayCity"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Date of Departure from the US</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="DepartDateFromGateCity" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("DepartDateFromGateCity"))%>" ></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Int'l City you are Flying To</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LocationGatewayCity" SIZE=20 MAXLENGTH=30 VALUE="<%=formHelp.value((String)h.get("LocationGatewayCity"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Date of Return to the US</b></FONT> <%=fontTextS%>(mm/dd/yyyy)</TD><td><%=font%><INPUT TYPE=Text NAME="ArrivalDateAtGatewayCity" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("ArrivalDateAtGatewayCity"))%>" ></FONT></TD></tr>

<TR><td colspan='2'><%=fontText%><b>In Country Contact</b></td></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Name and Contact Info</b></FONT></TD><td><%=font%><TEXTAREA NAME="InCountryContact" ROWS=2 COLS=30><%=formHelp.value((String)h.get("InCountryContact"))%></TEXTAREA></FONT></TD></tr>

<TR><td colspan='2'><%=fontText%><b>Other Information</b></td></tr>
<!-- TR><td><%=font%><b>&nbsp;&nbsp;Max # Staff</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="MaxNoStaff" SIZE=3 MAXLENGTH=2 VALUE="<% if (h.get("MaxNoStaff")!=null){%><%=formHelp.value((String)h.get("MaxNoStaff").toString())%><%}%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Max # Students</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="MaxNoStudents" SIZE=3 MAXLENGTH=2 VALUE="<% if (h.get("MaxNoStudents")!=null){%><%=formHelp.value((String)h.get("MaxNoStudents").toString())%><%}%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;CAPS fee paid</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("CAPSFeePaid");  if (h.get("CAPSFeePaid")!=null){selBoolean.setCurrentValue(h.get("CAPSFeePaid").toString().equals("true"));}%><%=selBoolean.printBoolean()%></FONT></TD></tr> -->
<TR><td><%=font%><b>&nbsp;&nbsp;Admin fee paid</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("AdminFeePaid");  if (h.get("AdminFeePaid")!=null){selBoolean.setCurrentValue(h.get("AdminFeePaid").toString().equals("true"));}%><%=selBoolean.printBoolean()%></FONT></TD></tr>

<TR><td colspan='2'><%=fontText%><b>Size Requirements</b><br /><%=fontTextS%><nobr>&nbsp;&nbsp;&nbsp;(You must enter some number, unless you want none allowed)</nobr></font></td></tr>
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
	<td><input type="text" size="3" maxlength="3" name="MaxNoStaffMale" value="<%=h.get("MaxNoStaffMale") == null? "":h.get("MaxNoStaffMale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStaffFemale" value="<%=h.get("MaxNoStaffFemale") == null? "":h.get("MaxNoStaffFemale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStaffCouples" value="<%=h.get("MaxNoStaffCouples") == null? "":h.get("MaxNoStaffCouples")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStaffFamilies" value="<%=h.get("MaxNoStaffFamilies") == null? "":h.get("MaxNoStaffFamilies")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStaff" value="<%=h.get("MaxNoStaff") == null? "":h.get("MaxNoStaff")%>"></td>
</tr>
<tr>
	<td><%=font%>Max # Intern Applicants</font></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternAMale" value="<%=h.get("MaxNoInternAMale") == null? "":h.get("MaxNoInternAMale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternAFemale" value="<%=h.get("MaxNoInternAFemale") == null? "":h.get("MaxNoInternAFemale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternACouples" value="<%=h.get("MaxNoInternACouples") == null? "":h.get("MaxNoInternACouples")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternAFamilies" value="<%=h.get("MaxNoInternAFamilies") == null? "":h.get("MaxNoInternAFamilies")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternA" value="<%=h.get("MaxNoInternA") == null? "":h.get("MaxNoInternA")%>"></td>
</tr>
<tr>
	<td><%=font%>Max # Intern Participants</font></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternPMale" value="<%=h.get("MaxNoInternPMale") == null? "":h.get("MaxNoInternPMale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternPFemale" value="<%=h.get("MaxNoInternPFemale") == null? "":h.get("MaxNoInternPFemale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternPCouples" value="<%=h.get("MaxNoInternPCouples") == null? "":h.get("MaxNoInternPCouples")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternPFamilies" value="<%=h.get("MaxNoInternPFamilies") == null? "":h.get("MaxNoInternPFamilies")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoInternP" value="<%=h.get("MaxNoInternP") == null? "":h.get("MaxNoInternP")%>"></td>
</tr>
<tr>
	<td><%=font%>Max # Student Applicants</font></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentAMale" value="<%=h.get("MaxNoStudentAMale") == null? "":h.get("MaxNoStudentAMale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentAFemale" value="<%=h.get("MaxNoStudentAFemale") == null? "":h.get("MaxNoStudentAFemale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentACouples" value="<%=h.get("MaxNoStudentACouples") == null? "":h.get("MaxNoStudentACouples")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentAFamilies" value="<%=h.get("MaxNoStudentAFamilies") == null? "":h.get("MaxNoStudentAFamilies")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentA" value="<%=h.get("MaxNoStudentA") == null? "":h.get("MaxNoStudentA")%>"></td>
</tr>
<tr>
	<td><%=font%>Max # Student Participants</font></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentPMale" value="<%=h.get("MaxNoStudentPMale") == null? "":h.get("MaxNoStudentPMale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentPFemale" value="<%=h.get("MaxNoStudentPFemale") == null? "":h.get("MaxNoStudentPFemale")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentPCouples" value="<%=h.get("MaxNoStudentPCouples") == null? "":h.get("MaxNoStudentPCouples")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudentPFamilies" value="<%=h.get("MaxNoStudentPFamilies") == null? "":h.get("MaxNoStudentPFamilies")%>"></td>
	<td><input type="text" size="3" maxlength="3" name="MaxNoStudents" value="<%=h.get("MaxNoStudents") == null? "":h.get("MaxNoStudents")%>"></td>
</tr>
</table>
</div>
<input type='Submit' value='Save'>
</form>

<%@ include file="wsnspfooter.jspf" %>

</HTML>