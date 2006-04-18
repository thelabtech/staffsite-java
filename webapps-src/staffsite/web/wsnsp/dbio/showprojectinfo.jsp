<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*,java.text.SimpleDateFormat" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>

<%  Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Project Information"; %>

<%@ include file="wsnspheader.jspf" %>

<table width='100%'>
<tr><td>
<center><%=fontXXL%><I><%=h.get("Name")%> Information</I></font></center></td>
<td>&nbsp;  </td>

<!-- ------------TOOL BOX---------- -->
<td rowspan='7' align='right' width='130' nowrap>
<%=fontTextL%><b>Available Tools</font></b><br>
	<table  border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=<%=session.getValue("MyHomeAction")%>"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=appinfo"><IMG SRC="/wsnsp/images/wsn_addapp.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Applicant"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=staffappsearch"><IMG SRC="/wsnsp/images/wsn_addstaff.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Staff"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistapps.jsp"><IMG SRC="/wsnsp/images/wsn_searchpeople.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Applicant"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistprojects.jsp"><IMG SRC="/wsnsp/images/wsn_searchproj.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Projects"></a></TD></tr>
	</TABLE>
</td>
<td rowspan='7' align='center' width='140' nowrap>
	<%=fontTextL%><b>Links</font></b><br>
	<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top'><td colspan=2><%=fontTextM%><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><A HREF="/servlet/CmsController?action=browse&catID=1000029" target='_blank'>Resource Center</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
	</TABLE>
</td></tr>
</table>

<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign="top"><td>
<%=fontTextL%><b>Basic Info</font></b><br /><%=fontTextS%>&nbsp;&nbsp;&nbsp;&nbsp;(Dates are in mm/dd/yyyy format)<br />
<table width='100%' border='0'>
<%
String pt = (String)h.get("ProjectType");
String ptString = "(unspecified project type)";
if (pt != null) {
	if (pt.equalsIgnoreCase("u")) ptString = "U.S. Summer Project";
	else if (pt.equalsIgnoreCase("w")) ptString = "W.S.N. Summer Project";
	else if (pt.equalsIgnoreCase("r")) ptString = "Regional Summer Project";
	else if (pt.equalsIgnoreCase("s")) ptString = "School of Leadership";	
	else if (pt.equalsIgnoreCase("i")) ptString = "Institute of Biblical Studies (IBS)";
	else if (pt.equalsIgnoreCase("p")) ptString = "Partnership Ministry";
}
%>
<% if (h.get("StudentStartDate") != null) h.put("StudentStartDate",new SimpleDateFormat("MM/dd/yyyy").format((Date)h.get("StudentStartDate")));
if (h.get("StudentEndDate") != null) h.put("StudentEndDate",new SimpleDateFormat("MM/dd/yyyy").format((Date)h.get("StudentEndDate")));
if (h.get("StaffStartDate") != null) h.put("StaffStartDate",new SimpleDateFormat("MM/dd/yyyy").format((Date)h.get("StaffStartDate")));
if (h.get("StaffEndDate") != null) h.put("StaffEndDate",new SimpleDateFormat("MM/dd/yyyy").format((Date)h.get("StaffEndDate"))); %>
<TR><td><%=font%><b>&nbsp;&nbsp;Project Name</b></FONT></TD><td><%=font%><%=h.get("Name")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Project Type</b></FONT></TD><td><%=font%><%=ptString%></FONT></TD></tr>
<TR><td><%=font%><b><nobr>&nbsp;&nbsp;Student Start Date</nobr></b></FONT></TD><td><%=font%><%=h.get("StudentStartDate")%></FONT></TD></tr>
<TR><td><%=font%><b><nobr>&nbsp;&nbsp;Student End Date</nobr></b></FONT></TD><td><%=font%><%=h.get("StudentEndDate")%></FONT></TD></tr>
<TR><td><%=font%><b><nobr>&nbsp;&nbsp;Staff Start Date</nobr></b></FONT></TD><td><%=font%><%=h.get("StaffStartDate")%></FONT></TD></tr>
<TR><td><%=font%><b><nobr>&nbsp;&nbsp;Staff End Date</nobr></b></FONT></TD><td><%=font%><%=h.get("StaffEndDate")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;City</b></FONT></TD><td><%=font%><%=h.get("City")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Country</b></FONT></TD><td><%=font%><%=h.get("Country")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Display Location</b></FONT></TD><td><%=font%><%=h.get("DisplayLocation")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Status</b></FONT></TD><td><%=font%><% if (h.get("Secure").toString().equals("true")) {%>Open/Secure Country<%} else {%>Closed/Insecure Country<%}%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;AOA</b></FONT></TD><td><%=font%><%=h.get("AOA")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Sending Region</b></FONT></TD><td><%=font%><% if (h.get("PartnershipRegion")!=null){ selRegion.setCurrentValue((String)h.get("PartnershipRegion"));%><%=selRegion.display()%><%}%></TD></tr>
<TR><td colspan="2"><%=font%>&nbsp;&nbsp;</font></TD></tr>
<TR><td colspan="2"><%=font%><h3>Operating Account Information</h3></font></TD></tr>
<TR><td colspan="2">
	<table width="100%" border="0" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr><td><%=font%><b>Business Unit</b></FONT></td>
	<td><%=font%><b>Operating Unit</b></FONT></td>
	<td><%=font%><b>Dept. ID</b></FONT></td>
	<td><%=font%><b>Project ID</b></FONT></td>
	<td><%=font%><b>Operating<br>Designation</b></FONT></td>
	</tr>
	<tr><td><%=font%><%=h.get("OperatingBusinessUnit")%></FONT></td>
	<td><%=font%><%=h.get("OperatingOperatingUnit")%></FONT></td>
	<td><%=font%><%=h.get("OperatingDeptID")%></FONT></td>
	<td><%=font%><%=h.get("OperatingProjectID")%></FONT></td>
	<td><%=font%><%=h.get("OperatingDesignation")%></FONT></td>
	</tr>
	</table>
