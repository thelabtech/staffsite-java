<!--  May 30, 2007 - following changes by Mark Davis per Todd Gross
	  This page was changed to no longer seperate certain ministries.  Now all  
      ministries will see the same STATUS and SUCCESS CRITERIA information.  
      Further comments are embedded in this page.  This change effects  
      modules:  Strategy.java, detail_target_area.jsp and set_report_criteria.jsp
      
      Ministries effected: Military Ministry (now Valor), Athletes In Action, 
      Christian Leadership Ministries (now Faculty COmmons), Korean CCC, Greek, Valor and Other
 -->

<%@ page import="org.alt60m.servlet.*,java.util.*,org.alt60m.ministry.Strategy,org.alt60m.ministry.model.dbio.Contact"%>
<%
	ActionResults ar;
	ar = ActionResults.getActionResults(session);

	Hashtable taTable = ar.getHashtable("target");

	Hashtable thisActivity = null; //used to store the actXX
	Collection otherMinistries = ar.getCollection("noncccmin");
	Collection contColl = null;
%>
<%
String pageTitle = (String) taTable.get("Name") + " Details";
%>
<html>
<head>
<title><%=pageTitle%></title>
</head>
<%@ include file="/infobase/ibheader.jspf"%>
				<form name=bookmarkForm action='/servlet/InfoBaseController' method='post'>
				    <input type=hidden name="action" value="changeBookmark">
						<input type=hidden name="displayname" value="<%= taTable.get("Name") %>">
						<input type=hidden name="type" value="targetarea">
						<input type=hidden name="targetareaid" value="<%= taTable.get("TargetAreaId") %>">
						<input type=hidden name="value" value="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%= taTable.get("TargetAreaId") %>">
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
<HR COLOR="#D0DDEA">

<HR COLOR="#D0DDEA">
<BR>
<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="95%" ALIGN="CENTER">
	<TR>
		<TD ALIGN="RIGHT" WIDTH="100%"><%=font%>[<A
			HREF="/servlet/InfoBaseController?action=createReport&targetareaid=<%= request.getParameter("targetareaid") %>&type=targetarea">Success
		Criteria Reporter</A>]</TD>
	</TR>
	<TR>
		<TD WIDTH="50%" ALIGN="RIGHT"><%= font %><A HREF="javascript: document.bookmarkForm.submit();">[<% if(mode == "remove") { %>Un-<% } %>Bookmark this Ministry Location]</A></FONT></TD>
	</TR>
