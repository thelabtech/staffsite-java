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
	// Help Text
	String pageTitle = "Edit " + conference.getName() + " Details";
	String helpText_Theme = "The theme of the conference. Example: Masterpiece, Open, Imagine";
	String helpText_Region = "Region in which U.S. conferences will take place.  Conferences outside the U.S. should indicate <I>Nat\\\'l Campus Office</I> as their region.";
	String helpText_AdminPassword = "Secret word administrator will need to gain access to confidential conference information";
    String helpText_StaffPassword = "Student leaders and volunteers can log on to http://conference.campuscrusadeforchrist.com to view reports, update scholarships and see which other students from their campuses have registered.  PLEASE CHOOSE A DIFFERENT PASSWORD THAN THE ADMINISTRATOR PASSWORD. (Campus Ministry staff do not need a special password, since they can view information while logged on to the Staff Site.)";
	String helpText_leaveBlank = "Leave this blank if it is not required.";
	String helpText_ContactAddress = "This is the address to which registrants will be told to mail their checks if they are paying by check.";
	//String helpText_email = "This message will appear in an email to registrants once they have completed their registration.";
	String helpText_email = "When a person\\\'s registration is complete and they have submitted any required preregistration deposit, the CRS will generate the following email to him/her:<BR><BR>\\\'Dear (Registrant\\\'s Name),<BR>Thank you for pre-registering for the (Your Conference\\\'s Name).  Your preregistration is complete. If you have any questions about your pre-registration, email us at (Contact Person\\\'s Email Address).  We look forward to seeing you at the conference!<BR>-- the (Your Conference\\\'s Name) Team\\\'<BR><BR> <I>Whatever you type in this field will be added to the end of this confirmation email as a P.S.</I>";
	String helpText_Merchant = "See Instructions below for information on how to acquire an Authnet account.";

	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");