</TD></TR>
<TR><td colspan="2"><%=font%>&nbsp;&nbsp;</font></TD></tr>
<TR><td colspan="2"><%=font%><h3>Scholarship Account Information</h3></font></TD></tr>
<TR><td colspan="2">
	<table width="100%" border="0" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr><td><%=font%><b>Business Unit</b></FONT></td>
	<td><%=font%><b>Operating Unit</b></FONT></td>
	<td><%=font%><b>Dept. ID</b></FONT></td>
	<td><%=font%><b>Project ID</b></FONT></td>
	<td><%=font%><b>Scholarship<br>Designation</b></FONT></td>
	</tr>
	<tr><td><%=font%><%=h.get("ScholarshipBusinessUnit")%></FONT></td>
	<td><%=font%><%=h.get("ScholarshipOperatingUnit")%></FONT></td>
	<td><%=font%><%=h.get("ScholarshipDeptID")%></FONT></td>
	<td><%=font%><%=h.get("ScholarshipProjectID")%></FONT></td>
	<td><%=font%><%=h.get("ScholarshipDesignation")%></FONT></td>
	</tr>
	</table>
</TD></TR>
<TR><td colspan="2"><%=font%>&nbsp;&nbsp;</font></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Staff Cost</b></FONT></TD><td><%=font%>$<%=h.get("StaffCost")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Student Cost</b></FONT></TD><td><%=font%>$<%=h.get("StudentCost")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Intern Cost</b></FONT></TD><td><%=font%>$<%=h.get("InternCost")%></FONT></TD></tr>
<TR><td colspan="2"><%=font%><b><nobr>&nbsp;&nbsp;<%=h.get("OnHold").toString().equals("true") ? "This project is on hold." : "This project is not on hold."%></nobr></b></FONT></TD></tr>
</TABLE><br />
<%=fontTextL%><b>Travel Info</font></b></br>
<table width='100%' border='0'>
<TR><td><%=font%><b>&nbsp;&nbsp;<nobr>US City you are Departing From</nobr></b></FONT></TD><td><%=font%><%=h.get("DestinationGatewayCity")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;<nobr>Date of Departure from the US</nobr></b></FONT></TD><td><%=font%><%=h.get("DepartDateFromGateCity")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;<nobr>International City you are Flying To</nobr></b></FONT></TD><td><%=font%><%=h.get("LocationGatewayCity")%></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;<nobr>Date of Return to the US</nobr></b></FONT></TD><td><%=font%><%=h.get("ArrivalDateAtGatewayCity")%></FONT></TD></tr>
</TABLE>
</td>
<td>
<table width='100%' border='0'>
<tr><td colspan='2'><%=fontTextL%><b>Project Leaders</font></b></td><td><%=fontS%>Email</td><td><%=fontS%>View</td></tr>
<% String strPD = (String)h.get("PD"); %>
<TR><td><%=font%><b>&nbsp;&nbsp;Project Director</b></font></td>
	<% if (strPD != null && !strPD.equals("-")) { %>
		<td><%=font%><%=h.get("PD")%></font></td><td><%=font%><a href="mailto:<%=h.get("PDEmail")%>"><img src='/wsnsp/images/mailbox.gif' border='0'></a> </font></td><td><%=font%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=h.get("PDid")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a></font></td>
	<%} else {%>
		<td><%=font%><%=h.get("PD")%></font></td><td><%=font%>&nbsp;-&nbsp;</font></td><td><%=font%>&nbsp;-&nbsp;</font></td>
	<%}%>
