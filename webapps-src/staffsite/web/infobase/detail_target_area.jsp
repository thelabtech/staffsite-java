<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);


Hashtable taTable = ar.getHashtable("target");
Hashtable actCA = ar.getHashtable("CA");
Hashtable actSC = ar.getHashtable("SC");
Hashtable actBR = ar.getHashtable("BR");
Hashtable actIE = ar.getHashtable("IE");
Hashtable actID = ar.getHashtable("ID");
Hashtable actII = ar.getHashtable("II");
Hashtable actWI = ar.getHashtable("WI");
Hashtable actWS = ar.getHashtable("WS");

//add more act's to the getHashtable
//added by David Bauer 7/14/04
Hashtable actMM = ar.getHashtable("MM");	//military ministry
Hashtable actAA = ar.getHashtable("AA");	//AIA
Hashtable actGR = ar.getHashtable("GR");	//Grad Resources
Hashtable actCL = ar.getHashtable("CL");	//CLM (Chrsitian Leadership U)
Hashtable actKC = ar.getHashtable("KC");	//Korean CCC



Hashtable thisActivity = null;				//used to store the actXX
Collection otherMinistries = ar.getCollection("noncccmin");
Collection contColl = null;
boolean hasMinistry = false;

%>
<% String pageTitle=(String)taTable.get("Name") + " Details"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>
<HR COLOR="#D0DDEA">

