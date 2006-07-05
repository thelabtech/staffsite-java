<%@ page import="org.alt60m.ministry.model.dbio.*, org.alt60m.wsn.sp.model.dbio.*, java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "View Personal Information"; %>

<%@ include file="wsnspheader.jspf" %>

<table border='0' width='100%'>
<tr valign='top'><td colspan='3'><%=fontTextXL%>View an Applicant</font> &nbsp; &nbsp; <%=fontXXL%><i><b><%=h.get("LegalFirstName")%>&nbsp;<%=h.get("LegalLastName")%></td>
<td colspan='2'> &nbsp; </td>

<!-- ------------TOOL BOX---------- -->
<td rowspan='7' colspan='2' align='center' nowrap>
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
<tr><td colspan='3'><%=fontText%>
	<form method="post" action="/servlet/WsnSpController">
	<input type='hidden' name="action" value='adminEditApp'>
	<input type='hidden' name="view" value='appinfo'>
	<input type='hidden' name="id" value='<%=h.get("WsnApplicationID")%>'>
<% //Start of protection code
	if (h.get("Evaluator").equals("Granted")) { // 2003-01-31: only people with Evaluator status get in
%>
	<B><A HREF="MSController?action=evalFormEdit&page=evalpersonschool&sendingpage=evalpersonschool&nextParm=evalpersonschool&WsnApplicationID=<%=h.get("WsnApplicationID")%>">Evaluate Applicant</A></B><P>

<% } //End of protection code %>

<%-- 4-24-03 kl: Commented Out section requiring SubmittedDate to Edit, added Edit button for everyone below
<%// if ((h.get("SubmittedDate") == null) && !(h.get("Role").equals("6"))){
	if (h.get("SubmittedDate") == null){
%>
	<p>
	<%=fontHLM%>This applicant has not submitted their application and cannot be edited.<font>
<% } else {
%>

	<input type='submit' value='Edit'><b> or Finish Application Entry</b></font>
	<p>
	<%=fontHLM%>If you wish to edit this person's record, click the "edit" button above.  Do not hit the back button on your browser.<font>
<% }
%>
--%>
	<input type='submit' value='Edit'><b> or Finish Application Entry</b></font>
	<p>
	<%=fontHLM%>If you wish to edit this person's record, click the "edit" button above.  Do not hit the back button on your browser.<font>

	</form>
</td></tr>

<tr><td colspan='1'><%=fontText%><b>Project Assignment</font></b></td><td><b><%=font%><% if (h.get("M") !=null) {selProj.setCurrentValue((String)h.get("M")); %><%=selProj.display()%>	<%}%> &nbsp;</b></td></tr>

<tr valign='top'><td colspan='2'><%=fontText%><b>Personal Information</td>							</tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Name</b></FONT></TD><td><%=font%><%=h.get("LegalFirstName")%>&nbsp;<%=h.get("LegalLastName")%></FONT></TD>
	<td> &nbsp; </td><td> <% if (h.get("MaritalStatus").equals("M")){ %><%=fontText%><b>Married to:</b><%}%></td></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Gender</b></FONT></TD><td><%=font%>		<% if (h.get("Gender").equals("1")){%>Male<%} else {%>Female<%}%></TD>
	<td> &nbsp; </td><td>
	<% if (h.get("MaritalStatus").equals("M")){ %><%=font%> &nbsp; 
		<% if (h.get("Spouse").equals("Unassigned")){
				%><a href='/servlet/WsnSpController?view=linkspouse&action=listSpouse&id=<%=h.get("WsnApplicationID")%>&FirstName=<%=h.get("LegalFirstName")%>&LastName=<%=h.get("LegalLastName")%>'><%=fontHLM%>You indicated this person is married.  Please click here to find the person's spouse.</font></a><%
			}
			else {%>
			<%=h.get("Spouse")%> <a href='/servlet/WsnSpController?view=linkspouse&action=listSpouse&id=<%=h.get("WsnApplicationID")%>&FirstName=<%=h.get("LegalFirstName")%>&LastName=<%=h.get("LegalLastName")%>'><%=fontS%><I>(change)</I></font></a>
			<%}%>

	<%}%></td></tr>

</tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Campus Region</b></FONT></TD><td><%=font%>		<%=h.get("Region")%></TD>
	<td> &nbsp; </td><td> <% if (h.get("Children").equals("true")){ %><%=fontText%><b>Children:</b><%}%></td></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Participant Role</b></FONT></TD><td><%=font%>	<% if (h.get("IsStaff").toString().equals("true")){%>Staff<%} else{ %>Student<%}%></TD>

	<td> &nbsp; </td><td rowspan='7'> <%
		if (h.get("Children").equals("true")){ %><%=font%> <% 
			if (!h.containsKey("0")) {
				if (h.get("Spouse").equals("Unassigned")){
				%>
				&nbsp;To add children you must first add this person's spouse to the system and associate them. 
				<%
				} else {
				%>
					<a href='/servlet/WsnSpController?view=showkids&action=showAddKids&id=<%=h.get("ShowKidsID")%>&FirstName=<%=h.get("LegalFirstName")%>&LastName=<%=h.get("LegalLastName")%>'><%=fontHLM%>You indicated this person's children are going on the project.  Please click here to enter their children.</font></a>
				<%
				}
			}
			else {
				Integer counter= new Integer(0);
				while (h.containsKey(counter.toString())){
					Hashtable app = (Hashtable)h.get(counter.toString());
					%>
					 &nbsp; <%=app.get("Name")%><br>
					<%
					counter=new Integer(counter.intValue()+1);
				}
			%>
				 &nbsp;  &nbsp; &nbsp;  &nbsp; <a href='/servlet/WsnSpController?view=showkids&action=showAddKids&id=<%=h.get("ShowKidsID")%>&FirstName=<%=h.get("LegalFirstName")%>&LastName=<%=h.get("LegalLastName")%>'><%=fontS%><I>(update)</I></font></a>
			<%
			}
			%>
			
	<%}%></td></tr>

