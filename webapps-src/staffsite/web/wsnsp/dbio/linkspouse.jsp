<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="WsnApplication" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnApplication2000"/>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Link Spouse"; %>

<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/WsnSpController">
<input type='hidden' name="action" value="linkSpouse">
<input type='hidden' name="view" value="showappinfo">
<input type='hidden' name="id" value='<%=h.get("WsnApplicationID")%>'>
&nbsp;
<p>
<table border='0' width='100%'>
<tr valign='top'><td colspan='3' nowrap><%=fontText%>Associate Spouse to</font> </td><td> <%=fontXXL%><i><b><%=h.get("LegalFirstName")%>&nbsp;<%=h.get("LegalLastName")%></td>
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
	<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/adduser.jsp"><IMG SRC="/wsnsp/images/wsn_addleader.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add a Project Leader"></a></td></tr>
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

<tr><td><%=fontText%><b>Spouse:</font></b></td><td colspan='4'><%=font%>

<%
	if (!h.containsKey("0")) {
		%>
		<%=font%>There are currently no entries with the same Last Name.</font>
		</td></tr><tr><td colspan='3'><b><A HREF="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=h.get("WsnApplicationID")%>">BACK</A></b></td>
		<%
	} else {
		Integer counter= new Integer(0);
%>		<select name='spouseID'>	<option value="x"></option><option value="Disassociate">Disassociate</option>
<%
		while (h.containsKey(counter.toString())){
			Hashtable app = (Hashtable)h.get(counter.toString());
			%>
			<option value='<%=app.get("WsnApplicationID")%>'><%=app.get("Name")%></option>
		<%
			counter=new Integer(counter.intValue()+1);
		}
		%></select>
		</td></tr>
		<tr><td colspan='2'><input type='submit' value='Link'></td><%
	}
	%>


<td align=right><%=fontText%><b>Note:</td>	<td><%=font%>If the person's spouse is not listed in the pulldown menu above, make sure you have entered them into the system. You can do this by clicking "add leader / user" (if the spouse will also have a leadership role), "add project staff" (if the spouse is going on the project but not assuming a leadership role), or "add applicant" (if this is a couple that is not on staff). If they are already in the system, make sure that their last name is spelled the same. Once you have added the spouse to the system, you will be prompted again to link the two spouses together.
</td></tr>
</form>
</table>
&nbsp;
<p>
&nbsp;
<p>

<p>
<%@ include file="wsnspfooter.jspf" %>




</HTML>