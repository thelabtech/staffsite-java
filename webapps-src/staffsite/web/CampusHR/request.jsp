<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*, org.alt60m.html.*" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	Hashtable changeRequest = ar.getHashtable("changeRequest");
	String firstName = (String)changeRequest.get("FirstName");
	String preferredName = (String)changeRequest.get("PreferredName");
	String middleInitial = (String)changeRequest.get("MiddleInitial");
	String lastName = (String)changeRequest.get("LastName");
	String accountNo = (String)changeRequest.get("AccountNo");
	String ministry = (String)changeRequest.get("Ministry");
	String spouseFirstName = (String)changeRequest.get("SpouseFirstName");
	String countryStatus = (String)changeRequest.get("CountryStatus");
	String address1 = (String)changeRequest.get("Address1");
	String address2 = (String)changeRequest.get("Address2");
	String address3 = (String)changeRequest.get("Address3");
	String address4 = (String)changeRequest.get("Address4");
	String city = (String)changeRequest.get("City");
	String state = (String)changeRequest.get("State");
	String zip = (String)changeRequest.get("Zip");
	String country = (String)changeRequest.get("Country");
	String homePhone = (String)changeRequest.get("HomePhone");
	String workPhone = (String)changeRequest.get("WorkPhone");
	String email = (String)changeRequest.get("Email");
	String spouseEmail = (String)changeRequest.get("SpouseEmail");
	String primaryEmpLocState = (String)changeRequest.get("PrimaryEmpLocState");
	String primaryEmpLocCountry = (String)changeRequest.get("PrimaryEmpLocCountry");
	String primaryEmpLocCity = (String)changeRequest.get("PrimaryEmpLocCity");
	String maritalStatus = (String)changeRequest.get("MaritalStatus");
	String spouseMiddleInitial = (String)changeRequest.get("SpouseMiddleInitial");
	String spouseLastName = (String)changeRequest.get("SpouseLastName");
	String spouseAccountNo = (String)changeRequest.get("SpouseAccountNo");
	String fianceeFirstName = (String)changeRequest.get("FianceeFirstName");
	String fianceeMiddleInitial = (String)changeRequest.get("FianceeMiddleInitial");
	String fianceeLastName = (String)changeRequest.get("FianceeLastName");
	String isFianceeStaff = (String)changeRequest.get("IsFianceeStaff");
	String fianceeJoinStaffDate = changeRequest.get("FianceeJoinStaffDate").toString();
	String loaStartDate = changeRequest.get("LoaStartDate").toString();
	String loaEndDate = changeRequest.get("LoaEndDate").toString();
	String loaReason = (String)changeRequest.get("LoaReason");
	String resignationDate = changeRequest.get("ResignationDate").toString();
	String resignationReason = (String)changeRequest.get("ResignationReason");
	String severancePayMonthsReq = (String)changeRequest.get("SeverancePayMonthsReq");
	String contributionsToOtherAcct = (String)changeRequest.get("ContributionsToOtherAcct");
	String contributionsToAcntNo = (String)changeRequest.get("ContributionsToAcntNo");
	String contributionsToAcntName = (String)changeRequest.get("ContributionsToAcntName");
	String dateRequested = (String)changeRequest.get("DateRequested");
	String effectiveDate = changeRequest.get("EffectiveDate").toString();
	Hashtable lookup = new Hashtable();
	lookup.put("NE", "Northeast");
	lookup.put("MA", "Mid-Atlantic");
	lookup.put("MS", "MidSouth");
	lookup.put("SE", "Southeast");
	lookup.put("GL", "Great Lakes");
	lookup.put("UM", "Upper Midwest");
	lookup.put("GP", "Great Plains");
	lookup.put("RR", "Red River");
	lookup.put("NW", "Greater Northwest");
	lookup.put("SW", "Pacific Southwest");
	lookup.put("NC", "National Campus Office");
	lookup.put("IN", "Impact National Office");
	lookup.put("ministry", "Ministry");
	lookup.put("jobStatus", "Job Status");
	lookup.put("region", "Region");
	lookup.put("strategy", "Strategy");
	lookup.put("role", "Role");
	lookup.put("position", "Position");
	lookup.put("workLocation", "Work Location");
	lookup.put("teamID", "Team");
	lookup.put("title", "Title");
	lookup.put("loaStartDate", "Beginning");
	lookup.put("loaEndDate", "Ending");
	lookup.put("loaReason", "Reason");
	lookup.put("resignationDate", "Last Day");
	lookup.put("resignationReason", "Reason");
	lookup.put("severancePayMonthsReq", "Severance Requested");
	lookup.put("contributionsToOtherAcct", "Contributions to Other Account");
	lookup.put("contributionsToAcntNo", "Contributions to Account No");
	lookup.put("contributionsToAcntName", "Contributions to Account Name");
	lookup.put("keepSupport", "Keeping Support Team");
	
	FormHelper formHelper = new FormHelper();
	
%>
<HTML>
<HEAD>
<TITLE> Request Approval </TITLE>
<%@ include file="hrheader.jspf" %>
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Personal Information</TD>
<TD ALIGN="RIGHT" CLASS="div">Date Requested: <%=dateRequested%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="98%">
		<TR>
			<TD>
				<B>Name</B>:&nbsp;&nbsp;
			</TD>
			<TD>
				<NOBR><%=lastName%>,&nbsp;<%=firstName%>&nbsp;<%=middleInitial%>&nbsp;&nbsp;</NOBR>
			</TD>
			<TD ALIGN=CENTER WIDTH="90%">&nbsp;
				
			</TD>
			<TD>
				<NOBR>&nbsp;<B>Account Number</B>:&nbsp;<%=accountNo%></NOBR>
			</TD>
		</TR>
	</TABLE>
