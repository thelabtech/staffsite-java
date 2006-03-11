<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
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
	CRSConference conference = (CRSConference)ar.getObject("conference");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	// Help Text
	String pageTitle = "Edit " + conference.getName() + " Details";
	String helpText_Name = "What this event is known as, for example: Regional Spring Conference";
	String helpText_Theme = "The theme of the conference.";
	String helpText_Region = "The Region where the conference will take place if in the USA.";
	String helpText_AdminPassword = "Password for administrator to get in and adminsitrate the conference registration";
    String helpText_StaffPassword = "Password for student leaders or volunteers to log on to http://conference.campuscrusadeforchrist.com to view reports, update scholarships and see which students from their campus have registered (Campus Ministry staff don\\'t need a special password because they can view all this by just being logged on to the Staff Site)";
	String helpText_leaveBlank = "Leave this blank if it is not required.";
	String helpText_ContactAddress = "This is the address to which registrants will be told to mail their checks if they are paying by check.";

	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");

%>
<%@ include file="/crs/e_header.jspf"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		// First check to see if all the required fields have something in them
		if(requiredFilled(document.theForm)){
			// Next check for specific content
			// Validate date ranges:
			if(!validDateRange(document.theForm.PreRegStart.value, document.theForm.PreRegEnd.value)){
				alert("The start Registration Date must be earlier than the end Registration Date");
			} else if(!validDateRange(document.theForm.DefaultDateStaffArrive.value, document.theForm.DefaultDateStaffLeave.value)){
				alert("The start Default Staff Date must be earlier than the end Default Staff Date");
			// Validate email:
			} else if(!validEmail(document.theForm.ContactEmail.value)){
				alert("You must enter a valid email address");
				document.theForm.ContactEmail.focus();
			} else{
				document.theForm.action.value = action;
				document.theForm.submit();
			}
		}
	}
//-->
</SCRIPT>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=conferenceMenu.display(6)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='theForm'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"> <INPUT
			TYPE=hidden
			NAME="ConferenceID"
			VALUE="<%=conference.getConferenceID()%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Conference Details</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Name</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="Name"
					size=55
					maxlength=64
					value="<%=conference.getName()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_Name%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Admin Password</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="Password"
					size=20
					maxlength=20
					value="<%=conference.getPassword()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_AdminPassword%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Student Leader / Volunteer Password</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="StaffPassword"
					size=20
					maxlength=20
					value="<%=conference.getStaffPassword()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_StaffPassword%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Region</TD>
				<TD CLASS="cell"><SELECT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="Region">
					<OPTION VALUE=""></OPTION>
					<%
			for(int i = 0; i < selRegion.regions.length; i++){
%>
					<OPTION
						VALUE="<%=selRegion.regions[i]%>"
						<%=((String)conference.getRegion()).equals(selRegion.regions[i]) ? "SELECTED" : "" %>><%=selRegion.regionNames[i]%></OPTION>
					<%
			}
%>
				</SELECT> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_Region%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Web Registration<BR>
				Starts</TD>
				<TD CLASS="cell"><INPUT
					NAME="PreRegStart"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(conference.getPreRegStart())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Web Registration<BR>
				Ends</TD>
				<TD CLASS="cell"><INPUT
					NAME="PreRegEnd"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(conference.getPreRegEnd())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Default Staff<BR>
				Arival Date</TD>
				<TD CLASS="cell"><INPUT
					NAME="DefaultDateStaffArrive"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(conference.getDefaultDateStaffArrive())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Default Staff<BR>
				Departure Date</TD>
				<TD CLASS="cell"><INPUT
					NAME="DefaultDateStaffLeave"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(conference.getDefaultDateStaffLeave())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Contact Name</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ContactName"
					size=35
					maxlength=60
					value="<%=conference.getContactName()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Contact Address</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ContactAddress1"
					size=35
					maxlength=35
					value="<%=conference.getContactAddress1()%>"> <img
					src="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_ContactAddress%>');"
					onMouseOut="return nd();"><BR>
				<INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ContactAddress2"
					size=35
					maxlength=35
					value="<%=conference.getContactAddress2()%>"> <BR>
				<INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ContactCity"
					size=15
					maxlength=30
					value="<%=conference.getContactCity()%>">, <% 
			selState.setName("ContactState"); 
			selState.setRequired("required"); 
			if(conference.getContactState()!=null)
				selState.setCurrentValue((String)conference.getContactState());
%> <%=selState.print()%> <INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ContactZip"
					size=10
					maxlength=10
					value="<%=conference.getContactZip()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Contact Phone</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ContactPhone"
					size=35
					maxlength=35
					value="<%=conference.getContactPhone()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Contact Email</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="ContactEmail"
					size=35
					maxlength=50
					value="<%=conference.getContactEmail()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Theme</TD>
				<TD CLASS="cell"><INPUT
					NAME="Theme"
					SIZE=55
					MAXLENGTH=128
					VALUE="<%=conference.getTheme()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Description</TD>
				<TD CLASS="cell"><TEXTAREA
					COLS="60"
					ROWS="4"
					NAME="BriefDescription"
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"><%=conference.getBriefDescription()%></TEXTAREA></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Postscript for Confirmation Email</TD>
				<TD CLASS="cell"><TEXTAREA
					COLS="60"
					ROWS="4"
					NAME="ConfirmationEmail"
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"><%=conference.getConfirmationEmail()%></TEXTAREA></TD>
			</TR>
			<% 
		if(newEvent){
%>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=adminHome"
					CLASS="button">Cancel</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('next')"
					CLASS="button">Next &gt;&gt;</A></TD>
			</TR>
			<% 
		} else{
%>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=showConference"
					CLASS="button">Cancel</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveConferenceDetails')"
					CLASS="button">Save Changes</A></TD>
			</TR>
			<% 
		}
%>
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
				<TD CLASS="cell"><% 
			if (newEvent){
%> This wizard will step you through the process of setting up
				conference registration.
				<P><%
			}
%> This page allows you to select colors, fonts, and graphics for your
				CRS-generated Home Page. You may preview your selections by clicking
				the "preview" button. Clicking the "default colors" button will make
				your page white, blue and sawgrass like this page. <a
					href="JavaScript: popupWindow('/crs/images/pic.jsp?pic=sampleUserView.gif', 'UserManual', 'height=620,width=740,dependent=yes,scrollbars=no,resizable')"
					CLASS="button">View a Sample Home Page</a>
				<P>Hover over the blue question marks <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('Hi!');"
					onmouseout="return nd();"> for additional information
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
