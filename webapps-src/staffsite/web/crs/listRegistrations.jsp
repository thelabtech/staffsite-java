<%/* THIS FILE IS DEPRECATED */  %>
<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String view = ar.getValue("view");
	String pageTitle = "Registrations";
	String helpText_FullCost = "Event cost per person INCLUDING the preregistration cost";
	String helpText_CommuterCost = "Event cost for people with their own housing arrangements";
    String helpText_CreditCards = "You must set up an account with authorize.net through CCC HQ Financial Services Group to use this feature";
    String helpText_Scholarships = "The registrant will be asked for the amount and the name of the CCC person who is responsible for the scholarship. Then this CCC person may go online to enter the account fields or you may get this info some other way.";
	String helpText_Merchant = "This is the Authorize.net account number given to you by CCC HQ Financial Services Group.";
	String helpText_leaveBlank = "Leave this blank if it is not required";
	String helpText_discountEarlyDate = "Last day that the early registration discount will be applied";
	String helpText_discountEarly = "Discount amount for registering by the date specified below";
	String helpText_disountFullPay = "Discount for paying the full conference cost during pre-registration.";
%>
<%@ include file="/crs/e_header.jspf"%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=conferenceMenu.display(2)%>
		</TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0">
			<TR>
				<TD CLASS="<%=view.equals("student") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listRegistrations&view=student&offset=<%=ar.getValue("offset")%>&size=<%=ar.getValue("size")%>"
					CLASS="<%=view.equals("student") ? "tabactive" : "tab" %>">Student
				Registrations</A></TD>
				<TD CLASS="<%=view.equals("staff") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listRegistrations&view=staff&offset=<%=ar.getValue("offset")%>&size=<%=ar.getValue("size")%>"
					CLASS="<%=view.equals("staff") ? "tabactive" : "tab" %>">Staff
				Registrations</A></TD>
				<TD CLASS="<%=view.equals("guest") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listRegistrations&view=guest&offset=<%=ar.getValue("offset")%>&size=<%=ar.getValue("size")%>"
					CLASS="<%=view.equals("guest") ? "tabactive" : "tab" %>">Guest
				Registrations</A></TD>
				<TD CLASS="<%=view.equals("ALL") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listRegistrations&view=ALL&offset=<%=ar.getValue("offset")%>&size=<%=ar.getValue("size")%>"
					CLASS="<%=view.equals("ALL") ? "tabactive" : "tab" %>">All
				Registrations</A></TD>
			</TR>
		</TABLE>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<%
		if(ar.getCollection("Registrations").size() > 0){		
			Iterator registrations = ar.getCollection("Registrations").iterator();
			Hashtable gender = new Hashtable();
			gender.put("M", "Male");
			gender.put("F", "Female");
			gender.put("", "");
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="4"
					CLASS="pager"><%=formatter.displayPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "Registrations", "/servlet/CRSAdmin?action=listRegistrations&view=" + view + "&order=" + ar.getValue("order") + "&=orderCol" + ar.getValue("orderCol"))%>
				</TD>
			</TR>
			<%
			formatter.setHeaderNames(new String[] {"Name", "Campus", "Gender", "Pre Registered?"});
			formatter.setHeaderSorts(new boolean[] {true, true, true, true});
			formatter.setHeaderWidths(new String[] {"", "", "", ""});
			formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "CENTER", "RIGHT"});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Registrations Table", "/servlet/CRSAdmin?action=listRegistrations&view=" + view)%>
			<%
			for(int i = 0; registrations.hasNext(); i++){
				Registration registration = (Registration)registrations.next();
%>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					VALIGN="TOP"><A
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					HREF="/servlet/CRSAdmin?action=showRegistration&registrationID=<%=registration.getRegistrationID()%>"
					onmouseover="return overlib('View <%=registration.getPerson().getFirstName()%> <%=registration.getPerson().getLastName()%>\'s Registration');"
					onmouseout="return nd();"><%=registration.getPerson().getFirstName()%>
				<%=registration.getPerson().getLastName()%> <%
						if(view.equals("ALL")){
%> <B><%=registration.getRegistrationType()%></B> <%
						}
%> </A></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"
					ROWSPAN="2"><%=registration.getPerson().getCampus()%>&nbsp;</TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"
					ROWSPAN="2"
					ALIGN="CENTER"><%=gender.get(registration.getPerson().getGender())%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"
					ALIGN="RIGHT"
					ROWSPAN="2"><%=registration.getPreRegistered() ? "Yes" : "No"%></TD>
			</TR>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					VALIGN="BOTTOM"><A
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					HREF="mailto:<%=registration.getPerson().getEmail()%>"
					onmouseover="return overlib('Email  <%=registration.getPerson().getFirstName()%> <%=registration.getPerson().getLastName()%>');"
					onmouseout="return nd();"><%=registration.getPerson().getEmail()%></A></TD>
			</TR>
			<%
			}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="4"
					CLASS="smallpager"><%=formatter.displaySmallPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "Registrations", "/servlet/CRSAdmin?action=listRegistrations&view=&view=" + view)%>
				</TD>
			</TR>
			<%
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="4">There aren't any items to display</TD>
			</TR>
			<%
		}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="4">
				<TABLE
					CELLSPACING="0"
					CELLPADDING="0"
					BORDER="0"
					WIDTH="100%">
					<TR>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=showConference"
							CLASS="button">Cancel</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"><A
							HREF="/servlet/CRSAdmin?action=newRegistration&type=<%=view%>"
							CLASS="button">New Registration</A></TD>
					</TR>
				</TABLE>
				</TD>
			</TR>
		</TABLE>
		</FORM>
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">Hover over the blue question marks <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('Hi!');"
					onmouseout="return nd();"> for additional information</TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf"%>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
