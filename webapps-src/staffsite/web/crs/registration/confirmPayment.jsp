<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSRegister");
	}
	Hashtable paymentInfoHash = ar.getHashtable("PaymentInfo");
	Conference conference = (Conference)ar.getObject("conference");
	Registration registration = (Registration)ar.getObject("registration");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	String pageTitle = "Confirm Online Payment";
%>
<%@ include file="/crs/e_user_header.jspf" %>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(){
		var form = document.payment;
		if(submitOnce('pay')) {
			form.submit();
		}
	}
//-->
</SCRIPT>

<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
	<%=registrationMenu.display(registration.getSpouseComing() == 2 ? 7 : 4)%>
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
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Confirm Payment Information</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">
<%			if (paymentInfoHash.get("PaymentMethod").equals("ministry_transfer")) {
%>
				The staff member that you have specified will be notified of this pending Minsitry Account Transfer via email.  Please review the information below and click "Confirm Payment" if it is correct.  If this is not correct or you do not wish to pay by Ministry Account Transfer at this time, click "Edit Payment Details."
<%			} else {
%>
				If the billing details below are correct, click the "confirm payment" button to complete your registration and view your conference receipt. Your payment type will be listed. If the information below is not correct, you may change it by clicking "Edit Payment Details."	
<%			}
%>
		</TD>
		</TR>
<%		/* default display options of name/address/... */
		if ((!paymentInfoHash.get("PaymentMethod").equals("Scholarship"))
			&&	(!paymentInfoHash.get("PaymentMethod").equals("staff_transfer"))
			&&  (!paymentInfoHash.get("PaymentMethod").equals("ministry_transfer"))){
%>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Billing Information</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">First Name</TD>
			<input type=hidden name=FirstName value=<%=paymentInfoHash.get("FirstName")%>>
			<TD CLASS="cell"><%=paymentInfoHash.get("FirstName")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Last Name</TD>
			<input type=hidden name=LastName value=<%=paymentInfoHash.get("LastName")%>>
			<TD CLASS="cell"><%=paymentInfoHash.get("LastName")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Address 1</TD>
			<input type=hidden name=Address1 value=<%=paymentInfoHash.get("Address1")%>>
			<TD CLASS="cell"><%=paymentInfoHash.get("Address1")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Address 2</TD>
			<input type=hidden name=Address2 value=<%=paymentInfoHash.get("Address2")%>>
			<TD CLASS="cell"><%=paymentInfoHash.get("Address2")%></TD>
		</TR>
		<tr>
			<TD CLASS="hl" ALIGN="RIGHT"> City, State Zip</TD>
			<input type=hidden name=City value=<%=paymentInfoHash.get("City")%>>
			<input type=hidden name=State value=<%=paymentInfoHash.get("State")%>>
			<input type=hidden name=Zip value=<%=paymentInfoHash.get("Zip")%>>
			<TD CLASS="cell"><%=paymentInfoHash.get("City")%>, <%=paymentInfoHash.get("State")%> <%=paymentInfoHash.get("Zip")%></TD>
		</tr>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Country</TD>
			<input type=hidden name=Country value=<%=paymentInfoHash.get("Country")%>>
			<TD CLASS="cell"><%=paymentInfoHash.get("Country")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Email</TD>
			<input type=hidden name=Email value=<%= paymentInfoHash.get("Email")%>>
			<TD CLASS="cell"><%= paymentInfoHash.get("Email")%></TD>
		</TR>
<%
	}
	if (paymentInfoHash.get("PaymentMethod").equals("Credit Card")) {
%>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Credit Card Payment Details</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Credit Card Number</TD>
			<TD CLASS="cell"><%=paymentInfoHash.get("CCNum")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">ExpirationDate</TD>
			<TD CLASS="cell"><%=paymentInfoHash.get("CCExpM")%>/<%=paymentInfoHash.get("CCExpY")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Payment Amount</TD>
			<TD CLASS="cell">$<%=paymentInfoHash.get("PaymentAmt")%></TD>
		</TR>
<% 
	} else if (paymentInfoHash.get("PaymentMethod").equals("ECheck")) {
%>
		<table align=center width="100%" border=0>
		<TR>
			<TD CLASS="subboxheader" ALIGN="CENTER" VALIGN="TOP" COLSPAN="3">Check Information</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Routing Number</TD>
			<TD CLASS="cell"><IMG SRC="/crs/images/symbol_route.gif" BORdER="0"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="BankABACode" size=16 maxlength=20><IMG SRC="/crs/images/symbol_route.gif" BORdER="0"></TD>
			<TD ROWSPAN="4" CLASS="cell"><IMG SRC="/crs/images/check_example.gif" BORDER="0"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Account Number</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="BankAcctNum" size=16 maxlength=20><IMG SRC="/crs/images/symbol_account.gif" BORdER="0"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Bank Name</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="BankName" size=16 maxlength=20></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Payment Amount</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="PaymentAmt" VALUE="<%=ar.getValue("PaymentAmount")%>" size=5 maxlength=6></TD>
		</TR>
<%
		if(paymentInfoHash.get("ssn") != null && !paymentInfoHash.get("ssn").equals("")){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Social Security Number</TD>
				<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="empty" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="ssn" size=16 maxlength=20></TD>
			</TR>
<%
		} else {
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Driver's License State</TD>
				<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="empty" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="DLState" size=16 maxlength=20></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Driver's License DOB</TD>
				<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="empty" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="DLDOB" size=16 maxlength=20></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Driver's License Number</TD>
				<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="empty" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="DLNum" size=16 maxlength=20></TD>
			</TR>
<%
		}
		} /* end Echeck payment */
		
		else if (paymentInfoHash.get("PaymentMethod").equals("Scholarship")) {
%>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Scholarship Payment Details</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Scholarship Amount</TD>
			<TD CLASS="cell">$<%=paymentInfoHash.get("PaymentAmt")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Contact Name</TD>
			<TD CLASS="cell"><%=ar.getValue("staffName")%><input type="hidden" name="staffEmail" value="<%=ar.getValue("staffName")%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Contact Email</TD>
			<TD CLASS="cell"><%=paymentInfoHash.get("Comment")%></TD>
		</TR>
<%
	} 
		else if (paymentInfoHash.get("PaymentMethod").equals("staff_transfer")){
%>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Account Transfer Payment Details</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Transfer Amount</TD>
			<TD CLASS="cell">$<%=paymentInfoHash.get("PaymentAmt")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Account Number</TD>
			<TD CLASS="cell"><%=ar.getValue("AccountNumber")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Comments</TD>
			<TD CLASS="cell"><%=paymentInfoHash.get("Comments")%></TD>
		</TR>
<%
	} else if (paymentInfoHash.get("PaymentMethod").equals("ministry_transfer")) {
%>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Ministry Account Transfer Payment Details</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Payment Amount</TD>
			<TD CLASS="cell">$<%=paymentInfoHash.get("PaymentAmt")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Business Unit</TD>
			<TD CLASS="cell"><%=ar.getValue("BU")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Operating Unit</TD>
			<TD CLASS="cell"><%=ar.getValue("OU")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Department</TD>
			<TD CLASS="cell"><%=ar.getValue("Dept")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Project</TD>
			<TD CLASS="cell"><%=ar.getValue("Project")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Staff Authorizer</TD>
			<TD CLASS="cell"><%=paymentInfoHash.get("staffName")%></TD>
		</TR>
<%
	} 
