<%@ page import="java.util.*" %>
<jsp:useBean id="articles" class="org.alt60m.wsn.sp.bean.dbio.WSNSPTAnnouncements" />
<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Welcome!"; %>
<%@ include file="/wsnsp/dbio/wsnspheader.jspf" %>


<%
if (h.get("Access").equals("Denied")){
%>
	<table align='center'>
		<tr>
			<td width="38%" valign='top'>
				<p>
				<%=font%><b>Sorry. </font></b>
				<p>
				This site is designed for WSN Summer Project Leaders and Coordinators.
				If you are leading or coordinating a WSN Summer Project, please contact
				your WSN Regional Director and let them know that you need access to
				this site. If you are coordinating some aspect of WSN Summer Projects
				in general, please send an email to <A HREF="mailto:WSN@uscm.org">WSN@uscm.org</A>
				to request access.
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
			<td valign='top'>
				<p>
				<%=fontXL%><b>Announcements</font></b><br>

			<%	//ARTICLES INSERTED HERE FROM RESOURCE CENTER WSN ANNOUNCEMENTS CATEGORY
				articles.setCategoryId("00000087590");
				articles.setNumOfArticles("1"); //homePageArticalesToDisplay set in header ::from profile info (not yet)%>
			<%=articles.print()%>

	<%=fontText%>			

	Please be sure to check the <A HREF="/wsnsp/dbio/info_old.jsp">past announcements</A>, in
	case you have missed any since your last visit.
<p>
					Click <A HREF="/wsnsp/dbio/info_old.jsp">here</A> for old announcements.
			</td>
			<td valign=middle align=center bgcolor="<%=bgcolor%>"><%=wsnLogo%></td>
			<td width="25%" valign=top align=right>
				<p align='right'><%=font%>
				<li><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></li>
				<li><A HREF="/servlet/CmsController?action=browse&catId=1000029" target='_blank'>Resource Center</a></li>
				<li><A HREF="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></li>
				<li><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></li>
				</font></p><br>
				
				<p align='right'>
				<%if (h.get("Access").equals("coord")){
				%><a href='/servlet/WsnSpController?action=showMainProj&view=adminprojects'><%=fontL%><b>View My Teams&nbsp;<b></font></a><br>
				<a href='/servlet/WsnSpController?action=showMainProj&region=yes&view=adminprojects'><%=fontL%><b>View My Region&nbsp;</b></font></a><br><%
				}
				else{%>
				<a href='/servlet/WsnSpController?action=showMainProj&view=adminprojects'><%=fontL%><b>View My Region&nbsp;</b></font></a><br>
					<%}%>
				</p>

				<p align='right'>
				<!-- project leaders links only show up for PD and AP. Not for RD or Coord. -->
				<!-- Should dynamically create links by checking to see what project they are a PD or APD for -->
				<!-- If not assigned to a project, it should print. Your role is Project Leader, but you're not assigned to any projects. Email xxx -->
				<%
				if (h.get("Access").equals("pdapd")){
						%><b>Project Leaders</b><br><%
					if (h.get("WsnProjectID").equals("notassigned")){
						%></font><%=font%>Your role is "Project Leader" but you have not been assigned as a leader of a project. Either go to "My Region"
						above, find your project and add yourself as a leader, or contact your WSN Regional Director.</font><%
					} else {
				%>
						<a href='/servlet/WsnSpController?action=showProj&id=<%=h.get("WsnProjectID")%>&view=showprojectinfo'><%=fontL%><b>View My Project&nbsp;</b></font></a><BR>
						<a href='/servlet/WsnSpController?action=showTeam&id=<%=h.get("WsnProjectID")%>&view=team'><%=fontL%><b>View My Team&nbsp;</b></font> </a><BR>
				<%
					}
				}
				%>
				</font>
				<p align='right'>
				<br><br>
				<%=fontXL%><b>Other Users</b></font><br>
				<%=font%><a href='/servlet/WsnSpController?action=showSOS&view=showsos'>SOS Administrator</a><br>
				<a href='/servlet/WsnSpController?action=showInsuranceProjects&view=insuranceprojects'>CCC Insurance Administrator</a><br>
				<a href='/servlet/WsnSpController?action=showAcctNo&view=showaccountno'>Donation Services</a><br>
				<a href='/wsnsp/dbio/filterwaiver.jsp'>WSN Orlando (Waivers)</a><br>
				<a href='/wsnsp/dbio/filterinsurance.jsp'>WSN Orlando (Insurance)</a><br>
				<a href='/servlet/WsnSpController?action=showWorldTravel&view=worldtravel'>World Travel</a>
				</font></p>
			</td>
		</tr>
	</table>
<%
}
%>

<%@ include file="/wsnsp/dbio/wsnspfooter.jspf" %>

</HTML>