</tr>
<% String strAPD = (String)h.get("APD"); %>
<TR><td><%=font%><b>&nbsp;&nbsp;Associate PD</b></font></td>
	<% if (strAPD != null && !strAPD.equals("-")) { %>
		<td><%=font%><%=h.get("APD")%></font></td><td><%=font%><a href="mailto:<%=h.get("APDEmail")%>"><img src='/wsnsp/images/mailbox.gif' border='0'></a></font></td><td><%=font%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=h.get("APDid")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a></font></td>
	<%} else {%>
		<td><%=font%><%=h.get("APD")%></font></td><td><%=font%>&nbsp;-&nbsp;</font></td><td><%=font%>&nbsp;-&nbsp;</font></td>
	<%}%>
</tr>
<% String strCoord = (String)h.get("Coord"); %>
<TR><td><%=font%><b>&nbsp;&nbsp;Coordinator</b></font></td>
	<% if (strCoord != null && !strCoord.equals("-")) { %>
		<td><%=font%><%=h.get("Coord")%></font></td><td><%=font%><a href="mailto:<%=h.get("CoordEmail")%>"><img src='/wsnsp/images/mailbox.gif' border='0'></a></font></td><td><%=font%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=h.get("Coordid")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a></font></td>
	<%} else {%>
		<td><%=font%><%=h.get("Coord")%></font></td><td><%=font%>&nbsp;-&nbsp;</font></td><td><%=font%>&nbsp;-&nbsp;</font></td>
	<%}%>
</tr>
<TR><td></TD><td align=right colspan=3><%=font%><A HREF="/servlet/WsnSpController?view=projectinfoleaders&action=showProj&id=<%=h.get("WsnProjectID")%>">Change Leaders</A></FONT></TD></tr>
</TABLE>

<%=fontTextL%><b>Other Info</font></b><br>
<table width='100%' border='0'>
<!-- <TR><td><%=font%><b>&nbsp;&nbsp;CAPS fee paid</b></FONT></TD><td><%=font%><%=h.get("CAPSFeePaid")%></FONT></TD></tr> -->
<TR><td><%=font%><b>&nbsp;&nbsp;Admin fee paid</b></FONT></TD><td><%=font%><%=h.get("AdminFeePaid")%></FONT></TD></tr>
</TABLE><br />
<%=fontTextL%><b>Size Requirements</b></FONT><br />
<div style="text-align: center;">
<table cellpadding="2" cellspacing="0" border="1">
<tr>
	<td>&nbsp;</td>
	<td><%=font%>Single<br />Men</font></td>
	<td><%=font%>Single<br />Women</font></td>
	<td><%=font%>Couples</font></td>
	<td><%=font%>Families</font></td>
	<td><%=font%>Total<br />Adults</font></td>
</tr>
<tr>
	<td><%=font%>Max # Staff Participants</font></td>
	<td><%=(Integer)h.get("MaxNoStaffMale")%></td>
	<td><%=(Integer)h.get("MaxNoStaffFemale")%></td>
	<td><%=(Integer)h.get("MaxNoStaffCouples")%></td>
	<td><%=(Integer)h.get("MaxNoStaffFamilies")%></td>
	<td><%=(Integer)h.get("MaxNoStaff")%></td>