<HR COLOR="#D0DDEA">
<BR><TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="95%" ALIGN="CENTER"><TR><TD ALIGN="RIGHT" WIDTH="100%">
<%= font %>[<A HREF="/servlet/InfoBaseController?action=createReport&targetareaid=<%= request.getParameter("targetareaid") %>&type=targetarea">Success Criteria Reporter</A>]</TD></TR></TABLE>
<BR><%= fontL %>&nbsp;<B>What's going on at this campus?</B></FONT><BR>
<% 
		if(((String)taTable.get("Country")).equals("USA")) {
			thisActivity = actCA;
			if(thisActivity == null)
				thisActivity = actSC; 
			if(thisActivity != null) {
				%>
				<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2 WIDTH="80%" BGCOLOR="#D0DDEA">
				<TR><TD COLSPAN="3" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%= font4L %><B><%= thisActivity.get("strategyName") %> Strategy</B></FONT></TD></TR>
				<TR>
					<TD ALIGN="CENTER"><%= font %>&nbsp;<B>Status:</B> <%= thisActivity.get("statusName") %> </FONT><%= fontS %>[<A HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>">Change</A>]</FONT></TD>
					<TD ALIGN="CENTER"><%= font %>&nbsp;<B>View Team Information:</B>&nbsp;<A HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%= thisActivity.get("name") %></A>&nbsp;</FONT></TD>
					<TD ALIGN="CENTER"><%= font %><A HREF="/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Enter Success Criteria<img valign="absmiddle" border=0 src="/infobase/images/check.gif"></A></TD>
				</TR>
				<TR>
					<TD COLSPAN="3"><%= font %>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
					<% 
					contColl = (Collection)thisActivity.get("contacts");
					int numContacts = contColl.size();
					Iterator contacts = contColl.iterator();
					Hashtable thisContact = null;
			    if(!contacts.hasNext())
						out.print("No Contacts<BR>");
					while(contacts.hasNext()) {
						thisContact = (Hashtable)contacts.next();
						%>&nbsp;
						<A HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= thisContact.get("AccountNo") %>"><%= thisContact.get("PreferredName") + " " + thisContact.get("LastName") %></A>
						
						&nbsp;[<A HREF="/servlet/InfoBaseController?action=removeContact&staffid=<%= thisContact.get("AccountNo") %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>] <BR>
						<%
					}
					if(numContacts < 2) {
						%><A HREF="/servlet/InfoBaseController?action=addContact&activityid=<%= thisActivity.get("activityID") %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>&mode=region">Add Contact</A>
						<%
					}
			} else {
		%><TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="80%">
				<TR><TD><P><%= font %>&nbsp;<I>There are no ministry strategies recorded.</I></FONT><P>
								<%= font %>&nbsp;[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=SC&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add SC</A>] [<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=CA&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add CA</A>]
		<%
		}
	} else {
			for(int i=0; i<2; i++) {
				switch(i) {
					case 0:
						thisActivity = actWS;
						break;
					case 1:
						thisActivity = actWI;
						break;
				}
			if(thisActivity != null) { 
				hasMinistry = true; %>
				<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2 WIDTH="80%" BGCOLOR="#D0DDEA">
				<TR><TD COLSPAN="3" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%= font4L %><B><%= thisActivity.get("strategyName") %> Strategy</B></FONT></TD></TR>
				<TR>
					<TD ALIGN="CENTER"><%= font %>&nbsp;<B>Status:</B> <%= thisActivity.get("statusName") %> </FONT><%= fontS %>[<A HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>">Change</A>]</FONT></TD>
					<TD ALIGN="CENTER"><%= font %>&nbsp;<B>View Team Information:</B>&nbsp;<A HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%= thisActivity.get("name") %></A>&nbsp;</FONT></TD>
					<TD ALIGN="CENTER"><%= font %><A HREF="/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Enter Success Criteria<img valign="absmiddle" border=0 src="/infobase/images/check.gif"></A></TD>
				</TR>
				<TR>
					<TD COLSPAN="3"><%= font %>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
					<% 
					contColl = (Collection)thisActivity.get("contacts");
					int numContacts = contColl.size();
					Iterator contacts = contColl.iterator();
					Hashtable thisContact = null;
			    if(!contacts.hasNext())
						out.print("No Contacts<BR>");
					while(contacts.hasNext()) {
						thisContact = (Hashtable)contacts.next();
						%>&nbsp;
						<A HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= thisContact.get("AccountNo") %>"><%= thisContact.get("PreferredName") + " " + thisContact.get("LastName") %></A>
						
						&nbsp;[<A HREF="/servlet/InfoBaseController?action=removeContact&staffid=<%= thisContact.get("AccountNo") %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>] <BR>
						<%
					}
					if(numContacts < 2) {
						%><A HREF="/servlet/InfoBaseController?action=addContact&activityid=<%= thisActivity.get("activityID") %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>&mode=region">Add Contact</A>
				<% } %>
				</TD></TR></TABLE>
<%
			} 
		} %>
  <TABLE ALIGN="CENTER" WIDTH="80%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><%= font %>
<%
		if(!hasMinistry) {
%>
  <%= font %><I>There are no ministries recorded.</I><P>
	<% } %>
								<%= font %>&nbsp;
								<% if(actWS == null) { %>
								[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=WS&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add WSN STINT</A>]
								<% } if(actWI == null) { %>
								[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=WI&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add WSN ICS</A>]
			<%			}
			} %>
</TD></TR></TABLE>
<BR><%= fontL %>&nbsp;<B>Contextual Ministries:</B></FONT><BR>
		<%
			boolean hasContextual = false;
			for(int i=0; i<4; i++) {
				switch(i) {
					case 0:
						thisActivity = actIE;
						break;
					case 1:
						thisActivity = actID;
						break;
					case 2:
						thisActivity = actII;
						break;
					case 3:
						thisActivity = actBR;
						break;
			}
			if(thisActivity != null) { 
				hasContextual = true; %>
	<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2 WIDTH="80%" BGCOLOR="#D0DDEA">
		<TR><TD COLSPAN="3" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%= font4L %><B><%= thisActivity.get("strategyName") %> Strategy</B></FONT></TD></TR>
		<TR>
			<TD ALIGN="CENTER"><%= font %>&nbsp;<B>Status:</B> Active</FONT><%= fontS %>[<A HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>">Change</A>]</FONT></TD>
			<TD ALIGN="CENTER"><%= font %>&nbsp;<B>View Team Information:</B>&nbsp;<A HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%= thisActivity.get("name") %></A>&nbsp;</FONT></TD>
			<TD ALIGN="CENTER"><%= font %>&nbsp;<A HREF="/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Enter Success Criteria<img valign="absmiddle" border=0 src="/infobase/images/check.gif"></A></TD>
		</TR>
		<TR>
			<TD COLSPAN="3"><%= font %>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
				<% 
					contColl = (Collection)thisActivity.get("contacts");
					int numContacts = contColl.size();
					Iterator contacts = contColl.iterator();
					Hashtable thisContact = null;
			    if(!contacts.hasNext())
						out.print("No Contacts<BR>");
					while(contacts.hasNext()) {
						thisContact = (Hashtable)contacts.next();
						%>&nbsp;
						<A HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= thisContact.get("AccountNo") %>"><%= thisContact.get("PreferredName") + " " + thisContact.get("LastName") %></A>
						
						&nbsp;[<A HREF="/servlet/InfoBaseController?action=removeContact&staffid=<%= thisContact.get("AccountNo") %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>] <BR>
						<%
					}
					if(numContacts < 2) {
						%><A HREF="/servlet/InfoBaseController?action=addContact&activityid=<%= thisActivity.get("activityID") %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>&mode=region">Add Contact</A>
				<% } %>
				</TD></TR></TABLE>
<%
				}
		}
%>
  <TABLE ALIGN="CENTER" WIDTH="80%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><%= font %>
<%
		if(!hasContextual) {
%>
  <%= font %><I>There are no contextual ministries recorded.</I><P>
	<% } %>
	<%
	if(actIE == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=IE&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add ESM-E</A>]
	<% } if(actID == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=ID&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add ESM-D</A>]
	<% } if(actII == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=II&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add ESM-I</A>]
	<% } if(actBR == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=BR&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add BR</A>]
	<% } %>
</FONT>
</TD></TR></TABLE>


<!------------------------------- non-CCC ministries ----------------------------------------------------------->


<BR><%= fontL %>&nbsp;<B>Non-Crusade Ministries:</B></FONT><BR>
<% 

		if(otherMinistries.size() > 0) {
			%><TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2 WIDTH="80%" BGCOLOR="#D0DDEA">
			<TR><TD COLSPAN="2" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%= font4L %><B>Other Ministries</B></FONT></TD></TR>
			<%
			for(Iterator i = otherMinistries.iterator();i.hasNext() ; )
			{
				String otherMinistryID = "";
				Hashtable otherministry = (Hashtable) i.next();
			%>
			<TR>
			<TD ALIGN="CENTER"><%= font %>&nbsp;<A HREF="/servlet/InfoBaseController?action=showMin&noncccminid=<%= otherministry.get("NonCccMinId") %>"><%= otherministry.get("Ministry") %></A>&nbsp;<%= otherministry.get("FirstName") %>&nbsp;<%= otherministry.get("LastName") %></FONT></TD>
			<TD ALIGN="CENTER" WIDTH="10%"><%= font %>[<A HREF="/servlet/InfoBaseController?action=removeMin&from=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&noncccminid=<%= otherministry.get("NonCccMinId") %>">Remove</A>]</FONT></TD>
			</TR><%
			}
			%>
			</TABLE><%

		} else {
		%><TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="80%">
				<TR><TD><P><%= font %>&nbsp;<I>There are no non-Crusade ministries recorded.</I></FONT><P></TR></TD></TABLE>
		<% } %>

  <TABLE ALIGN="CENTER" WIDTH="80%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><%= font %>[<A HREF="/servlet/InfoBaseController?action=addMinToCampus&targetareaid=<%= request.getParameter("targetareaid") %>">Add non-CCC Ministry to this campus</A>]
<!--[<A HREF="/servlet/InfoBaseController?action=editNonCCCMin&mode=add&targetareaid=<%= request.getParameter("targetareaid") %>">Add a non-Crusade ministry</A>]--></FONT></TD></TR></TABLE>

<!--------------------------- end non-CCC ministries ------------------------------------------------------------->


<!--------------------------- start CCC Ministry Non-campus Ministries ------------------------------------------->
<BR><%= fontL %>&nbsp;<B>CCC Ministries Non-Campus Ministries:</B></FONT><BR>
		<%
			hasContextual = false;
			for(int i=0; i<5; i++) {
				switch(i) {
					case 0:
						thisActivity = actMM;
						break;
					case 1:
						thisActivity = actAA;
						break;
					case 2:
						thisActivity = actGR;
						break;
					case 3:
						thisActivity = actCL;
						break;
					case 4:
						thisActivity = actKC;
						break;
			}
			if(thisActivity != null) { 
				hasContextual = true; %>
	<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2 WIDTH="80%" BGCOLOR="#D0DDEA">
		<TR><TD COLSPAN="3" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%= font4L %><B><%= thisActivity.get("strategyName") %> Strategy</B></FONT></TD></TR>
		<TR>
			<TD ALIGN="CENTER"><%= font %>&nbsp;<B>Status:</B> Active</FONT><%= fontS %>[<A HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>">Change</A>]</FONT></TD>
			<TD ALIGN="CENTER"><%= font %>&nbsp;<B>View Team Information:</B>&nbsp;<A HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%= thisActivity.get("name") %></A>&nbsp;</FONT></TD>
		</TR>
		<TR>
			<TD COLSPAN="3"><%= font %>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
				<% 
					contColl = (Collection)thisActivity.get("contacts");
					int numContacts = contColl.size();
					Iterator contacts = contColl.iterator();
					Hashtable thisContact = null;
			    if(!contacts.hasNext())
						out.print("No Contacts<BR>");
					while(contacts.hasNext()) {
						thisContact = (Hashtable)contacts.next();
						%>&nbsp;
						<A HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= thisContact.get("AccountNo") %>"><%= thisContact.get("PreferredName") + " " + thisContact.get("LastName") %></A>
						
						&nbsp;[<A HREF="/servlet/InfoBaseController?action=removeContact&staffid=<%= thisContact.get("AccountNo") %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>] <BR>
						<%
					}
					if(numContacts < 2) {
						%><A HREF="/servlet/InfoBaseController?action=addContact&activityid=<%= thisActivity.get("activityID") %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>&mode=region">Add Contact</A>
				<% } %>
				</TD></TR></TABLE>
<%
				}
		}
%>
  <TABLE ALIGN="CENTER" WIDTH="80%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD><%= font %>
<%
		if(!hasContextual) {
%>
  <%= font %><I>There are no ccc ministry non-campus ministries recorded.</I><P>
	<% } %>
	<%
	if(actMM == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=MM&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add MM</A>]
	<% } if(actAA == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=AA&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add AA</A>]
	<% } if(actGR == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=GR&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add GR</A>]
	<% } if(actCL == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=CL&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add CL</A>]
	<% } if(actKC == null) { %>
		[<A HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=KC&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Add KC</A>]
	<% } %>
