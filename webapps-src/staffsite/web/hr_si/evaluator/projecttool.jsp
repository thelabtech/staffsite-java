<%@ page import="org.alt60m.hr.si.servlet.dbio.*, java.util.*" %>
<jsp:useBean id="articles" class="org.alt60m.wsn.sp.bean.dbio.WSNSPTAnnouncements" />
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />
<%
try {
    Hashtable h = (Hashtable) session.getValue("tub");
%>
<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Welcome!"; %>
<%@ include file="sitoolheader.jspf" %>


<!-- USE THIS SECTION WHEN CLOSING THE TOOL -->
<!--
<table align='center'>
<tr>
	<td width="38%" valign='top'>
		<p>
		<%=font%><b>Sorry. </font></b>
		<p>The STINT/Internship tool is temporarily closed for maintenance.</p>
		<p>Please try back in a few hours.</p>
	</td>
	<td bgcolor="<%=bgcolor%>"><%=wsnLogo%></td>
	<td width="38%">
	</td>
</tr>
</table>
-->
<!-- ************************************** -->


<!-- USE THIS SECTION WHEN THE TOOL IS OPEN -->

<%
if (! (h.get("ToolUser").equals("Granted") || h.get("Evaluator").equals("Granted")) ){
//if (false){
%>
	<table align='center'>
		<tr>
			<td width="38%" valign='top'>
				<p>
				<%=font%><b>Sorry. </font></b>
				<p>
				This site is designed for STINT and Internships Leaders and Coordinators.
				If you need access to this site, contact your regional office.  For general information,
				please send an email to <A HREF="mailto:stintandinternships@uscm.org">stintandinternships@uscm.org</A>.
				</p>
			</td>
			<td bgcolor="<%=bgcolor%>"><%=wsnLogo%></td>
			<td width="38%">
			</td>
		</tr>
	</table>
<%
} else {
%>
	<table align='center'>
		<tr>
			<td valign='top' width="30%">
				<p>
				<%=fontXL%><b>Announcements</font></b><br></p><%=fontText%><p>Welcome to the New STINT/Internship Tool.  Here you will be able to see all of the people who have applied for a STINT or an Internship via www.apply4internship.com.</p><p>To get started, go to the region drop down list and pick your region, then click "Go".</p><p>Check back here for updated information.  If you have questions, please contact your regional STINT or Internship Coordinator.</p>
			</td>
			<td valign=middle align=center bgcolor="<%=bgcolor%>" width="35%"><img src='/images/CMlogobig.gif' border='0'></td>
			<td width="30%" valign=top align=right>
				<p align='right'><%=font%>
				<li><a href="/hr_si/index.jsp" target="_blank">Online STINT/Internship Application</a></li>
				<li><A HREF="/hr_si/opportunities.jsp" target='_blank'>Current STINT/Internship Opportunities</a></li>
				<li><A HREF="http://www.thisiswhereilive.info" target='_blank'>WSN STINT Site</a></li>
				<li><A HREF="https://sitrack.uscm.org/" target='_blank'>STINT Tracker</a></li>
				</font></p><br>
				
				<p align='right'>
                <FORM NAME="appForm" ACTION="/servlet/SIController" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="action" VALUE="goToPage">
                <INPUT TYPE="HIDDEN" NAME="page" VALUE="projectview">


			<table>
			<tr><td align='right'>
				<FONT FACE="Arial" SIZE="3" COLOR="#336699"><b>Select your region <%regions.setName("region");regions.setBlankTitle("&lt;Unassigned&gt;");%><%=regions.print()%></b></font></td>
				<td valign="bottom" align='center'><input type="submit" value="Go"></td></tr>
			<tr><td align='right'>
				<FONT FACE="Arial" SIZE="3" COLOR="#336699"><b>Select Year<br>
				<select name="year">
					<option value="<%=SIUtil.CURRENT_SI_YEAR%>">Current</option>
					<%
						for( int i = SIUtil.CURRENT_SI_YEAR_INT - 1; i >= 2003; i-- ) {
					%>
							<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
					</select></b></font></td><td>&nbsp;</td></tr>
			</table>

                    
                </Form>
				</p>

				<p align='right'>
				<%
				//project leaders links only show up for PD and AP. Not for RD or Coord.
				//Should dynamically create links by checking to see what project they are a PD or APD for
				//If not assigned to a project, it should print. Your role is Project Leader, but you're not assigned to any projects. Email xxx
				%>
				</font>
				<p align='right'>
				<br><br>
				<%=fontXL%><b>Other Information</b></font><br>
				<%=font%><a href='/servlet/StaffController?action=showHome'>Your References</a><br>
				<a href='/servlet/WsnSpController?action=showIndex'>The New Summer Project Tool</a><br>
				<a href="/servlet/MSController" target="_blank">Online Summer Project Application</a><br>
				<A HREF="/hr_ms/opportunities.jsp" target='_blank'>Current Summer Project Opportunities</a><br>
				</font></p>
			</td>
		</tr>
	</table>
<%
}
%>

<!-- ************************************** -->


<%@ include file="sitoolfooter.jspf" %>

</HTML>
<% } catch (Exception e) { e.printStackTrace(); } %>