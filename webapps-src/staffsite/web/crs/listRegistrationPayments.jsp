<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="formHelp"
	class="org.alt60m.html.FormHelper" />
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<% 
	selBool.setLabels("Yes","No");
%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}

	Registration registration = (Registration)ar.getObject("registration");
	Conference conference = (Conference)ar.getObject("conference");
	RegistrationType regType = registration.getRegistrationType();
	Collection payments = ar.getCollection("payments");
	Hashtable AccountSummary = ar.getHashtable("AccountSummary");

	String pageTitle = registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName() + "'s Payment Info"; 

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
	
	function savePayment(form){
		if(!validDate(form.PostedDate.value)) {
			alert("The Posted Date must be entered in the form MM/DD/YYYY");
		} else {
			form.submit();
		}
	}

	function goNext(action, buttonname){
		var form = document.newForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue");
		}
		else if(form.Type.value=="Ministry Account Transfer" && form.BusinessUnit.value == ""){
			alert("Ministry Transfers require a Business Unit");
			form.BusinessUnit.focus();
		}
		else if(form.Type.value=="Ministry Account Transfer" && form.OperatingUnit.value == ""){
			alert("Ministry Transfers require a Operating Unit");
			form.OperatingUnit.focus();
		}
		else if(form.Type.value=="Ministry Account Transfer" && form.Dept.value == ""){
			alert("Ministry Transfers require a Department");
			form.Dept.focus();
		}
		else if(form.Type.value=="Ministry Account Transfer" && form.Project.value == ""){
			alert("Ministry Transfers require a Project");
			form.Project.focus();
		}
<%/*		else if (form.Type.value=="Ministry Account Transfer" || form.Type.value=="Staff Account Transfer" || form.Type.value.substring(0,7)=="Scholar"){
			if ((form.AccountNo.value.length<9)
				|| (!isInteger(form.AccountNo.value.substring(0,9)))
				|| (((form.AccountNo.value.length==10) && ((isInteger(form.AccountNo.value)))
					||(!((form.AccountNo.value.charAt(9)=="s")||(form.AccountNo.value.charAt(9)=="S"))))))	{
				alert("Please be sure to enter your staff account number as a 9-digit number.\nYou may need to add zeroes at the beginning of the number.\nWives, if you are adding an \"S\" be sure to put it at the end, AFTER the 9 digits.");
				form.AccountNo.focus();
			}
			else {
				if(submitOnce(buttonname)) {
					form.action.value = action;
					form.submit();
				}
			}
		}
*/%>	
		else {
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}
//-->
</SCRIPT>
<%@ include file="/crs/e_header.jspf"%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Account Summary</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="25%">Name</TD>
				<TD CLASS="cell"><%=registration.getPerson().getFirstName()%> <%=registration.getPerson().getLastName()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Total Credits</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal((Float)AccountSummary.get("Credits"))%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Total Debits</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal((Float)AccountSummary.get("Debits"))%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Balance Due</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal((Float)AccountSummary.get("BalanceDue"))%></TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="CENTER"
					COLSPAN="2"><A
					HREF="/servlet/CRSAdmin?action=showRegistration&registrationID=<%=registration.getRegistrationID()%>"
					CLASS="button">Return to <%=registration.getPerson().getFirstName()%>
				<%=registration.getPerson().getLastName()%>'s Registration Details</A></TD>
			</TR>
		</TABLE>
		<%