</TABLE>
<BR>
<%=fontL%>
&nbsp;
<B>What movements exist at this Ministry Location?</B>
</FONT>
<BR>
<%
	boolean hasMovement = false;

	for (Strategy strategy : Strategy.campusStrategies()) {
		thisActivity = ar.getHashtable(strategy.name());
		
		if (thisActivity != null) {
			hasMovement = true;
%>
			<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2 WIDTH="80%"
				BGCOLOR="#D0DDEA">
				<TR>
					<TD COLSPAN="3" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%=font4L%><B><%=thisActivity
																	.get("strategyName")%>
					</B></FONT></TD>
				</TR>
				<TR>
					<TD ALIGN="CENTER"><%=font%>&nbsp;<B>Status:</B> <%=thisActivity.get("statusName")%>
					</FONT><%=fontS%>[<A
						HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>&url=<%=thisActivity.get("Url")%>&facebook=<%=thisActivity.get("Facebook")%>">Change</A>]</FONT></TD>
					<TD ALIGN="CENTER"><%=font%>&nbsp;<B>View Missional Team Information:</B>&nbsp;<A
						HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%=thisActivity.get("name")%></A>&nbsp;</FONT></TD>
					<TD ALIGN="CENTER"><%=font%><A
						HREF="/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Enter
					Success Criteria<img valign="absmiddle" border=0
						src="/infobase/images/check.gif"></A></TD>
				</TR>
				<TR>
					<TD COLSPAN="1"><%=font%>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
					<%
								contColl = (Vector<Contact>) thisActivity
								.get("contacts");
								
								Iterator contacts = contColl.iterator();
								Contact thisContact = null;
								if (!contacts.hasNext())
									out.print("No Contacts<BR>");
								while (contacts.hasNext()) {
									thisContact = (Contact) contacts.next();
					%>&nbsp; <A HREF="/servlet/InfoBaseController?action=showPersonInfo&personID=<%= thisContact.getPersonID()%>">
								<%
								if((thisContact.getPreferredName()!=null)&&
									(!((String)thisContact.getPreferredName()).equals(""))&&
									(!((String)thisContact.getPreferredName()).equals(" ")))
											{
												out.print( (String)thisContact.getPreferredName());
											}
								else
											{
												out.print((String)thisContact.getFirstName());
											}
								%>
								<%= (String)thisContact.getLastName() %>
							</A>

					&nbsp;[<A
						HREF="/servlet/InfoBaseController?action=removePersonContact&personID=<%= thisContact.getPersonID() %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>]
					<BR>
					<%
								}
								
					%><A HREF="/servlet/InfoBaseController?action=addPersonContact&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&lastName=A">Add
					Contact
					</A>
					</TD>
<!--  -->
					
					<TD COLSPAN="2" valign="top">
					<table>
					<tr>
					<td align="right" ><%=font%>&nbsp;<B>URL:&nbsp&nbsp</B></td><td><%=font%> <%=thisActivity.get("Url")%>
							</FONT><%=fontS%>&nbsp&nbsp[<A
  
						HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>&url=<%=thisActivity.get("Url")%>&facebook=<%=thisActivity.get("Facebook")%>">Change</A>]</FONT></td>
					</tr>
					<tr>
					<td align="right" ><%=font%>&nbsp;<B>Facebook/MySpace:&nbsp&nbsp</B></td><td><%=font%> <%=thisActivity.get("Facebook")%>
							</FONT><%=fontS%>&nbsp&nbsp[<A
  
						HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>&url=<%=thisActivity.get("Url")%>&facebook=<%=thisActivity.get("Facebook")%>">Change</A>]</FONT></td>
					</tr>
					</table>
<!--  -->			</TD>		
				</TR>

			</TABLE>
			<br>
			<%
		}
	}
	%>
	
  	
	<%
	if (otherMinistries.size() > 0) {
		hasMovement = true;
		%>
		<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2
			WIDTH="80%" BGCOLOR="#D0DDEA">
			<TR>
				<TD COLSPAN="2" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%=font4L%><B>Other
				Ministries</B></FONT></TD>
			</TR>
			<%
							for (Iterator i = otherMinistries.iterator(); i
							.hasNext();) {
						String otherMinistryID = "";
						Hashtable otherministry = (Hashtable) i.next();
			%>
			<TR>
				<TD ALIGN="CENTER"><%=font%>&nbsp;<A
					HREF="/servlet/InfoBaseController?action=showMin&noncccminid=<%= otherministry.get("NonCccMinId") %>"><%=otherministry.get("Ministry")%></A>&nbsp;<%=otherministry.get("FirstName")%>&nbsp;<%=otherministry.get("LastName")%></FONT></TD>
				<TD ALIGN="CENTER" WIDTH="10%"><%=font%>[<A
					HREF="/servlet/InfoBaseController?action=removeMin&from=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&noncccminid=<%= otherministry.get("NonCccMinId") %>">Remove</A>]</FONT></TD>
			</TR>
			<%
			}
			%>
		</TABLE>
		<%
		}
	
	
	%>
	<TABLE ALIGN="CENTER" WIDTH="80%" BORDER=0 CELLPADDING=0
	CELLSPACING=0>
	<TR>
		<TD> <%
	
	if (!hasMovement) {
			%>
		<%=font%><I>There are no movements recorded.</I>
		<BR></FONT> <%
     }

	%> 
		</TD>
	</TR>
	<TR>
		<TD>
	
	<%
	
   	for (Strategy strategy : Strategy.campusStrategies()) {
   		thisActivity = ar.getHashtable(strategy.name());
   		boolean showAddLink = false;
   		if (thisActivity == null) {
   			showAddLink = true;
   			
   			// Check for exclusion of CA/SC
   			if (strategy.name().equals("CA")) {
   				thisActivity = ar.getHashtable("SC");
   				if (thisActivity != null) {
   					showAddLink = false;
   				}
   			}
   			else if (strategy.name().equals("SC")) {
   				thisActivity = ar.getHashtable("CA");
   				if (thisActivity != null) {
   					showAddLink = false;
   				}
   			}
   		}
		if ((Strategy.internationalCampusStrategies().contains(strategy) && (taTable.get("Country")).equals("USA")) ||
			(Strategy.usCampusStrategies().contains(strategy) && !(taTable.get("Country")).equals("USA")))
		{
			showAddLink = false;
		}
   		
   		if (showAddLink) {
			%>
			<%=font%>[ <A
			HREF="/servlet/InfoBaseController?action=addTeamToCampus&from=addTeamToCampus&strategy=<%= strategy.toString() %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>">
			Add <%= strategy.getName() %> Movement</A> ] 
			</font>
			
			<br>
			<%
			
   		}
	}
		

	
	   		
	   		
	    %>
	   			<%=font%>[ <A 
	   			HREF="/servlet/InfoBaseController?action=addMinToCampus&targetareaid=<%= request.getParameter("targetareaid") %>">Add non-CCC Ministry to this Ministry Location</A> ]
				</font>
				<br>
	   	<%
	   	

	   	
   	%>
			</TD>
		</TR>
	</TABLE>

<BR>



				<!--------------------------- end CCC Ministry Non-campus Ministries --------------------------------------------->


				<%
						box.reset();
						box.setWidth("");
						box
								.setTitle("&nbsp;Miscellaneous Ministry Location Information &nbsp;");
						box.setStyle("Classic");
						box.setColor(color2);
				%>
				<P ALIGN="CENTER"><%=box.printTop()%>
				<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=3 CELLSPACING=0>
					<TR>
						<TD ALIGN="RIGHT"><%=font%>Region:</TD>
						<TD><%=font%><%=taTable.get("Region")%></TD>
					</TR>
					<TR>
						<TD ALIGN="RIGHT"><%=font%>Alternate Name:</TD>
						<TD><%=font%><%=taTable.get("AltName")%></TD>
					</TR>
					<TR>
						<TD ALIGN="RIGHT"><%=font%>Local Ministry URL:</TD>
						<TD><%=font%><%=taTable.get("Url")%></TD>
					</TR>
					<TR>
						<TD ALIGN="RIGHT"><%=font%>Official School Website URL:</TD>
						<TD><%=font%><%=taTable.get("InfoUrl")%></TD>
					</TR>
					<TR>
						<TD ALIGN="RIGHT"><%=font%>Address:</TD>
						<TD><%=font%> <%
 if (!((String) taTable.get("Address1")).equals("")) {
 %><%=(String) taTable.get("Address1")%><BR>
						<%
						}
						%> <%
 if (!((String) taTable.get("Address2")).equals("")) {
 %><%=(String) taTable.get("Address2")%><BR>
						<%
						}
						%> <%=taTable.get("City")%>, <%=taTable.get("State")%> <%=taTable.get("Zip")%>
						<%=taTable.get("Country")%></TD>
					</TR>
					<TR>
						<TD ALIGN="RIGHT"><%=font%>Enrollment:</TD>
						<TD><%=font%> <%
 if ((taTable.get("Enrollment")) != null) {
 %><%=taTable.get("Enrollment")%><BR>
						<%
						} else {
						%> unknown <%
						}
						%>
						</TD>
					</TR>




					
					<%-- <TR><TD ALIGN="RIGHT"><%= font %>Secure?</TD><TD><%= font %>
<% if (((Boolean)taTable.get("IsSecure")).booleanValue()) { 
%>Yes<% 
} else { 
%>No<% 
} %>
</TD></TR> --%>
					<TR>
						<TD ALIGN="RIGHT"><%=font%>Semester?</TD>
						<TD><%=font%>
						<%
										if (((Boolean) taTable.get("IsSemester"))
										.booleanValue()) {
						%>Yes<%
						} else {
						%>No<%
						}
						%>
						</TD>
					</TR>
					<%
					if (taTable.get("MonthSchoolStarts") != null) {
					%>
					<TR>
						<TD ALIGN="RIGHT"><%=font%>School year:</TD>
						<TD><%=font%> <%=taTable.get("MonthSchoolStarts")%> to <%=taTable.get("MonthSchoolStops")%>
						<%
						}
						%>
						</TD>
					</TR>
					<TR>
						<TD ALIGN="CENTER" COLSPAN="2"><%=font%><A
							HREF="/servlet/InfoBaseController?action=editTargetArea&targetareaid=<%= request.getParameter("targetareaid") %>">Update</A></FONT></TD>
					</TR>
				</TABLE>
				<%=box.printBottom()%> <!--<%=fontB%><%=ar.toHTML()%>--> <%@ include
					file="/infobase/ibfooter.jspf"%>
				</html>