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
	function isDigit(num) {
		var string="1234567890";
		if (string.indexOf(num) != -1) {
			return true;
			}
		return false;
	}

	function isInteger (s){
		var i;	
		if ((s == null) || (s.length == 0) || (s == " "))  /* isEmpty*/
		   if (isInteger.arguments.length == 1) return true;
		   else return (isInteger.arguments[1] == true);
		for (i = 0; i < s.length; i++){   
			var c = s.charAt(i);
			if (!isDigit(c)) return false;
		}
		return true;
	}
		
	function isIntegerInRange (s, a, b){
		if ((s == null) || (s.length == 0) || (s == " "))  /* isEmpty*/
		   if (isIntegerInRange.arguments.length == 1) return true;
		   else return (isIntegerInRange.arguments[1] == true);
		if (!isInteger(s, false)) return false;
		var num = parseInt (s);
		return ((num >= a) && (num <= b));
	}

	function goNext(action){
		var form = document.theForm;

		if(!requiredFilled(form)){
			alert("You must fill out all of the required fields to continue.");
		}
		else if(!validFloat(form.PaymentAmt.value)){
			alert("You can enter only a number is this field");
			form.PaymentAmt.focus();
		}
		else if (
			(form.AccountNumber.value.length<9)	|| 
			(!isInteger(form.AccountNumber.value.substring(0,9))) ||
			( (form.AccountNumber.value.length==10) && 
				( (isInteger(form.AccountNumber.value)) || !((form.AccountNumber.value.charAt(9)=="s") || (form.AccountNumber.value.charAt(9)=="S")) ) ) )	{
				
			alert("Please be sure to enter your staff account number as a 9-digit number.\nYou may need to add zeroes at the beginning of the number.\nWives, if you are adding an \"S\" be sure to put it at the end, AFTER the 9 digits.");
			form.AccountNumber.focus();
		}
		else{
			form.action.value = action;
			form.submit();
		}
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
	<%=registrationMenu.display(registration.getSpouseComing() == 2 ? 10 : 7)%>
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
	<input type=hidden name='PaymentMethod' value='<%=ar.getValue("PaymentMethod")%>'>
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Payment by Staff Account Transfer</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">Please enter the 9-digit staff account number to be 
			charged in the "account number" field below (you may need to add zeroes at the 
			beginning of the number to make it a 9-digit number). If it is already 
			filled in, please verify that it is the correct account number and edit 
			if necessary. 
			<p>
			If you came to this page by mistake and are not using an account transfer,
			please change your payment type by clicking the "Change Payment Type" link below.</TD>
		</TR>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Account Information</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Transfer Amount</TD>
			<TD CLASS="cell">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="PaymentAmt" VALUE="<%=ar.getValue("PaymentAmount")%>" size=5 maxlength=6>
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Account Number</TD>
			<TD CLASS="cell">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="AccountNumber" VALUE="<%=ar.getValue("AccountNumber")%>" size=10 maxlength=10>
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Comments:</TD>
			<TD CLASS="cell">
			<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Comments" VALUE="" size=30 maxlength=60>
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
				<A HREF="javascript: goNext('confirmPayment')" CLASS="button">Submit Transfer Request</A>
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
