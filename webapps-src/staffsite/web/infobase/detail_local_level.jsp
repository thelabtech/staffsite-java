<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
  Hashtable teamTable = ar.getHashtable("team");
	String teamName = (String)teamTable.get("Name");
	String teamNote = (String)teamTable.get("Note");
	String teamRegion = (String)teamTable.get("Region");
	String teamID = (String)teamTable.get("LocalLevelId");
	String teamPhone = (String)teamTable.get("Phone");
	String teamEmail = (String)teamTable.get("Email");
	String teamUrl = (String)teamTable.get("Url");
	if(!teamUrl.equals("")) 
	{
		if(!teamUrl.startsWith("http")){
			teamUrl="http://"+teamUrl;
		}
	}
	String teamLane = (String)teamTable.get("Lane");
	String teamAddress = (String)teamTable.get("Address1");
	String teamAddress2 = (String)teamTable.get("Address2");
	String teamCity = (String)teamTable.get("City");
	String teamState = (String)teamTable.get("State");
	String teamZip = (String)teamTable.get("Zip");
	String teamCountry = (String)teamTable.get("Country");
	if (!teamAddress.equals(""))
	{
		if (!teamAddress2.equals(""))
			teamAddress = teamAddress + "<br>" + teamAddress2;
		if (!teamCity.equals(""))
			teamAddress = teamAddress + "<br>" + teamCity;
		if (!teamState.equals(""))
			teamAddress = teamAddress + ", " + teamState;
		if (!teamZip.equals(""))
			teamAddress = teamAddress + " " + teamZip;
		if (!teamCountry.equals(""))
			teamAddress = teamAddress + "<br>" + teamCountry;
	}
	String teamRegionName = (String)teamTable.get("RegionName");
	Boolean tempActive = (Boolean)teamTable.get("IsActive");
	String teamActive;
	if(tempActive.booleanValue())
		teamActive = "Yes";
	else
		teamActive = "No";
%>
<html>
<head>
<title><%=teamName%>&nbsp;Details</title>
</head>

<% String pageTitle = teamName; %>
<%@ include file="/infobase/ibheader.jspf" %>
				<form name=bookmarkForm action='/servlet/InfoBaseController' method='post'>
				    <input type=hidden name="action" value="changeBookmark">
						<input type=hidden name="displayname" value="<%= teamName %>">
						<input type=hidden name="type" value="locallevel">
						<input type=hidden name="locallevelid" value="<%= teamID %>">
						<input type=hidden name="value" value="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= teamID %>">
						<% 
								String mode;
								if(!ar.getValue("bookmarkID").equals("")) {
									mode = "remove";
								} else {
										mode = "add";
									}
							%>
						<INPUT TYPE=hidden name="bookmarkid" value="<%= ar.getValue("bookmarkID") %>"> 
						<INPUT TYPE=hidden name="mode" value="<%= mode %>">
				</form>
<% box.setWidth("100%");%>
<% box.setTitleAlign("LEFT");%>
<% box.setStyle("classic");%>
<% box.setTitleColor("#FFFFFF");%>
<% box.setTitle(""); %>
<% box.setColor("#D0DDEA");%>
<%=box.printTop() %>



<TABLE WIDTH="100%" BORDER="0"><TR><TD WIDTH="50%" ALIGN="LEFT"><%= font %>[<A HREF="/servlet/InfoBaseController?action=createReport&locallevelid=<%= teamID %>&type=locallevel">Success Criteria Reporter</A>]</FONT></TD><TD WIDTH="50%" ALIGN="RIGHT"><%= font %><A HREF="javascript: document.bookmarkForm.submit();"><% if(mode == "remove") { %>Un-<% } %>Bookmark this team</A></FONT></TD></TR></TABLE>
<%=box.printBottom() %>
	<table width="100%" border=0><tr><td WIDTH="30%" ALIGN="CENTER" VALIGN="TOP">
