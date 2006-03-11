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
<%
	registrationMenu.setActives(new boolean[]{
		true,
		true, 
		true, 
		true, 
		true, 
		true, 
		true, 
		true, 
		false, 
		false, 
		true
	});
otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

	accountManagementMenu.setActives(new boolean[]{
		true
	});
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else if(!validEmail(form.Email.value)){
			alert("You must enter a valid email address");
			form.Email.focus();
		} else if(!validInt(form.BankABACode.value)){
			alert("You can enter only number is this field");
			form.BankABACode.focus();
		} else if(!validInt(form.BankAcctNum.value)){
			alert("You can enter only number is this field");
			form.BankAcctNum.focus();
		} else if(!validFloat(form.PaymentAmt.value)){
			alert("You can enter only a number is this field");
			form.PaymentAmt.focus();
		} else if(form.ssn.value == "" && (form.DLState.value == "" || form.DLDOB.value == "" || form.DLNum.value == "")){
			alert("You must enter your social security number or driver's license information");
			form.ssn.focus();
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
		<P>
		<%=accountManagementMenu.display(0)%>
	</TD>
	<TD VALIGN="TOP" COLSPAN="2">
	<form method=post action="/servlet/CRSRegister" name="theForm">
	<input type=hidden name='action' value='confirmPayment'>
	<input type=hidden name='PaymentMethod' value='Echeck'>
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="3">Payment by E-check</TD>
		</TR>
		<TR>
			<TD CLASS="subboxheader" ALIGN="CENTER" VALIGN="TOP" COLSPAN="3">Information as Printed on your Check</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="30%">First Name<%=conference.getIsCloaked() ? " (Given Name)" : ""%></TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="FirstName" size=20 maxlength=30 value="<%=person.getFirstName()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT">Last Name<%=conference.getIsCloaked() ? " (Family Name)" : ""%></TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="LastName" size=20 maxlength=30 value="<%=person.getLastName()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address 1</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Address1" size=20 maxlength=35 value="<%=person.getAddress1()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address 2</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="empty" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Address2" size=20 maxlength=35 value="<%=person.getAddress2()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">City</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="City" size=20 maxlength=30 value="<%=person.getCity()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">State</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="State" size=3 maxlength=2 value="<%=person.getState()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Zip</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Zip" size=10 maxlength=10 value="<%=person.getZip()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Country</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Country" size=20 maxlength=50 value="<%=person.getCountry()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Phone</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="HomePhone" size=10 maxlength=24 value="<%=person.getHomePhone()%>"></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Email</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Email" size=20 maxlength=200 value="<%=person.getEmail()%>"></TD>
		</TR>
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
		<TR>
			<TD CLASS="subboxheader" ALIGN="CENTER" VALIGN="TOP" COLSPAN="3">Provide One of the Following</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Social Security Number</TD>
			<TD CLASS="cell" COLSPAN="2"><INPUT CLASS="empty" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="ssn" size=16 maxlength=20></TD>
		</TR>
		<TR>
			<TD CLASS="subboxheader" ALIGN="CENTER" VALIGN="TOP" COLSPAN="3">Or</TD>
		</TR>
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
		<TR>
			<TD CLASS="hl">&nbsp;</TD>
			<TD CLASS="cell" COLSPAN="2">
				<B>Note:</B></font> 
				<% if(true) { // (!((Boolean)person.getPreRegistered()).booleanValue()){%>
					To guarantee your pre-registration you must pay at least the pre-registration cost (including any scholarships).<br>
				<%}%>
				<B>You may pay the full amount now or at the event.</B>
				</font>
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="3" CLASS="button" ALIGN="CENTER">
				<A HREF="javascript: goNext('confirmPayment')" CLASS="button">Submit E-Check Payment</A>
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