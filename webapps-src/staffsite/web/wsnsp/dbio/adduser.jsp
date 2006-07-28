<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
 
<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Add a Site User"; %>
<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="adminListUser">
<input type="hidden" name="view" value="adminlistuser">

<br>
<table width='100%' border='0'>
<TR VALIGN=TOP>
	<td colspan='2'><%=fontTextXL%>Add Summer Project Site User</font>
		<p>
		This page is for adding Project Leaders (staff or students) and Summer Project Tool Users. 
		If you want to add a staff person who is going on a project but not assuming a leadership role, 
		please click the "Add Project Staff" button to the right. If you want to add a normal project 
		participant (a student who is not in a leadership role),  click the "Add Applicant" button to the right.
	</TD>

	<!-- TOOL BOX -->
	<td rowspan='4' align='center' nowrap>
	<%=fontTextL%><b>Available Tools</font></b><br>
		<TABLE width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
			<tr><td><a href="/servlet/WsnSpController?action=<%=session.getValue("MyHomeAction")%>"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a></TD></tr>
			<tr><td><a href="/servlet/WsnSpController?action=clearTub&view=appinfo"><IMG SRC="/wsnsp/images/wsn_addapp.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Applicant"></a></TD></tr>
			<tr><td><a href="/servlet/WsnSpController?action=clearTub&view=staffappsearch"><IMG SRC="/wsnsp/images/wsn_addstaff.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Staff"></a></TD></tr>
			<tr><td><a href="/wsnsp/dbio/filterlistapps.jsp"><IMG SRC="/wsnsp/images/wsn_searchpeople.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Applicant"></a></TD></tr>
			<tr><td><a href="/wsnsp/dbio/filterlistprojects.jsp"><IMG SRC="/wsnsp/images/wsn_searchproj.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Projects"></a></TD></tr>
		</TABLE>
		<%=fontTextL%><b>Links</font></b><br>
		<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
			<tr><td><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></TD></tr>
			<tr><td><%=fontTextM%><A HREF="/servlet/CmsController?action=browse&catId=1000029" target='_blank'>Resource Center</a></font></TD></tr>
			<tr><td><%=fontTextM%><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
			<tr><td><%=fontTextM%><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
			<tr><td><%=fontTextM%><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
		</TABLE>
	</td>
	<!-- end TOOL BOX -->
</tr>

<TR>
	<td><%=fontTextL%><b>Search by last name:</font></b></td>
	<td></TD>
</TR>

<TR>
	<td><%=font%><INPUT TYPE=Text NAME="LegalLastName" SIZE=20 MAXLENGTH=50 VALUE="" ></FONT></TD>
	<td></TD>
</TR>

<TR VALIGN=TOP>
	<td><%=font%><%=searchSubmit%></TD>
	<td><%=font%>
		<B>Notes:</B><BR>
		Type in the first few letters or all of the person's last name. <br>
		Capitalization is not important.
		</FONT>
	</td>
</tr>
</table>
</form>
<%@ include file="wsnspfooter.jspf" %>

</HTML>