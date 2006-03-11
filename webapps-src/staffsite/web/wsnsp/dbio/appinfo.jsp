<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selEmergState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/>
<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>

<HTML>
<HEAD>
<TITLE>WSN SPT APP</TITLE>

<%@ include file="/validate.js" %>
<SCRIPT LANGUAGE="JavaScript"><!--
	function validate() {

		failed = false;
		errorMessage = "You cannot continue for the following reasons:\n"

		emptyCheck(document.myForm.LegalFirstName,"You must enter the applicant's legal first name.");
		emptyCheck(document.myForm.LegalLastName,"You must enter the applicant's legal last name.");
		selectedCheck(document.myForm.Region,"You must specify the applicant's region.");
		selectedCheck(document.myForm.MaritalStatus,"You must specify the applicant's marital status.");
		emptyCheck(document.myForm.CurrentAddress,"You must enter the applicant's current address.");
		emptyCheck(document.myForm.CurrentCity,"You must enter the applicant's current city.");
		//emptyCheck(document.myForm.CurrentState,"You must enter the applicant's current state.");
		emptyCheck(document.myForm.CurrentZip,"You must enter the applicant's current zip code.");
		emptyCheck(document.myForm.CurrentPhone,"You must enter the applicant's current phone number.");
		emptyCheck(document.myForm.CurrentEmail,"You must enter the applicant's current e-mail address.");
		//emptyCheck(document.myForm.DateAddressGoodUntil,"You must specify the date to which the applicant will be at his/her current address.");
		selectedCheck(document.myForm.M,"You must specify which project the applicant is assigned to.");

		if (document.myForm.IsStaff.value=="true") {
			emptyCheck(document.myForm.ApplAccountNo,"You must enter the applicant's staff account number.");
		} else {
			emptyCheck(document.myForm.EmergName,"You must enter the applicant's emergency contact.");
			emptyCheck(document.myForm.EmergAddress,"You must enter the emergency contact's adress.");
			emptyCheck(document.myForm.EmergCity,"You must enter the emergency contact's city of residence.");
			//emptyCheck(document.myForm.EmergState,"You must enter the emergency contact's state of residence.");
			emptyCheck(document.myForm.EmergZip,"You must enter the emergency contact's zip code.");
			emptyCheck(document.myForm.EmergPhone,"You must enter the emergency contact's phone number.");
			selectedCheck(document.myForm.ProjectPref1,"You must specify the applicant's #1 project preference.");
			emptyCheck(document.myForm.Birthdate,"You must enter the applicant's birthdate");
			emptyCheck(document.myForm.UniversityFullName,"You must enter the university which the applicant attends.");
			emptyCheck(document.myForm.EarliestAvailableDate,"You must enter the earliest date the applicant is able to go on a project.");
			emptyCheck(document.myForm.DateMustReturn,"You must enter the date the applicant must return from a project.");
		}

		if (document.myForm.ApplAccountNo.value=="child") {
			failed=false;
		}
		
		if (document.myForm.MaritalStatus.value=="M") {
			selectedCheck(document.myForm.Child,"You indicated that the applicant is married.  You must also indicate if the applicant has children that are going.");
		}

		// if (!isDateMMDDYYYY(document.myForm.DateAddressGoodUntil.value)) {
		//	errorMessage = errorMessage + "\n" + "You need to enter dates in the form of mm/dd/yyyy";
		//	failed = true;
		//	document.myForm.DateAddressGoodUntil.focus();
		// }

		if (!isDateMMDDYYYY(document.myForm.Birthdate.value)) {
			errorMessage = errorMessage + "\n" + "You need to enter dates in the form of mm/dd/yyyy";
			failed = true;
			document.myForm.Birthdate.focus();
		}

		if (!isDateMMDDYYYY(document.myForm.SubmittedDate.value)) {
			errorMessage = errorMessage + "\n" + "You need to enter dates in the form of mm/dd/yyyy";
			failed = true;
			document.myForm.SubmittedDate.focus();
		}

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

<% String pageTitle = "Personal Information"; %>

<%@ include file="wsnspheader.jspf" %>

<form name="myForm" method="post" action="/servlet/WsnSpController" onSubmit="return validate()"> 
<input type="hidden" name="action" value="adminSaveApp"> <!-- adminSaveApp, dirSaveApp -->
<input type="hidden" name="view" value="showappinfo">
<TABLE>
	<TR>
		<TD align="left" valign="top" width="27%">
			<%  if (h.get("WsnApplicationID")!=null){
			%>	<input type="hidden" name="id" value="<%=h.get("WsnApplicationID")%>"><!-- new if a totally new project, the number of the record if we are editing -->
				<%=fontTextXL%>Edit an applicant</font>
			<%}
			else{%>	<input type="hidden" name="id" value="new">
					<input type="hidden" name="WsnYear" value="<%=session.getValue("wsnYear")%>">
				<%=fontTextXL%>Add an Applicant</font>
			<%}%>
			<%  if (request.getParameter("StaffProfileID")!=null) {
			%>	<input type="hidden" name="StaffProfileID" value="<%=request.getParameter("StaffProfileID")%>">
			<%}%>
		
		</td>

		<td>
	<%  if (h.get("frompage")!=null){
			if (h.get("frompage").equals("ProjectStaff")){
		%>	
				<table>
					<TR>
						<TD><%=fontText%>To finish adding this "Project Staff", please verify the information below 
							for accuracy. Then fill in the other fields including "Assigned Project" 
							and hit "Save" at the bottom of the page. 
						</font></TD>
					</TR>
				</TABLE>
			<%} else { %>
				<table>
					<TR>
						<TD><%=fontText%><b>You have just assigned this person as a leader.</b></font></TD>
					</TR>
					<TR>
						<TD><%=fontText%>If you assigned a STAFF leader, check the fields below to make sure they are correct and edit any if needed. 
						(If it is all OK, then click SAVE at the bottom of this page.)</font></TD>
					</TR>
					<TR>
						<TD><%=fontText%>If you assigned a NON-STAFF leader, you need to fill in the appropriate required fields below and click any "Save" button.</font></TD>
					</TR>
				</TABLE>
			<%}
		}%>
		</td>
	</tr>
</table>

<%if (h.get("Role")!=null){
%><input type="hidden" name="Role" value="<%=h.get("Role")%>"> <!-- person's role for site access -->
<%}
else if (request.getParameter("StaffProfileID") != null) {
%><input type="hidden" name="Role" value="5">
<%}
else {%><input type="hidden" name="Role" value="1"><%}%>
<p>

<table width='100%' border='0'>
<tr valign='top'><td colspan='3'><td rowspan='6' valign='top'>
<tr valign='top'><td colspan='2'><%=fontText%>(* = required for everyone; ** = required for non-staff)</font></td>
<tr valign='top'><td colspan='2'><%=fontText%><b>Personal Information</b></font></td>

<!--------------TOOL BOX------------>
<td rowspan='7' colspan='2' align='center' nowrap>
<%=fontTextL%><b>Available Tools</font></b><br>
	<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=<%=session.getValue("MyHomeAction")%>"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a></TD></tr>
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
<tr valign='top'><td align="right"><%=font%><b>*First Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LegalFirstName" SIZE=40 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("LegalFirstName"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>*Last Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LegalLastName" SIZE=40 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("LegalLastName"))%>" ></FONT></TD></tr> 
<tr valign='top'><td align="right"><%=font%><b>*Gender</b></FONT></TD><td><%=font%><% selGender.setName("Gender"); if (h.get("Gender")!=null){ selGender.setCurrentValue((String)h.get("Gender"));} %><%=selGender.print()%></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>*Participant's Campus Region</b></FONT></TD><td><%=font%><% selRegion.setName("Region"); if (h.get("Region")!=null){ selRegion.setCurrentValue((String)h.get("Region"));} %><%=selRegion.print()%></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>*Staff or student</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Staff","Student"); selBoolean.setName("IsStaff");  if (h.get("IsStaff")!=null){ selBoolean.setCurrentValue(h.get("IsStaff").toString().equals("true"));}%><%=selBoolean.printBoolean()%></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Account Number</b></FONT></TD><td><%=font%><input type=text name="ApplAccountNo" size="12" maxlength="10" value="<% if (h.get("ApplAccountNo")!=null) {%><%=h.get("ApplAccountNo")%><%}%>"  onBlur="isInteger(this, this.value)"><%=fontS%> (This is required if staff. 7 digit #)</TD></tr>