</FONT>
</TD></TR></TABLE>


<!--------------------------- end CCC Ministry Non-campus Ministries --------------------------------------------->


<% 
		box.reset();
		box.setWidth("");
		box.setTitle("&nbsp;Miscellaneous Campus Information &nbsp;");
		box.setStyle("Classic");
		box.setColor(color2);
%>
<P ALIGN="CENTER">
<%= box.printTop() %>
<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=3 CELLSPACING=0>
<TR><TD ALIGN="RIGHT"><%= font %>Region:</TD><TD><%= font %><%= taTable.get("Region") %></TD></TR>
<TR><TD ALIGN="RIGHT"><%= font %>Alternate Name:</TD><TD><%= font %><%= taTable.get("AltName") %></TD></TR>
<TR><TD ALIGN="RIGHT"><%= font %>Local Ministry URL:</TD><TD><%= font %><%= taTable.get("Url") %></TD></TR>
<TR><TD ALIGN="RIGHT"><%= font %>Official School Website URL:</TD><TD><%= font %><%= taTable.get("InfoUrl") %></TD></TR>
<TR><TD ALIGN="RIGHT"><%= font %>Address:</TD><TD><%= font %>
<% if(!((String)taTable.get("Address1")).equals("")) { %><%= (String)taTable.get("Address1") %><BR><% } %>
<% if(!((String)taTable.get("Address2")).equals("")) { %><%= (String)taTable.get("Address2") %><BR><% } %>
<%= taTable.get("City") %>, <%= taTable.get("State") %> <%= taTable.get("Zip") %> <%= taTable.get("Country") %>
</TD></TR>
<TR><TD ALIGN="RIGHT"><%= font %>Enrollment:</TD><TD><%= font %>