<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Account Number</b><br><%=fontS%> &nbsp; &nbsp;</FONT></TD><td><%=font%><% if (h.get("ApplAccountNo")!=null) {%><%=h.get("ApplAccountNo")%><%}%></TD></tr>
<tr valign='top'><td colspan='2'><%=fontText%><b>Current Mailing Address</TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Street</b></FONT></TD><td><%=font%>		<%=h.get("CurrentAddress")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Street 2</b></FONT></TD><td><%=font%>		<%=h.get("CurrentAddress2")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;City, State Zip</b></FONT></TD><td><%=font%>	<%=h.get("CurrentCity")%>, <%=h.get("CurrentState")%>&nbsp;<%=h.get("CurrentZip")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Telephone</b></FONT></TD><td><%=font%>		<%=h.get("CurrentPhone")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Email</b></FONT></TD><td><%=font%>			<a href="mailto:<%=h.get("CurrentEmail")%>"><%=h.get("CurrentEmail")%></a></FONT></TD></tr>
<!-- <tr valign='top'><td><%//=font%><b>&nbsp;&nbsp;At this address until</b></FONT> <%//=fontTextS%>(mm/dd/yy)</TD><td><%//=font%><%//=h.get("DateAddressGoodUntil")%></FONT></TD></tr> -->
<tr valign='top'><td colspan='2'><%=fontText%><b>Parent's/Emergency Contact Address</TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Parents' Full Names</b></FONT></TD><td><%=font%>	<%=h.get("EmergName")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Street</b></FONT></TD><td><%=font%>		<%=h.get("EmergAddress")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;City, State Zip</b></FONT></TD><td><%=font%>	<%=h.get("EmergCity")%>,&nbsp;<%=h.get("EmergState")%>&nbsp;<%=h.get("EmergZip")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Telephone</b></FONT></TD><td><%=font%>		<%=h.get("EmergPhone")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Work Phone</b></FONT></TD><td><%=font%>		<%=h.get("EmergWorkPhone")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Email</b></FONT></TD><td><%=font%><% if (h.get("EmergEmail")!=null) {%><%=h.get("EmergEmail")%><%}%></FONT></TD></tr>
<tr valign='top'><td height='4'colspan='2'> &nbsp;</td></tr>
<tr valign='top'><td colspan='2'><%=fontText%><b>More Personal Info</b></td></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Birth Date</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><%=h.get("Birthdate")%></FONT></TD><td> &nbsp; </td><td align="right" rowspan='2'><%=font%><b>&nbsp;&nbsp;Previously participated in a Crusade Project?</FONT></TD><td> &nbsp; </td><td><%=font%><%=h.get("PrevIsp")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Date Became a Christian</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><%=h.get("DateBecameChristian")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Marital Status</b></FONT></TD><td><%=font%><%=WsnPerson.translateMaritalStatus((String)h.get("MaritalStatus"))%></FONT></TD><td> &nbsp; </td><td align="right"><%=font%><b>&nbsp;&nbsp;Children Going Also?</FONT></TD><td> &nbsp; </td><td><%=font%><%=h.get("Child")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;University's Full Name</b></FONT></TD><td><%=font%><%=h.get("UniversityFullName")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Major</b></FONT></TD><td><%=font%><%=h.get("Major")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Class</b></FONT></TD><td><%=font%><%=h.get("YearInSchool")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Graduation Date</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><%=h.get("GraduationDate")%></FONT></TD></tr>
<tr valign='top'><td colspan='2'><%=fontText%><b>Availability for project and Forms</b></td></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Earliest Available Date</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><%=h.get("EarliestAvailableDate")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Date Must Leave For School</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><%=h.get("DateMustReturn")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Insurance Form Received by HQ?</b></FONT></TD><td><%=font%><%=h.get("InsuranceReceived")%></FONT></td><td><%=fontS%> &nbsp; <a href='#' onClick='window.open("/wsnsp/dbio/popupinsurance.jsp","plain","scrollbars,width=350,height=200");'>Insurance Info</a></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Waiver Received by HQ?</b></FONT></TD><td><%=font%><%=h.get("WaiverReceived")%></FONT> </td><td><%=fontS%> &nbsp; <a href='#' onClick='window.open("/wsnsp/dbio/popupwaiver.jsp","plain","scrollbars,width=350,height=200");'>Waiver Info</a></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Applicant Status</TD><td><%=font%><%=h.get("Status")%></FONT></TD></tr>
<tr valign='top'><td colspan='2'><%=fontText%><b>Citizenship</b></td></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;US citizen</TD><td><%=font%><%=h.get("UsCitizen")%></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;If Not, which country</b></FONT></TD><td><%=font%><% if (h.get("Citizenship")!=null){ selCountry.setCurrentValue((String)h.get("Citizenship")); %><%=selCountry.display()%><%;}%> &nbsp; </td><td> &nbsp; </td><td align='right'><%=font%> <b>Multiple US Visa entry?</b> <td> &nbsp; </td><td><%=font%><%=h.get("VisaIsMultipleEntry")%></FONT></TD></tr>
</TABLE>

<form method="post" action="/servlet/WsnSpController">
<input type='hidden' name="action" value='adminEditApp'>
<input type='hidden' name="view" value='appinfo'>
<input type='hidden' name="id" value='<%=h.get("WsnApplicationID")%>'>
<!--added 3/3/3 Edit Application link --><B><A HREF="MSController?action=appFormEditOverride&WsnApplicationID=<%=h.get("WsnApplicationID")%>&UserEmail=<%=h.get("CurrentEmail")%>" target='_blank'>Login to Application as Student</A></B>
</form>
<p>


<%@ include file="wsnspfooter.jspf" %>

<%
//for (Enumeration e = h.keys(); e.hasMoreElements();) {
//	String k = (String) e.nextElement();
//	out.println("key: " + k + " value: " + h.get(k) + " <br>");
//}
%>


</HTML>