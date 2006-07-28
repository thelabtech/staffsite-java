<%@ page import="org.alt60m.ministry.model.dbio.*, org.alt60m.hr.ms.servlet.dbio.*, java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selAOA" class="org.alt60m.html.SelectAoA"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>

<% /*Hashtable h = (Hashtable) session.getValue("tub");*/ %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Projects - (Search Tool)"; %>

<%@ include file="wsnspheader.jspf" %>

<table width='100%' border='0'>
<TR>
	<td>
		<table>

			<tr><td colspan='2'><%=fontXL%><b>&nbsp;&nbsp;Search Projects</b></FONT></TD></tr>
			<tr><td>
<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="listProjects">
<input type="hidden" name="view" value="listprojects">
			<%=searchSubmit%></TD></tr>
			<tr><td><%=font%><b>&nbsp;&nbsp;Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="Name" SIZE=30 MAXLENGTH=50 VALUE="" ></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;City</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="City" SIZE=30 MAXLENGTH=50 VALUE="" ></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;Country</b></FONT></TD><td><%=font%><% selCountry.setName("Country"); /*if (h.get("Country")!=null){ selCountry.setCurrentValue((String)h.get("Country"));}*/%><%=selCountry.print()%></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;Sending Region</b></FONT></TD><td><%=font%><% selRegion.setName("Region");%><%=selRegion.print()%></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;AOA</b></FONT></TD><td><%=font%><% selAOA.setName("AOA");%><%=selAOA.print()%></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;Start Date</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="StartDate" SIZE=10 MAXLENGTH=8 VALUE="" ></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;End Date</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="EndDate" SIZE=10 MAXLENGTH=8 VALUE="" ></FONT></TD></tr>
			<tr valign='top'>
				<td><%=font%><b>&nbsp;&nbsp;Year</TD>
				<td><%=font%><select name="Year">
					<option value=<%=MSInfo.CURRENT_WSN_YEAR%>>Current Year</option><selected>
					<%
						for(int i = MSInfo.CURRENT_WSN_YEAR_INT-1; i >= 2001; i--) {
					%>
							<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
					<option value="">All Years</option>
					</select></FONT>
				</TD>
			</tr>
			<TR>
				<td>
					<%=searchSubmit%>
					</form>
				</TD>
			</tr>
		</table>
	</td>

	<td colspan='2' valign='top'>
		<%=font%><div align=left>
		<b>Notes:</b>
		<ul>
			For the text boxes you only have to enter the first few letters. The more you enter the more refined the search will be.
		</ul>
		</div>
	</td>

	<!-- ------------TOOL BOX---------- -->
	<td rowspan='7' colspan='2' align='right' valign='top'>
		<%=fontTextL%><b>Available Tools</font></b><br>
		<table border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
			<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=<%=session.getValue("MyHomeAction")%>"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a></TD></tr>
			<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=appinfo"><IMG SRC="/wsnsp/images/wsn_addapp.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Applicant"></a></TD></tr>
			<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=staffappsearch"><IMG SRC="/wsnsp/images/wsn_addstaff.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Staff"></a></TD></tr>
			<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistapps.jsp"><IMG SRC="/wsnsp/images/wsn_searchpeople.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Applicant"></a></TD></tr>
			<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistprojects.jsp"><IMG SRC="/wsnsp/images/wsn_searchproj.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Projects"></a></TD></tr>
		</TABLE>
		<%=fontTextL%><b>Links</font></b><br>
		<table width='140' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
			<tr valign='top'><td colspan=2><%=fontTextM%><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></font></TD></tr>
			<tr valign='top'><td colspan=2><%=fontTextM%><A HREF="/servlet/CmsController?action=browse&catId=1000029" target='_blank'>Resource Center</a></font></TD></tr>
			<tr valign='top'><td colspan=2><%=fontTextM%><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
			<tr valign='top'><td colspan=2><%=fontTextM%><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
			<tr valign='top'><td colspan=2><%=fontTextM%><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
		</TABLE>
	</td>
</tr>
</table>
<p> &nbsp;
<%@ include file="wsnspfooter.jspf" %>

</HTML>