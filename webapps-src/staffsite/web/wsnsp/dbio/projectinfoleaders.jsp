<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="selPerson" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnApplication2000"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Project Leader Information"; %>

<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/WsnSpController">
<% if (h.get("WsnProjectID")!=null){%>
	<input type="hidden" name="id" value="<%=h.get("WsnProjectID")%>"><!-- new if a totally new project, the number of the record if we are editing -->
	<input type="hidden" name="action" value="saveEditProjLeaders">
	<input type="hidden" name="view" value="showprojectinfo">
<%} 
%>
<table width='100%' border='0'>
<TR><td colspan='2'><%=fontXL%><b><%=formHelp.value((String)h.get("Name"))%></b></font></td>
<!-- ------------TOOL BOX---------- -->
<td rowspan='7' colspan='2' align='right' nowrap>
<%=fontTextL%><b>Available Tools</font></b><br>
	<table  border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
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
<TR>
	<td width="35%"><%=fontText%><b>Project Leaders</td>
	<td><%=font%>(Last name, First name)</FONT></TD>
</tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Project Director</b></FONT></TD>
	<td><%=font%><% selPerson.setName("pd"); selPerson.setCurrentValue((String)"null"); if (h.get("PDid") != null) {selPerson.setCurrentValue((String)h.get("PDid"));}%><%=selPerson.print(true)%></font></TD>
</tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Associate Project Director</b></FONT></TD>
	<td><%=font%><% selPerson.setName("apd"); selPerson.setCurrentValue((String)"null"); if (h.get("APDid") != null) {selPerson.setCurrentValue((String)h.get("APDid"));}%><%=selPerson.print(true)%></FONT></TD>
</tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Project Coordinator</b></FONT></TD>
	<td><%=font%><% selPerson.setName("coord"); selPerson.setCurrentValue((String)"null"); if (h.get("Coordid") != null) {selPerson.setCurrentValue((String)h.get("Coordid"));}%><%=selPerson.print(true)%></FONT></TD>
</tr>
</TABLE>
<p>
<input type='Submit' value='Save'><%=font%>&nbsp;&nbsp;<b>Have Questions?</b> see below:<br><br>
	
	1) If you are REPLACING a leader, the old leader will become unassigned from this project. If they are still going on this or any other project, you will need to find them by clicking "Search People" and then indicate their new assignment.<br><br>
	2) If the NEW Project Director or Associate Project Director is currently assigned to lead another project, they will be automatically taken off the old project and assigned to this one.<br><br>
	3) If you make someone a leader who was not originally added to the site using the "Add Leader" screen, they may not be able to access the site. Please email <A HREF="mailto:wsn@uscm.org">wsn@uscm.org</A> with the subject of "Changed applicant to leader" and the leader's name. <BR></FONT>
</form>

<%@ include file="wsnspfooter.jspf" %>

</HTML>