Iterator paymentsIter = payments.iterator();
if ("admin".equals(session.getValue("authLevel")) || "uber".equals(session.getValue("authLevel"))) {
%> <%
	for(int i = 0; paymentsIter.hasNext(); i++){
		Payment payment = (Payment)paymentsIter.next();
		String paymentType = payment.getType();
		int colCount = 6;
		if (paymentType.indexOf("Credit card payment") != -1)
				colCount++;
		else if (payment.getType().startsWith("Scholarship"))
				colCount += 5;
%>
		<P>
		<TABLE
			WIDTH="100%"
			CELLPADDING="2"
			CELLSPACING="0"
			CLASS="box">
			<FORM
				name='theForm<%=i%>'
				action='/servlet/CRSAdmin'
				method=post><INPUT
				TYPE="HIDDEN"
				name='action'
				value='savePaymentDetails'> <INPUT
				TYPE="HIDDEN"
				name="registrationID"
				value="<%=registration.getRegistrationID()%>"> <INPUT
				TYPE="HIDDEN"
				name="PaymentID"
				value="<%=payment.getPaymentID()%>">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="<%=colCount%>">#<%=payment.getPaymentID()%> - <%=payment.getType()%>
					<%
					if ("Ministry Account Transfer".equals(payment.getType())){		%>
					<%=payment.getBusinessUnit()%>/<%=payment.getOperatingUnit()%>/<%=payment.getDept()%>
					/<%=payment.getProject()%>	
					<%} else if ("Staff Account Transfer".equals(payment.getType())){	%>
					, Account #<%=payment.getAccountNo()%>
					<%} else if (payment.getType().startsWith("Scholarship")){	%>
					, From Account #<%=payment.getAccountNo()%>
					<%}%>
					</TD>
			</TR>
			<TR>
				<TD CLASS="hl">Transaction Date</TD>
				<TD CLASS="hl">Credit/Payment</TD>
				<TD CLASS="hl">Debit/Charge</TD>
				<%
			if (paymentType.indexOf("Credit card payment") != -1) { 
%>
				<TD CLASS="hl">Auth Code</TD>
				<% 
			} else if (payment.getType().startsWith("Scholarship")) { 
%>
				<TD CLASS="hl">Staff Account #</TD>
				<TD CLASS="hl">Business Unit</TD>
				<TD CLASS="hl">Oper. Unit</TD>
				<TD CLASS="hl">Dept</TD>
				<TD CLASS="hl">Project</TD>
				<% 
			} 
%>
				<TD CLASS="hl">Comment</TD>
				<TD CLASS="hl">Posted?</TD>
				<TD CLASS="hl">Date Posted</TD>
			</TR>
			<TR>
				<TD><%=formatter.formatDate(payment.getPaymentDate())%></TD>
				<%
			if((paymentType.indexOf("Conference cost") != -1) ||
				(paymentType.indexOf("Discount") != -1) ||
				(paymentType.indexOf("Credit card payment") != -1) ||
				(paymentType.indexOf("ECheck payment") != -1)) { //if it contains the words "Conference cost" or "Discount", don't let them edit the amount charged 
%>
				<TD>$<%=formatter.formatDecimal(payment.getCredit())%></TD>
				<INPUT
					TYPE="HIDDEN"
					name="Credit"
					value="<%=formatter.formatDecimal(payment.getCredit())%>">
				<TD>$<%=formatter.formatDecimal(payment.getDebit())%></TD>
				<INPUT
					TYPE="HIDDEN"
					name="Debit"
					value="<%=formatter.formatDecimal(payment.getDebit())%>">
				<% 
			} else { 
%>
				<TD>$<INPUT CLASS="empty" size=5 maxlength=10 name="Credit" value="<%=formatter.formatDecimal(payment.getCredit())%>"></TD>
				<TD>$<INPUT CLASS="empty" size=5 maxlength=10 name="Debit" value="<%=formatter.formatDecimal(payment.getDebit())%>"></TD>
				<% 
			} 
			if(paymentType.indexOf("Credit card payment") != -1) { 
%>
				<TD><%=payment.getAuthCode()%></TD>
				<% 
			} else if (payment.getType().startsWith("Scholarship")) { 
%>
				<TD><INPUT
					CLASS="empty"
					size=5
					maxlength=20
					name="AccountNo"
					value="<%=payment.getAccountNo()%>"></TD>
				<TD><INPUT
					CLASS="empty"
					size=5
					maxlength=20
					name="BusinessUnit"
					value="<%=payment.getBusinessUnit()%>"></TD>
				<TD><INPUT
					CLASS="empty"
					size=5
					maxlength=20
					name="OperatingUnit"
					value="<%=payment.getOperatingUnit()%>"></TD>
				<TD><INPUT
					CLASS="empty"
					size=5
					maxlength=20
					name="Dept"
					value="<%=payment.getDept()%>"></TD>
				<TD><INPUT
					CLASS="empty"
					size=5
					maxlength=20
					name="Project"
					value="<%=payment.getProject()%>"></TD>
				<INPUT
					TYPE="hidden"
					NAME="Posted"
					VALUE="T">
				<INPUT
					TYPE="hidden"
					NAME="PostedDate"
					VALUE="<%=formatter.formatDate(new Date())%>">
				<% 
			} 
%>
				<TD><INPUT
					CLASS="empty"
					NAME="Comment"
					MAXLENGTH="100"
					size=10
					value="<%=payment.getComment()%>"></TD>
				<TD><%=payment.getPosted()%></TD>
				<TD><%=formatter.formatDate(payment.getPostedDate())%></TD>
			</TR>
			<TR>
				<TD
					COLSPAN="<%=colCount%>"
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: document.theForm<%=i%>.submit()"
					CLASS="button">Save</A> <A
					HREF="/servlet/CRSAdmin?action=deletePayment&paymentDelete=<%=payment.getPaymentID()%>&registrationID=<%=registration.getRegistrationID()%>"
					CLASS="button"
					onmouseover="return overlib('<B>WARNING!</B> You are about to delete this payment record. This action cannot be undone. Do not delete credit card records that correspond to actual AuthNet transactions. If you issue a refund, then simply add a credit card record with a negative amount corresponding to the refund.', LEFT);"
					onmouseout="return nd();">Delete</A></TD>
			</TR>
		</TABLE>
		</FORM>
		<%
	}
} else {
	while (paymentsIter.hasNext()) {
		Payment payment = (Payment)paymentsIter.next();
		String paymentType = (String)payment.getType();
		if (paymentType.startsWith("Scholarship")) {
%>
		<form
			name='theForm<%=payment.getPaymentID()%>'
			action='/servlet/CRSAdmin'
			method=post
			onsubmit="return formVerify()"><INPUT
			TYPE="HIDDEN"
			name='action'
			value='savePaymentDetails'> <INPUT
			TYPE="HIDDEN"
			name="PaymentID"
			value="<%=payment.getPaymentID()%>"> <INPUT
			TYPE="HIDDEN"
			name="registrationID"
			value="<%=registration.getRegistrationID()%>">
		<P>
		<TABLE
			WIDTH="100%"
			CELLPADDING="2"
			CELLSPACING="0"
			CLASS="box">
			<TR>
				<TD
					COLSPAN="2"
					CLASS="subboxheader">#<%=payment.getPaymentID()%> - <%=payment.getType()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="25%">ID</TD>
				<TD><%=payment.getPaymentID()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Transaction Date</TD>
				<TD><%=formatter.formatDate(payment.getPaymentDate())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Scholarship Amount</TD>
				<TD CLASS="cell">$<INPUT type=text size=5 maxlength=10 name="Credit"
				value="<%=formatter.formatDecimal(payment.getCredit())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Payment Type</TD>
				<TD CLASS="cell"><%=payment.getType()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Staff Account Number</TD>
				<TD CLASS="cell"><INPUT
					type=text
					size=10
					maxlength=20
					name="AccountNo"
					value="<%=payment.getAccountNo()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Business Unit</TD>
				<TD CLASS="cell"><INPUT
					type=text
					size=10
					maxlength=20
					name="BusinessUnit"
					value="<%=payment.getBusinessUnit()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Oper. Unit</TD>
				<TD CLASS="cell"><INPUT
					type=text
					size=10
					maxlength=20
					name="OperatingUnit"
					value="<%=payment.getOperatingUnit()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Department</TD>
				<TD CLASS="cell"><INPUT
					type=text
					size=10
					maxlength=20
					name="Dept"
					value="<%=payment.getDept()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Project</TD>
				<TD CLASS="cell"><INPUT
					type=text
					size=10
					maxlength=20
					name="Project"
					value="<%=payment.getProject()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Posted</TD>
				<TD CLASS="cell"><%
					selBool.setCurrentValue(payment.getPosted());
					selBool.setName("Posted");
%> <%=selBool.printRadioBoolean()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Posted Date</TD>
				<TD CLASS="cell"><INPUT
					type=text
					size=10
					maxlength=20
					name="PostedDate"
					value="<%=formatter.formatDate(payment.getPostedDate())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Comment</TD>
				<TD CLASS="cell"><INPUT
					TYPE=TEXT
					NAME="Comment"
					MAXLENGTH="100"
					size=30
					value="<%=payment.getComment()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					COLSPAN="2"
					ALIGN="CENTER"><A
					HREF="javascript: savePayment(document.theForm<%=payment.getPaymentID()%>)"
					CLASS="button">Save</A></TD>
			</TR>
		</TABLE>
		</FORM>
		<%
		} else {
%>
		<P>
		<TABLE
			WIDTH="100%"
			CELLPADDING="2"
			CELLSPACING="0"
			CLASS="box">
			<TR>
				<TD
					COLSPAN="2"
					CLASS="subboxheader">#<%=payment.getPaymentID()%> - <%=payment.getType()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="25%">ID</TD>
				<TD CLASS="cell"><%=payment.getPaymentID()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Transaction Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(payment.getPaymentDate())%></TD>
			</TR>
			<%
			if(payment.getCredit() != 0) { 
%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Credit/Payment</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal(payment.getCredit())%></TD>
			</TR>
			<% 
			}
			if(payment.getDebit() != 0) { 
%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Debit/Charge</TD>
				<TD CLASS="cell">$<%=formatter.formatDecimal(payment.getDebit())%></TD>
			</TR>
			<% 
			} 
%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Type</TD>
				<TD><%=payment.getType()%></TD>
			</TR>
			<% 
			if((paymentType.indexOf("Credit card payment") != -1) || (paymentType.indexOf("ECheck payment") != -1)) { 
%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Auth Code</TD>
				<TD CLASS="cell"><%=payment.getAuthCode()%></TD>
			</TR>
			<% 
			} 
%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Comment</TD>
				<TD CLASS="cell"><%=payment.getComment()%></TD>
			</TR>
		</TABLE>
		<%
		}
	}
} 
%>
		<FORM
			name='newForm'
			action='/servlet/CRSAdmin'
			method=post><INPUT
			TYPE="HIDDEN"
			name='action'
			value='savePaymentDetails'> <INPUT
			TYPE="HIDDEN"
			name='PaymentID'
			value='0'> <INPUT
			TYPE="HIDDEN"
			name='PaymentDate'
			value='<%=formatter.formatDate(new Date())%>'> <INPUT
			TYPE="HIDDEN"
			name='PostedDate'
			value='<%=formatter.formatDate(new Date())%>'> <INPUT
			TYPE="HIDDEN"
			name='Posted'
			value='T'> <INPUT
			TYPE="HIDDEN"
			name="registrationID"
			value="<%=registration.getRegistrationID()%>">
		<P>
		<TABLE
			WIDTH="100%"
			CELLPADDING="2"
			CELLSPACING="0"
			CLASS="box">
			<TR>
				<TD
					COLSPAN="9"
					CLASS="subboxheader">Add New Payment</TD>
			</TR>
			<TR>
				<TD CLASS="hl">Credit/Payment</TD>
				<TD CLASS="hl">Debit/Charge</TD>
				<TD CLASS="hl">Payment Type</TD>
				<TD CLASS="hl">Staff Account #</TD>
				<TD CLASS="hl">Business Unit</TD>
				<TD CLASS="hl">Oper. Unit</TD>
				<TD CLASS="hl">Dept</TD>
				<TD CLASS="hl">Project</TD>
				<TD CLASS="hl">Comment</TD>
			</TR>
			<TR>
				<TD>$<INPUT CLASS="empty" size=5 maxlength=10 name="Credit"></TD>
				<TD>$<INPUT CLASS="empty" size=5 maxlength=10 name="Debit"></TD>
				<TD><SELECT
					SIZE="1"
					NAME="Type">
					<% if (regType.getAcceptScholarships()){%>
					<option	value="Scholarship - Campus Accnt">Scholarship - Campus Accnt</option>
					<option value="Scholarship - Staff Accnt.">Scholarship - Staff Accnt.</option>
					<%}%>
					<% if (regType.getAcceptStaffAcctTransfer()){%>
					<option value="Staff Account Transfer">Staff Account Transfer</option>
					<%}%>
					<% if (regType.getAcceptMinistryAcctTransfer	()){%>
					<option value="Ministry Account Transfer">Ministry Account Transfer</option>
					<%}%>
					<% if (regType.getAcceptCreditCards()){%>
					<option value="Credit card payment">Credit card payment</option>
					<%}%>
					<% if (regType.getAcceptChecks()){%>
					<option value="Check">Check</option>
					<%}%>					
					<option value="Cash">Cash</option>
					<option value="Onsite Conference Cost">Onsite Conference Cost</option>
					<option value="Commuter Conference Cost">Commuter Conference Cost</option>
					<option value="Early Registration Discount">Early Registration Discount</option>
					<option value="Custom">Custom (use comments section)</option>
				</SELECT></TD>
				<TD><INPUT CLASS="empty" size=10 maxlength=10 name="AccountNo"></TD>
				<TD><INPUT CLASS="empty" size=6 maxlength=20 name="BusinessUnit"></TD>
				<TD><INPUT CLASS="empty" size=6 maxlength=20 name="OperatingUnit"></TD>
				<TD><INPUT CLASS="empty" size=6 maxlength=20 name="Dept"></TD>
				<TD><INPUT CLASS="empty" size=6 maxlength=20 name="Project"></TD>
				<TD><INPUT CLASS="empty" size=10 maxlength="100" name="Comment"></TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><INPUT
					TYPE="CHECKBOX"
					VALUE="yes"
					NAME="preRegDisc"><%=fontS%>award pre-reg discount</font></TD>
				<TD
					CLASS="button"
					COLSPAN="8"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('savePaymentDetails', 'save')"
