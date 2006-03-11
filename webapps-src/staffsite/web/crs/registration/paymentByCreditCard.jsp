<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*" %>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState" scope="request"/>
<jsp:useBean id="selMonth" class="org.alt60m.html.SelectMonth" scope="request"/>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	Registration registration = (Registration)ar.getObject("registration");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	Conference conference = (Conference)ar.getObject("conference");
    Person person = registration.getPerson();

    String pageTitle = "Online Payment";
%>
<%@ include file="/crs/e_user_header.jspf" %>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the required fields to continue.");
		} else if(!validEmail(form.Email.value)){
			alert("You must enter a valid email address");
			form.Email.focus();
		} else if(!validCC(form.CCNum.value)){
			alert("Please enter a 16 digit credit card number with no spaces");
			form.CCNum.focus();
		} else if(form.CCExpY.value == <%=today.get(Calendar.YEAR)%> && form.CCExpM.value < <%=(today.get(Calendar.MONTH) + 1)%>){ 
			alert("The credit card expiration date you entered is expried, lease correct it.");
		} else if(!validFloat(form.PaymentAmt.value)){
			alert("You can enter only a number is this field");
			form.PaymentAmt.focus();
		} else{
			form.action.value = action;
			form.submit();
		}
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
	<%=registrationMenu.display(isSpouse ? 7 : 4)%>
	<p>
	<%=otherOptionsMenu.display(0)%>
	<P>
		<TABLE CLASS="box" WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
			<TR><TD CLASS="subboxheader">Key</TD></TR>
			<TR><TD CLASS="cell"><INPUT CLASS="required" VALUE="Required Fields"></TD></TR>
			<TR><TD CLASS="cell"><INPUT CLASS="empty" VALUE="Optional Fields"></TD></TR>
		</TABLE>
	</TD>
	<TD VALIGN="TOP" COLSPAN="2">
	<form method=post action="/servlet/CRSRegister" name="theForm">
	<input type=hidden name='action' value='confirmPayment'>
	<input type=hidden name='PaymentMethod' value='Credit Card'>
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Payment by Credit Card</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">Please enter your credit card information below, including the billing address (this is the address to which the monthly credit card statement is mailed). PLEASE NOTE THAT IF THE ADDRESS YOU ENTER BELOW DOES NOT MATCH THE BILLING ADDRESS ON THE CARD, YOUR PAYMENT WILL BE DECLINED AND THE ISSUING BANK MAY TEMPORARILY WITHHOLD FUNDS ANYWAY. You assume all responsibility for funds being withheld from your available credit.</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">First Name<%=conference.getIsCloaked() ? " (Given Name)" : ""%></TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="FirstName" size=20 maxlength=30 value="<%=person.getFirstName()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Last Name<%=conference.getIsCloaked() ? " (Family Name)" : ""%></TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="LastName" size=20 maxlength=30 value="<%=person.getLastName()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address 1</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Address1" size=20 maxlength=35 value=""></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address 2</TD>
			<TD CLASS="cell"><INPUT CLASS="empty" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Address2" size=20 maxlength=35 value=""></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">City</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="City" size=20 maxlength=30 value=""></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">State</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="State" size=3 maxlength=2 value=""></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Zip</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Zip" size=10 maxlength=10 value=""></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Country</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Country" size=20 maxlength=50 value=""></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Phone</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="HomePhone" size=10 maxlength=24 value=""></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Email</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Email" size=20 maxlength=200 value="<%=person.getEmail()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Payment Amount</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="PaymentAmt" VALUE="<%=ar.getValue("PaymentAmount")%>" size=5 maxlength=6></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Accepted Cards</TD>
			<TD CLASS="cell">
				<%=conference.getAcceptVisa() ? "<IMG SRC='/crs/images/smvisa.gif'>" : ""%>
				<%=conference.getAcceptMasterCard() ? "<IMG SRC='/crs/images/smmc.gif'>" : ""%>
				<%=conference.getAcceptAmericanExpress() ? "<IMG SRC='/crs/images/smamex.gif'>" : ""%>
				<%=conference.getAcceptDiscover() ? "<IMG SRC='/crs/images/smdiscvr.gif'>" : ""%>
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Credit Card Number</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="CCNum" size=16 maxlength=20></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Expiration Date</TD>
			<TD CLASS="cell">
				<SELECT name="CCExpM" CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
					<OPTION VALUE=""></OPTION>
					<OPTION VALUE="01">Jan</OPTION>
					<OPTION VALUE="02">Feb</OPTION>
					<OPTION VALUE="03">Mar</OPTION>
					<OPTION VALUE="04">Apr</OPTION>
					<OPTION VALUE="05">May</OPTION>
					<OPTION VALUE="06">June</OPTION>
					<OPTION VALUE="07">July</OPTION>
					<OPTION VALUE="08">Aug</OPTION>
					<OPTION VALUE="09">Sept</OPTION>
					<OPTION VALUE="10">Oct</OPTION>
					<OPTION VALUE="11">Nov</OPTION>
					<OPTION VALUE="12">Dec</OPTION>
				</SELECT> /
				<SELECT name="CCExpY" CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
					<OPTION VALUE=""></OPTION>
<%
					for(int year = 0; year <= 5; year++){
%>
						<OPTION VALUE="<%=today.get(Calendar.YEAR) + year%>"><%=today.get(Calendar.YEAR) + year%></OPTION>
<%
					}
%>
				</SELECT>

			</TD>
		</TR>
		<TR>
			<TD CLASS="hl">&nbsp;</TD>
			<TD CLASS="cell">
				<B>Note:</B></font>
				<% if(true) { // (!((Boolean)person.getPreRegistered()).booleanValue()){%>
					To guarantee your pre-registration you must pay at least the pre-registration cost (including any scholarships).<br>
				<%}%>
				<B>You may pay the full amount now or at the event.</B>
				</font>
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="2" CLASS="button" ALIGN="CENTER">
				<A HREF="javascript: goNext('confirmPayment')" CLASS="button">Submit Credit Card Payment</A>
				<BR><BR>
				<A HREF="javascript: history.go(-1)" CLASS="button">Change Payment Type</A>
			</TD>
		</TR>
	</TABLE>
	</form>
</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>