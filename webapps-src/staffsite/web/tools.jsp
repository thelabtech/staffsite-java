<%@ page import="org.alt60m.servlet.ActionResults" %>

<HTML>
<HEAD>
<TITLE>Tools</TITLE>
</HEAD>
<%
ActionResults ar = ActionResults.getActionResults(session);
boolean isHr = (new Boolean(ar.getValue("isHR"))).booleanValue();
boolean hasHRQueryAccess = (new Boolean(ar.getValue("hasHRQueryAccess"))).booleanValue();

int curr_tab = 3; %>
<%@ include file="/header.jspf"%>

<% box.setStyle("rounded");%>
<% box.setColor(color3);%>
<% box.setTitleFontSize("5");	%>
<% box.setTitle("Tools");	%>
<%=box.printTop()%>
<!-- 
<table width='50%' align="center">
<tr valign=top>
	<td valign=top>
	<% box.reset();%>
	<% box.setStyle("classic");%>
	<% box.setColor(color2);%>
	<% box.setTitle("Coming Soon...");	%>
	<%=box.printTop()%>
		<table border=0 cellpadding=2 bordercolorlight='#ddddaa'>
			<tr>
				<td valign="center" align="center" colspan="2">
					<img src="/images/missionhub_icon.gif"> </td>
					<td>
					<%=font%><b>MisionHub</b></font><br>
					<%=fontS%>An online <b>follow-up system</b> with your audience in mind. Check out the unveiling at CSU! This new tool will be accessible by students, volunteers, and staff via web, iPhone and Android.</font>
				</td>
			</tr>
		</table>
	</td>
</tr></table>
<%=box.printBottom()%>
-->
<!--
<td valign=top>
	<% box.reset();%>
	<% box.setStyle("classic");%>
	<% box.setColor(color2);%>
	<% box.setTitle("Coming Soon...");	%>
	<%=box.printTop()%>
					<a href="/servlet/StaffController?action=showTools"><img src="/images/logo_mystery.gif"></a><br>
					<%=font%><b>Masterful Mystery Tool</b></font><br>
					<%=fontS%>Wouldn't you like to know what will be showing up here soon? So would we!	</font>
	<%=box.printBottom()%>
</td>
-->

<br>

<table width="95%" align=center>
	<tr>
	<td width='50%' valign=top>
<% box.setStyle("classic");%>
<% box.setColor(color2);%>
<% box.setTitle("Power Tools");	%>
<%=box.printTop()%>
	<table border=0 cellpadding=5 bordercolorlight='#ddddaa'>
		<tr>
			<td valign="center" align="center">
				<a href="http://missionhub.com"><img src="/images/missionhub_icon.gif"></a></td>
			<td>
				<%=fontS%>MissionHub: An online follow-up system with your audience in mind.
				</font>
			</td>
		</tr>

		<tr>
			<td valign="center" align="center">
				<a href="<%= (request.getServerName().equals("staff.campuscrusadeforchrist.com") || request.getServerName().equals("staff.uscm.org")) ?
                        "http://pr.uscm.org" : "http://pr.int.uscm.org" %>"><img src="/images/360logo.gif"></a></td>
			<td>
				<%=fontS%>We've all heard of 360 reviews, the tool that helps to make each staff 
				member more effective personally and in ministry. Come experience the adventure within Panorama!<br/>
				<a href="/servlet/Review360Controller">View pre-2011 reviews in the old 360 tool</a>
				</font>
			</td>
		</tr>
					
		
		<!--
		<tr>
			<td valign="center" align="center"><img src="/crs/images/crs_logo.gif" BORDER="0"></td>
			<td>
				<%=font%><b>Conference Registration System (CRS)</b></font></td><td>
				<%=fontS%>The CRS site is temporarily unavailable.  Please try back in a few hours.</font>
			</td>
		</tr>
		-->
		<tr>
			<td valign="center" align="center"><a href="<%= (request.getServerName().equals("staff.campuscrusadeforchrist.com") || request.getServerName().equals("staff.uscm.org")) ?
						"http://www.conferenceregistrationtool.com/admin" : "http://crs.int.uscm.org/admin" %>"><img src="/images/crs_icon.jpg" BORDER="0"></a></td>
			<td><%=fontS%>Create, administer, and register online for an event of any size.<br/>
			<a href="/servlet/CRSAdmin">Old CRS tool</a>
			</font></td>
		</tr>

		<tr>
			<td valign="center" align="center"><a href="
				<%= (request.getServerName().equals("staff.campuscrusadeforchrist.com") || request.getServerName().equals("staff.uscm.org")) ?
						"http://sp.campuscrusadeforchrist.com/admin" : "http://sp.int.uscm.org/admin" %>"><img src="/images/logo_allsp.gif"></a></td>
				
 			<!--
			<td valign="center" align="center"><a href="/servlet/WsnSpController?action=showIndex"><img src="/images/logo_allsp.gif"></a></td>
			<td>
				
				<a href="/servlet/wsnsummerproject?action=showIndex"><img src="/images/logo_wsnspt.gif"></a></td><td>	-->

			<td><%=fontS%>View and manage online applications for WSN and US Summer Projects, with the 
			ability to automatically generate new account numbers for accepted students, 
			track their balances,  evaluate applications, etc.</font></td>
		</tr>

	<%// } %>			
	</table>
