<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	Registration registration = (Registration)ar.getObject("registration");
	RegistrationType regType = registration.getRegistrationType();
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
    Conference conference = (Conference)ar.getObject("conference");
	Person person = registration.getPerson();
    Hashtable accountSummary = ar.getHashtable("AccountSummary");
	String pageTitle = "Registration of " + registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName();
%>
<%@ include file="/crs/e_user_header.jspf" %>
<%
	registrationMenu.setActives(new boolean[]{
		true,
		true,
		true,
		true,
		true,
		true,
		true,
		true,
		false,
		true
	});
otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

	accountManagementMenu.setActives(new boolean[]{
		true
	});
%>

<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
	<TR>
		<TD VALIGN="TOP" WIDTH="150" ROWSPAN="3">
			<%=registrationMenu.display(registration.getSpouseComing() == 2 ? 8 : 5)%>
			<p>
			<%=otherOptionsMenu.display(0)%>
			<P>
			<%=accountManagementMenu.display(0)%>
		</TD>
		<TD VALIGN="TOP" WIDTH="50%">
			<TABLE border="0" CLASS="box" CELLSPACING="0" width="100%">
				<TR>
					<TD COLSPAN="2" CLASS="subboxheader">My Information Summary</TD>
				</TR>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT" WIDTH="30%">Name</TD>
					<TD><%=person.getFirstName()%> <%=person.getMiddleInitial()%> <%=person.getLastName()%></TD>
				</TR>
				<%
						if(regType.decodeProfile(6) >= 1) {
				%>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">College</TD>
					<TD><%=person.getCampus()%></TD>
				</TR>
				<%
						}
				%>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">Email</TD>
					<TD CLASS="cell"><%=person.getEmail()%></TD>
				</TR>
				<%
				if(regType.decodeProfile(2) >= 1){
				%>
				<TR>
					<TD CLASS="hl" valign=top ALIGN="RIGHT">Address</TD>
					<TD>
						<%=person.getAddress1()%><br>
						<%
									if (!(person.getAddress2()).equals("")){
						%>
						<%=person.getAddress2()%><br>
						<%
									}
						%>
						<%=person.getCity()%>, <%=person.getState()%> <%=person.getZip()%>
					</TD>
				</TR>
				<%
				}
				%>
				<TR>
					<TD COLSPAN="2" CLASS="subboxheader"><%=conference.getName()%> Information</TD>
				</TR>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">Registration ID</TD>
					<TD CLASS="cell"><%=registration.getRegistrationID()%></TD>
				</TR>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">Registered On</TD>
					<TD CLASS="cell"><%=formatter.formatDate(registration.getRegistrationDate())%></TD>
				</TR>
				<%
						if(conference.getOnsiteCost() > 0 && conference.getDiscountEarlyReg() > 0){
				%>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">Pre-Registered</TD>
					<TD CLASS="cell"><%=registration.getPreRegistered() ? "Yes" : "staff".equals(registration.getRegistrationType()) ? "Your staff account will be billed by the conference administrators" : "Please pay your pre-registration deposit."%></TD>
				</TR>
				<%
						}
				%>
				<TR>
					<TD COLSPAN="2" CLASS="subboxheader">Financial Information</TD>
				</TR>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">Your Cost</TD>
					<TD CLASS="cell">$<%=formatter.formatDecimal((Float)accountSummary.get("Debits"))%></TD>
				</TR>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">Amount Paid</TD>
					<TD CLASS="cell">$<%=formatter.formatDecimal((Float)accountSummary.get("Credits"))%></TD>
				</TR>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">Amount Due</TD>
					<TD CLASS="cell">$<%=formatter.formatDecimal((Float)accountSummary.get("BalanceDue"))%></TD>
				</TR>
			</TABLE>
		</TD>
		<TD VALIGN="TOP" WIDTH="50%">
			<TABLE border="0" CLASS="box" CELLSPACING="0" width="100%">
				<TR>
					<TD CLASS="subboxheader">If you have questions you may contact</TD>
				</TR>
				<TR>
					<TD CLASS="cell">
						<BLOCKQUOTE><B><%=conference.getContactName()%></B><br>
							<%=conference.getContactAddress1()%><br>
							<% if ((conference.getContactAddress2()!=null)&&(!(conference.getContactAddress2()).equals(""))){%><%=conference.getContactAddress2()%><br><%}%>
							<%=conference.getContactCity()%>, <%=conference.getContactState()%> <%=conference.getContactZip()%><br>
							<A HREF="mailto:<%=conference.getContactEmail()%>"><%=conference.getContactEmail()%></A><br>
							<%=conference.getContactPhone()%></BLOCKQUOTE>
						
						<P>
						<b> This is the final page of your online conference registration.</b> If you need to go back to previous pages and finish them, you may use the Registration Tools on the left of the screen. <b>
							<%
										if ("student".equals(registration.getRegistrationType())) {
							%>
							If you have finished filling out all of the pages and have paid your pre-registration deposit, you have now completed your online registration.
							<%
										} else {
							%>
							If you have finished filling out all of the pages, you have now completed your online registration.
							<%
										}
							%>
						</b> Click &quot;logout&quot; to exit the registration system.
						
						
						<P ALIGN="CENTER">
						<%
									if ("".equals(conference.getSplashPageURL())) {
						%>
						<A HREF="/servlet/CRSRegister?action=selectEvent" CLASS="button">Logout</A><BR><BR>
						<%
									} else if (conference.getSplashPageURL().startsWith("http://")) {
						%>
						<A HREF="<%=conference.getSplashPageURL()%>" CLASS="button">Logout</A><BR><BR>
						<%
									} else {
						%>
						<A HREF="http://<%=conference.getSplashPageURL()%>" CLASS="button">Logout</A><BR><BR>
						<%
									}
						%>
						
						<P>
						This conference registration will be online until <%=formatter.formatDate(conference.getPreRegEnd())%>, in case you need to come back and update your information.<br>
						
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