<TABLE ALIGN="CENTER" WIDTH="98%" BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR><TD><NOBR><B>Spouse Name</B>:&nbsp;&nbsp;</NOBR></TD><TD><%=spouseFirstName%>&nbsp;&nbsp;</TD><TD WIDTH="90%" ALIGN="CENTER"><B>Ministry</B>:&nbsp;&nbsp;<%=ministry%>&nbsp;</TD><TD><NOBR><B>Location:</B>:&nbsp;<%=countryStatus%></NOBR></TD></TR>
</TABLE>

<TABLE WIDTH="100%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;Request Detail</TD></TR></TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=5>
<TR>
	<TD>
		<NOBR><B><%=firstName + " " + changeRequest.get("LastName")%> has requested to update the following information:</B></NOBR><P ALIGN="CENTER">
		<TABLE WIDTH="80%" BORDER=0><TR><TD><B><%=(String)changeRequest.get("changeRequestType")%>:</B></TD></TR><TR><TD><P ALIGN="CENTER">
		<TABLE BORDER="0" CELLSPACING="2" CLASS="outline" WIDTH="80%">
		<TR>
		<TD ALIGN="RIGHT" VALIGN="TOP"><B>From:&nbsp;&nbsp;</B></TD>
		<TD>
		<%
			List changes = (List)changeRequest.get("fieldChanges");
			ListIterator lit = changes.listIterator();
			while (lit.hasNext()) {
				Hashtable fieldChange = (Hashtable)lit.next();
				if (fieldChange.get("oldTeam") != null) { %>
					Team:&nbsp;<%=fieldChange.get("oldTeam")%><BR>
			<%	} else if (((String)fieldChange.get("field")).equals("region")){ %>
				<%=lookup.get((String)fieldChange.get("field"))%>:&nbsp;<%=lookup.get((String)fieldChange.get("oldValue"))%><BR>
			<%  }  else { %>
				<%=lookup.get((String)fieldChange.get("field"))%>:&nbsp;<%=(String)fieldChange.get("oldValue")%><BR>
			<%  }  %>
		<%  }  %>
		</TD>
		</TR>
		<TR>
		<TD ALIGN="RIGHT" VALIGN="TOP"><B>To:&nbsp;&nbsp;</B></TD>
		<TD>
		<%
			lit = changes.listIterator();
			while (lit.hasNext()) {
				Hashtable fieldChange = (Hashtable)lit.next();
				if (fieldChange.get("newTeam") != null) { %>
				Team:&nbsp;<%=fieldChange.get("newTeam")%><BR>
			<%	} else if (((String)fieldChange.get("field")).equals("region")) { %>
				<%=lookup.get((String)fieldChange.get("field"))%>:&nbsp;<%=lookup.get((String)fieldChange.get("newValue"))%><BR>
			<%  } else { %>
				<%=lookup.get((String)fieldChange.get("field"))%>:&nbsp;<%=(String)fieldChange.get("newValue")%><BR>
			<%  }  %>
		<%  }  %>
		</TD>
		</TR>
		<% if (effectiveDate != null) { %>
			<TR><TD ALIGN="RIGHT" VALIGN="TOP"><B>Effective Date:&nbsp;&nbsp;</B></TD>
				<TD><%=effectiveDate%><BR></TD>
			</TR>
		<% } %>
		</TABLE>
		<NOBR><B>If you do not approve this request, it is your responsibility to contact this staff member.</B></NOBR><P ALIGN="CENTER">
		<TABLE WIDTH="98%" BORDER="0">
	<FORM NAME="confirmForm" ACTION="/servlet/AuthorizeController?action=submitAuthForm" METHOD="POST">
		<TR>
			<TD COLSPAN="2" CLASS="label"><BR>
			    Please include any comments regarding this change.<P ALIGN="CENTER">
				<TEXTAREA NAME="comments" ROWS="10" COLS="60" WRAP="virtual"></TEXTAREA>
			</TD>
		</TR>
		<INPUT type="hidden" name="authorizationID" value='<%=(String)changeRequest.get("authorizationID")%>'>
		<INPUT type="hidden" name="changeRequestID" value='<%=(String)changeRequest.get("changeRequestID")%>'>
	<TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" NAME="authorize" VALUE="Approve" CLASS="button">&nbsp;&nbsp;</TD><TD> <NOBR>By clicking "Approve", you acknowledge understanding that you are approving</NOBR><BR><NOBR>the staff members request to change the information detailed above.</NOBR></TD></TR>
	<TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" NAME="unauthorize" VALUE="Do Not Approve" CLASS="button">&nbsp;&nbsp;</TD><TD><NOBR>By clicking "Do Not Approve", you acknowledge understanding that the</NOBR><BR><NOBR>staff members request will not be approved at this time and that you will</NOBR><BR><NOBR>contact him or her to discuss the reason(s) the request was not approved.</NOBR></TD></TR></TABLE><P>
	</FORM>
		<A HREF="javascript: history.go(-1)"><I>back to previous screen</I></A><BR>
		<A HREF="/CampusHR/index.jsp"><I>back to form list</I></A><BR>
		<A HREF="/index.html"><I>back to tools page</I></A>
	</TD>
</TR>
</TABLE>
</TD></TR></TABLE>
<%@ include file="hrfooter.jspf" %>
</HTML>