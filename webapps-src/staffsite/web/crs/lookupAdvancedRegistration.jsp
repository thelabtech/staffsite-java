<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*, org.alt60m.ministry.model.dbio.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<jsp:useBean
	id="selState"
	class="org.alt60m.html.SelectState"
	scope="request" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	Conference conference = (Conference)ar.getObject("conference");
	String pageTitle = "Search Registrations";
	String view = ar.getValue("view");
	String viewLabel = ar.getValue("viewLabel");
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");

	selRegion.setName("region");
	selRegion.setCurrentValue(ar.getValue("region"));
	selState.setName("state");
	selState.setCurrentValue(ar.getValue("state"));

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
			WIDTH="150"><%=toolsMenu.display(2)%>
		<P><%=conferenceMenu.display(2)%>
		</TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="2"
					CLASS="boxheader">Advanced Registration Search</TD>
			</TR>
			<FORM
				ACTION="/servlet/CRSAdmin"
				METHOD="GET"
				NAME="theForm"><INPUT
				TYPE="HIDDEN"
				NAME="view"
				VALUE="<%=ar.getValue("view")%>"> <INPUT
				TYPE="HIDDEN"
				NAME="action"
				VALUE="lookupAdvancedRegistrations">
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl"
					WIDTH="20%">First Name</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><INPUT
					WIDTH="20"
					NAME="firstName"
					VALUE="<%=ar.getValue("firstName") != null ? ar.getValue("firstName") : ""%>"></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl">Last Name</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><INPUT
					WIDTH="20"
					NAME="lastName"
					VALUE="<%=ar.getValue("lastName") != null ? ar.getValue("lastName") : ""%>">
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Campus</TD>
				<TD CLASS="cell"><INPUT
					CLASS="empty"
					onClick="return overlib('To input a campus you must click Find Campus');"
					onFocus="return overlib('To input a campus you must click Find Campus');"
					onMouseOut="return nd();"
					NAME="Campus"
					size=40
					maxlength=128
					value="<%=ar.getValue("Campus") != null ? ar.getValue("Campus") : ""%>"
					READONLY> <A
					class="button"
					href="javascript:popupWindow('/crs/campuslist.jsp','Help','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=400,width=510,height=400'%20)">Find
				Campus</A></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl">State</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><%=selState.print()%></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl">Region</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><%=selRegion.print()%></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl">Local Level</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><SELECT NAME="localLevelID">
					<OPTION VALUE=""></OPTION>
					<%
			for(Iterator i = ar.getCollection("localLevels").iterator(); i.hasNext();){
				LocalLevel l = (LocalLevel)i.next();
%>
					<OPTION
						VALUE="<%=l.getLocalLevelId()%>"
						<%=l.getLocalLevelId().equals(ar.getValue("localLevelID")) ? "SELECTED" : ""%>><%=l.getName()%></OPTION>
					<%
			}
