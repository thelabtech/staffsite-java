<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	Conference conference = (Conference)ar.getObject("conference");
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");
	boolean newEvent = (session.getValue("newEvent") != null && session.getValue("newEvent").equals("true"));
	String pageTitle = conference.getName() + " Details";
%>
<%@ include file="/crs/e_header.jspf"%>
<%selRegion.setCurrentValue(conference.getRegion());%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(1) : conferenceMenu.display(1)%>
		</TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="4">Conference Info <A
					HREF="/servlet/CRSAdmin?action=editConferenceDetails"
					CLASS="button">Edit</A></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Conference Name</TD>
				<TD CLASS="cell"><%=conference.getName()%></TD>
				<TD
					CLASS="cell"
					VALIGN="TOP"
					ROWSPAN="8"
					ALIGN="RIGHT"><%
			if(!"".equals(conference.getConfImageID())){
%> <IMG WIDTH="600" SRC="/cms/content/<%=conference.getConfImageID()%>"> <%
			}
%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Region</TD>
				<TD CLASS="cell"><%=selRegion.display()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Web Registration<BR>
				Starts</TD>
				<TD CLASS="cell"><%=formatter.formatDate(conference.getPreRegStart())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Web Registration<BR>
				Ends</TD>
				<TD CLASS="cell"><%=formatter.formatDate(conference.getPreRegEnd())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Master Default Arrive Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(conference.getMasterDefaultDateArrive())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Master Default Leave Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(conference.getMasterDefaultDateLeave())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Registration Summary</TD>
				<TD CLASS="cell">
				<% /* iterate over all RegistrationTypes */
					Iterator regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
						String typeRegistered = (String)v.get(2);
						%>
						<STRONG>
						<A HREF="/servlet/CRSAdmin?action=lookupRegistrations&lastName=&view=<%=typeID%>">
							<%=typeLabel%>
						</A>
						</STRONG>
						- <%=typeRegistered%><BR>
						<%
					}	%>
				</TD>
				<TD>
				<TABLE
					BORDER="0"
					CELLSPACING="0"
					WIDTH="100%">
					<TR>
						<TD
							ALIGN="CENTER"
							COLSPAN="2"
							CLASS="cell"><b>Search All Registrations</TD>
					</TR>
					<FORM
						ACTION="/servlet/CRSAdmin"
						METHOD="GET"
						NAME="lookupReg""><INPUT
						TYPE="HIDDEN"
						NAME="view"
						VALUE="ALL"> <INPUT
						TYPE="HIDDEN"
						NAME="action"
						VALUE="lookupRegistrations">
					<TR>
						<TD
							ALIGN="RIGHT"
							WIDTH="30%"
								CLASS="cell">First Name</TD>
						<TD
							ALIGN="LEFT"><INPUT
							WIDTH="20"
							NAME="firstName"
							VALUE="<%=ar.getValue("firstName") != null ? ar.getValue("firstName") : ""%>"></TD>
					</TR>
					<TR>
						<TD
							ALIGN="RIGHT"
								CLASS="cell">Last Name</TD>
						<TD
							ALIGN="LEFT"><INPUT
							WIDTH="20"
							NAME="lastName"
							VALUE="<%=ar.getValue("lastName") != null ? ar.getValue("lastName") : ""%>">
							<A
							HREF="javascript: document.lookupReg.submit()"
							CLASS="button">Search</A>
						</TD>
					</TR>
					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Contact</TD>
				<TD CLASS="cell"><STRONG><%=conference.getContactName()%></STRONG><BR>
				<%=conference.getContactAddress1()%><BR>
				<%
			if(conference.getContactAddress2() != null && !conference.getContactAddress2().equals("")){
%> <%=conference.getContactAddress2()%><BR>
				<%
			}
%> <%=conference.getContactCity()%>, <%=conference.getContactState()%> <%=conference.getContactZip()%>
				<BR>
				<%=conference.getContactPhone()%> <BR>
				<A HREF="mailto:<%=conference.getContactEmail()%>"><%=conference.getContactEmail()%></A>
				</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Theme</TD>
				<TD
					CLASS="cell"
					COLSPAN="3"><%=conference.getTheme()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Description</TD>
				<TD
					CLASS="cell"
					VALIGN="TOP"
					COLSPAN="3"><%=conference.getBriefDescription()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Postscript for Confirmation Email</TD>
				<TD
					CLASS="cell"
					VALIGN="TOP"
					COLSPAN="3"><%=conference.getConfirmationEmail()%></TD>
			</TR>
		</TABLE>
		<P>
		<FORM>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Web Presence</TD>
			</TR>
			<%
			String serverName = (request.getServerName().endsWith("campuscrusadeforchrist.com") ? "http://" : "http://") + request.getServerName();
					// changes Web Presence URL from staff.campuscrusade... to www.conferenceregistrationtool.com
					if (conference.getIsCloaked()==true)
						serverName = "http://www.conferenceregistrationtool.com";

		 /* iterate over all RegistrationTypes */
		regTypes = regTypesV.iterator();
		for(int i = 0; regTypes.hasNext(); i++){
			Vector v = (Vector)regTypes.next();
			String typeID = (String)v.get(0);
			String typeLabel = (String)v.get(1);
			%>
			<TR>
				<TD
					CLASS="hl"
					COLSPAN="2"><%=typeLabel%> Registration URL</TD>
			</TR>
			<TR>
				<TD CLASS="cell"><INPUT
					VALUE="<%=serverName%>/servlet/CRSRegister?action=userLogin&regTypeID=<%=typeID%>&ConferenceID=<%=conference.getConferenceID()%>"
					SIZE="80"
					onFocus="this.select()"> <IMG
					SRC="/crs/images/info.gif"
					onmouseover="return overlib('If your event has its own promotional website, use this URL to link students into the registration process. This will skip the CRS-generated Home Page.');"
					onmouseout="return nd();"></TD>
				<TD
					CLASS="cell"
					ALIGN="CENTER"><A
					HREF="<%=serverName%>/servlet/CRSRegister?action=userLogin&regTypeID=<%=typeID%>&ConferenceID=<%=conference.getConferenceID()%>&preview=Y"
					TARGET=_blank
					CLASS="button">Preview URL</A></TD>
			</TR>
			<%
			}   /* end displaying all registration link URLs */
			%>
			
			<TR>
				<TD
					CLASS="hl"
					COLSPAN="2">CRS Generated Home Page URL</TD>
			</TR>
			<TR>
				<TD CLASS="cell"><INPUT
					VALUE="<%=serverName%>/servlet/CRSRegister?ConferenceID=<%=conference.getConferenceID()%>"
					SIZE="80"
					onFocus="this.select()"> <IMG
					SRC="/crs/images/info.gif"
					onmouseover="return overlib('This is the URL for the CRS-generated Home Page.  If your event does not have its own promotional website, send students to this URL.');"
					onmouseout="return nd();"></TD>
				<TD
					CLASS="cell"
					ALIGN="CENTER"><A
					HREF="<%=serverName%>/servlet/CRSRegister?ConferenceID=<%=conference.getConferenceID()%>"
					TARGET=_blank
					CLASS="button">Preview URL</A></TD>
			</TR>
		</TABLE>
		</FORM>
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
