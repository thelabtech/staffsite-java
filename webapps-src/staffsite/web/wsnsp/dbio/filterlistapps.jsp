<%@ page import="org.alt60m.ministry.model.dbio.*, org.alt60m.hr.ms.servlet.dbio.*, java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>

<% //Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "People - (Search Tool)"; %>
<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="listApps">
<input type="hidden" name="view" value="listapps">

<table width='100%' border='0'>
<TR VALIGN=TOP><td><%=font%><%=searchSubmit%></TD><td> &nbsp; </td><td rowspan=6><%=font%>
	<ul>	<B>Notes:</B><p>
		Capitalization is important.<p>
		For text fields you only need to put in the first few
		letters if you are not completely sure of the details.<p>
	</ul></FONT></TD>
	<td colspan='1'> &nbsp; </td>

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
	<table width='140' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top'><td colspan=2><%=fontTextM%><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><A HREF="/servlet/CmsController?action=browse&catID=1000029" target='_blank'>Resource Center</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
	</TABLE>
</td>

	</tr>

<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;First Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LegalFirstName" SIZE=20 MAXLENGTH=50 VALUE="" ></FONT></TD></tr>
<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;Last Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LegalLastName" SIZE=20 MAXLENGTH=50 VALUE="" ></FONT></TD></tr>

<tr valign='top'><td align="right"><%=font%><b>&nbsp;&nbsp;Applicant Role</TD><td><%=font%><select name="Admin">
	<option value="">All</option>
	<option value="1">Student / Project Staff</option>
	<option value="5">Regional Director/Site User</option>
	<option value="4">Coordinator</option>
	<option value="3">PD</option>
	<option value="2">APD</option>
	</select></FONT></TD></tr><br>

<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;Gender</b></FONT></TD><td><%=font%><select name="Gender"><option><option value="1">Male<option value="0">Female</select></TD></tr>
<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;Staff or Student?</b></FONT></TD><td><%=font%><select name="IsStaff" ><option selected></option><option value="1" >Staff</option><option value="0">Student</option></select></TD></tr>
<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;University Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="University" SIZE=20 MAXLENGTH=50 VALUE="" ></FONT></TD></tr>
<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;Participant's Region</b></FONT></TD><td><%=font%><% selRegion.setName("Region"); %><%=selRegion.print()%></TD></tr>
<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;City</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="City" SIZE=20 MAXLENGTH=30 VALUE="" ></FONT></TD></tr>
<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;State</b></FONT></TD><td><%=font%><% selState.setName("State"); %><%=selState.print()%></TD></tr>
<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;Account #</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="ApplAccountNo" SIZE=20 MAXLENGTH=50 VALUE="" ></FONT></TD></tr>
<tr><td colspan=3><%=hr%></td></tr>
<TR VALIGN=TOP><td colspan=2><%=fontTextL%><b>Project Preference</font></b></td><td rowspan=2><%=font%>
	<ul>	This will search all 5 project preferences (not just the first choice).<p>
	</ul></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Preferred Project</b></FONT></TD><td><%=font%><% selProj.setName("Project"); %><%=selProj.print()%></TD></tr>
<tr><td colspan=3><%=hr%></td></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Applicant Status</TD><td><%=font%><select name="Status">
	<option></option>
	<option>Pending</option>
	<option>Accepted</option>
	<option>Withdrawn</option>
	<option>Declined</option></select></FONT></TD></tr>

<TR VALIGN=TOP><td><%=font%><b>&nbsp;&nbsp;Project Assignment</b></FONT></TD><td><%=font%><% selProj.setName("ProjectAssign"); %><%=selProj.print()%></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;Year</TD><td><%=font%><select name="Year">
	<option value=<%=MSInfo.CURRENT_WSN_YEAR%>>Current Year</option><selected>
	<%
		for(int i = MSInfo.CURRENT_WSN_YEAR_INT-1; i >= 2001; i--) {
	%>
			<option value="<%=i%>"><%=i%></option>
	<%
		}
	%>
	<option value="">All Years</option>
	</select></FONT></TD></tr>

</table>
<%=searchSubmit%>
</form>
<p> &nbsp;

<%@ include file="wsnspfooter.jspf" %>

</HTML>