<%=box.printBottom()%>
<BR>
<% if(isHr||hasHRQueryAccess) { %>
<% box.setStyle("classic");%>
<% box.setColor(color2);%>
<% box.setTitle("HR Administrative Tools");	%>
<%=box.printTop()%>
	<table border=0 cellpadding=2 CELLSPACING=1 bordercolorlight='#ddddaa' WIDTH="100%">
                               <TBODY>
                          <%if(isHr){%><TR><TD><FONT face=Arial color=#336699 size=2><A HREF="/servlet/AuthorizeController?action=showPage"><B>View Pending Requests</B></A></FONT></TD></TR><%}%>
                          <TR><TD><FONT face=Arial color=#336699 size=2><A HREF="/servlet/HRQueryController"><B>Query Tool</B></A></FONT></TD></TR>
                          <%if(isHr){%><TR><TD><FONT face=Arial color=#336699 size=2><A HREF="/CampusHR/initiate_acs.jsp"><B>Initiate ACOS</B></A></FONT></TD></TR><%}%>

</TR></TBODY>	</table>
<%=box.printBottom()%>
<% } %>


	</td>
<td width='50%' valign=top>

<% box.setStyle("classic");%>
<% box.setColor(color2);%>
<% box.setTitle("Hand Tools");	%>
<%=box.printTop()%>
	<table border=0 cellpadding=5 bordercolorlight='#ddddaa'>
		<tr>
			<td valign="center" align="center" colspan="2">
				<a href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org" %>"><img src="/modules/images/infobaselogo.png"></a> </td><td>
				<%=fontS%>Information on all campuses involved with the Campus Ministry. Also enter stats and generate reports.</font>
			</td>
		</tr>
		
		<%// if (isStudent.equals("false")) { %>
		<%
		boolean fskEnabled = true;
		if ((fskEnabled)||(ar.getValue("FSKadmin").equals("true"))) { 
		%>
 		<tr>
 			<td valign="center" align="center">
 				<a href="http://www.fsicatalog.com/FSK">
				<img src="/images/logo_fsk.gif"></a></td><td>
 				<%=font%><b><a href="http://www.fsicatalog.com/FSK">FSK Ordering Tool</b></font></td><td>
 				<%=fontS%>Ordering Freshman Survival Kits for 2011-2012. Use access code "fsk+2011".</font><br>
				
 			</td>
 		</tr>
		<%
		} else {
		%>
 		<tr>
			<td valign="center" align="center">
				<img src="/images/logo_fsk.gif"></td><td>
				<%=font%><b>FSK Ordering Tool</b></font></td><td>
				<%=fontS%>The FSK Order site is no longer available. To order materials please contact Jane Stump at <a href="mailto:jane.stump@uscm.org">jane.stump@uscm.org</a> or 407-443-7699</font><br />
				<!--
				<%=fontS%>View contents <a href='http://fsk.campuscrusadeforchrist.com/customer/product/public_list' onClick="window.open('http://fsk.campuscrusadeforchrist.com/customer/product/public_list', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable'); return false">here.</a></font>
				-->
			</td>
		</tr>
		<%
		}
		%>
		<%// } %>			
		<tr>
			<td valign="center" align="center">
				<a href="http://quest.campuscrusadeforchrist.com" target="_blank"><img src="/images/logo_quest.gif"></a></td><td>
				<%=font%><b><a href="http://quest.campuscrusadeforchrist.com">Quest Survey Tool</b></font></td><td>
				<%=fontS%>View and Enter QuEST survey results into the QuEST Database.	</font>
			</td>
		</tr>
		<%// if (isStudent.equals("false")) { %>
		<%
		boolean stintEnabled = true;
		if (stintEnabled) { 
		%>
		<tr>
			<td valign="center" align="center"><a href="
				<%= (request.getServerName().equals("staff.campuscrusadeforchrist.com") || request.getServerName().equals("staff.uscm.org")) ?
						"http://stint.uscm.org/admin" : "http://stint.int.uscm.org/admin" %>"><img src="/images/logo_stintintern.gif" width="63" height="39"></a></td>
			<td><%=font%><b><a href="http://stint.uscm.org/admin">Stint/Internship Tool</b></font></a></td>
				<!-- <td>	<a href="/servlet/wsnsummerproject?action=showIndex"><img src="/images/logo_wsnspt.gif"></a></td>	-->
			<td><%=fontS%>View and manage online applications for STINTS or Internships.</font></td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td valign="center" align="center"><img src="/images/logo_stintintern.gif" width="63" height="39"></td>
			
				<!-- <td>	<a href="/servlet/wsnsummerproject?action=showIndex"><img src="/images/logo_wsnspt.gif"></a></td>	-->
			<td><%=fontS%>The STINT/Internship Tool is not currently available.  Please check back after October first.</font></td>
		</tr>
		<%
		}
		%>
	</table>
<%=box.printBottom()%>
</td></tr></table>


<table width="95%" align=center>
	<tr>
	<td width='100%' valign=top>
	<%// if (isStudent.equals("false")) { %>
<% box.setTitle("Personal Tools");%>
<% box.setStyle("classic");%>
<% box.setColor(color2);%>
<%=box.printTop()%>
	<table border=0 cellpadding=2 bordercolorlight='#ddddaa'>
			<tr>
				<td>
					<table>
						<tr>
							<td><%=font%><A HREF="https://staffweb.ccci.org/pay-benefits-staff-expenses/reimbursements/new-reimbursement/index.htm" target="_blank">Personal Reimbursement</A></font></td>
							<td><%=fontTextS%> Online personal reimbursements.</font></td>
						</tr>
						<tr>
							<td><%=font%><A HREF="https://staffweb.ccci.org/pay-benefits-staff-expenses/reimbursements/reimbursement-advance/index.htm" target='_blank'>Reimbursement Advance</A></font></td>
							<td><%=fontTextS%> Online reimbursement advances.</font></td>
						</tr>
						<tr>
							<td><%=font%><A HREF="https://staffweb.ccci.org/pay-benefits-staff-expenses/payroll/salary-calculation/additional-salary/index.htm" target='_blank'>Additional Salary Request</A></font></td>
							<td><%=fontTextS%> Online additional salary requests.</font></td>
						</tr>
						<tr>
							<td><%=font%><A HREF="https://staffweb.ccci.org/pay-benefits-staff-expenses/payroll/salary-calculation/index.htm" target='_blank'>Salary Calculation</A></font></td>
							<td><%=fontTextS%> Online salary calculations.</font></td>
						</tr>
					</table>
				</td>
				<td>
					<table>
						<tr>
							<td><%=font%><a href='https://staffweb.ccci.org/pay-benefits-staff-expenses/printable-forms/index.htm' target='_blank'>Forms</a></font></td>
							<td><%=fontTextS%> Downloadable personal and ministry forms.</font></td>
						</tr>
						<tr>
							<td><%=font%><a href="/servlet/StaffController?action=showCustomize"><%=fontB%>Customize</FONT></a></td>
							<td><%=fontTextS%>Customize home page items</font></td>
						</tr>
						<tr>
							<td COLSPAN="2"><%=font%><A HREF="https://staff2.ccci.org/ssfiles/manuals/FPM/" target='_blank'>Financial Policy Manual</a></font></td>
						</tr>
					</table></td></tr></table>
				<%=box.printBottom()%>
					<%// } %>			
				</td>
			</tr>
		</table>	



<% box.setStyle("rounded");%>
<%=box.printBottom()%>

<%@ include file="/footer.jspf" %>
</BODY>
</HTML>

