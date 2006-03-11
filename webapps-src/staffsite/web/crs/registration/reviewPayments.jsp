<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Registration registration = (Registration)ar.getObject("registration");
	RegistrationType regType = registration.getRegistrationType();
	boolean isSpouse = false;
	Conference conference = (Conference)ar.getObject("conference");
	Hashtable discountsAvailable = ar.getHashtable("discountsAvailable");
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	String pageTitle = "Registration of " + registration.getPerson().getFirstName() 
			+ " " + registration.getPerson().getLastName();
	Hashtable gender = new Hashtable();
	gender.put("1", "Male");
	gender.put("0", "Female");
	gender.put("", "");
	Hashtable maritalStatus = new Hashtable();
	maritalStatus.put("S", "Single");
	maritalStatus.put("M", "Married");
	maritalStatus.put("D", "Divorced");
	maritalStatus.put("P", "Separated");
	maritalStatus.put("W", "Widowed");

	String view = ar.getValue("view");
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
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150" ROWSPAN="3">
		<%=registrationMenu.display(registration.getSpouseComing() == 2 ? 7 : 4)%>
		<p>
		<%=otherOptionsMenu.display(0)%>
		<P>
		<%=accountManagementMenu.display(0)%>
	</TD>
	<TD VALIGN="TOP" COLSPAN="2">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="3">Payment History</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="3">
					The total cost of your conference, including additional expenses and any applicable discounts, is displayed below. Choose a payment option from the pull down menu.
			</TD>
		</TR>
		<TR>
			<TD CLASS="subboxheader" WIDTH="15%">Transaction Date</TD>
			<TD CLASS="subboxheader">Type</TD>
			<TD CLASS="subboxheader" ALIGN="RIGHT" WIDTH="15%">Amount</TD>
		</TR>

<%
		float amount = 0;
		if(ar.getCollection("payments").size() > 0){	
			Iterator payments = ar.getCollection("payments").iterator(); 
			int i = 0;
			while(payments.hasNext()){ 
				Payment p = (Payment)payments.next();
				amount += p.getDebit() == 0 ? -p.getCredit() : p.getDebit();
%>
				<TR>
					<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"><%=formatter.formatDate(p.getPaymentDate())%></TD>
					<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"><%=p.getType()%>
					<%
					if ("Ministry Account Transfer".equals(p.getType())){		%>
					<%=p.getBusinessUnit()%>/<%=p.getOperatingUnit()%>/<%=p.getDept()%>/<%=p.getProject()%>	
					<%} else if ("Staff Account Transfer".equals(p.getType())){	%>
					, Account #<%=p.getAccountNo()%>
					<%} else if ((p.getType().startsWith("Scholarship"))
							&&(!(p.getAccountNo()==null))
							&&(!("".equals(p.getAccountNo())))){	%>
					, From Account #<%=p.getAccountNo()%>
					<%}%>
					</TD>
					<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM" ALIGN="RIGHT">$<%=formatter.formatDecimal(p.getDebit() == 0 ? -p.getCredit() : p.getDebit())%></TD>
				</TR>
<%
				i++;
			}
%>
			<TR>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" COLSPAN="2" ALIGN="RIGHT">Balance Due</TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" ALIGN="RIGHT">$<%=formatter.formatDecimal(amount)%></TD>
			</TR>
<%
		} else {
%>
			<TR>
				<TD CLASS="cell" ALIGN="CENTER" COLSPAN="3">There aren't any payments to display</TD>
			</TR>
<%
		}
%>
	</TABLE>
	</TD>
	</TR>

		<TR>
		<TD VALIGN="TOP" WIDTH="60%">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="subboxheader">Available Discounts</TD>
			</TR>						
<%
			float preRegDiscount = 0;
			float fullPaymentDiscount = 0;	
		
			int i = 0;
			boolean preRegDiscountAvail = ((Boolean)discountsAvailable.get("preReg")).booleanValue();
			boolean fullPayDiscountAvail = ((Boolean)discountsAvailable.get("fullPay")).booleanValue();
			if(preRegDiscountAvail) {
				//preRegDiscount = conference.getDiscountEarlyReg();
				preRegDiscount = ((Float)discountsAvailable.get("preReg_DiscountAmount")).floatValue();
				i++;
%>
				<TR>
					<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" >
					<UL><LI>A <B>Early Registration Discount</B> of 
							$<%=formatter.formatDecimal(preRegDiscount)%>
					will be applied if payments totaling 
							$<%=formatter.formatDecimal(((Float)discountsAvailable.get("preReg_Deposit")).floatValue())%>
					are received or postmarked by midnight EST/EDT 
							<%=formatter.formatDate((Date)discountsAvailable.get("preReg_Date"))%>
					</TD>
				</TR>
<%
			}
		
			if(fullPayDiscountAvail) {
				fullPaymentDiscount = ((Float)discountsAvailable.get("fullPay_DiscountAmount")).floatValue();
				i++;
%>
				<TR>
					<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" >
					<UL><LI> A <B>Full Payment Discount</B> of 
							$<%=formatter.formatDecimal(fullPaymentDiscount)%>
					will be applied if payments totaling 
							$<%=formatter.formatDecimal(amount - fullPaymentDiscount)%>
					are received or postmarked by midnight EST/EDT 
							<%=formatter.formatDate((Date)discountsAvailable.get("fullPay_Date"))%>
					</TD>
				</TR>
<%
			}

			if(preRegDiscountAvail && fullPayDiscountAvail) {
				i++;
				fullPaymentDiscount = ((Float)discountsAvailable.get("fullPay_DiscountAmount")).floatValue();
				preRegDiscount = ((Float)discountsAvailable.get("preReg_DiscountAmount")).floatValue();
%>
				<TR>
					<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" >
						<UL><LI> <B>Both Discounts</B> will be applied if payments totaling
						$<%=formatter.formatDecimal(amount - fullPaymentDiscount - preRegDiscount)%>
						are received or postmarked by midnight EST/EDT <%=formatter.formatDate((Date)discountsAvailable.get("preReg_Date"))%>
					</TD>
				</TR>
<%
			}

			if(!preRegDiscountAvail && !fullPayDiscountAvail) {
%>
				<TR>
					<TD CLASS="cell">There are currently no discounts available for this conference.</TD>
				</TR>
<%
			}
