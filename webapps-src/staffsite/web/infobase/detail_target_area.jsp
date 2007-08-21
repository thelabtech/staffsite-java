<!--  May 30, 2007 - following changes by Mark Davis per Todd Gross
	  This page was changed to no longer seperate certain ministries.  Now all  
      ministries will see the same STATUS and SUCCESS CRITERIA information.  
      Further comments are embedded in this page.  This change effects  
      modules:  Strategy.java, detail_target_area.jsp and set_report_criteria.jsp
      
      Ministries effected: Military Ministry, Athletes In Action,Grad Resources, 
      Christian Leadership Ministries, Korean CCC, Greek, Valor and Other
 -->

<%@ page import="org.alt60m.servlet.*,java.util.*,org.alt60m.ministry.Strategy"%>
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
<HR COLOR="#D0DDEA">

<HR COLOR="#D0DDEA">
<BR>
<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="95%" ALIGN="CENTER">
	<TR>
		<TD ALIGN="RIGHT" WIDTH="100%"><%=font%>[<A
			HREF="/servlet/InfoBaseController?action=createReport&targetareaid=<%= request.getParameter("targetareaid") %>&type=targetarea">Success
		Criteria Reporter</A>]</TD>
	</TR>
</TABLE>
<BR>
<%=fontL%>
&nbsp;
<B>What movements exist on this campus?</B>
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
						HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>&url=<%=thisActivity.get("Url")%>">Change</A>]</FONT></TD>
					<TD ALIGN="CENTER"><%=font%>&nbsp;<B>View Team Information:</B>&nbsp;<A
						HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%=thisActivity.get("name")%></A>&nbsp;</FONT></TD>
					<TD ALIGN="CENTER"><%=font%><A
						HREF="/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>">Enter
					Success Criteria<img valign="absmiddle" border=0
						src="/infobase/images/check.gif"></A></TD>
				</TR>
				<TR>
					<TD COLSPAN="1"><%=font%>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
					<%
								contColl = (Collection) thisActivity
								.get("contacts");
								int numContacts = contColl.size();
								Iterator contacts = contColl.iterator();
								Hashtable thisContact = null;
								if (!contacts.hasNext())
									out.print("No Contacts<BR>");
								while (contacts.hasNext()) {
									thisContact = (Hashtable) contacts.next();
					%>&nbsp; <A
						HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= thisContact.get("AccountNo") %>"><%=thisContact
																		.get("PreferredName")
																+ " "
																+ thisContact
																		.get("LastName")%></A>

					&nbsp;[<A
						HREF="/servlet/InfoBaseController?action=removeContact&staffid=<%= thisContact.get("AccountNo") %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>]
					<BR>
					<%
								}
								if (numContacts < 2) {
					%><A HREF="/servlet/InfoBaseController?action=addContact&activityid=<%= thisActivity.get("activityID") %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>&mode=region">Add
					Contact
					</A><%
								}
					%>
					</TD>
<!--  -->
					<TD COLSPAN="2" valign="top"><%=font%>&nbsp;<B>URL:&nbsp&nbsp</B> <%=thisActivity.get("Url")%>
							</FONT><%=fontS%>&nbsp&nbsp[<A
  
						HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>&url=<%=thisActivity.get("Url")%>">Change</A>]</FONT></TD>

<!--  -->					
				</TR>

			</TABLE>
			<br>
			<%
		}
	}
	
	/* ---------------------------------------------------------------------------------------
 	*  This code is being removed as part of the Movement/Success Criteria changes.  See note at 
 	*  the top of the code.  This section of code deals with the ministries: Grad Resources,  
 	*  ChristianLeadership Ministries, and Korean CCC.  This code can be completely removed 
 	*  eventually. 
 	* -----------------------------------------------------------------------------------------
	for (Strategy strategy : Strategy.campusNoSuccessCriteriaStrategies()) {
		thisActivity = ar.getHashtable(strategy.name());
		
		if (thisActivity != null) {
			hasMovement = true;
%>
			<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2
					WIDTH="80%" BGCOLOR="#D0DDEA">
					<TR>
						<TD COLSPAN="3" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%=font4L%><B><%=thisActivity
														.get("strategyName")%>
						</B></FONT></TD>
					</TR>
					<TR>
						<TD ALIGN="CENTER"><%=font%>&nbsp;<B>Status:</B> Active</FONT><%=fontS%>[<A
							HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>&url=<%=thisActivity.get("Url")%>">Change</A>]</FONT></TD>
						<TD ALIGN="CENTER"><%=font%>&nbsp;<B>View Team
						Information:</B>&nbsp;<A
							HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%=thisActivity.get("name")%></A>&nbsp;</FONT></TD>
					</TR>
					<TR>
						<TD COLSPAN="3"><%=font%>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
						<%
			contColl = (Collection) thisActivity.get("contacts");
			int numContacts = contColl.size();
			Iterator contacts = contColl.iterator();
			Hashtable thisContact = null;
			if (!contacts.hasNext())
				out.print("No Contacts<BR>");
			while (contacts.hasNext()) {
				thisContact = (Hashtable) contacts.next();
						%>&nbsp; <A
							HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= thisContact.get("AccountNo") %>"><%=thisContact
															.get("PreferredName")
													+ " "
													+ thisContact
															.get("LastName")%></A>

						&nbsp;[<A
							HREF="/servlet/InfoBaseController?action=removeContact&staffid=<%= thisContact.get("AccountNo") %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>]
						<BR>
						<%
			}
			if (numContacts < 2) {
			%>
			<A HREF="/servlet/InfoBaseController?action=addContact&activityid=<%= thisActivity.get("activityID") %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>&mode=region">Add
						Contact</A> 
			<%
			}
			%>
						</TD>
					</TR>
				</TABLE>
			<br>
			<%
		}
	}
  --- End Of Comment Block -------------------------*/
  /* ---------------------------------------------------------------------------------------
	*  This code is being removed as part of the Movement/Success Criteria changes.  See the 
	*  note at the top of the code.  This section of code deals with the ministries: Greek, Valor 
	*  & Other.  This code can be completly removed eventually.
	* -----------------------------------------------------------------------------------------
  
	for (Strategy strategy : Strategy.microCultures()) {
		thisActivity = ar.getHashtable(strategy.name());
		
		if (thisActivity != null) {
	hasMovement = true;
%>
			<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2
					WIDTH="80%" BGCOLOR="#D0DDEA">
					<TR>
						<TD COLSPAN="3" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%=font4L%><B><%=thisActivity
														.get("strategyName")%>
						</B></FONT></TD>
					</TR>
					<TR>
						<TD ALIGN="CENTER"><%=font%>&nbsp;<B>Status:</B> Active</FONT><%=fontS%>[<A
							HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>&url=<%=thisActivity.get("Url")%>">Change</A>]</FONT></TD>
						<TD ALIGN="CENTER"><%=font%>&nbsp;<B>View Team
						Information:</B>&nbsp;<A
							HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%=thisActivity.get("name")%></A>&nbsp;</FONT></TD>
					</TR>
					<TR>
						<TD COLSPAN="3"><%=font%>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
						<%
										contColl = (Collection) thisActivity
										.get("contacts");
										int numContacts = contColl.size();
										Iterator contacts = contColl.iterator();
										Hashtable thisContact = null;
										if (!contacts.hasNext())
									out.print("No Contacts<BR>");
										while (contacts.hasNext()) {
									thisContact = (Hashtable) contacts.next();
						%>&nbsp; <A
							HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= thisContact.get("AccountNo") %>"><%=thisContact
															.get("PreferredName")
													+ " "
													+ thisContact
															.get("LastName")%></A>

						&nbsp;[<A
							HREF="/servlet/InfoBaseController?action=removeContact&staffid=<%= thisContact.get("AccountNo") %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>]
						<BR>
						<%
										}
										if (numContacts < 2) {
						%><A
							HREF="/servlet/InfoBaseController?action=addContact&activityid=<%= thisActivity.get("activityID") %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>&mode=region">Add
						Contact</A> <%
 }
 %>
						</TD>
					</TR>
				</TABLE>
			<br>
			<%
		}
	}
  --- End Of Comment Block -------------------------*/	
  
  /* ---------------------------------------------------------------------------------------
	*  This code is being removed as part of the Movement/Success Criteria changes.  See note at 
	*  the top of the code.  This section of code deals with the ministries: Military Ministry   
	*  and Athletes in Action. This code can be completly removed eventually.
	* -----------------------------------------------------------------------------------------
	for (Strategy strategy : Strategy.nonCampusStrategies()) {
		thisActivity = ar.getHashtable(strategy.name());
		
		if (thisActivity != null) {
			hasMovement = true;
%>
			<TABLE ALIGN="CENTER" CELLPADDING=2 BORDER=1 CELLSPACING=2
					WIDTH="80%" BGCOLOR="#D0DDEA">
					<TR>
						<TD COLSPAN="3" BGCOLOR="<%= color1 %>" ALIGN="CENTER"><%=font4L%><B><%=thisActivity
														.get("strategyName")%>
						</B></FONT></TD>
					</TR>
					<TR>
						<TD ALIGN="CENTER"><%=font%>&nbsp;<B>Status:</B> Active</FONT><%=fontS%>[<A
							HREF="/servlet/InfoBaseController?action=editActivity&activityid=<%= thisActivity.get("activityID") %>&referrer=targetarea&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>&locallevelid=<%= thisActivity.get("LocalLevelId") %>&status=<%= thisActivity.get("status") %>&url=<%=thisActivity.get("Url")%>">Change</A>]</FONT></TD>
						<TD ALIGN="CENTER"><%=font%>&nbsp;<B>View Team
						Information:</B>&nbsp;<A
							HREF="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisActivity.get("LocalLevelId") %>"><%=thisActivity.get("name")%></A>&nbsp;</FONT></TD>
					</TR>
					<TR>
						<TD COLSPAN="3"><%=font%>&nbsp;<B>Contacts</B>: (2 maximum)<BR>
						<%
			contColl = (Collection) thisActivity.get("contacts");
			int numContacts = contColl.size();
			Iterator contacts = contColl.iterator();
			Hashtable thisContact = null;
			if (!contacts.hasNext())
				out.print("No Contacts<BR>");
			while (contacts.hasNext()) {
				thisContact = (Hashtable) contacts.next();
						%>&nbsp; <A
							HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= thisContact.get("AccountNo") %>"><%=thisContact
															.get("PreferredName")
													+ " "
													+ thisContact
															.get("LastName")%></A>

						&nbsp;[<A
							HREF="/servlet/InfoBaseController?action=removeContact&staffid=<%= thisContact.get("AccountNo") %>&activityid=<%= thisActivity.get("activityID") %>&targetareaid=<%= request.getParameter("targetareaid") %>&strategy=<%= thisActivity.get("strategy") %>">Remove</A>]
						<BR>
						<%
			}
			if (numContacts < 2) {
			%>
			<A HREF="/servlet/InfoBaseController?action=addContact&activityid=<%= thisActivity.get("activityID") %>&region=<%= taTable.get("Region") %>&targetareaid=<%= request.getParameter("targetareaid") %>&mode=region">Add
						Contact</A> 
			<%
			}
			%>
						</TD>
					</TR>
				</TABLE>
			<br>
			<%
		}
	}
  --- End Of Comment Block -------------------------*/	
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
		

	   	for (Strategy strategy : Strategy.campusNoSuccessCriteriaStrategies()) {
	   		thisActivity = ar.getHashtable(strategy.name());
	   		boolean showAddLink = false;
	   		if (thisActivity == null) {
	   			showAddLink = true;
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

	   	for (Strategy strategy : Strategy.microCultures()) {
	   		thisActivity = ar.getHashtable(strategy.name());
	   		boolean showAddLink = false;
	   		if (thisActivity == null) {
	   			showAddLink = true;
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
	   			<br>
	    <%

	   	for (Strategy strategy : Strategy.nonCampusStrategies()) {
	   		thisActivity = ar.getHashtable(strategy.name());
	   		boolean showAddLink = false;
	   		if (thisActivity == null) {
	   			showAddLink = true;
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
	   			HREF="/servlet/InfoBaseController?action=addMinToCampus&targetareaid=<%= request.getParameter("targetareaid") %>">Add non-CCC Ministry to this campus</A> ]
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
								.setTitle("&nbsp;Miscellaneous Campus Information &nbsp;");
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




					<TR>
						<TD ALIGN="RIGHT"><%=font%>Fice:</TD>
						<TD><%=font%><%=taTable.get("Fice")%></TD>
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