<%/*					HREF="javascript: document.newForm.submit()"*/%>
					NAME="save"
					CLASS="button">Save New Payment</A></TD>
			</TR>
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
				<TD CLASS="cell">Each time a person registers for a conference,
				their account is immediately debited (charged) for the amount of the
				conference cost, as well as any additional merchandise they may have
				signed up for. These are the first transactions you will see on the
				person's account. Transactions are listed in order by date. Each
				charge is listed as a separate transaction, and each payment is
				listed as a separate transaction.
				<P>Please note that there are two ways that scholarships can be
				added to a registrant's payment record. The first way is when the
				person indicates during the registration process that they are
				receiving a scholarship. In this case, you will already see a
				payment transaction above which will list the date and amount of the
				scholarship, as well as the name and phone number of the staff
				member that you can contact to verify that this person is eligible
				for a scholarship. All you need to do is confirm this scholarship
				transaction by entering the account information for the account that
				will be charged for the scholarship. If it is a staff person's
				account, enter their staff account number in the "Staff Account #"
				field. If it is a ministry account, enter the Business Unit,
				Operating Unit, Department and Project designations in the
				appropriately labeled fields. Click the "save" button.
				<P>The second way that scholarships are added occurs when a person
				did NOT indicate that they were receiving a scholarship, but you
				want to add one for them anyway. In this case, you can fill out the
				"Add New Payment" record at the bottom of the page above. Enter the
				amount of the scholarship in the "Credit/Payment" field, and
				"Scholarship" in the "Type" field. Indicate the information for the
				account that should be charged for the scholarship, as described
				above. Click the "Save New Payment" button.
				<P>To add a check payment, enter the amount of the check in the
				"Credit/Payment" field. In the "Type" field, enter "Check." You may
				add a comment to the "Comment" field if desired, and then click
				"Save New Payment."
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
