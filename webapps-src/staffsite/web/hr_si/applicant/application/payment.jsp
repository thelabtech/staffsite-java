<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postChoosePayment";
-->
</script>

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<STRONG>Payment Wizard</STRONG>
			<P>
			Application fee: $<%=SIApplication.calcApplicationFee()%>
			<P>
			<!-- Highlighted inner table representing the Payment Wizard -->
			<TABLE WIDTH="100%" CELLSPACING="0" BORDER="5" RULES="NONE">

				<!-- display the payments if they exist. -->
				<TR>
					<TD colspan="4">
<%
						Hashtable existingpayments = a.getPayments();
						if (existingpayments.size()>0) {
							if (a.getIsPaid()) {
%>
								<P><B>Your payment for your application has been received.  Your application can now be processed.  Thank you!</B>
								<P>
<%
							} else {
%>
								Your indicated payment has not yet been processed.  Once payment is received, you will be notified via email.
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
										String credit = h.get("Credit").toString();
										String displayPending = h.get("PageDisplay").toString();
										out.println("<TR><TD width=\"20%\">" + h.get("Type") + "</TD>");
										out.println("<TD width=\"20%\">" + h.get("PaymentDate") + "</TD>");
										if(displayPending.equals("Pending")) {
											credit = displayPending;
										}
										if(h.get("Type").equals("Staff Intent")) {
											%>
											<input type="hidden" name="PayIntent" value="Staff Intent">
											<%
										}
										out.println("<TD width=\"20%\">" + credit + "</TD>");
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
				if (!a.getIsPaid()) {
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
						<A CLASS="button" HREF="JavaScript: doPostForm('payment2')">Make Payment</A>
					</TD>
				</TR>
<%
				} // end of choose payment area
%>
			</TABLE>
			<!-- end of highlighted table -->
		</TD>
	</TR>


	<TR>
		<TD COLSPAN="2">
		&nbsp;
		<HR>
		<P>
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="/hr_si/siMainFooter.jspf" %>
