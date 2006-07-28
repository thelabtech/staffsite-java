<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "People - (Search Tool)"; %>

<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="listStaffApps">
<input type="hidden" name="view" value="liststaffapps">

<p>
<table width='100%' border='0'>
<TR VALIGN=TOP>
	<td> &nbsp; </td>
	<td> <%=fontTextXL%>Search by</font> </TD>
	<td> &nbsp; </td>

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
			<tr valign='top'><td colspan=2><%=fontTextM%><A HREF="/servlet/CmsController?action=browse&catId=1000029" target='_blank'>Resource Center</a></font></TD></tr>
			<tr valign='top'><td colspan=2><%=fontTextM%><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
			<tr valign='top'><td colspan=2><%=fontTextM%><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
			<tr valign='top'><td colspan=2><%=fontTextM%><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
		</TABLE>
	</td>

</tr>
<TR VALIGN=TOP>
	<td>
		<%=font%><b>&nbsp;Last Name</b></FONT>
	</TD>
	<td>
		<%=font%><INPUT TYPE=Text NAME="LegalLastName" SIZE=20 MAXLENGTH=50 VALUE="" ></FONT>
	</TD>
	<td>
		&nbsp;
	</td>
</tr>
<TR VALIGN=TOP>
	<td> &nbsp; </FONT>
	</TD>
	<td>
		<%=font%><input type="submit" name="search" value="search"></FONT>
	</TD>
	<td> &nbsp; </td>
</tr>
<TR VALIGN=TOP>
	<td> &nbsp; </FONT>
	</TD>
	<td rowspan='4'><%=font%>
		<ul>	<B>Notes:</B><p>
			Capitalization is not important.<p>
			For text fields you only need to put in the first few
			letters if you are not completely sure of the details.<p>
		</ul></FONT>
	</TD>
	<td> &nbsp; </td>
</tr>

</table>
</form>
<p> &nbsp;

<%@ include file="wsnspfooter.jspf" %>

</HTML>