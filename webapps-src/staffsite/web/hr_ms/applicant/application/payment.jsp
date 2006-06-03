<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);	

	String ErrorMessage = (String) ar.getValue("ErrorMessage");

	Hashtable existingpayments = ar.getHashtable("existingpayments");
	if (existingpayments==null) existingpayments = new Hashtable();
	
%>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<script language="javascript">
<!--
//set the action for this particular page.
//document.appForm.action.value="postChoosePayment"; //KL: 11-3-03 - Unnecessary code
-->
</script>

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<STRONG>Payment Wizard</STRONG>
			<P>
			Application fee: $<%=ar.getValue("AppFee")%>
			<P>
			<!-- Highlighted inner table representing the Payment Wizard -->
			<TABLE WIDTH="100%" CELLSPACING="0" BORDER="5" RULES="NONE">

				<!-- display the payments if they exist. -->
				<TR>
					<TD colspan="4">
<%
						if (existingpayments.size()>0) {
							if ( ((Boolean)personHash.get("IsPaid")).booleanValue()==true) {
%>
								<P><B>Your payment for your application has been received.  Your application can now be processed.  Thank you!</B>
								<P>
<%
							} else {
%>
								<B>Your indicated payment has not yet been processed.  Once payment is received, you will be notified via email.</B>
								<P>
								If you wish to change your payment type, you still can.  Just select a new payment type below.
								<BR><BR>
<%
							}
%>
							<table border=1>
								<TR><TH>Payment Type</TH><TH>Payment Date</TH><TH>Amount Paid</TH></TR>
<%
									for (Iterator i = existingpayments.keySet().iterator(); i.hasNext(); )
									{
									   String key = (String) i.next();
									   Hashtable h = (Hashtable) existingpayments.get(key);
								  
									   out.println("<TR><TD width=\"20%\">" + h.get("Type") + "</TD>");
									   out.println("<TD width=\"20%\">" + h.get("PaymentDate") + "</TD>");
									   out.println("<TD width=\"20%\">" + h.get("Credit") + "</TD>");
									   out.println("</TR>");
									}
%>
							</table>
							<BR><BR><HR>
<%
						}//end if any payments
%>
					</TD>
				</TR>	

<%
				if ( ((Boolean)personHash.get("IsPaid")).booleanValue()==false) {
				// start of choose payment area
%>
				<TR>
					<TD CLASS="app" COLSPAN="2">
						Please select one of the following three options for paying your application fee, and click "Make Payment."
					</TD>
				</TR>

				<TR>
					<TD CLASS="app">
						<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="RADIO" NAME="ChoosePayment" VALUE="CCard" CHECKED>Credit/Debit Card (Fastest--Processed Online)<BR>
						<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="RADIO" NAME="ChoosePayment" VALUE="Mail">Check or Money Order via Postal Mail<BR>
						<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="RADIO" NAME="ChoosePayment" VALUE="Staff">Transfer from a Staff/Project/Scholarship Fund<BR>
						<BR>
						&nbsp;
						<BR>
					</TD>
					<TD CLASS="app" ALIGN="CENTER" VALIGN="MIDDLE">
						<A CLASS="button" HREF="JavaScript: doPostFormNextAction('actionChoosePayment', 'goToView', 'payment2')" CLASS="button">Make Payment</A>
					</TD>
				</TR>
<%
				} // end of choose payment area
%>
			</TABLE>
			<!-- end of highlighted table -->
			<P>
			<HR>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum]%>')" CLASS="button">Next&gt;&gt;</A>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>