</tr>
<tr>
	<td><%=font%>Max # Intern Applicants</font></td>
	<td><%=(Integer)h.get("MaxNoInternAMale")%></td>
	<td><%=(Integer)h.get("MaxNoInternAFemale")%></td>
	<td><%=(Integer)h.get("MaxNoInternACouples")%></td>
	<td><%=(Integer)h.get("MaxNoInternAFamilies")%></td>
	<td><%=(Integer)h.get("MaxNoInternA")%></td>
</tr>
<tr>
	<td><%=font%>Max # Intern Participants</font></td>
	<td><%=(Integer)h.get("MaxNoInternPMale")%></td>
	<td><%=(Integer)h.get("MaxNoInternPFemale")%></td>
	<td><%=(Integer)h.get("MaxNoInternPCouples")%></td>
	<td><%=(Integer)h.get("MaxNoInternPFamilies")%></td>
	<td><%=(Integer)h.get("MaxNoInternP")%></td>
</tr>
<tr>
	<td><%=font%>Max # Student Applicants</font></td>
	<td><%=(Integer)h.get("MaxNoStudentAMale")%></td>
	<td><%=(Integer)h.get("MaxNoStudentAFemale")%></td>
	<td><%=(Integer)h.get("MaxNoStudentACouples")%></td>
	<td><%=(Integer)h.get("MaxNoStudentAFamilies")%></td>
	<td><%=(Integer)h.get("MaxNoStudentA")%></td>
</tr>
<tr>
	<td><%=font%>Max # Student Participants</font></td>
	<td><%=(Integer)h.get("MaxNoStudentPMale")%></td>
	<td><%=(Integer)h.get("MaxNoStudentPFemale")%></td>
	<td><%=(Integer)h.get("MaxNoStudentPCouples")%></td>
	<td><%=(Integer)h.get("MaxNoStudentPFamilies")%></td>
	<td><%=(Integer)h.get("MaxNoStudents")%></td>
</tr>
</table>
</div>

<p>

<table width="100%" border="0">
	<tr>
		<td colspan="2"><%=fontTextL%><b>State-Side Contact Information</b></font></td>
	</tr>
	<tr> 
		<td><%=font%>Name</font></td><td><%=font%><%=h.get("StatesideContactName")%></font></td>
	</tr>
	<tr>
		<td><%=font%>Project Role</font></td><td><%=font%><%=h.get("StatesideContactProjectRole")%></font></td>
	</tr>
	<tr>
		<td><%=font%>Phone</font></td><td><%=font%><%=h.get("StatesideContactPhone")%></font></td>
	</tr>
	<tr>
		<td><%=font%>Email</font></td><td><%=font%><%=h.get("StatesideContactEmail")%></font></td>
	</tr>
</table>

<p>

<center>
<A HREF="/servlet/WsnSpController?view=team&action=showTeam&id=<%=h.get("WsnProjectID")%>"">View Team Roster and Tools</A><br>
<A HREF="/servlet/WsnSpController?view=showtravelinfo&action=defaultShowProj&id=<%=h.get("WsnProjectID")%>">Go to Travel Page</A><br>
<A HREF="/servlet/WsnSpController?view=projectinfo&action=showProj&id=<%=h.get("WsnProjectID")%>">Edit this Project's Information</A><br>
<A HREF="/servlet/WsnSpController?view=listquestions&action=listQuestions&id=<%=h.get("WsnProjectID")%>">Edit Project Specific Application Questions</A><br>
<A HREF="/servlet/WsnSpController?view=projectinfoleaders&action=showProj&id=<%=h.get("WsnProjectID")%>">Change this Project's Leaders</A><br>
</center>

</td></tr>
</table>


<%@ include file="wsnspfooter.jspf" %>

<%
//for (Enumeration e = h.keys(); e.hasMoreElements();) {
//	String k = (String) e.nextElement();
//	out.println("key: " + k + " value: " + h.get(k) + " <br>");
//}
%></HTML>