<%@ page				
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	RegistrationType rt = (RegistrationType)ar.getObject("RegistrationType");
	int typeID = rt.getRegistrationTypeID();
	String typeLabel = rt.getLabel();
	
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean newRegType = session.getValue("newRegType") != null && ((String)session.getValue("newRegType")).equals("true");
	boolean onlyOneRegType = session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true");
	
	String pageTitle = "Financial Info" + (onlyOneRegType?"":(" for "+typeLabel));
	
	String helpText_IndivCost = "Event cost per person excluding discounts and scholarships";
	String helpText_CoupleCost = "Event cost per married couple excluding discounts and scholarships";
	String helpText_IndivCommuterCost = "Event cost for individuals not staying in designated housing, excluding discounts and scholarships";
	String helpText_CoupleCommuterCost = "Event cost for married couples not staying in designated housing, excluding discounts and scholarships";
	String helpText_CreditCards = "In order to accept credit cards, you must fill in the \"Authnet Login ID\" and \"Authnet Password\" fields.";
    String helpText_Scholarships = "The registrant will be asked for the amount and the name of the CCC person who is responsible for the scholarship. Then this CCC person may go online to enter the account fields or you may get this info some other way.";
	String helpText_Merchant = "See Instructions below for information on how to acquire an Authnet account.";
	String helpText_leaveBlank = "Leave this blank if it is not required";
	String helpText_discountEarlyDate = "Last day that the early registration discount will be applied";
	String helpText_IndivDiscountEarly = "Amount discounted when individual registers on or before the early registration deadline.  (Note: NOT the price after the discount.)";
	String helpText_IndivDiscountFullPay = "Amount discounted when registrant pays the full registration cost while registering. (Note: NOT the price after the discount.)";
	String helpText_CoupleDiscountEarly = "Amount discounted from when married couple registers on or before the early registration deadline.  (Note: NOT the price after the discount.)";
	String helpText_CoupleDiscountFullPay = "Amount discounted when married couple pays the full registration cost while registering. (Note: NOT the price after the discount.)";
	String helpText_IndivRegDate = "Partial payment required for an individual to register.";
	String helpText_CoupleRegDate = "Partial payment required for a married couple to register.";

%>
<SCRIPT LANGUAGE="JavaScript">
<!--

	function goNextWithRedirect(action, nextAction, buttonname){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue");
		}
		
		else if((form.SingleDiscountEarlyReg.value != 0 && form.SinglePreRegDeposit.value == 0) ){
			alert("If you want to award an early registration discount, you must require a registration deposit");
			form.SinglePreRegDeposit.focus();
		}
		else if(form.SingleDiscountEarlyReg.value != 0 && form.SingleDiscountEarlyRegDate.value == "No Date" ){
			alert("If you want to award an early registration discount, you must indicate an early registration deadline");
			form.SingleDiscountEarlyReg.focus();
		} else if(!validMoney(form.SingleOnsiteCost.value)){
			alert("You can enter only a number is this field");
			form.SingleOnsiteCost.focus();
		} else if(!validMoney(form.SingleCommuteCost.value)){
			alert("You can enter only a number is this field");
			form.SingleCommuteCost.focus();
		} else if(!validMoney(form.SinglePreRegDeposit.value)){
			alert("You can enter only a number is this field");
			form.SinglePreRegDeposit.focus();
		} else if(!validMoney(form.SingleDiscountFullPayment.value)){
			alert("You can enter only a number is this field");
			form.SingleDiscountFullPayment.focus();
		} else if(!validMoney(form.SingleDiscountEarlyReg.value)){
			alert("You can enter only a number is this field");
			form.SingleDiscountEarlyReg.focus();
		}
		else if((form.MarriedDiscountEarlyReg.value != 0 && form.MarriedPreRegDeposit.value == 0) ){
			alert("If you want to award an early registration discount, you must require a registration deposit");
			form.MarriedDiscountEarlyReg.focus();
		}
		else if(form.MarriedDiscountEarlyReg.value != 0 && form.MarriedDiscountEarlyRegDate.value == "No Date" ){
			alert("If you want to award an early registration discount, you must indicate an early registration deadline");
			form.MarriedDiscountEarlyReg.focus();
		} else if(!validMoney(form.MarriedOnsiteCost.value)){
			alert("You can enter only a number is this field");
			form.MarriedOnsiteCost.focus();
		} else if(!validMoney(form.MarriedCommuteCost.value)){
			alert("You can enter only a number is this field");
			form.MarriedCommuteCost.focus();
		} else if(!validMoney(form.MarriedPreRegDeposit.value)){
			alert("You can enter only a number is this field");
			form.MarriedPreRegDeposit.focus();
		} else if(!validMoney(form.MarriedDiscountFullPayment.value)){
			alert("You can enter only a number is this field");
			form.MarriedDiscountFullPayment.focus();
		} else if(!validMoney(form.MarriedDiscountEarlyReg.value)){
			alert("You can enter only a number is this field");
			form.MarriedDiscountEarlyReg.focus();
		}
		 else if(!validDate(form.PreRegStart.value)){
			alert("The Pre Registration Start Date must be entered in the form MM/DD/YYYY");
			form.form.PreRegStart.focus();
		} else if(!validDate(form.PreRegEnd.value)){
			alert("The Pre Registration End Date must be entered in the form MM/DD/YYYY");
			form.form.PreRegEnd.focus();
		} else if(!validDateRange(form.PreRegStart.value, form.PreRegEnd.value)){
			alert("The start Pre-Registration Date must be earlier than the end Pre-Registration Date");
		} else {
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.nextAction.value = nextAction;
				form.submit();
			}
		}
	}

	function goNext(action,buttonname){
		goNextWithRedirect(action,null,buttonname);
	}
	function emptyfunction(){
	}