<% box.setTitleColor("#336699");%>
<% box.setColor("#FFFFFF");%>
<% box.setTitle("&nbsp;Team Info");%>
<% box.setWidth("98%");%>
<%=box.printTop()%>
				<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<% if(!teamLane.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Lane: </B></FONT></TD><TD><%= font %><%= teamLane %></TD></TR><% } %>
				<% if(!teamRegion.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Region: </B></FONT></TD><TD><%= font %><%= teamRegionName %></TD></TR><% } %>
				<% if(!teamAddress.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Address: </B></FONT></TD><TD style="padding-bottom:5px;"><%= fontS %><%= teamAddress  %></TD></TR><% } %>
				<% if(!teamPhone.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Phone: </B></FONT></TD><TD><%= font %><%= teamPhone %></TD></TR><% } %>
				<% if(!teamEmail.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>E-mail: </B></FONT></TD><TD><%= font %><A HREF="mailto: <%= teamEmail %>"><%= teamEmail %></A></TD></TR><% } %>
				<% if(!teamUrl.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Website: </B></FONT></TD><TD><%= font %><A HREF="<%= teamUrl %>"><%= teamUrl %></A></TD></TR><% } %>
				<% if(!teamActive.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Active? </B></TD><TD><%= font %><%= teamActive %></TD></TR><% } %>
				<% if(!teamNote.equals("")) { %><TR><TD VALIGN="TOP"><%=font%><B>Note: </B></TD><TD><%= font %><%= teamNote %></TD></TR><% } %>
				</TABLE>
				<P ALIGN="CENTER">
			<A HREF="/servlet/InfoBaseController?action=editTeam&mode=update&locallevelid=<%= teamID %>"><%= font %>Update</FONT></A><BR><%= fontS %>(Click update to add or change team contact info, web address, note, etc.)
