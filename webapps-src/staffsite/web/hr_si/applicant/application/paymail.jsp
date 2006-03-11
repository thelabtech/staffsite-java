<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postMailPayment";
-->
</script>

<input type="hidden" name="PaymentType" value="Mail">

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<STRONG>Payment Wizard</STRONG>
			<P>
			Application fee: $<%=SIApplication.calcApplicationFee()%>
			<P>
			<!-- Highlighted inner table representing the Payment Wizard -->
			<TABLE WIDTH="100%" CELLSPACING="0" BORDER="5" RULES="NONE">
				<TR>
					<TD class="app">
						<STRONG>Check or Money Order</STRONG>
						<P>
						Please note that your application <b>will not</b> be processed until your mailed payment is received. We suggest that you take a moment right now to write your check and put it in the mail.
						<P>
						1. Make your check or money order for <B>$<%=SIApplication.calcApplicationFee()%></B> payable to "Campus Crusade for Christ".<BR>
						2. Write your <B>Full Name</B> as entered on this application (<B><%=p.getFirstName()+" "+p.getLastName()%></B>) on a separate piece of paper and include it in the envelope with your check.
						<P>

						<TABLE WIDTH="100%" CELLSPACING="0">
							<TR>
								<TD ALIGN="RIGHT" CLASS="app" VALIGN="TOP">
									<B>Mail to:
								</TD>
								<TD ALIGN="LEFT" CLASS="app">
									<B>
									Campus Crusade for Christ<br>
									Dept 2500 - STINT Coordinator<br>
									100 Lake Hart Drive<br>
									Orlando, FL 32832<br>
									</B>
								</TD>
							</TR>
						</TABLE>
						<P>
						<TABLE WIDTH="100%" CELLSPACING="0">
							<TR>
								<TD ALIGN="CENTER" CLASS="button">
									<A CLASS="button" HREF="JavaScript: doPostForm('paymentsoon')">Click here if you have mailed your payment</A>
								</TD>
								<TD ALIGN="CENTER" CLASS="button">
									<A CLASS="button" HREF="JavaScript: doPostForm('payment')">Cancel Payment</A>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
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