//-->
</SCRIPT>
<%@ include file="/crs/e_header.jspf"%>
<%
	if(newEvent){
		creationMenu.setActives(new boolean[]{
			true,
			true, 
			true, 
			false
		});
	}
%><TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(3) : conferenceMenu.display(8)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='theForm'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"><INPUT
			TYPE=hidden
			NAME="nextAction"> <INPUT
			TYPE=hidden
			NAME="ConferenceID"
			VALUE="<%=conference.getConferenceID()%>">
			<INPUT
			TYPE=hidden
			NAME="RegistrationTypeID"
			VALUE="<%=rt.getRegistrationTypeID()%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="3">Financial Info<%=onlyOneRegType?"":" for "+rt.getLabel()%></TD>
			</TR>
<!-- end table header -->
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Full Cost (Individual)</TD>
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="SingleOnsiteCost"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getSingleOnsiteCost())%>">
				</TD>

				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_IndivCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD	CLASS="hl" ALIGN="RIGHT">(Married Couple)</TD>
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					<% if (!rt.getAskSpouse()){%>TYPE="hidden"<%}%>
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="MarriedOnsiteCost"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getMarriedOnsiteCost())%>">
				</TD>

				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_CoupleCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR><TD CLASS="hl" height="1" COLSPAN="3"></TD></TR>
			<TR>
				<TD	CLASS="hl" ALIGN="RIGHT">Commuter Cost (Individual)</TD>
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="SingleCommuteCost"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getSingleCommuteCost())%>">
				</TD>
				
				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_IndivCommuterCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD	CLASS="hl" ALIGN="RIGHT">(Married Couple)</TD>		
				<TD CLASS="cell" ALIGN="CENTER">
				<INPUT
					<% if (!rt.getAskSpouse()){%>TYPE="hidden"<%}%>
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="MarriedCommuteCost"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getMarriedCommuteCost())%>">
				</TD>

				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_CoupleCommuterCost%>');"
					onMouseOut="return nd();"></TD>
			</TR>			
			<TR><TD CLASS="hl" height="1" COLSPAN="3"></TD></TR>
			<TR>
				<TD CLASS="hl"
					ALIGN="RIGHT">Pre-Registration Deposit (Individual)</TD>
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="SinglePreRegDeposit"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getSinglePreRegDeposit())%>">
				</TD>

			<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_IndivRegDate%>');"
					onMouseOut="return nd();"></TD>
			</TR>

			<TR>
				<TD CLASS="hl"
					ALIGN="RIGHT">Pre-Registration Deposit (Married Couple)</TD>
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					<% if (!rt.getAskSpouse()){%>TYPE="hidden"<%}%>
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="MarriedPreRegDeposit"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getMarriedPreRegDeposit())%>">
				</TD>

				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_CoupleRegDate%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD CLASS="hl"
					ALIGN="RIGHT">Pre-Registration Start</TD>
			<TD CLASS="cell" ALIGN="CENTER"><INPUT
					CLASS="empty"
					NAME="PreRegStart"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(rt.getPreRegStart() == null ? conference.getPreRegStart() : rt.getPreRegStart())%>">
			</TD>

			</TR>
			<TR>
				<TD CLASS="hl"
					ALIGN="RIGHT">Pre-Registration End</TD>
			<TD CLASS="cell" ALIGN="CENTER"><INPUT
					CLASS="empty"
					NAME="PreRegEnd"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(rt.getPreRegEnd() == null ? conference.getPreRegEnd() : rt.getPreRegEnd())%>">
				</TD>

			</TR>

			<TR><TD CLASS="hl" height="1" COLSPAN="3"></TD></TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Full Payment Discount (Individual)</TD>	
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="SingleDiscountFullPayment"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getSingleDiscountFullPayment())%>">
				</TD>
				
				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_IndivDiscountFullPay%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD	CLASS="hl" ALIGN="RIGHT">(Married Couple)</TD>	
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					<% if (!rt.getAskSpouse()){%>TYPE="hidden"<%}%>
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="MarriedDiscountFullPayment"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getMarriedDiscountFullPayment())%>">
				</TD>
				
				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_CoupleDiscountFullPay%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR><TD CLASS="hl" height="1" COLSPAN="3"></TD></TR>
			<TR>
				<TD	CLASS="hl" ALIGN="RIGHT">Early Reg. Discount (Individual)</TD>		
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="SingleDiscountEarlyReg"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getSingleDiscountEarlyReg())%>">
				</TD>
				
				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_IndivDiscountEarly%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">(Married Couple)</TD>		
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					<% if (!rt.getAskSpouse()){%>TYPE="hidden"<%}%>
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="MarriedDiscountEarlyReg"
					size=10
					maxlength=7
					value="<%=formatter.formatDecimal(rt.getMarriedDiscountEarlyReg())%>">
				</TD>
				
				<TD CLASS="cell">
					<IMG SRC="/crs/images/info.gif"
					onMouseOver="return overlib('<%=helpText_CoupleDiscountEarly%>');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR><TD CLASS="hl" height="1" COLSPAN="3"></TD></TR>
			<TR>
				<TD	CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Early Reg. Deadline (Individual)</TD>		
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					NAME="SingleDiscountEarlyRegDate"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(rt.getSingleDiscountEarlyRegDate())%>">
				</TD>
			</TR>
			<TR>
				<TD	CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">(Married Couple)</TD>		
				<TD CLASS="cell" ALIGN="CENTER"><INPUT
					<% if (!rt.getAskSpouse()){%>TYPE="hidden"<%}%>
					NAME="MarriedDiscountEarlyRegDate"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(rt.getMarriedDiscountEarlyRegDate())%>">
				</TD>
				
			</TR>
			<TR><TD CLASS="hl" height="1" COLSPAN="3"></TD></TR>
