<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	ChildRegistration registration = (ChildRegistration)ar.getObject("registration");
	Registration parentregistration = (Registration)ar.getObject("parentregistration");
	Conference conference = (Conference)ar.getObject("conference");

	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Child Registration of " + registration.getFirstName() + " " + registration.getLastName();
	Hashtable gender = new Hashtable();
	gender.put("M", "Male");
	gender.put("F", "Female");
	gender.put("", "");
	Hashtable maritalStatus = new Hashtable();
	maritalStatus.put("S", "Single");
	maritalStatus.put("M", "Married");
	maritalStatus.put("D", "Divorced");
	maritalStatus.put("", "");
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
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			CLASS="box">
			<TR>
				<TD CLASS="subboxheader">Jump to:</TD>
			</TR>
			<TR>
				<TD CLASS="menu"><A
					HREF="#reg"
					CLASS="menu">- Registration Info</A></TD>
			</TR>
			<TR>
				<TD CLASS="menu"><A
					HREF="#contact"
					CLASS="menu">- Contact Info</A></TD>
			</TR>
		</TABLE>
		<P><%=conferenceMenu.display(2)%>
		</TD>
		<TD
			VALIGN="TOP"
			COLSPAN="2"><A NAME="reg">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Child Registration Info <A
					HREF="/servlet/CRSAdmin?action=editChildRegistration&childRegistrationID=<%=registration.getChildRegistrationID()%>"
					CLASS="button">Edit</A> <A
					HREF="/servlet/CRSAdmin?action=confirmDeleteChildRegistration&registrationID=<%=registration.getChildRegistrationID()%>"
					CLASS="button">Delete</A></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Full Name</TD>
				<TD CLASS="cell"><%=registration.getFirstName()%> <%=registration.getLastName()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Parent's Email</TD>
				<TD CLASS="linkcell"><A
					CLASS="linkcell"
					HREF="mailto:<%=parentregistration.getPerson().getEmail()%>"><%=parentregistration.getPerson().getEmail()%></A></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Arrival Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(registration.getArriveDate())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Departure Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(registration.getLeaveDate())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Birth Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(registration.getBirthDate())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">In Child Care?</TD>
				<TD CLASS="cell"><%=registration.getInChildCare()?"Y":"N"%></TD>
			</TR>
		</TABLE>
		<BR>
		<A NAME="contact">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Parent's Contact Info</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP"
					WIDTH="25%">Current Address</TD>
				<TD CLASS="cell"><%=parentregistration.getPerson().getAddress1()%><BR>
				<%
			if(parentregistration.getPerson().getAddress2() != null && !parentregistration.getPerson().getAddress2().equals("")){
%> <%=parentregistration.getPerson().getAddress2()%><BR>
				<%
			}
%> <%=parentregistration.getPerson().getCity()%>, <%=parentregistration.getPerson().getState()%>
				<%=parentregistration.getPerson().getZip()%> <BR>
				<%
			if(parentregistration.getPerson().getCountry() != null && !parentregistration.getPerson().getCountry().equals("")){
%> <%=parentregistration.getPerson().getCountry()%><BR>
				<%
			}
%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Home Phone</TD>
				<TD CLASS="cell"><%=parentregistration.getPerson().getHomePhone()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Permanent Address</TD>
				<TD CLASS="cell"><%=parentregistration.getPerson().getPermanentAddress1()%><BR>
				<%
			if(parentregistration.getPerson().getPermanentAddress2() != null && !parentregistration.getPerson().getPermanentAddress2().equals("")){
%> <%=parentregistration.getPerson().getPermanentAddress2()%><BR>
				<%
			}
%> <%=parentregistration.getPerson().getPermanentCity()%>, <%=parentregistration.getPerson().getPermanentState()%>
				<%=parentregistration.getPerson().getPermanentZip()%> <BR>
				<%
			if(parentregistration.getPerson().getPermanentCountry() != null && !parentregistration.getPerson().getPermanentCountry().equals("")){
%> <%=parentregistration.getPerson().getPermanentCountry()%><BR>
				<%
			}
%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Permanent Phone</TD>
				<TD CLASS="cell"><%=parentregistration.getPerson().getPermanentPhone()%></TD>
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