<% if ((taTable.get("Enrollment")) != null) { %><%= taTable.get("Enrollment") %><BR><% }
	else {%> unknown <%} %> </TD></TR>




<TR><TD ALIGN="RIGHT"><%= font %>Fice:</TD><TD><%= font %><%= taTable.get("Fice") %></TD></TR>
<%-- <TR><TD ALIGN="RIGHT"><%= font %>Secure?</TD><TD><%= font %>
<% if (((Boolean)taTable.get("IsSecure")).booleanValue()) { 
%>Yes<% 
} else { 
%>No<% 
} %>
</TD></TR> --%>
<TR><TD ALIGN="RIGHT"><%= font %>Semester?</TD><TD><%= font %><% if(((Boolean)taTable.get("IsSemester")).booleanValue()) { %>Yes<% } else { %>No<% } %></TD></TR>
<% if(taTable.get("MonthSchoolStarts") != null) { %>
<TR><TD ALIGN="RIGHT"><%= font %>School year:</TD><TD><%= font %>
<%= taTable.get("MonthSchoolStarts") %> to <%= taTable.get("MonthSchoolStops") %>
<% } %></TD></TR>
<TR><TD ALIGN="CENTER" COLSPAN="2"><%= font %><A HREF="/servlet/InfoBaseController?action=editTargetArea&targetareaid=<%= request.getParameter("targetareaid") %>">Update</A></FONT></TD></TR>
</TABLE>
<%= box.printBottom() %>

<!--<%=fontB%><%=ar.toHTML()%>-->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>