%>
		<form method=post action="/servlet/CRSRegister" NAME="payment">
<%
		if (paymentInfoHash.get("PaymentMethod").equals("Credit Card")) {
%>
			<input type=hidden name='action' value='processCredtitCardPayment'>
<% 
		} else if (paymentInfoHash.get("PaymentMethod").equals("ECheck")) {
%>
			<input type=hidden name='action' value='processCredtitCardPayment'>
<% 
		} else if (paymentInfoHash.get("PaymentMethod").equals("Scholarship")) {
%>
			<input type=hidden name='action' value='processScholarshipPayment'>
<% 
		}  else if (paymentInfoHash.get("PaymentMethod").equals("staff_transfer")) {
%>
			<input type=hidden name='action' value='processAccountTransferPayment'>
<% 
		}  else if (paymentInfoHash.get("PaymentMethod").equals("ministry_transfer")) {
%>
			<input type=hidden name='action' value='processMinistryTransferPayment'>
<% 
		} 
%>
		<input type=hidden name='RegistrationID' value='<%=ar.getValue("RegistrationID")%>'>
<%
		Enumeration paymentInfo = paymentInfoHash.keys();
		while (paymentInfo.hasMoreElements()) {
			String key = (String)paymentInfo.nextElement();
%>
			<input type=hidden name='<%=key%>' value='<%=(String)paymentInfoHash.get(key)%>'><%
		}
%>
		<TR>
			<TD CLASS="button" ALIGN="LEFT"><A HREF="javascript: history.go(-1)" CLASS="button">Edit Payment Details</A></TD>
			<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext()" NAME="pay" CLASS="button">Confirm Payment</A></TD>
		</TR>
		</form>
		<TR>
			<TD CLASS="hl" COLSPAN="2" ALIGN="CENTER">
				Please click the confirmation button only once. The next page may take a few minutes to load.
				<br>
				If you have any problems upon clicking this, please do not click this button again.  Wait 24 hours for an email confirming your payment.  If you do not receive a confirmation email, please contact us.
			</TD>
		</TR>
	</TABLE>
	</form>
</TD>
</TR>
</TABLE>

<%@ include file="/crs/e_user_footer.jspf" %>
