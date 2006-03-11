<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<%
	ActionResults ar = ActionResults.getActionResults(session);
	String currentRegion = ar.getValue("currentRegion");
	String view = ar.getValue("view");
	int regionIndex = ArrayHelper.indexOf(currentRegion, selRegion.regions);
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = ((regionIndex < 0 ) ? "All"  : selRegion.regionNames[regionIndex]) + " Conferences";
	Conference conference = new Conference();
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
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="subboxheader"
					VALIGN="BOTTOM">Change Region</TD>
			</TR>
			<TR>
				<TD
					CLASS="<%=currentRegion.equals("ALL") ? "menuactive" : "menu" %>"
					VALIGN="BOTTOM"><A
					HREF="/servlet/CRSAdmin?action=listConferences&currentRegion=ALL&view=<%=view%>"
					CLASS="<%=currentRegion.equals("ALL") ? "menuactive" : "menu" %>">All</A></TD>
			</TR>
			<%
			for(int i = 0; i < selRegion.regions.length; i++){
%>
			<TR>
				<TD
					CLASS="<%=(currentRegion.equals(selRegion.regions[i])) ? "menuactive" : "menu" %>"
					VALIGN="BOTTOM"><A
					HREF="/servlet/CRSAdmin?action=listConferences&currentRegion=<%=selRegion.regions[i]%>&view=<%=view%>"
					CLASS="<%=(currentRegion.equals(selRegion.regions[i])) ? "menuactive" : "menu" %>"><%=selRegion.regionNames[i]%></A></TD>
			</TR>
			<%
			}
%>
			</TR>
		</TABLE>
		</TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0">
			<TR>
				<TD CLASS="<%=view.equals("current") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listConferences&currentRegion=<%=currentRegion%>&view=current"
					CLASS="<%=view.equals("current") ? "tabactive" : "tab" %>">Current
				Conferences</A></TD>
				<TD CLASS="<%=view.equals("archived") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listConferences&currentRegion=<%=currentRegion%>&view=archived"
					CLASS="<%=view.equals("archived") ? "tabactive" : "tab" %>">Archived
				Conferences</A></TD>
				<TD CLASS="<%=view.equals("all") ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listConferences&currentRegion=<%=currentRegion%>&view=all"
					CLASS="<%=view.equals("all") ? "tabactive" : "tab" %>">All
				Conferences</A></TD>
			</TR>
		</TABLE>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<%
	try{
		Iterator conferences = ar.getCollection("Conferences").iterator();
		if(ar.getCollection("Conferences").size() > 0){
%>
			<%
			formatter.setHeaderNames(new String[] {"Name", "Registration Starts", "Registration Ends", "", ""});
			formatter.setHeaderSorts(new boolean[] {true, true, true, false, false});
			formatter.setHeaderWidths(new String[] {"", "", "", "", ""});
			formatter.setHeaderAligns(new String[] {"LEFT", "RIGHT", "LEFT", "", ""});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Conferences Table", "/servlet/CRSAdmin?action=listConferences&currentRegion=" + currentRegion + "&view=" + view)%>
			<%
			for(int i = 0; conferences.hasNext(); i++){
				Conference c = (Conference)conferences.next();
%>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM">
					<%
					if (!"".equals(c.getSplashPageURL())) {
						if (c.getSplashPageURL().startsWith("http://")) {
					%>
						<A HREF="<%=c.getSplashPageURL()%>"><%=c.getName()%></A>
					<%
						} else {
					%>
						<A HREF="http://<%=c.getSplashPageURL()%>"><%=c.getName()%></A>
					<%
						}
					}
					else
					{
					%>
					<%=c.getName()%>
					<%
					}
					%>
					</TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="RIGHT"><%=formatter.formatDate(c.getPreRegStart())%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><%=formatter.formatDate(c.getPreRegEnd())%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					HREF="/servlet/CRSAdmin?action=showConference&conferenceID=<%=c.getConferenceID()%>"
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>">Manage</A></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					HREF="/servlet/CRSRegister?action=selectEvent&ConferenceID=<%=c.getConferenceID()%>"
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>">Register</A></TD>
			</TR>
			<%
			}
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
					ALIGN="CENTER">There aren't any conferences to display</TD>
			</TR>
			<%
		}
		} catch (Exception e) {
			e.printStackTrace();
            throw new Exception(e);
        }
%>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
