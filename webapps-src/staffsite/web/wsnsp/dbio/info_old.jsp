<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="articles" class="org.alt60m.wsn.sp.bean.dbio.WSNSPTAnnouncements" />

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Old Announcements"; %>

<%@ include file="wsnspheader.jspf" %>
<p> &nbsp;
<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr valign='top'>
		<td>
			<p><%=fontXL%><b>All Announcements</font></b><br>

			<%=fontText%>

		<%	//ARTICLES INSERTED HERE FROM RESOURCE CENTER WSN ANNOUNCEMENTS CATEGORY
			articles.setCategoryId("00000087590");
			articles.setNumOfArticles("all"); //homePageArticalesToDisplay set in header ::from profile info (not yet)%>
			<%=articles.print()%>


		</td>
		<td width='30%'>
			<a href="/servlet/WsnSpController?action=<%=session.getValue("MyHomeAction")%>"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a>
			<p>

			<b>Documents</b><br>
				<A HREF="https://staff.campuscrusadeforchrist.com/servlet/CmsController?action=browse&catID=1000029" target='_blank'>Resource Center<br> (WSN section)</a><br>
			<p>
			</ul>
		</td>
	</tr>
</table>

<%@ include file="wsnspfooter.jspf" %>

</HTML></HTML>