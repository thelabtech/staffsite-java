<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	CRSConference conference = (CRSConference)ar.getObject("conference");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	String view = ar.getValue("view");
	String pageTitle = "Payment Options";
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
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		// First check to see if all the required fields have something in them
		if(requiredFilled(document.theForm)){
			// Next check for specific content
			document.theForm.action.value = action;
			document.theForm.submit();
		}
	}

-->
</SCRIPT>
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
		<P><%=conferenceMenu.display(7)%>
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
					COLSPAN="2">Payment Details</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="30%">Full Cost</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="OnsitetCost"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(conference.getOnsiteCost())%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_FullCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Commuter Cost</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="CommuterCost"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(conference.getCommuterCost())%>">
				<IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_FullCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Registration Deposit</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="PreRegDeposit"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(conference.getPreRegDeposit())%>">
				<IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_FullCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Full Payment Discount</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="DiscountFullPayment"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(conference.getDiscountFullPayment())%>">
				<IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_FullCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Early Registration Discount</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="DiscountEarlyReg"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(conference.getDiscountEarlyReg())%>">
				<IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_FullCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Early Registration Deadline</TD>
				<TD CLASS="cell"><INPUT
					NAME="DiscountEarlyRegDate"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(conference.getDiscountEarlyRegDate())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="subboxheader"
					COLSPAN="2">Accepted Payment Types</TD>
			</TR>
			<% 
		selBool.setLabels("Yes","No");
%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">E-Checks</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(conference.getAcceptEChecks());
			selBool.setName("AcceptEChecks");
%> <%=selBool.printRadioBoolean()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">Scholarships</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(conference.getAcceptScholarships());
			selBool.setName("AcceptScholarships");
%> <%=selBool.printRadioBoolean()%></TD>
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
					VALIGN="CENTER">MasterCard</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(conference.getAcceptMasterCard());
			selBool.setName("AcceptMasterCard");
%> <%=selBool.printRadioBoolean()%> <IMG SRC="/crs/images/smmc.gif"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">AmericanExpress</TD>
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
					HREF="javascript: goNext('savePaymentDetails')"
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
				<TD CLASS="cell">The available online payment methods right now are
				mail check, scholarship, and credit card. You must set up a merchant
				account in order to do online credit card payments. If you have not
				set up an account yet, do <B>not</B> set the <I>Accept Credit Cards</I>
				field to yes.
				<p>If the event has no costs associated with it, leave all the
				fields blank.
				<P><B>Additional Payment Add-Ons</B><BR>
				These are items that will be listed on the "My Registration Info"
				page for students. They are things that will add to the conference
				cost if they choose "yes". For example, you could charge an
				additional $50 for a ski day, or $10 for a T-shirt, or $20 for a
				book. Click the [Add] link below to see how the add-ons will be
				displayed. You won't have to add one if you don't want to.
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
