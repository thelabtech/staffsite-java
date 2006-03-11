<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>

<% Hashtable h = (Hashtable) session.getValue("tub");
    Collection ready = (Collection)h.get("Ready");
    Collection notReady = (Collection)h.get("NotReady");
	String usableAcctBalString = "";
	String fullAcctBalString = "";
//	Double db1 = new Double("0.00");
//	double usableAcctBal;
//	double fullAcctBal;
	double constant95 = 0.95;
%>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = h.get("ProjectName") + " Team Information"; %>

<%@ include file="wsnspheader.jspf" %>

<table width="100%">
<tr align="center"><td>
<!--	// 2-13-02 kl: New Table contains Project name -->
	<table width="100%">
		<tr><td>
		<center><%=fontXL%><%=h.get("ProjectName")%> &nbsp; 
		<% if (h.get("PartnershipRegion")!=null) { %>
			<% selRegion.setCurrentValue((String)h.get("PartnershipRegion")); %>
			<%=font%>(<%=selRegion.display()%> Partnership) 
		<% } %>
		</font></center>
		</td></tr>
		</table>
<!--	// 2-13-02 kl: This table was added for counting Applicants and Participants -->
<table width="60%" border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr>
		<td colspan=4 align=center>&nbsp;</td>
		<td align=center><%=fontS%>Men</td>
		<td align=center><%=fontS%>Women</td>
		<td align=center><%=fontS%>Total</td>
	</tr>
	<tr>
		<td colspan=4 align=center><%=fontS%>Staff/Interns</font></td>
		<td align=center><%=font%><b><%=h.get("MaleStaff")%></b></font></td>
		<td align=center><%=font%><b><%=h.get("FemaleStaff")%></b></font></td>
		<td align=center><%=font%><b><%=h.get("TotalStaff")%></b></font></td>
	</tr>
	<tr>
		<td colspan=4 align=center><%=fontS%>Applicants</font></td>
		<td align=center><%=font%><b><%=h.get("MaleApplicants")%></b></font></td>
		<td align=center><%=font%><b><%=h.get("FemaleApplicants")%></b></font></td>
		<td align=center><%=font%><b><%=h.get("TotalApplicants")%></b></font></td>
	</tr>
	<tr>
		<td colspan=4 align=center><%=fontS%>Participants</font></td>
		<td align=center><%=font%><b><%=h.get("MaleParticipants")%></b></font></td>
		<td align=center><%=font%><b><%=h.get("FemaleParticipants")%></b></font></td>
		<td align=center><%=font%><b><%=h.get("TotalParticipants")%></b></font></td>
	</tr>
</table>
<!--	// 2-13-02 kl: End of added code for counting Applicants and Participants -->
<td>
<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr><td colspan='2'><%=fontText%><b>Project Leaders</font></b></td><td><%=fontS%>Email</td><td><%=fontS%>View</td></tr>