<tr valign='top'><td colspan='2'><%=fontText%><b>Contact Information</TD></tr>
<tr valign='top'><td align="right"><%=font%><b>*Street</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentAddress" SIZE=40 MAXLENGTH=49 VALUE="<%=formHelp.value((String)h.get("CurrentAddress"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Street 2</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentAddress2" SIZE=40 MAXLENGTH=34 VALUE="<%=formHelp.value((String)h.get("CurrentAddress2"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>*City, *State, *Zip</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentCity" SIZE=20 MAXLENGTH=34 VALUE="<%=formHelp.value((String)h.get("CurrentCity"))%>"><% selState.setName("CurrentState"); if (h.get("CurrentState")!=null){ selState.setCurrentValue((String)h.get("CurrentState"));}%><%=selState.print()%><INPUT TYPE=Text NAME="CurrentZip" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("CurrentZip"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>*Telephone</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentPhone" SIZE=15 MAXLENGTH=20 VALUE="<%=formHelp.value((String)h.get("CurrentPhone"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>*Email</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="CurrentEmail" SIZE=30 MAXLENGTH=50 VALUE="<%=formHelp.value((String)h.get("CurrentEmail"))%>" ></FONT></TD></tr>
<!-- <tr valign='top'><td align="right"><%=font%><b>*At This Address Until</b></font></TD><td><%=font%><INPUT TYPE=Text NAME="DateAddressGoodUntil" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("DateAddressGoodUntil"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr> -->

<!-- <tr valign='top'><td colspan='1'></td><td><input type='submit' value='Save'></td></tr>  -->
<tr valign='top'><td colspan='2'><%=fontText%><b>Emergency Contact Information</TD></tr>
<tr valign='top'><td align="right"><%=font%><b>**Emergency Contact's Full Names</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="EmergName" SIZE=50 MAXLENGTH=49 VALUE="<%=formHelp.value((String)h.get("EmergName"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>;**Street</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="EmergAddress" SIZE=40 MAXLENGTH=50 VALUE="<%=formHelp.value((String)h.get("EmergAddress"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>**City, **State **Zip</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="EmergCity" SIZE=20 MAXLENGTH=30 VALUE="<%=formHelp.value((String)h.get("EmergCity"))%>"><% selEmergState.setName("EmergState"); if (h.get("EmergState")!=null){ selEmergState.setCurrentValue((String)h.get("EmergState"));}%><%=selEmergState.print()%><INPUT TYPE=Text NAME="EmergZip" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("EmergZip"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>**Telephone</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="EmergPhone" SIZE=15 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("EmergPhone"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Work Phone</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="EmergWorkPhone" SIZE=15 MAXLENGTH=15 VALUE="<%=formHelp.value((String)h.get("EmergWorkPhone"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Email</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="EmergEmail" SIZE=30 MAXLENGTH=50 VALUE="<%=formHelp.value((String)h.get("EmergEmail"))%>" ></FONT></TD></tr>

<% 
String projectPrefID[]={"","","","",""};
projectPrefID[0] = (String)h.get("ProjectPref1")==null?"":(String)h.get("ProjectPref1");
projectPrefID[1] = (String)h.get("ProjectPref2")==null?"":(String)h.get("ProjectPref2");
projectPrefID[2] = (String)h.get("ProjectPref3")==null?"":(String)h.get("ProjectPref3");
projectPrefID[3] = (String)h.get("ProjectPref4")==null?"":(String)h.get("ProjectPref4");
projectPrefID[4] = (String)h.get("ProjectPref5")==null?"":(String)h.get("ProjectPref5");

//fetches projects that aren't full! from whole list (US and WSN)
Collection validProjects = infoBean.getValidProjects((String)h.get("Region"), true, (String)h.get("Gender"));

boolean isProjectPrefValid[]={false,false,false,false,false};
if (validProjects != null) {
	Iterator itr = validProjects.iterator();
	boolean allValid=false;
	while (itr.hasNext()&&!allValid) {
		Hashtable project = (Hashtable)itr.next();
		String currentProjectID = (String)project.get("WsnProjectID");
		for(int prefIndex=0;prefIndex<5;prefIndex++)
		{
			if (currentProjectID.equalsIgnoreCase(projectPrefID[prefIndex]))
			{
				isProjectPrefValid[prefIndex]= true;
			}
		}
		if(isProjectPrefValid[0]&isProjectPrefValid[1]&isProjectPrefValid[2]&isProjectPrefValid[3]&isProjectPrefValid[4])
		{
			// all are valid, stop searching for them	
			allValid=true;
		}
	}	
}
%>

<tr valign='top'><td colspan='2'><%=fontText%><b>Project Preferences</font></b></td></tr>
<tr valign='top'><td align="right"><%=font%><b>**Preferred Project 1</b></FONT></TD><td><%=font%><% selProj.setName("ProjectPref1"); if (h.get("ProjectPref1") != null) {selProj.setCurrentValue((String)h.get("ProjectPref1").toString());}%><%=selProj.print()%><%if(!isProjectPrefValid[0]&h.get("ProjectPref1") != null&!"".equals(h.get("ProjectPref1"))){%><strong>This project is full.</strong><%}%></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Preferred Project 2</b></FONT></TD><td><%=font%><% selProj.setName("ProjectPref2"); if (h.get("ProjectPref2") != null) {selProj.setCurrentValue((String)h.get("ProjectPref2").toString());}%><%=selProj.print()%><%if(!isProjectPrefValid[1]&h.get("ProjectPref2") != null&!"".equals(h.get("ProjectPref2"))){%><strong>This project is full.</strong><%}%></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Preferred Project 3</b></FONT></TD><td><%=font%><% selProj.setName("ProjectPref3"); if (h.get("ProjectPref3") != null) {selProj.setCurrentValue((String)h.get("ProjectPref3").toString());}%><%=selProj.print()%><%if(!isProjectPrefValid[2]&h.get("ProjectPref3") != null&!"".equals(h.get("ProjectPref3"))){%><strong>This project is full.</strong><%}%></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Preferred Project 4</b></FONT></TD><td><%=font%><% selProj.setName("ProjectPref4"); if (h.get("ProjectPref4") != null) {selProj.setCurrentValue((String)h.get("ProjectPref4").toString());}%><%=selProj.print()%><%if(!isProjectPrefValid[3]&h.get("ProjectPref4") != null&!"".equals(h.get("ProjectPref4"))){%><strong>This project is full.</strong><%}%></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Preferred Project 5</b></FONT></TD><td><%=font%><% selProj.setName("ProjectPref5"); if (h.get("ProjectPref5") != null) {selProj.setCurrentValue((String)h.get("ProjectPref5").toString());}%><%=selProj.print()%><%if(!isProjectPrefValid[4]&h.get("ProjectPref5") != null&!"".equals(h.get("ProjectPref5"))){%><strong>This project is full.</strong><%}%></TD></tr>
<tr valign='top'><td align="right"><%=fontS%><b>If these are unavailable, is the applicant willing to<br> participate in another Summer Project?</FONT></TD><td><% selBoolean.setLabels("Yes","No"); selBoolean.setName("WillingForDifferentProject"); if (h.get("WillingForDifferentProject")!=null){selBoolean.setCurrentValue(h.get("WillingForDifferentProject").toString().equals("true"));} else { selBoolean.setCurrentValue(true);}%><%=selBoolean.printBoolean()%></FONT></TD></tr>
<% 
if(validProjects!=null&&h.get("WsnApplicationID")!=null)
{
	%>
	<tr valign='top'><td align="right"><%=font%><b>Available (not full) US Projects</FONT></TD><td>
	<SELECT>
	<%
	Iterator itr = validProjects.iterator();
	while (itr.hasNext()) {
		Hashtable project = (Hashtable)itr.next();
		if(!"w".equals((String)project.get("ProjectType")))
		{
			out.write("<option>"+(String) project.get("Name"));
			if(((Boolean)project.get("PartnershipRegionOnly")).booleanValue())
				out.write(" ("+(String)project.get("PartnershipRegion")+" region only)");
			out.write("</option>");
		}
		
	}	
	%>
	</SELECT>
	</FONT></TD><br><br></tr>
<%
}
%>
<tr valign='top'><td align="right"><%=fontText%><b>*Assigned Project</b></FONT></TD><td><%=font%><% selProj.setName("M"); if (h.get("M") != null) {selProj.setCurrentValue((String)h.get("M"));}%><%=selProj.print()%></TD></tr>
<%
if (h.get("unassignedCoord") != null) {
	if (h.get("unassignedCoord").equals("yes")) {
		%>
		<tr valign='top'><td align="right"><%=fontText%><b>Note:</b></FONT></TD>
			<td><%=fontText%>
				The database indicates that this person is coordinating <br>
				one or more projects, but not actually going on a project <br>
				(they are coordinating stateside). If this is the case, <br>
				leave their project as "unassigned." They will still show<br>
				up as the coordinator for the appropriate project(s). If <br>
				they are GOING on a project (i.e. traveling with the <br>
				project that they are coordinating), then change their <br>
				assignment to the project they are going on. This will<br>
				add them to the roster for that project.
			</font></TD>
		</tr>
		<%
	} else if (h.get("unassignedCoord").equals("no")) {
	%>
	<tr valign='top'><td align="right"><%=fontText%><b>Note:</b></FONT></TD>
		<td><%=fontText%>
			If you don't know which project the person will be <br>
			assigned to, assign them to their first preference <br>
			and leave the status as "pending" (the status <br>
			field is below on this form).
		</font></TD>
	</tr>
	<%
	}
} else {
	%>
	<tr valign='top'><td align="right"><%=fontText%><b>Note:</b></FONT></TD>
		<td><%=fontText%>
			If you don't know which project the person will be <br>
			assigned to, assign them to their first preference <br>
			and leave the status as "pending" (the status <br>
			field is below on this form).
		</font></TD>
	</tr>
	<%
}
%>
<%
if (h.get("Coord") != null)
{
%>
	<tr valign='top'><td align="right"><%=fontText%><b>Note:</b></FONT></TD>
	<td><%=fontText%>This person is a coordinator for: <%=h.get("Coord")%>. <BR>
	If they are going on a project be sure to assign them above. Otherwise this field is not required <BR>
	</font></TD></tr><%
} else { 
%>
<%
}
%>

<!-- 4-22-03 kl add 2 new features (SubmittedDate, IsPaid) for Adding Applicant -->

<tr valign='top'><td align="right"><%=font%><b>Submitted Date</b></font></TD><td><%=font%><INPUT TYPE=Text NAME="SubmittedDate" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("SubmittedDate"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Paid?</TD><td><%=font%><% selBoolean.setLabels("Yes","No");
	selBoolean.setName("IsPaid"); if (h.get("IsPaid")!=null){
	selBoolean.setCurrentValue(h.get("IsPaid").toString().equals("true"));} else {
	selBoolean.setCurrentValue(false);}%><%=selBoolean.printBoolean()%></FONT></TD></tr>
<tr valign='top'><td align="right"><%=fontText%><b>Note:</b></FONT></TD>
	<td><%=fontText%>
		To add an applicant from paper application and have them <br>
		available to a Team Roster give this person a submitted date. <br>
		Also adjust their Paid status here. This causes the applicant<br>
		to appear on the Ready to Evaluate list.
	</font></TD>
</tr>

<tr valign='top'><td height='4'colspan='2'>&nbsp; </td></tr>

<tr valign='top'><td colspan='2'><%=fontText%><b>More Personal Info</b></td></tr>
<tr valign='top'><td align="right"><%=font%><b>Previously Participated In A Crusade Project?</FONT></TD><td><% selBoolean.setLabels("Yes","No"); selBoolean.setName("PrevIsp"); if (h.get("PrevIsp")!=null){ selBoolean.setCurrentValue(h.get("PrevIsp").toString().equals("true"));}%><%=selBoolean.printBoolean()%></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>**Birth Date</b></font></TD><td><%=font%><INPUT TYPE=Text NAME="Birthdate" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("Birthdate"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Date Became A Christian</b></font></TD><td><%=font%><INPUT TYPE=Text NAME="DateBecameChristian" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("DateBecameChristian"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr>
<tr valign='top'><td align="right"><%=font%><b>*Marital Status</b></FONT></TD><td><%=font%><select name="MaritalStatus">
	<option value=""></option>
	<option value="S" <%=formHelp.select((String)h.get("MaritalStatus"),"S")%>>Single</option>
	<option value="M" <%=formHelp.select((String)h.get("MaritalStatus"),"M")%>>Married</option>
	<option value="D" <%=formHelp.select((String)h.get("MaritalStatus"),"D")%>>Divorced</option>
	<option value="P" <%=formHelp.select((String)h.get("MaritalStatus"),"P")%>>Separated</option>
	<option value="W" <%=formHelp.select((String)h.get("MaritalStatus"),"W")%>>Widowed</option></select></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Children Going Also?</FONT></TD><td><% selBoolean.setLabels("Yes","No"); selBoolean.setName("Child"); if (h.get("Child")!=null){ selBoolean.setCurrentValue(h.get("Child").toString().equals("true"));} else{ selBoolean.setCurrentValue("");}%><%=selBoolean.printBoolean()%> <%=fontTextS%> *Required field for married couples. Note: Children must be entered in this tool also.</FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>**University's Full Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="UniversityFullName" SIZE=20 MAXLENGTH=100 VALUE="<%=formHelp.value((String)h.get("UniversityFullName"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Major</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="Major" SIZE=20 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("Major"))%>" ></FONT><%=fontTextS%>If unknown enter "Undeclared"</TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Class</b></FONT></TD><td><%=font%><select name="YearInSchool">
	<option <%=formHelp.select((String)h.get("YearInSchool"),"Freshman")%>>Freshman</option>
	<option <%=formHelp.select((String)h.get("YearInSchool"),"Sophomore")%>>Sophomore</option>
	<option <%=formHelp.select((String)h.get("YearInSchool"),"Junior")%>>Junior</option>
	<option <%=formHelp.select((String)h.get("YearInSchool"),"Senior")%>>Senior</option>
	<option <%=formHelp.select((String)h.get("YearInSchool"),"Grad Student")%>>Grad Student</option>
	<option <%=formHelp.select((String)h.get("YearInSchool"),"Other")%>>Other</option></select></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Graduation Date</b></font></TD><td><%=font%><INPUT TYPE=Text NAME="GraduationDate" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("GraduationDate"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr>
<tr valign='top'><td colspan='2'><%=fontText%><b>Availability For Project</b></td></tr>
<tr valign='top'><td align="right"><%=font%><b>**Earliest Available Date</b></font></TD><td><%=font%><INPUT TYPE=Text NAME="EarliestAvailableDate" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("EarliestAvailableDate"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr>
<tr valign='top'><td align="right"><%=font%><b>**Date Must Return To School</b></font></TD><td><%=font%><INPUT TYPE=Text NAME="DateMustReturn" SIZE=10 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("DateMustReturn"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr>
<tr valign='top'><td colspan='2'><%=fontText%><b>Citizenship</b></td></tr>
<tr valign='top'><td align="right"><%=font%><b>US citizen</TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("UsCitizen"); if (h.get("UsCitizen")!=null){ selBoolean.setCurrentValue(h.get("UsCitizen").toString().equals("true"));} else {selBoolean.setCurrentValue(true);}%><%=selBoolean.printBoolean()%></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>If Not, Which Country</b></FONT></TD><td><%=font%><% selCountry.setName("Citizenship"); if (h.get("Citizenship")!=null){ selCountry.setCurrentValue((String)h.get("Citizenship"));}%><%=selCountry.print()%></FONT></TD></tr>

<tr valign='top'><td colspan='2'><%=fontText%><b>Forms</b></td></tr>
<tr valign='top'><td align="right"><%=font%><b>Application Complete?</TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("IsApplicationComplete"); if (h.get("IsApplicationComplete")!=null){ selBoolean.setCurrentValue(h.get("IsApplicationComplete").toString().equals("true"));} else { selBoolean.setCurrentValue(true);}%><%=selBoolean.printBoolean()%></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b><i>Applicant Status?</i></TD><td><%=font%><select name="Status">
	<option <%=formHelp.select((String)h.get("Status"),"Pending")%>>Pending</option>
	<%if (h.get("frompage")!=null){	%>
			<option selected>Accepted</option>
	<%} else {%>
			<option <%=formHelp.select((String)h.get("Status"),"Accepted")%>>Accepted</option>
	<%}%>
	<option <%=formHelp.select((String)h.get("Status"),"Withdrawn")%>>Withdrawn</option>
	<option <%=formHelp.select((String)h.get("Status"),"Declined")%>>Declined</option></select></FONT></TD></tr>
<tr><td></td></tr>
<tr valign='top'><td colspan='1'><%=fontText%><b>Skip Optional Info and Save:</b></td><td><input type='submit' value='Save'></td></tr>
<tr valign='top'><td colspan='2'><%=font%><b>Additional information follows that you can fill in.</b> <br> &nbsp;</TD></tr>

<tr valign='top'><td colspan='2'><%=fontTextL%><b>Optional Info</b></td></tr>
<tr valign='top'><td colspan='2'><%=fontText%><b>Passport and Visa</b></td></tr>
<tr valign='top'><td align="right"><%=font%><b>Passport Number</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="PassportNo" SIZE=20 MAXLENGTH=25 VALUE="<%=formHelp.value((String)h.get("PassportNo"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Passport Country</b></FONT></TD><td><%=font%><%=font%><% selCountry.setName("PassportCountry"); if (h.get("PassportCountry")!=null){ selCountry.setCurrentValue((String)h.get("PassportCountry"));}%><%=selCountry.print()%></FONT></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Passport Issue Date</b></font></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="PassportIssueDate" SIZE=9 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("PassportIssueDate"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Passport Expiration Date</b></font></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="PassportExpirationDate" SIZE=9 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("PassportExpirationDate"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Visa Number</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="VisaNo" SIZE=20 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("VisaNo"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Visa Country</b></FONT></TD><td><%=font%><%=font%><% selCountry.setName("VisaCountry"); if (h.get("VisaCountry")!=null){ selCountry.setCurrentValue((String)h.get("VisaCountry"));} %><%=selCountry.print()%></FONT></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Visa Issue Date</b></font></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="VisaIssueDate" SIZE=9 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("VisaIssueDate"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Visa Expiration Date</b></font></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="VisaExpirationDate" SIZE=9 MAXLENGTH=10 VALUE="<%=formHelp.value((String)h.get("VisaExpirationDate"))%>" ></FONT><%=fontTextS%>(mm/dd/yyyy)</TD>
<tr valign='top'><td align="right"><%=font%><b>Visa Type</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="VisaType" SIZE=20 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("VisaType"))%>" ></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Does The Visa Allow Multiple US Entry?</TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("VisaIsMultipleEntry"); if (h.get("VisaIsMultipleEntry")!=null){ selBoolean.setCurrentValue(h.get("VisaIsMultipleEntry").toString().equals("true"));}%><%=selBoolean.printBoolean()%></FONT></TD></tr>

<tr valign='top'><td colspan='2'><%=fontText%><b>Post Project</b></td></tr>
<tr valign='top'><td align="right"><%=font%><b>Did The Applicant Go?</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("DidGo"); if (h.get("DidGo")!=null){ selBoolean.setCurrentValue(h.get("DidGo").toString().equals("true"));}%><%=selBoolean.printBoolean()%></FONT></TD></tr>
<tr valign='top'><td align="right"><%=font%><b>Participant Evaluation Received?</b></FONT></TD><td><%=font%><% selBoolean.setLabels("Yes","No"); selBoolean.setName("ParticipantEvaluation"); if (h.get("ParticipantEvaluation")!=null){ selBoolean.setCurrentValue(h.get("ParticipantEvaluation").toString().equals("true"));}%><%=selBoolean.printBoolean()%></FONT></TD></tr>
</TABLE>
<p>
<%=hr%>
<p>
</form>
<%@ include file="wsnspfooter.jspf" %>
</HTML>