<%=box.printBottom()%>
<BR>
<% box.setTitle("&nbsp;Staff Info");%>
<% box.setBodyFontSize("2");%>
<%=box.printTop()%>
<% Iterator targetStaffI = ar.getCollection("staff").iterator();
  String emailList = "";
  while(targetStaffI.hasNext()) {
		Hashtable staffMember = (Hashtable)targetStaffI.next();
    String staffName = staffMember.get("PreferredName") + " " + staffMember.get("LastName");
		String staffEmail = (String)staffMember.get("Email");
		String staffID = (String)staffMember.get("AccountNo");
		if(!staffEmail.equals("")) {
			emailList = emailList + staffEmail + "; ";
		}
		%>
		<A HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= staffID %>"><%=staffName%></A><!-- [<A HREF="/servlet/InfoBaseController?action=removeStaff&staffid=<%= staffID %>&locallevelid=<%= teamID %>">Remove</A>]--><BR>
   <%}%>
		<P ALIGN="CENTER">

		<!--<A HREF="/servlet/InfoBaseController?action=listStaff&mode=associate&group=locallevel&groupid=<%= teamID %>&searchby=region&searchtext=<%= teamRegion %>">Add Staff</A>-->
		<% if(!emailList.equals("")) { %>
			<A HREF="mailto: <%= emailList %>">E-mail</A> all team members
		<% } %>
	<%= box.printBottom()%>
	</TD>
	<TD VALIGN="TOP">
  <% Collection activeTargetCampusC = ar.getCollection("activetarget");
  Collection inactiveTargetCampusC = ar.getCollection("inactivetarget");
  Collection forerunnerTargetCampusC = ar.getCollection("forerunnertarget");
  Iterator activeTargetCampusI = activeTargetCampusC.iterator();
  Iterator inactiveTargetCampusI = inactiveTargetCampusC.iterator();
  Iterator forerunnerTargetCampusI = forerunnerTargetCampusC.iterator();
	   Hashtable row = null;
	%>
	<% if (activeTargetCampusC.size()>0) { %>
		<% box.setTitle("&nbsp;This team is currently responsible for the following target areas:");%>
		<% box.setSubPad("0"); %>
		<% box.setWidth("100%"); %>
		<%=box.printTop()%>
			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
			<TR>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Campus</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Strategy</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Status</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Update</B></FONT></TD>
			</TR>
			<% while(activeTargetCampusI.hasNext()) {
				   row = (Hashtable)activeTargetCampusI.next();
				%>
				<TR>
					<TD><%=font%><A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=row.get("TargetAreaID")%>"><B><%=row.get("Name")%></B></A></FONT></TD>
					<TD><%=font%><%=row.get("StrategyName")%></FONT></TD>
					<TD><%=font%><%=row.get("StatusName")%></FONT></TD>
					<TD><%=font%>[<A HREF="/servlet/InfoBaseController?action=editActivity&locallevelid=<%= teamID %>&referrer=locallevel&targetareaid=<%= row.get("TargetAreaID") %>&strategy=<%= row.get("Strategy") %>&activityid=<%= row.get("ActivityId") %>&status=<%= row.get("Status") %>&url=<%= row.get("Url") %>">Update</A>]</FONT></TD>
				</TR>
			<% } %>
				</TABLE><P ALIGN="CENTER"><TABLE WIDTH="90%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD>
				<%=font%>Add a campus to this team:<BR>
					<%=font%>[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=SC">add SC</A>]
					 				[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=CA">add CAT</A>]  
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=BR">add BR</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=ID">add ESM-D</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=IE">add ESM-E</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=II">add ESM-I</A>] <BR>
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=WI">add WSN ICS</A>] 
									[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=WS">add WSN STINT</A>] 
			</TD></TR></TABLE>

		<%=box.printBottom()%><P>
	<% } %>
	<% if (forerunnerTargetCampusC.size()>0) { %>
		<% box.setTitle("&nbsp;This team is trusting God to help them launch ministries at:");%>
		<% box.setSubPad("0"); %>
		<% box.setWidth("100%"); %>
		<%=box.printTop()%>
			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
			<TR>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Campus</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Strategy</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Status</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Update</B></FONT></TD>
			</TR>
			<% while(forerunnerTargetCampusI.hasNext()) {
				   row = (Hashtable)forerunnerTargetCampusI.next();
				%>
				<TR>
					<TD><%=font%><A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=row.get("TargetAreaID")%>"><B><%=row.get("Name")%></B></A></FONT></TD>
					<TD><%=font%><%=row.get("StrategyName")%></FONT></TD>
					<TD><%=font%><%=row.get("StatusName")%></FONT></TD>
					<TD><%=font%>[<A HREF="/servlet/InfoBaseController?action=editActivity&locallevelid=<%= teamID %>&referrer=locallevel&targetareaid=<%= row.get("TargetAreaID") %>&strategy=<%= row.get("Strategy") %>&activityid=<%= row.get("ActivityId") %>&status=<%= row.get("Status") %>&url=<%= row.get("Url") %>">Update</A>]</FONT></TD>
				</TR>
			<% } %>
				</TABLE><P ALIGN="CENTER"><TABLE WIDTH="90%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD>
				<%=font%>Add a campus to this team:<BR>
					<%=font%>[<A HREF="/servlet/InfoBaseController?action=addActivity&locallevelid=<%= teamID %>&strategy=CA">add Forerunner</A>]
			</TD></TR></TABLE>
		<%=box.printBottom()%><P>
	<% } %>
	<% if (inactiveTargetCampusC.size()>0) { %>
		<% box.setTitle("&nbsp;Target areas this team has been responsible for in the past:");%>
		<% box.setSubPad("0"); %>
		<% box.setWidth("100%"); %>
		<%=box.printTop()%>
			<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
			<TR>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Campus</B></FONT></TD>
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Strategy</B></FONT></TD>
				<!-- Commented out to eliminate the confusion about "inactive" might mean 
						and because everything here will be inactive anyway
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Status</B></FONT></TD>
				-->
				<TD BGCOLOR="<%= color2 %>"><%=font%><B>Update</B></FONT></TD>
			</TR>
			<% while(inactiveTargetCampusI.hasNext()) {
				   row = (Hashtable)inactiveTargetCampusI.next();
				%>
				<TR>
					<TD><%=font%><A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=row.get("TargetAreaID")%>"><B><%=row.get("Name")%></B></A></FONT></TD>
					<TD><%=font%><%=row.get("StrategyName")%></FONT></TD>
					<!-- Commented out to eliminate the confusion about "inactive" might mean 
					and because everything here will be inactive anyway
					<TD><%=font%><%=row.get("StatusName")%></FONT></TD>
					-->
					<TD><%=font%>[<A HREF="/servlet/InfoBaseController?action=editActivity&locallevelid=<%= teamID %>&referrer=locallevel&targetareaid=<%= row.get("TargetAreaID") %>&strategy=<%= row.get("Strategy") %>&activityid=<%= row.get("ActivityId") %>&status=<%= row.get("Status") %>&url=<%= row.get("Url") %>">Update</A>]</FONT></TD>
				</TR>
			<% } %>
				</TABLE>
		<%=box.printBottom()%>
	<% } %>
</TD></TR></TABLE>
	    <!--<%=fontB%><%=ar.toHTML()%></font> -->
<br>

<%@ include file="/infobase/ibfooter.jspf" %>
</html>