%>
		</TABLE>
		</TD>

	<TD VALIGN="TOP" WIDTH="40%">
	<FORM METHOD="POST" ACTION="/servlet/CRSRegister" NAME="payment">
	<INPUT TYPE=hidden NAME="action" VALUE="getPaymentInfo">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="subboxheader">Make a Payment</TD>
		</TR>
		<TR>
			<TD CLASS="cell">
<%
		if(amount > 0){
%>
			<INPUT TYPE="radio" value="<%=formatter.formatDecimal(amount - (fullPaymentDiscount + preRegDiscount))%>" NAME="PaymentAmount" checked>
						&nbsp; Pay in Full $<%=formatter.formatDecimal(amount - (fullPaymentDiscount + preRegDiscount))%><br>
<% 
			if((!(discountsAvailable.get("preReg_Deposit")==null))&&((Float)discountsAvailable.get("preReg_Deposit")).doubleValue() > 0 && !registration.getPreRegistered()) {
%>
			<INPUT TYPE="radio" value="<%=formatter.formatDecimal(((Float)discountsAvailable.get("preReg_Deposit")).doubleValue())%>" NAME="PaymentAmount">
					&nbsp; Pre-Registration deposit $<%=formatter.formatDecimal(((Float)discountsAvailable.get("preReg_Deposit")).doubleValue())%><br>
<% 			}
%>
			<INPUT TYPE="radio" VALUE="Other" NAME="PaymentAmount">
				&nbsp; Other: $<INPUT TYPE="text" NAME="PaymentAmountOther" SIZE="7" value="<%=formatter.formatDecimal(amount - fullPaymentDiscount - preRegDiscount)%>"><br>
			
			Payment Method <SELECT SIZE="1" NAME="PaymentMethod">
<% 
if (regType.getAcceptCreditCards() && (conference.getAcceptVisa() || conference.getAcceptMasterCard() || conference.getAcceptAmericanExpress() || conference.getAcceptDiscover())){%>
												<option value="Credit Card" selected>Credit Card</option>
<% }
if (regType.getAcceptScholarships()){%>			<option value="Scholarship">Scholarship</option>
<% }								
if (regType.getAcceptEChecks()){%>				<option value="Echeck">E-Check</option>
<% }
if (regType.getAcceptStaffAcctTransfer()){%>	<option value="staff_transfer">Staff Acct Transfer</option>
<% }
if (regType.getAcceptMinistryAcctTransfer()){%>	<option value="ministry_transfer">Ministry Acct Transfer</option>
<% }
if (regType.getAcceptChecks()){%>				<option value="Check">Mail a Check</option>
<%}%>
			</select>
<% 
			if (regType.getAcceptCreditCards() && (conference.getAcceptVisa() || conference.getAcceptMasterCard() || conference.getAcceptAmericanExpress() ||conference.getAcceptDiscover())){
%>
				<BR>
				We accept: <%=conference.getAcceptVisa() ? "<IMG SRC='/crs/images/smvisa.gif'>" : ""%>
				<%=conference.getAcceptMasterCard() ? "<IMG SRC='/crs/images/smmc.gif'>" : ""%>
				<%=conference.getAcceptAmericanExpress() ? "<IMG SRC='/crs/images/smamex.gif'>" : ""%>
				<%=conference.getAcceptDiscover() ? "<IMG SRC='/crs/images/smdiscvr.gif'>" : ""%>
<% 
			}
%>								
			</TD>
		</TR>
		<TR>
			<TD CLASS="button" ALIGN="CENTER"><A CLASS="button" HREF="javascript: document.payment.submit()">Make Payment</A></TD>
		</TR>
<% 
		} else if (!(regType.getAcceptCreditCards()
			||regType.getAcceptScholarships()
			||regType.getAcceptEChecks()
			||regType.getAcceptStaffAcctTransfer()
			||regType.getAcceptMinistryAcctTransfer()
			||regType.getAcceptChecks()
			)){
%>
			<TR>
				<TD CLASS="cell" ALIGN="CENTER">There are no payment options for this conference. <P ALIGN="CENTER"><A HREF="/servlet/CRSRegister?action=reviewRegistration" CLASS="button">Review Your Registration</A><BR><BR></TD>
			</TR>
<% 		}
		else {
%>
			<TR>
				<TD CLASS="cell" ALIGN="CENTER">You are paid in full<P ALIGN="CENTER"><A HREF="/servlet/CRSRegister?action=reviewRegistration" CLASS="button">Review Your Registration</A><BR><BR></TD>
			</TR>
<% 		}%>
	</TABLE>
	</FORM>
	</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