<%	if (!h.containsKey("PD")) {		%>
		<tr><td><%=font%><b>PD</b></FONT></TD><td colspan=8 align=center><%=fontS%>No Director Assigned!!</font></TH></tr>
		<%
	}
	else {
		Hashtable PD = (Hashtable)h.get("PD");
			%>
			<TR><td><%=font%><b>PD</b></FONT></TD>
			<td><%=fontS%><%=PD.get("Name")%></td>
			<td><%=fontS%><a href="mailto:<%=PD.get("CurrentEmail")%>"><img src='/wsnsp/images/mailbox.gif' border='0'></a> </td>
			<td><%=fontS%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=PD.get("WsnApplicationID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a></FONT></TD>
			</tr>
			<%
	}
	if (!h.containsKey("APD")) {
		%>
		<tr><td><%=font%><b>APD</b></FONT></TD><td colspan=8 align=center><%=fontS%>No APD Assigned!</font></TH></tr>
		<%
	} else {
		Hashtable APD = (Hashtable)h.get("APD");
			%>
			<TR><td><%=font%><b>APD</b></FONT></TD>
			<td><%=fontS%><%=APD.get("Name")%></td>
			<td><%=fontS%><a href="mailto:<%=APD.get("CurrentEmail")%>"><img src='/wsnsp/images/mailbox.gif' border='0'></a> </td>
			<td><%=fontS%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=APD.get("WsnApplicationID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a></FONT></TD>
			</tr>
			<%
	}
	if (!h.containsKey("Coord")) {
		%>
		<tr><td><%=font%><b>Coord</b></FONT></TD><td colspan=8 align=center><%=fontS%>No Coordinator Assigned!</font></TH></tr>
		<%
	} else {
		Hashtable Coord = (Hashtable)h.get("Coord");
			%>
			<TR><td><%=font%><b>Coord</b></FONT></TD>
			<td><%=fontS%><%=Coord.get("Name")%></td>
			<td><%=fontS%><a href="mailto:<%=Coord.get("CurrentEmail")%>"><img src='/wsnsp/images/mailbox.gif' border='0'></a> </td>
			<td><%=fontS%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=Coord.get("WsnApplicationID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a></FONT></TD>
			</tr>
		<%
	}
%>
</table>

</td></tr>
</table>


<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign="top"><td width="80%">

<% for(int roster=0; roster<2; roster++) {
    Collection currentRoster = ((roster==0)?ready:notReady);
%>
	<%=fontTextL%><b>Team Roster</b> - 
		<% if (roster==0) { %>
			Ready To Evaluate<br><small><small>(Application submitted, paid, and all references submitted)</small></small>
		<% } else { %>
			Not Ready To Evaluate<br><small><small>(Application submitted but not paid or not all references submitted)</small></small>
		<% } %>
	</font></br>
	<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr valign='top' align='center'>
		<td><%=fontText%><b>Email</b></FONT></TD>
		<td><%=fontText%>Name<br><%=fontTextS%>click to view</FONT></TD>
		<td><%=fontText%>Status</td>
		<td><%=fontText%>Acct#</td>
		<td><%=fontText%>Summer Intern</td>
		<td><%=fontText%>Acct Balance (100%/95%)</td>
		<td><%=fontText%>Campus</td>
		<td><%=fontText%>Passport?</td>
		<td><%=fontText%>Visa?</td>
		<td><a href='#' onClick='window.open("/wsnsp/dbio/popupwaiver.jsp","plain","scrollbars,width=350,height=200");'><%=fontText%>Waiver?</a></td>
		<td><a href='#' onClick='window.open("/wsnsp/dbio/popupinsurance.jsp","plain","scrollbars,width=350,height=200");'><%=fontText%>Insurance Form</a>?</td>
	</tr>
	 <%
		if (currentRoster.isEmpty()) {
			%>
			<tr><td> &nbsp; </td><td colspan=10><%=font%>There are currently no team members!</font></TH></tr>
			<%
		} else {
			int counter = 0;
			Iterator i = currentRoster.iterator();
			while (i.hasNext()) {
				counter = counter + 1;
				Hashtable app = (Hashtable)i.next();

//				String tmpValue = (String)app.get("SupportBalance");
//				usableAcctBalString = tmpValue.substr(String)app.get("SupportBalance");
//				System.out.println("usableAcctBalString" + usableAcctBalString);
//				Double db1 = Double.valueOf((String)app.get("SupportBalance"));
//				double usableAcctBal = db1.doubleValue();


				//usableAcctBal = (Double)app.get("SupportBalance");
				//Float.parseFloat(usableAcctBalString)
				//usableAcctBal = new Double(usableAcctBalString);
				//usableAcctBal = Float.valueOf(amount).floatValue();
				//Double.valueOf(usableAcctBalString).doubleValue();
			//	double fullAcctBal = usableAcctBal / constant95;
			//	Double d = new Double(fullAcctBal);
			//	fullAcctBalString = String.valueOf(fullAcctBal);
				%>
				<tr align=center>
					<td><%=fontS%><%=counter%> <a href="mailto:<%=app.get("CurrentEmail")%>"><img src='/images/small_mail.gif' border='0'></a></td>
					<td><%=fontS%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=app.get("WsnApplicationID")%>"><%=app.get("Name")%></a>&nbsp;</td>
					<td><%=fontS%><%=app.get("Status")%>&nbsp;</td>
					<td><%=fontS%><%=app.get("ApplAccountNo")%>&nbsp;</td>
					<td><%=fontS%><%=app.get("SummerIntern")%>&nbsp;</td>
					<td><%=fontS%><%=app.get("FullSupportBalance")%>&nbsp;/&nbsp;<%=app.get("UsableSupportBalance")%></td>
					<td><%=fontS%><%=app.get("UniversityFullName")%>&nbsp;</td>
					<td><%=fontS%><%=app.get("PassportNo")%>&nbsp;</td>
					<td><%=fontS%><%=app.get("VisaNo")%>&nbsp;</td>
					<td><%=fontS%><%=app.get("WaiverReceived")%>&nbsp;</td>
					<td><%=fontS%><%=app.get("InsuranceReceived")%>&nbsp;</td>
				</tr>
				<%
			}
		}
		%>

	</TABLE><BR>
<% } %>

</td>
<td align='center'>
<%=fontTextL%><b>Available Tools</font></b><br>
<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=<%=session.getValue("MyHomeAction")%>"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?view=showprojectinfo&action=showProj&id=<%=h.get("id")%>"><IMG SRC="/wsnsp/images/wsn_viewproject.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="ProjectInfo"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=appinfo"><IMG SRC="/wsnsp/images/wsn_addapp.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Applicant"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=staffappsearch"><IMG SRC="/wsnsp/images/wsn_addstaff.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Staff"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistapps.jsp"><IMG SRC="/wsnsp/images/wsn_searchpeople.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Applicant"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistprojects.jsp"><IMG SRC="/wsnsp/images/wsn_searchproj.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Projects"></a></TD></tr>
<tr valign='top'><td colspan=2><FORM ACTION="/wsnsp/dbio/composeemail.jsp" NAME="email" METHOD="post"><input type=hidden name="EmailList" value="<%=h.get("emailList")%>"><input type=hidden name="fromPage" value="showTeam"><input type=hidden name="id" value="<%=h.get("id")%>"><input type=hidden name="view" value="team"><A HREF="JavaScript: email.submit()"><IMG SRC="/wsnsp/images/wsn_emailteam.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Email Team"></a></td></tr></form>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=makeDownload&view=download&id=<%=h.get("id")%>"><IMG SRC="/wsnsp/images/wsn_getteamdb.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Get Team DB"></a></TD></tr>
	</TABLE>
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
<BR><BR>
Note: If you have duplicate records for an applicant and need to have records deleted, 
please email <a href="mailto:wsn@uscm.org">wsn@uscm.org</a> with the applicant's name. 
To make sure the correct record gets deleted, you may want to change their first name to 
"Delete" before emailing us. You can do this by clicking on "View", then "Edit", and 
editing their first name and clicking "Save." This is only to eliminate duplicate records. 
If an applicant has withdrawn from a project, simply click "View," then "Edit,"  change 
the person's status to "withdrawn," and click "Save."
<BR><BR>
<%@ include file="wsnspfooter.jspf" %>

</HTML>
