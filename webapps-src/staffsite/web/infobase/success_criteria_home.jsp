<%@ page import="org.alt60m.servlet.ActionResults, org.alt60m.staffSite.bean.dbio.*, org.alt60m.staffSite.model.dbio.StaffSitePref"%>
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />

<% String pageTitle="Success Criteria"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<br>
<table cellpadding=0 cellspacing=0 border=0 width="98%" ALIGN="CENTER">
	<TR>
		<TD width="48%">
			<%=fontB%>
			<center><b>Entering Success Criteria:</b></center>
			<br>
			To enter success criteria for your Movement, find your Movement by using the "Search" box above 
			(or go to the <a href='/servlet/InfoBaseController?action=showIndex'>InfoBase</a> and use the clickable 
			map to find the Movement). Once you're on the page for your Movement, click on the "Enter Success Criteria" 
			link. You can bookmark your Movement' success criteria page and it will appear below in the list of 
			bookmarks to make it easier each time you come back.
			<br><BR>
			<center>
			<% box.setTitle("Bookmarks");%>
			<% box.setStyle("Classic");%>
			<%=box.printTop()%>
				<%=fontB%><B>Success Criteria</B><br></font><%=fontB1%>
				<% String profileID = (String)session.getAttribute("loggedIn"); %>
				<% Iterator prefs;
					StaffSitePref pref = null;
					Bookmarks bookmarks = new Bookmarks();
					prefs = bookmarks.getBookmarks(profileID, Bookmarks.STATISTIC).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (StaffSitePref)prefs.next();
							%>
								<a href="/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid=<%=pref.getValue()%>"><%=pref.getDisplayName()%></a><BR>
							<%
						}
					}
					%>
				<%=hr%>
				</font><%=fontB%><B>Ministry Location</B><br></font><%=fontB1%>
				<% prefs = bookmarks.getBookmarks(profileID, Bookmarks.TARGET_AREA).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (StaffSitePref)prefs.next();
							%>
								<a href="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=pref.getValue()%>"><%=pref.getDisplayName()%></a><BR>
							<%
						}
					}
					%>
				<%=hr%>
				</font><%=fontB%><B>Missional Team</B><br></font><%=fontB1%>
				<% prefs = bookmarks.getBookmarks(profileID, Bookmarks.LOCAL_LEVEL).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (StaffSitePref)prefs.next();
							%>
								<a href="/servlet/InfoBaseController?action=showTeam&locallevelid=<%=pref.getValue()%>"><%=pref.getDisplayName()%></a><BR>
							<%
						}
					}
					%>
			<%=box.printBottom()%>
			<BR><BR>
			<a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with entering Success Criteria</a>
			</font>
			</center>
		</td>

		<TD width="4%">
			&nbsp;
		</td>
		
		<TD valign=top width="48%">
			<%=fontB%>
			<center><b>Viewing Success Criteria Reports:</b></center>
			<br>
			Reports are made from the success criteria entered for each Movement. You can view the national 
			and regional reports from the links below. To view reports, find the Missional Team or Ministry Location   
			using the "Search" box above (or go to the <a href='/servlet/InfoBaseController?action=showIndex'>InfoBase</a> 
			and use the clickable map to find the Missional Team or Ministry Location). Once you're on the page for that Missional Team or Ministry Location, click the 
			"Success Criteria Reporter" link.
			<BR><BR>
			<center>
			<% box.setTitle("Success Criteria Reports");%>
			<% box.setColor(colorL);%>
			<%=box.printTop()%>
					<%=fontB%>
					<ul>
						<li><a style="text-decoration:none;" href="/infobase/set_muster_criteria_agile.jsp"><p style="color:yellow;display:inline;"><b>New!&nbsp;</b></p><u>Movement Rollcall</u>
						(Generates custom listing of movements, ministry locations or teams sorted by your choice of criteria)</a>
						<!-- <li>National Report is Under Construction -->
						<!-- <li><a href="/sc?page=/ib/spec_report.jsp">National Report</a> (<a href="/sc?page=/ib/report_nation.jsp">YTD</a>) -->
            <li>
							<form name=reports action="/servlet/InfoBaseController?action=createReport" method=post>
							<INPUT TYPE="HIDDEN" NAME="type" value="regional">
								Regional Report: 
								<% regions.setName("region"); %>
								<%=regions.print()%> <a href="javascript:document.reports.submit()">Go</a> 
								<!--(<a href="/sc?page=/ib/report_region.jsp&region=GP">YTD</a>)-->
							</form>
						<LI> <A HREF="/servlet/InfoBaseController?action=createReport&type=national">National Report</A>
					</ul> 
					</font>
					<!-- <a href="http://staff2.uscm.org/successreports/default.asp" target="_blank">View last year's reports.</a> -->

			<%=box.printBottom()%>

			<BR><BR>
			<a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Success Criteria Reports</a>
			</font>
			</center>
		</TD>
	</TR>
</table>
<br>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>