<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*" %>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState" scope="request"/>
<jsp:useBean id="selMonth" class="org.alt60m.html.SelectMonth" scope="request"/>
<%
	try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSRegister");
	}
	Registration registration = (Registration)ar.getObject("registration");
	RegistrationType regType = registration.getRegistrationType();
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
	function goNext(action){
		var form = document.theForm;

		if(!requiredFilled(form)){
			alert("You must fill out all of the required fields to continue.");
		} else if(!validEmail(form.Email.value)){
			alert("You must enter a valid email address");
			form.Email.focus();
		} else if(!validZip(form.Zip.value)){
			alert("Please enter a 5 or 9 digit zip code");
			form.Zip.focus();
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
	<TD VALIGN="TOP" COLSPAN="2">
	<form method=post action="/servlet/CRSRegister" name="theForm">
	<input type=hidden name='action' value='confirmPayment'>
	<input type=hidden name='PaymentMethod' value='Scholarship'>
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Check Payment for <%=conference.getName()%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">Name</TD>
			<TD CLASS="cell"><%=person.getFirstName()%> <%=person.getMiddleInitial()%> <%=person.getLastName()%></TD>
		</TR>
		<%
		if(regType.decodeProfile(6) >= 1){
		%>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">College</TD>
			<TD CLASS="cell"><%=person.getCampus()%></TD>
		</TR>
		<%
		}
		%>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">Email</TD>
			<TD CLASS="cell"><%=person.getEmail()%></TD>
		</TR>
		<%
		if(regType.decodeProfile(2) >= 1){
		%>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%" VALIGN="TOP">Address</TD>
			<TD CLASS="cell">
				<%=person.getAddress1()%><br>
<%
				if (!((String)person.getAddress2()).equals("")){
%>
					<%=person.getAddress2()%><br>
<%
				}
%>
				<%=person.getCity()%>, <%=person.getState()%> <%=person.getZip()%>
			</TD>
		</TR>
		<% 
		}
		%>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Conference Details</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">Registration ID</TD>
			<TD CLASS="cell"><%=registration.getRegistrationID()%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">Registered On</TD>
			<TD CLASS="cell"><%=formatter.formatDate(registration.getRegistrationDate())%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">Pre-Registered</TD>
			<TD CLASS="cell"><%=registration.getPreRegistered() ? "Yes" : "Please pay your pre-registration deposit."%></TD>
		</TR>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Payment Details</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2"><UL>
<%
		Hashtable discountsAvailable = ar.getHashtable("DiscountsAvailable");
		Hashtable accountSummary = ar.getHashtable("AccountSummary");

		float preRegDiscount = 0;
		float fullPaymentDiscount = 0;
		int i = 0;
		float balanceDue = ((Float)accountSummary.get("BalanceDue")).floatValue();

		boolean preRegDiscountAvail = ((Boolean)discountsAvailable.get("preReg")).booleanValue();
		boolean fullPayDiscountAvail = ((Boolean)discountsAvailable.get("fullPay")).booleanValue();
		if(preRegDiscountAvail) {
			preRegDiscount = conference.getDiscountEarlyReg();
%>
				<LI>A <B>Early Registration Discount</B> of $<%=formatter.formatDecimal(((Float)discountsAvailable.get("preReg_DiscountAmount")).doubleValue())%> will be applied if payments totaling  $<%=formatter.formatDecimal(((Float)discountsAvailable.get("preReg_Deposit")).doubleValue())%> are received or postmarked by midnight EST/EDT <%=formatter.formatDate((Date)discountsAvailable.get("preReg_Date"))%>
<%
		}
	
		if(fullPayDiscountAvail) {
			fullPaymentDiscount = conference.getDiscountFullPayment();
%>
			<LI> A <B>Full Payment Discount</B> of $<%=formatter.formatDecimal(((Float)discountsAvailable.get("fullPay_DiscountAmount")).doubleValue())%> will be applied if payments totaling $<%=formatter.formatDecimal(balanceDue - ((Float)discountsAvailable.get("fullPay_DiscountAmount")).doubleValue())%> are received or postmarked by midnight EST/EDT <%=formatter.formatDate((Date)discountsAvailable.get("fullPay_Date"))%>
<%
		}

		if(preRegDiscountAvail && fullPayDiscountAvail) {
%>
			<LI> <B>Both Discounts</B> will be applied if payments totaling $<%=formatter.formatDecimal(balanceDue - ((Float)discountsAvailable.get("fullPay_DiscountAmount")).doubleValue() - ((Float)discountsAvailable.get("preReg_DiscountAmount")).doubleValue())%> are received or postmarked by midnight EST/EDT <%=formatter.formatDate((Date)discountsAvailable.get("preReg_Date"))%>
<%
		}

		if(!preRegDiscountAvail && !fullPayDiscountAvail) {
%>
			<LI>There are currently no discounts available for this conference.
<%
		}
%>
			</UL></TD>
		</TR>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Instructions</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">
			<UL>
			<LI>Print this page.
			<LI>Make your check payable to <B><%=conference.getCheckPayableTo()%></B> and write your registration <B>#<%=registration.getRegistrationID()%></B> in the memo.
			<LI>Mail this page and your check to:
			<BLOCKQUOTE>
			<b><%=conference.getCheckPayableTo()%></b><br />
			Attn: <%=conference.getName()%><br />
			<%=conference.getContactAddress1()%><br />
<% 
			if ((conference.getContactAddress2()!=null)&&(!(conference.getContactAddress2()).equals(""))){
%>
				<%=conference.getContactAddress2()%><br>
<%
			}
%>
			<%=conference.getContactCity()%>, <%=conference.getContactState()%> <%=conference.getContactZip()%>
			</BLOCKQUOTE>
			</UL>
			</TD>
		</TR>
		<TR>
			<TD CLASS="button" ALIGN="LEFT"><A HREF="javascript: history.go(-1)" CLASS="button">Change Payment Type</A></TD>
			<TD CLASS="button" ALIGN="RIGHT"><A HREF="/servlet/CRSRegister?action=reviewRegistration" CLASS="button">View Registration Summary</A></TD>
		</TR>
	</TABLE>
	</form>
</TD>
	<TD VALIGN="TOP" WIDTH="150">
	<%=registrationMenu.display(registration.getSpouseComing() == 2 ? 7 : 4)%>
	<p>
	<%=otherOptionsMenu.display(0)%>
	<P>
		<%=accountManagementMenu.display(0)%>
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
