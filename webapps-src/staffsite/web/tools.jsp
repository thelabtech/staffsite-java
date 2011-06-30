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
<% box.setTitle("Staff Tools");	%>
<%=box.printTop()%>
<table width='100%'>
<tr valign=top><td valign=top>
	<p><%=fontB%>
	Not having the right tool for the job makes the job twice as difficult. This section of the site includes various tools 
	to help make your job easier. Tools for everything from ordering your FSK packages to registering students for your Summer project can be found here. As time goes on, new and better tools will be introduced here.
	</p></font>
</td>

<td valign=top>
	<% box.reset();%>
	<% box.setStyle("classic");%>
	<% box.setColor(color2);%>
<!--
	<% box.setTitle("Current Highlights");	%>
	<%=box.printTop()%>
			<table width='100%'>
			<tr><td>
				<a href="/servlet/FskController"><img src="/images/logo_fsk.gif"></a>
				<br><%=font%><b>FSK Ordering Tool</b></font>
			</td>
			<td>
				<%=fontS%>Regions can now allocate kits and local leaders are now able to order their kits. Questions regarding materials? Email <a href="mailto:dave.schlernitzauer@uscm.org">Dave Schlernitzauer</a>.</font>
			</td>
			</tr>
			</table>
	<%=box.printBottom()%>
-->
</td>
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
</tr>
</table>

<br>

<table width="95%" align=center>
	<tr><td width='50%' valign=top>

<% box.setStyle("classic");%>
<% box.setColor(color2);%>
<% box.setTitle("Ministry and Team Tracking");	%>
<%=box.printTop()%>
	<table border=0 cellpadding=2 bordercolorlight='#ddddaa'>
		<tr>
			<td valign="center" align="center" colspan="2">
				<a href="/servlet/Home"><img src="/modules/images/infobaselogo.png"></a> </td><td>
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
 				<%=fontS%>Allocating and ordering freshman survival kits for Fall 2008.</font><br>
				
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
	</table>
<%=box.printBottom()%>
<br>
		<%// if (isStudent.equals("false")) { %>
<% box.setTitle("Personal Tasks");%>
<% box.setStyle("classic");%>
<% box.setColor(color2);%>
<%=box.printTop()%>
	<table width='100%' border=0>
		<tr>
		<td><%=font%><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/ReimbServlet" target="_blank">Personal Reimbursement</A></font></td><td><%=fontTextS%> Online personal reimbursements.</font></td>
		</tr>
		<tr>
		<td><%=font%><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/ReimbAdvServlet" target='_blank'>Reimbursement Advance</A></font></td><td><%=fontTextS%> Online reimbursement advances.</font></td>
		</tr>
		<tr>
		<td><%=font%><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/AsrServlet" target='_blank'>Additional Salary Request</A></font></td><td><%=fontTextS%> Online additional salary requests.</font></td>
		</tr>
		<tr>
		<td><%=font%><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/SalaryCalc2002Servlet" target='_blank'>Salary Calculation</A></font></td><td><%=fontTextS%> Online salary calculations.</font></td>
		</tr>
		<tr>
		<td><%=font%><a href='https://staff2.ccci.org/ss/pages/PFormFrame.html' target='_blank'>Forms</A></font></td><td><%=fontTextS%> Downloadable personal and ministry forms.</font></td>
		</tr>
		<tr>
		<td><%=font%><A HREF="https://staff.ccci.org/ss/manuals/FPM/" target='_blank'>Financial Policy Manual</A></font></td><td><%=fontTextS%>&nbsp;</font></td>
		</tr>
		<TR>
		<TD COLSPAN="2"><%=font%><a href="/servlet/HRUpdateController">Change my personal or job information</a></TD>
		</TR>
	</table>
<%=box.printBottom()%>
		<%// } %>			

	</td>
	<td width='50%' valign=top>