<%			if (!"".equals(conference.getCheckPayableTo())){%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Accept Checks</TD>		
				<TD CLASS="cell" ALIGN="CENTER"><small><%
				selBool.setCurrentValue(rt.getAcceptChecks());
				selBool.setName("AcceptChecks");
				%> <%=selBool.printRadioBoolean()%></small></TD>

			</TR>
<%}%>
			<TR>
				<TD	CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Accept Scholarships</TD>
				<TD CLASS="cell" ALIGN="CENTER"><small><%
				selBool.setCurrentValue(rt.getAcceptScholarships());
				selBool.setName("AcceptScholarships");
				%> <%=selBool.printRadioBoolean()%></small></TD>
				
			</TR>
<%			if ((!"".equals(conference.getMerchantAcctNum()))&&(!"".equals(conference.getAuthnetPassword()))){%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Accept Credit Cards</TD>		
				<TD CLASS="cell" ALIGN="CENTER"><small><%
				selBool.setCurrentValue(rt.getAcceptCreditCards());
				selBool.setName("AcceptCreditCards");
				%> <%=selBool.printRadioBoolean()%></small></TD>

			</TR>			
<!--		//place holders for future abilities
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Accept E-Checks</TD>
				<TD CLASS="cell" ALIGN="CENTER"><small><%
				selBool.setCurrentValue(rt.getAcceptEChecks());
				selBool.setName("AcceptEChecks");
				%> <%=selBool.printRadioBoolean()%></small></TD>
			</TR>			
-->
<%}%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Accept Staff Account Transfers</TD>	
				<TD CLASS="cell" ALIGN="CENTER"><small><%
				selBool.setCurrentValue(rt.getAcceptStaffAcctTransfer());
				selBool.setName("AcceptStaffAcctTransfer");
				%> <%=selBool.printRadioBoolean()%></small></TD>

			</TR>			
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Accept Ministry Account Transfers</TD>	
				<TD CLASS="cell" ALIGN="CENTER"><small><%
				selBool.setCurrentValue(rt.getAcceptMinistryAcctTransfer());
				selBool.setName("AcceptMinistryAcctTransfer");
				%> <%=selBool.printRadioBoolean()%></small></TD>

			</TR>			
		
		<P>
			<%
	//	if(newEvent && newRegType){ //why new reg type AND new event?  why not just new reg type?
	if(newRegType){				// replaced 5/9/05 S.Paulis

%>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=listRegistrationTypes"
					CLASS="button">&lt;&lt; Back</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveFinancialDetails', 'save')"
					NAME="save"
					CLASS="button">Next &gt;&gt;</A></TD>
			</TR>
			<% 
		} else{
%>
			<TR><TD COLSPAN="3" CLASS="button" >
				<TABLE WIDTH="100%"><TR>
				<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=listRegistrationTypes" CLASS="button">Cancel</A></TD>
				<TD CLASS="button" ALIGN="CENTER">
				
				<A HREF="javascript: goNextWithRedirect('saveFinancialDetails','editRegistrationType', 'rt')" CLASS="button" NAME="rt">Edit Registrant Type</A><br><br>
				<A HREF="javascript: emptyfunction('saveFinancialDetails','editFinancialDetails', 'financial')" CLASS="inactivebutton" NAME="financial">Edit Financial Details</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveFinancialDetails','listRegTypeMerchandise', 'merchandise')" CLASS="button" NAME="merchandise">Edit Additional Expenses</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveFinancialDetails','editProfileQuestions', 'profile')" CLASS="button" NAME="profile">Edit Profile Questions</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveFinancialDetails','listRegTypeQuestions', 'questions')" CLASS="button" NAME="questions">Edit Custom Questions</A><br><br>
				</TD>
				<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('saveFinancialDetails', 'save')" NAME="save" CLASS="button" NAME="save">Save Changes</A></TD>
				</TR></TABLE>
				</TD>
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
				Use this page to enter the costs, discounts, early
				registration deadlines, and accepted payment methods for this registrant type. Event wide payment types are set up in the Edit Conference Info section.

<!--
				<P>The system currently does not actually charge staff/ministry
				accounts. Selecting the option will allow the registrant to see the
				option, but the administrator will need to actually charge the account.
	-->
				<P>If the event has no costs associated with it, leave all fields
				blank.
				<P>Hover over the blue question marks <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('Look for additional information here!');"
					onmouseout="return nd();"> for additional information
					
				<P><B>Note:</b>  If the date pickers aren't working, it could be because your browser is blocking popups.  For Windows Firefox users, you can unblock popups for this site by clicking Tools->Options->Web Features in your browser.
				</TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf"%>
		</TD>
	</TR>
</TABLE>
<!-- Those responsible for coolness have been sacked. -->
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