%>
				</SELECT></TD>
			</TR>
			<TR>
				<TD
					ALIGN="CENTER"
					CLASS="button"
					COLSPAN="2"><A
					HREF="javascript: document.theForm.submit()"
					CLASS="button">Search</A> <A
					HREF="/servlet/CRSAdmin?action=lookupRegistrations"
					CLASS="button">Basic Search</A></TD>
			</TR>
			</FORM>
		</TABLE>
		<P><%
	if(ar.getCollection("Registrations") != null){
		String passURL = "&lastName=" + ar.getValue("lastName") + "&firstName=" + ar.getValue("firstName") + "&region=" + ar.getValue("region") + "&state=" + ar.getValue("state") + "&localLevelID=" + ar.getValue("localLevelID") + "&Campus=" + ar.getValue("Campus");
		String passURLa = passURL + "&offset=" + ar.getValue("offset")+ "&size=" + ar.getValue("size");
		String passURLb = passURL + "&order=" + ar.getValue("order")+ "&orderCol=" + ar.getValue("orderCol");
%>
		<TABLE
			BORDER="0"
			CELLSPACING="0">
			<TR>
				<% /* iterate over all RegistrationTypes */
					Iterator regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
						%>
				<TD CLASS="<%=view.equals(typeID) ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=lookupAdvancedRegistrations&view=<%=typeID%><%=passURL%>"
					CLASS="<%=view.equals(typeID) ? "tabactive" : "tab" %>"><%=typeLabel%></A></TD>
						<%
					}	%>
				<TD CLASS="<%=view.equals("ALL") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=lookupAdvancedRegistrations&view=ALL<%=passURL%>"
					CLASS="<%=view.equals("ALL") ? "tabactive" : "tab" %>">All</A></TD>
			</TR>
		</TABLE>
		<%
		if(ar.getCollection("Registrations").size() > 0){
%>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="5">Your search returned <%=ar.getValue("maxSize")%>
				registrations</TD>
			</TR>
			<%
			passURLa += "&view=" + ar.getValue("view");
			passURLb += "&view=" + ar.getValue("view");
			Iterator registrations = ar.getCollection("Registrations").iterator();
			Hashtable gender = new Hashtable();
			gender.put("M", "Male");
			gender.put("F", "Female");
			gender.put("", "");
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="5"
					CLASS="pager"><%=formatter.displayPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "registrations", "/servlet/CRSAdmin?action=lookupAdvancedRegistrations" + passURLb)%>
				</TD>
			</TR>
			<%
			formatter.setHeaderNames(new String[] {"Name", "Gender", "Campus", "Pre-Registration Paid?", "Registration Date"});
			formatter.setHeaderSorts(new boolean[] {true, true, true, true, true});
			formatter.setHeaderWidths(new String[] {"", "", "", "", ""});
			formatter.setHeaderAligns(new String[] {"LEFT", "CENTER", "CENTER", "CENTER", "RIGHT"});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "", "/servlet/CRSAdmin?action=lookupAdvancedRegistrations" + passURLa)%>
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
					onmouseover="return overlib('View <%=formatter.escapeString(registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName())%>\'s Registration');"
					onmouseout="return nd();"><%=registration.getPerson().getFirstName()%>
				<%=registration.getPerson().getLastName()%> <%
						if(view.equals("ALL")){
%> <B><%=registration.getRegistrationType().getLabel()%></B> <%
						}
%> </A></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"
					ROWSPAN="2"
					ALIGN="CENTER"><%=gender.get(registration.getPerson().getGender())%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"
					ALIGN="CENTER"
					ROWSPAN="2"><%=registration.getCampus()%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"
					ALIGN="CENTER"
					ROWSPAN="2"><%=registration.getPreRegistered() ? "Yes" : "No"%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"
					ROWSPAN="2"
					ALIGN="RIGHT"><%=formatter.formatDate(registration.getRegistrationDate())%>&nbsp;</TD>
			</TR>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					VALIGN="BOTTOM"><A
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					HREF="mailto:<%=registration.getPerson().getEmail()%>"
					onmouseover="return overlib('Email  <%=formatter.escapeString(registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName())%>');"
					onmouseout="return nd();"><%=registration.getPerson().getEmail()%></A></TD>
			</TR>
			<%
			}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="5"
					CLASS="smallpager"><%=formatter.displaySmallPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "registrations", "/servlet/CRSAdmin?action=lookupAdvancedRegistrations" + passURLb)%>
				</TD>
			</TR>
		</TABLE>
		<%
		} else {
%>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="4">There are no registrations that match <B>'<%=ar.getValue("firstName")%>
				<%=ar.getValue("lastName")%>'</B> for <%=viewLabel%></TD>
			</TR>
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
		<%
		}
%> <%
		}
%>
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
				<TD CLASS="cell">The advanced search allows you to look for a
				registrant by name, campus, state that their campus is in, region,
				or local level. To ensure the accuracy of the "State" and "Region"
				searches, please verify that your campus' address and region is up
				to date in the Campus InfoBase. The "Local Level" menu is a list of
				all the local level teams in the Campus Infobase. To ensure the
				accuracy of this search, please verify that the correct campuses are
				associated with your local level team in the Campus Infobase. If you
				have questions about this, please contact <A
					HREF="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</A>.
				</TD>
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