<% box.setStyle("classic");%>
<% box.setColor(color2);%>
<% box.setTitle("Standard Tools");	%>
<%=box.printTop()%>
	<table border=0 cellpadding=2 bordercolorlight='#ddddaa'>
		<%// if (isStudent.equals("false")) { %>
		<%
		boolean stintEnabled = true;
		if (stintEnabled) { 
		%>
		<tr>
			<td valign="center" align="center"><a href="
				<%= (request.getServerName().equals("staff.campuscrusadeforchrist.com") || request.getServerName().equals("staff.uscm.org")) ?
						"http://stint.uscm.org/admin" : "http://stint.int.uscm.org/admin" %>"><img src="/images/logo_stintintern.gif" width="63" height="39"></a></td>
			<td>
				<!--	<a href="/servlet/wsnsummerproject?action=showIndex"><img src="/images/logo_wsnspt.gif"></a></td><td>	-->
				<%=font%><b><a href="http://stint.uscm.org/admin">The STINT/<br>Internship Tool</b></font></td>
			<td><%=fontS%>View and manage online applications for STINTS or Internships.</font></td>
		</tr>

		<%
		} else {
		%>

		<tr>
			<td valign="center" align="center"><img src="/images/logo_stintintern.gif" width="63" height="39"></td>
			<td>
				<!--	<a href="/servlet/wsnsummerproject?action=showIndex"><img src="/images/logo_wsnspt.gif"></a></td><td>	-->
				<%=font%><b>The STINT/<br>Internship Tool</b></font></td>
			<td><%=fontS%>The STINT/Internship Tool is not currently available.  Please check back after October first.</font></td>
		</tr>

		<%
		}
		%>
				
		
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
			<td>
				<%=font%><b><a href="http://www.conferenceregistrationtool.com/admin">Conference Registration System (CRS) </b></font></td>
			<td><%=fontS%>Create, administer, and register online for an event of any size.<br/>
			<br/>
			<a href="/servlet/CRSAdmin">Old CRS tool</a>
			</font></td>
		</tr>
		<tr>
			<td valign="center" align="center"><a href="
				<%= (request.getServerName().equals("staff.campuscrusadeforchrist.com") || request.getServerName().equals("staff.uscm.org")) ?
						"http://sp.campuscrusadeforchrist.com/admin" : "http://sp.int.uscm.org/admin" %>"><img src="/images/logo_allsp.gif"></a></td>
			<td>
				<!--
			<td valign="center" align="center"><a href="/servlet/WsnSpController?action=showIndex"><img src="/images/logo_allsp.gif"></a></td>
			<td>
				
				<a href="/servlet/wsnsummerproject?action=showIndex"><img src="/images/logo_wsnspt.gif"></a></td><td>	-->
				<%=font%><b><a href="http://sp.campuscrusadeforchrist.com/admin">The<br>Summer<br>Project<br>Tool</b></font></td>
			<td><%=fontS%>View and manage online applications for WSN and US Summer Projects, with the 
						ability to automatically generate new account numbers for accepted students, 
						track their balances,  evaluate applications, etc.</font></td>
		</tr>
		<tr>
			<td valign="center" align="center">
				<a href="<%= (request.getServerName().equals("staff.campuscrusadeforchrist.com") || request.getServerName().equals("staff.uscm.org")) ?
                        "http://pr.uscm.org" : "http://pr.int.uscm.org" %>"><img src="/images/360logo.gif"></a></td><td>
				<%=font%><b><a href="http://pr.uscm.org">Panorama</b></font></td><td>
				<%=fontS%>We've all heard of 360 reviews, the tool that helps to make each staff 
				member more effective personally and in ministry. Come experience the adventure within Panorama!<br/>
				<br/>
				<a href="/servlet/Review360Controller">View pre-2011 reviews in the old 360 tool</a>
				</font>
			</td>
		</tr>
		<!--<tr> 
			<td valign="center" align="center"><a href="/servlet/CRSAdmin"><img src="/crs/images/crs_logo.gif" BORDER="0"></a></td>
			<td>
				<%=font%><b><i>Conference Registration System (CRS) </i>-- PhaseOut in progress</b></font></td>
			<td><%=fontS%>Available for administrating existing conferences only-- use CRS 2.0 for new conferences.</font></td>
		</tr> -->
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

<% box.setStyle("classic");%>
<% box.setColor(color2);%>
<% box.setTitle("Account Management");	%>
<%=box.printTop()%>
	<table width=100% border=0 cellpadding=2 bordercolorlight='#ddddaa'>
		<%// if (isStudent.equals("false")) { %>
<!--		
		<tr>
			<td>
				<a href="/servlet/StaffController?action=showSetupEmail"><%=fontB%><B>Email setup</B></FONT></a></td>
				<td><%=fontB1%>Change your email setup</font>
			</td>
		</tr>
-->
<!--
		<tr>
			<td>
				<a href="/servlet/StaffController?action=managePS" target="_blank"><%=fontB%><B>PeopleSoft setup</B></FONT></a></td>
				<td><%=fontB1%>Change your PeopleSoft setup</font>
			</td>
		</tr>
		<%// } %>
		<tr>
			<td>
				<a href="/servlet/StaffController?action=changePassword"><%=fontB%><B>Staff Site Password</B></FONT></a></td>
				<td><%=fontB1%>Change staff.campuscrusadeforchrist.com password</font>
			</td>
		</tr>
-->
		<tr>
			<td>
				<a href="/servlet/StaffController?action=showCustomize"><%=fontB%><B>Customize</B></FONT></a></td>
				<td><%=fontB1%>Customize home page items</font>
			</td>
		</tr>
	</table>
	<%=box.printBottom()%>

	</td></tr>
</table>
	
<% box.setStyle("rounded");%>
<%=box.printBottom()%>

<%@ include file="/footer.jspf" %>
</BODY>
</HTML>

