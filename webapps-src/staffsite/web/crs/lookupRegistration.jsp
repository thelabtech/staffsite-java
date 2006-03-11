<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	Conference conference = (Conference)ar.getObject("conference");
	String pageTitle = "Search Registrations";
	String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	String view = ar.getValue("view");
	String viewLabel = ar.getValue("viewLabel");
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");
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
					CLASS="boxheader">Search for Registrations</TD>
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
				VALUE="lookupRegistrations">
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
				<A
					HREF="javascript: document.theForm.submit()"
					CLASS="button">Search</A> <A
					HREF="/servlet/CRSAdmin?action=lookupAdvancedRegistrations"
					CLASS="button">Advanced Search</A></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl">Quick Links</TD>
				<TD
					ALIGN="LEFT"
					CLASS="button"><%
			char[] letters = alphabet.toCharArray();
			for(int i = 0; i < letters.length; i++){
%> <A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=lookupRegistrations&lastName=<%=letters[i]%>&view=<%=view%>"><%=letters[i]%></A>
				<%
				if(i == 12){
%> <BR>
				<BR>
				<%
				}
			}
%> <BR>
				<BR>
				<% /* iterate over all RegistrationTypes */
					Iterator regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
						%>
				<A CLASS="button"
					HREF="/servlet/CRSAdmin?action=lookupRegistrations&lastName=&view=<%=typeID%>">List
				All <%=typeLabel%></A>
				<%}%>
				</TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					CLASS="hl">New Registrations</TD>
				<TD CLASS="button">
				<% /* iterate over all RegistrationTypes */
					regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
						%>
				<A
					HREF="/servlet/CRSAdmin?action=newRegistration&type=<%=typeID%>"
					CLASS="button">New <%=typeLabel%> Registration</A>
				<%}%>
				
				</TD>
			</TR>
			</FORM>
		</TABLE>
		<P><%
	if(ar.getCollection("Registrations") != null){
		String passURL = "&lastName=" + ar.getValue("lastName") + "&firstName=" + ar.getValue("firstName");
		String passURLa = passURL + "&offset=" + ar.getValue("offset")+ "&size=" + ar.getValue("size");
		String passURLb = passURL + "&order=" + ar.getValue("order")+ "&orderCol=" + ar.getValue("orderCol");
%>
		<TABLE
			BORDER="0"
			CELLSPACING="0">
			<TR>
				<% /* iterate over all RegistrationTypes */
					regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
						%>
				<TD CLASS="<%=view.equals(typeID) ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=lookupRegistrations&view=<%=typeID%><%=passURL%>"
					CLASS="<%=view.equals(typeID) ? "tabactive" : "tab" %>"><%=typeLabel%></A></TD>
						<%
					}	%>
				<TD CLASS="<%=view.equals("ALL") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=lookupRegistrations&view=ALL<%=passURL%>"
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
			gender.put("1", "Male");
			gender.put("0", "Female");
			gender.put("", "");
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="5"
					CLASS="pager"><%=formatter.displayPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "registrations", "/servlet/CRSAdmin?action=lookupRegistrations" + passURLb)%>
				</TD>
			</TR>
			<%
			formatter.setHeaderNames(new String[] {"Name", "Gender", "Campus", "Pre-Registration Paid?", "Registration Date"});
			formatter.setHeaderSorts(new boolean[] {true, true, true, true, true});
			formatter.setHeaderWidths(new String[] {"", "", "", "", ""});
			formatter.setHeaderAligns(new String[] {"LEFT", "CENTER", "CENTER", "CENTER", "RIGHT"});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "", "/servlet/CRSAdmin?action=lookupRegistrations" + passURLa)%>
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
					CLASS="smallpager"><%=formatter.displaySmallPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "registrations", "/servlet/CRSAdmin?action=lookupRegistrations" + passURLb)%>
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
				<%
			if (("".equals(ar.getValue("lastName"))) && ("".equals(ar.getValue("firstName")))){

				if ("ALL".equals(ar.getValue("view"))) {
%>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="4">There are no registrations</TD>
				<%
				} else {
%>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="4">There are no <%=viewLabel%>
				registrations</TD>
				<%
				}
			} else {
%>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="4">There are no registrations that match <B>'<%=ar.getValue("firstName")%>
				<%=ar.getValue("lastName")%>'</B> for <%=viewLabel%></TD>
				<%
			}
%>
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
				<TD CLASS="cell">There are two ways in which you can search for a
				registration. You can either enter the name of the person you are
				looking for in the search field, or you can click on the first
				letter of the person's last name. You can then search through the
				different types of registrations by clicking on the tabs below the
				search tool. You may do an <A
					HREF="/servlet/CRSAdmin?action=lookupAdvancedRegistrations">advanced
				search</A> to locate registrants from a particular region or local
				level.
				<P>You can add a registration to the conference by clicking on the
				"New Registration" button.
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
