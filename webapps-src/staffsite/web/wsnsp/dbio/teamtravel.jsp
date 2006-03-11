<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = h.get("ProjectName") + " Team Information"; %>

<%@ include file="wsnspheader.jspf" %>

<center><%=fontXL%><%=h.get("ProjectName")%> &nbsp; <% if (h.get("PartnershipRegion")!=null){%><% selRegion.setCurrentValue((String)h.get("PartnershipRegion")); %></font><%=font%>(<%=selRegion.display()%> Partnership) <%}%></font></center><br>

<table width="100%">
<tr align="center">
	<td>

		<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
			<tr><td colspan='2'><%=fontText%><b>Travel Info</font></b></td><td colspan='2'><%=fontS%>&nbsp;</td></tr>

			<TR><td colspan='2'><%=font%><b>Outbound Gateway City</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("DestinationGatewayCity")%></td>
			</tr>
			
			<TR><td colspan='2'><%=font%><b>Outbound Flight Date</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("DepartDateFromGateCity")%></td>
			</tr>
			
			<TR><td colspan='2'><%=font%><b>International Gateway City</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("LocationGatewayCity")%></td>
			</tr>

			<TR><td colspan='2'><%=font%><b>Arrival Date at Location</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("ArrivalDateAtLocation")%></td>
			</tr>

			<TR><td colspan='2'><%=font%><b>Return Date from Location</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("DepartureDateFromLocation")%></td>
			</tr>

			<TR><td colspan='2'><%=font%><b>Arrival Date at Return Gateway City</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("ArrivalDateAtGatewayCity")%></td>
			</tr>

			<TR><td colspan='2'><%=font%><b>Flight Budget</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("FlightBudget")%></td>
			</tr>

			<TR><td colspan='2'><%=font%><b>Outbound Flight Numbers</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("GatewayCitytoLocationFlightNo")%></td>
			</tr>

			<TR><td colspan='2'><%=font%><b>Return Flight Numbers</b></FONT></TD>
			<td colspan='2'><%=fontS%><%=h.get("LocationToGatewayCityFlightNo")%></td>
			</tr>

			<tr><td colspan='4' align=center><%=font%><a href="/servlet/WsnSpController?action=defaultShowProj&view=showtravelinfo&id=<%=h.get("id")%>&wt=1">Edit Travel Info</a></td></tr>

		</table>
	
	</td>
	
	<td valign=top>

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

	</td>
</tr>
</table>

<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign="top"><td width="80%">
<%=fontTextL%><b>Team Roster</font></b></br>
<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top' align='center'><td><%=fontTextS%> &nbsp;</FONT></TD><td><%=fontTextS%><b>View</b></FONT></TD><td><%=fontText%>Passport<br>First Name</FONT></TD><td><%=fontText%>Passport<br>Last Name</td><td><%=fontText%>Passport #</td><td><%=fontText%>DOB</td><td><%=fontText%>Is Child?</td><td><%=fontText%>Is Staff?</td></tr>

<%	if (!h.containsKey("0")) {
		%>
		<tr><td> &nbsp; </td><td colspan=8><%=font%>There are currently no team members!</font></TH></tr>
		<%
	} else {
		Integer counter= new Integer(0);
		while (h.containsKey(counter.toString())){
			Hashtable app = (Hashtable)h.get(counter.toString());
			%>
			<tr align=center>
				<td><%=fontS%><b><%=counter.intValue()+1%></td>
				<td><%=fontS%>
					<a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=app.get("WsnApplicationID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a>
				</td>
				<td><%=fontS%><%=app.get("LegalFirstName")%></a>&nbsp;</td>
				<td><%=fontS%><%=app.get("LegalLastName")%></a>&nbsp;</td>
				<td><%=fontS%><%=app.get("PassportNo")%>&nbsp;</td>
				<td><%=fontS%><%=app.get("Birthdate")%>&nbsp;</td>
				<td><%=fontS%><%=app.get("IsChild")%>&nbsp;</td>
				<td><%=fontS%><%=app.get("IsStaff")%>&nbsp;</td>
			</tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
	}
	%>

</TABLE>


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
Note: If you have duplicate records for an applicant and need to have records deleted, please email <a href="mailto:wsn@uscm.org">wsn@uscm.org</a> with the applicant's name. To make sure the correct record gets deleted, you may want to change their first name to "Delete" before emailing us. You can do this by clicking on "View", then "Edit", and editing their first name and clicking "Save." This is only to eliminate duplicate records. If an applicant has withdrawn from a project, simply click "View," then "Edit,"  change the person's status to "withdrawn," and click "Save."
<BR><BR>
<%@ include file="wsnspfooter.jspf" %>

</HTML>
