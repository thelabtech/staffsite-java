<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
  Hashtable ministryTable = ar.getHashtable("ministry");
	String ministryName = (String)ministryTable.get("Ministry");
	String ministryFirstName = (String)ministryTable.get("FirstName");
	String ministryLastName = (String)ministryTable.get("LastName");
	String ministryNote = (String)ministryTable.get("Note");
	String ministryAddress1 = (String)ministryTable.get("Address1");
	String ministryAddress2 = (String)ministryTable.get("Address2");
	String ministryCity = (String)ministryTable.get("City");
	String ministryState = (String)ministryTable.get("State");
	String ministryZip = (String)ministryTable.get("Zip");
	String ministryCountry = (String)ministryTable.get("Country");
	String ministryId = (String)ministryTable.get("NonCccMinId");
	String ministryHomePhone = (String)ministryTable.get("HomePhone");
	String ministryWorkPhone = (String)ministryTable.get("WorkPhone");
	String ministryEmail = (String)ministryTable.get("Email");
	String ministryUrl = (String)ministryTable.get("Url");
	String ministryFax = (String)ministryTable.get("Fax");
	String ministryPager = (String)ministryTable.get("Pager");

%>
<html>
<head>
<title><%=ministryName%>&nbsp;Details</title>
</head>

<% String pageTitle = ministryName; %>
<%@ include file="/infobase/ibheader.jspf" %>

<table wIdth="100%" border=0><tr><td WIdTH="30%" ALIGN="CENTER" VALIGN="TOP">
<% box.setTitleColor("#336699");%>box

<% box.setColor("#FFFFFF");%>
<% box.setTitle("&nbsp;Ministry Info");%>
<% box.setWidth("98%");%>
<% box.setStyle("classic");%>
<%=box.printTop()%>
				<TABLE WIdTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<TR><TD VALIGN="TOP"><%=font%><B>Contact Name: </B></FONT></TD><TD><%= font %><%= ministryFirstName %>&nbsp;<%= ministryLastName %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Address1: </B></FONT></TD><TD><%= font %><%= ministryAddress1 %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Address2: </B></FONT></TD><TD><%= font %><%= ministryAddress2 %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>City: </B></FONT></TD><TD><%= font %><%= ministryCity %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>State: </B></FONT></TD><TD><%= font %><%= ministryState %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Zip: </B></FONT></TD><TD><%= font %><%= ministryZip %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Country: </B></FONT></TD><TD><%= font %><%= ministryCountry %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Home Phone: </B></FONT></TD><TD><%= font %><%= ministryHomePhone %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Work Phone: </B></FONT></TD><TD><%= font %><%= ministryWorkPhone %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Fax: </B></FONT></TD><TD><%= font %><%= ministryFax %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>E-mail: </B></FONT></TD><TD><%= font %><A HREF="mailto: <%= ministryEmail %>"><%= ministryEmail %></A></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Website: </B></FONT></TD><TD><%= font %><A HREF="<%= ministryUrl %>"><%= ministryUrl %></A></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Note: </B></TD><TD><%= font %><%= ministryNote %></TD></TR>
				</TABLE>
				<P ALIGN="CENTER">
			<A HREF="/servlet/InfoBaseController?action=editNonCCCMin&mode=update&noncccminid=<%= ministryId %>"><%= font %>Update</FONT></A><BR><%= fontS %>(Click update to add or change ministry contact info, web address, note, etc.)
<%=box.printBottom()%>
</TD>

<TD VALIGN="TOP">
<% box.setTitle("&nbsp;Where is this ministry working at?");%>
<% box.setSubPad("0"); %>
<% box.setWidth("100%"); %>
<%=box.printTop()%>
	<TABLE WIdTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
  <% Iterator targetCampusI = ar.getCollection("target").iterator();
	   Hashtable row = null;
	%>
	<TR>
		<TD BGCOLOR="<%= color2 %>"><%=font%><B>Ministry Location</B></FONT></TD>
		<TD BGCOLOR="<%= color2 %>"><%=font%><B>Remove</B></FONT></TD>

	</TR>
	<% while(targetCampusI.hasNext()) {
		   row = (Hashtable)targetCampusI.next();
		%>
		<TR>
			<TD><%=font%><A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=row.get("TargetAreaId")%>"><B><%=row.get("Name")%></B></A></FONT></TD>
			<TD><%=font%>[<A HREF="/servlet/InfoBaseController?action=removeMin&from=ministrydetail&targetareaid=<%=row.get("TargetAreaId")%>&noncccminid=<%=ministryId%>">Remove</A>]</FONT></TD>
		</TR>
	<% } %>
	</TABLE>
	<P ALIGN="CENTER"><TABLE WIdTH="90%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><%=font%>[<A HREF="/infobase/get_campus_name.jsp?ministry=<%=ministryName%>&noncccminid=<%=ministryId%>">Add a Ministry Location to this ministry</A>]<BR></TD></TR></TABLE>
<%=box.printBottom()%>
</TD></TR></TABLE>
	    <!--<%=fontB%><%=ar.toHTML()%></font> -->
<br>

<%@ include file="/infobase/ibfooter.jspf" %>
</html>