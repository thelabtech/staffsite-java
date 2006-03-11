<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*" %>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState" scope="request"/>
<jsp:useBean id="selMonth" class="org.alt60m.html.SelectMonth" scope="request"/>
<%
try {
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSRegister");
	}
	Registration registration = (Registration)ar.getObject("registration");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	Conference conference = (Conference)ar.getObject("conference");
	Payment payment = (Payment)ar.getObject("payment");
	Hashtable paymentInfoHash = ar.getHashtable("paymentInfo");
    String pageTitle = "Confirm Online Payment";
%>
<%@ include file="/crs/e_user_header.jspf" %>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
	<%=registrationMenu.display(registration.getSpouseComing() == 2 ? 7 : 4)%>
	<p>
	<%=otherOptionsMenu.display(0)%>
	</TD>
	<TD VALIGN="TOP">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Receipt</TD>
		</TR>
<%
	if(!("Scholarship".equals(payment.getType())
			|| "Ministry Account Transfer".equals(payment.getType())
			|| "Staff Account Transfer".equals(payment.getType()))){
%>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">Name</TD>
			<TD CLASS="cell"><%=paymentInfoHash.get("FirstName")%> <%=paymentInfoHash.get("LastName")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address</TD>
			<TD CLASS="cell">
			<%=paymentInfoHash.get("Address1")%><BR>
<%
			if(!"".equals(paymentInfoHash.get("Address2"))){
%>
				<%=paymentInfoHash.get("Address1")%><BR>
<%
			}
%>
			<%=paymentInfoHash.get("City")%>, <%=paymentInfoHash.get("State")%> <%=paymentInfoHash.get("Zip")%> <BR>
			<%=paymentInfoHash.get("HomePhone")%> <BR>
			<%=paymentInfoHash.get("Email")%>
			</TD>
		</TR>
<%
	}	
%>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Payment Type</TD>
			<TD CLASS="cell"><%=payment.getType()%>
			<%
					if ("Ministry Account Transfer".equals(payment.getType())){		%>
						<%=payment.getBusinessUnit()%>/<%=payment.getOperatingUnit()%>/<%=payment.getDept()%>/<%=payment.getProject()%>	
					<%} else if ("Staff Account Transfer".equals(payment.getType())){	
						out.write(", Account #");%>
						<%=payment.getAccountNo()%>
					<%}%>
			<BR><%=payment.getComment()%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Payment Amount</TD>
			<TD CLASS="cell">$<%=paymentInfoHash.get("PaymentAmt")%></TD>
		</TR>
<%
		if (paymentInfoHash.get("CCNum") != null) { 
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">To credit card</TD>
				<TD CLASS="cell"><%=paymentInfoHash.get("CCNum")%></TD>
			</TR>
<% 
		} 
%>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Payment ID</TD>
			<TD CLASS="cell"><%=payment.getPaymentID()%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Payment Date</TD>
			<TD CLASS="cell"><%=formatter.formatDate(payment.getPaymentDate())%></TD>
		</TR>
		<TR>
			<TD COLSPAN="2" CLASS="button" ALIGN="CENTER">
				<I>(Print this receipt for your records)</I>
				<BR><BR>
				<A HREF="/servlet/CRSRegister?action=reviewRegistration" CLASS="button">Review Registration Details</A>
			</TD>
		</TR>
	</TABLE>
	</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
<% } catch (Exception e) {e.printStackTrace();} %>
