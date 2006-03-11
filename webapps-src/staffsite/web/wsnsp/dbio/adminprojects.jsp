<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "My Region"; %>

<%@ include file="wsnspheader.jspf" %>
<p> &nbsp;

<center><%=fontXXL%><b><% if (h.get("region")!=null){ selRegion.setCurrentValue((String)h.get("region"));%><%=selRegion.display()%> Region<%} else{%>No Region Selected<%}%></b></font></center>
<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
		<tr valign="top"><td width="80%">
		<%=fontTextL%><b>Projects</font></b></br>
		<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
		<tr valign='top' align='center'>
<!--
	<td><%=fontTextS%><b>View</b></FONT></TD>
-->
		<td><%=fontTextS%>&nbsp;</FONT></TD><td><%=fontText%>Project<BR><%=fontTextS%>click to view</FONT></FONT></TD><td><%=fontText%>Country</td><td><%=fontText%>PD</td><td><%=fontText%>APD</td><td><%=fontText%>Coordinator</td><td><%=fontText%>Delete<BR><%=fontTextS%>click to delete</FONT></td></tr>
	<%
	if (!h.containsKey("0")) {
		%>
		<TH colspan=8><%=font%>There are currently no projects in your region.</font></TH>
		<%
	} else {
		Integer counter= new Integer(0);
		while (h.containsKey(counter.toString())){
			Hashtable app = (Hashtable)h.get(counter.toString());
			%>
			<tr align=center>
				<td><%=fontS%><b><%=counter.intValue()+1%></td>
<!--
				<td>
					<a href="/servlet/WsnSpController?view=team&action=showTeam&id=<%=app.get("WsnProjectID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a>
				</td>
-->
				<td><a href="/servlet/WsnSpController?view=team&action=showTeam&id=<%=app.get("WsnProjectID")%>"> <%=fontS%><%=app.get("Name")%>&nbsp;</a></td>
				<td><%=fontS%><%=app.get("Country")%>&nbsp;</td>
				<td><%=fontS%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=app.get("PDid")%>"><%=app.get("PD")%></a>&nbsp;</td>
				<td><%=fontS%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=app.get("APDid")%>"><%=app.get("APD")%></a>&nbsp;</td>
				<td><%=fontS%><a href="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=app.get("Coordid")%>"><%=app.get("Coord")%></a>&nbsp;</td>
				<td><%=fontS%><a href="/wsnsp/dbio/deleteprojectconf.jsp?region=<%=h.get("region")%>&name=<%=app.get("Name")%>&id=<%=app.get("WsnProjectID")%>">Del</a></td>
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
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=appinfo"><IMG SRC="/wsnsp/images/wsn_addapp.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Applicant"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=staffappsearch"><IMG SRC="/wsnsp/images/wsn_addstaff.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Staff"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistapps.jsp"><IMG SRC="/wsnsp/images/wsn_searchpeople.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Applicant"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistprojects.jsp"><IMG SRC="/wsnsp/images/wsn_searchproj.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Projects"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/adduser.jsp"><IMG SRC="/wsnsp/images/wsn_addleader.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add a Project Leader"></a></td></tr>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=projectinfo"><IMG SRC="/wsnsp/images/wsn_addproject.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add a Project"></a></td></tr>
<tr valign='top'><td colspan=2><FORM ACTION="/wsnsp/dbio/composeemail.jsp" NAME="email" METHOD="post"><input type=hidden name="EmailList" value="<%=h.get("emailList")%>"><input type=hidden name="fromPage" value="showMainProject"><input type=hidden name="view" value="adminprojects"><A HREF="JavaScript: email.submit()"><IMG SRC="/wsnsp/images/wsn_emailleaders.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Email Leaders"></a></td></tr></form>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?view=download&action=makeDownload&region=<%=h.get("region")%>"><IMG SRC="/wsnsp/images/wsn_gerregdb.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Get Regional DB"></a></TD></tr>
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
<%@ include file="wsnspfooter.jspf" %>