%>
<%@ include file="/crs/e_header.jspf"%>
<%formatter.setNoDate("");%>
<%
	if(newEvent){
		creationMenu.setActives(new boolean[]{
			true,
			false, 
			false, 
			false
		});
	}
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		form.ContactEmail.value = form.ContactEmail.value.toLowerCase();

		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else if(!validDate(form.PreRegStart.value)){
			alert("The Web Registration Starts Date must be entered in the form MM/DD/YYYY");
			form.PreRegStart.focus();
		} else if(!validDate(form.PreRegEnd.value)){
			alert("The Web Registration Ends Date must be entered in the form MM/DD/YYYY");
			form.PreRegEnd.focus();
		} else if(!validDate(form.MasterDefaultDateLeave.value)){
			alert("The Master Default Departure Date must be entered in the form MM/DD/YYYY");
			form.MasterDefaultDateLeave.focus();
		} else if(!validDate(form.MasterDefaultDateArrive.value)){
			alert("The Default Master Arrival Date must be entered in the form MM/DD/YYYY");
			form.MasterDefaultDateArrive.focus();
		} else if(!validDateRange(form.PreRegStart.value, form.MasterDefaultDateLeave.value)){
			alert("Pre-Registration must occur before the end of the conference.");
			form.PreRegStart.focus();
		} else if(!validDateRange(form.PreRegStart.value, form.PreRegEnd.value)){
			alert("The start Registration Date must be earlier than the end Registration Date");
			form.PreRegStart.focus();
		} else if(!validDateRange(form.MasterDefaultDateArrive.value, form.MasterDefaultDateLeave.value)){
			alert("The start Master Default Date must be earlier than the end Master Default Date");
			form.MasterDefaultDateArrive.focus();
		} else if((form.MerchantAcctNum.value == '' || form.AuthnetPassword.value == '')&&(form.AcceptVisa[0].checked || form.AcceptMasterCard[0].checked || form.AcceptAmericanExpress[0].checked || form.AcceptDiscover[0].checked)){
			alert("You must fill in the Authnet Login ID and Password");
			form.MerchantAcctNum.focus();
		} else if(!validEmail(form.ContactEmail.value)){
			alert("You must enter a valid email address");
			form.ContactEmail.focus();
		} else{
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
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
		<P><%=newEvent ? creationMenu.display(1) : conferenceMenu.display(6)%>
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
					WIDTH="20%">Conference Name</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="Name"
					size=55
					maxlength=64
					value="<%=conference.getName()%>"></TD>
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
				<TD
					CLASS="cell"
					VALIGN="TOP"><TEXTAREA
					COLS="60"
					ROWS="4"
					NAME="ConfirmationEmail"
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"><%=conference.getConfirmationEmail()%></TEXTAREA>
				<img
					align="TOP"
					src="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_email%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="subboxheader"
					COLSPAN="2">Dates</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Web Registration<BR>
				Starts</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="PreRegStart"
					SIZE=10
					MAXLENGTH=10
					value="<%=formatter.formatDate(conference.getPreRegStart())%>"> <A
					HREF="javascript: pickdate(document.theForm.PreRegStart)"
					CLASS="button">Choose</A></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Web Registration<BR>
				Ends</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="PreRegEnd"
					SIZE=10
					MAXLENGTH=10
					value="<%=formatter.formatDate(conference.getPreRegEnd())%>"> <A
					HREF="javascript: pickdate(document.theForm.PreRegEnd)"
					CLASS="button">Choose</A></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Master Default <BR>
				Arrival Date</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="MasterDefaultDateArrive"
					SIZE=10
					MAXLENGTH=10
					value="<%=formatter.formatDate(conference.getMasterDefaultDateArrive())%>">
				<A
					HREF="javascript: pickdate(document.theForm.MasterDefaultDateArrive)"
					CLASS="button">Choose</A></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Master Default <BR>
				Departure Date</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="MasterDefaultDateLeave"
					SIZE=10
					MAXLENGTH=10
					value="<%=formatter.formatDate(conference.getMasterDefaultDateLeave())%>">
				<A
					HREF="javascript: pickdate(document.theForm.MasterDefaultDateLeave)"
					CLASS="button">Choose</A></TD>
			</TR>
			
			<%--2/22/2006 SRW - Added for Student Venture so this ministry can 
			mark its conferences. --%>		
			<TR>
				<TD
					CLASS="subboxheader"
					COLSPAN="2">Ministry Type</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">What type of conference is this?</TD>
				<TD 
					CLASS="cell">
					<SELECT NAME="MinistryType">
					<option VALUE=""
						<%=(conference.getMinistryType().equals("") ? "" : "")%>></option>
					<option VALUE="SV"
						<%=(conference.getMinistryType().equals("SV") ? "SELECTED" : "")%>>Student Venture</option>
					<option VALUE="BR"
						<%=(conference.getMinistryType().equals("BR") ? "SELECTED" : "")%>>Bridges</option>
					<option VALUE=""
						<%=(conference.getMinistryType().equals("") ? "SELECTED" : "")%>>Other</option>
					</SELECT>
			</TR>
			
			<!-- 11/23/2005 Cloaked Conference
			This new section allows a conference admin to cloak a conference, 
			meaning that all references to Campus Crusade for Christ are removed.
			This is a new feature requested by Bridges Int'l for their ministry. -->
			<TR>
				<TD
					CLASS="subboxheader"
					COLSPAN="2">Cloaked Conference</TD>
					<% selBool.setLabels("Yes","No"); %>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">Do you wish to remove all references to 
					Campus Crusade for Christ from this conference?</TD>
				<TD CLASS="cell"><%
					selBool.setCurrentValue(conference.getIsCloaked());
					selBool.setName("IsCloaked"); %> 
					<%=selBool.printRadioBoolean()%> </TD>
			</TR>
			<!-- End Cloaked Conference -->
			<TR>
				<TD
					CLASS="subboxheader"
					COLSPAN="2"><B>General Financial Information</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="30%">Authnet API Login ID</TD>
				<TD CLASS="cell"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="MerchantAcctNum"
					size=20
					maxlength=64
					value="<%=conference.getMerchantAcctNum()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_Merchant%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Authnet Transaction Key</TD>
				<TD CLASS="cell"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="AuthnetPassword"
					size=20
					maxlength=200
					value="<%=conference.getAuthnetPassword()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="subboxheader"
					COLSPAN="2">Accepted Payment Types</TD>
			</TR>
			<% 
				selBool.setLabels("Yes"," No");
%>
			
	<!--<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER" WIDTH="30%">E-Checks</TD>
			<TD CLASS="cell">
<%
			selBool.setCurrentValue(conference.getAcceptEChecks());
			selBool.setName("AcceptEChecks");
%>
			<%=selBool.printRadioBoolean()%>			
			</TD>
		</TR> -->
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="30%">Make Checks Payable To</TD>
				<TD CLASS="cell" COLSPAN="3"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="CheckPayableTo"
					size=30
					maxlength=40
					value="<%=conference.getCheckPayableTo()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_leaveBlank%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">Visa</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(conference.getAcceptVisa());
			selBool.setName("AcceptVisa");
%> <%=selBool.printRadioBoolean()%> <IMG SRC="/crs/images/smvisa.gif"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">Master Card</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(conference.getAcceptMasterCard());
			selBool.setName("AcceptMasterCard");
%> <%=selBool.printRadioBoolean()%> <IMG SRC="/crs/images/smmc.gif"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">American Express</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(conference.getAcceptAmericanExpress());
			selBool.setName("AcceptAmericanExpress");
%> <%=selBool.printRadioBoolean()%> <IMG SRC="/crs/images/smamex.gif"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">Discover</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(conference.getAcceptDiscover());
			selBool.setName("AcceptDiscover");
%> <%=selBool.printRadioBoolean()%> <IMG SRC="/crs/images/smdiscvr.gif">
				</TD>
			</TR>
			
			<TR>
				<TD
					CLASS="subboxheader"
					COLSPAN="2">Contact Information</TD>
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
				<TD CLASS="cell"><input
					class="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					name="ContactAddress1"
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
					value="<%=conference.getContactAddress2()%>"><BR>
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
					maxlength=24
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
					HREF="javascript: goNext('saveConferenceDetails', 'save')"
					NAME="save"
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
					HREF="javascript: goNext('saveConferenceDetails', 'save')"
					NAME="save"
					CLASS="button"
					NAME="savebutton">Save Changes</A></TD>
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
				<TD CLASS="cell">
				<p><b>NEW!</b> Several new features have been added to the CRS. The 
				first is called Cloaked Conference. By selecting "Yes", any mention
				of Campus Crusade for Christ will be removed. This can be very useful 
				where you have to be sensitive to the Christian nature of our 
				organization. Another new feature is that you can label your conference
				according to the branch of your ministry. Currently, we only have 
				labels for "Student	Venture" and "Bridges". </p> 
				
				<p>Complete all required (<FONT CLASS="required">yellow</FONT>)
				fields. The CRS will use the information entered to generate a home
				page for your event. The purpose of this home page is to give
				students the information they will need about the event and then
				link them to the registration form. If your conference has its own
				promotional/informational website, you don't have to use the
				CRS-generated home page (you can link directly to the registration
				form from your website), but it will be there for you if you need
				it.</p>
				<p><a
					href="JavaScript: popupWindow('/crs/images/pic.jsp?pic=sampleUserView.gif', 'UserManual', 'height=870,width=772,dependent=yes,scrollbars=no,resizable')"
					CLASS="button">View a Sample Home Page</a></p>
				<p>
				If you will be accepting credit card payments for this event,
				you must have a merchant account with our credit card processing
				vendor, Authorize.net. To set up an Authorize.net merchant account
				and receive your Authorize.net API Login ID and Transaction Key, contact Steve
				Hackney in Campus Crusade for Christ's Financial Services Group. You
				can email him at 
				<A HREF="mailto:Steve.Hackney@ccci.org">Steve.Hackney@ccci.org</A>.
				If you already have a Ministry Checking Account, please have the
				account number and the contact information of your local Financial
				Administrator available prior to contacting the Financial Services
				Group.
				</p>
				<P>Hover over the blue question marks <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('Hi!');"
					onmouseout="return nd();"> for additional information</P>
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
