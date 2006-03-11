<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<%
	String Name = personHash.get("LegalFirstName") + " " + (String)personHash.get("LegalLastName");
	ActionResults ar = ActionResults.getActionResults(session);
%>

<input type="hidden" name="PaymentType" value="Mail">
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<STRONG>Payment Wizard</STRONG>
			<P>
			Application fee: $<%=ar.getValue("AppFee")%>
			<P>
			<!-- Highlighted inner table representing the Payment Wizard -->
			<TABLE WIDTH="100%" CELLSPACING="0" BORDER="5" RULES="NONE">
				<TR>
					<TD class="app">
						<STRONG>Check or Money Order</STRONG>
						<P>
						Please note that your application <b>will not</b> be processed until your mailed payment is received. We suggest that you take a moment right now to write your check and put it in the mail.
						<P>
						1. Make your check or money order for <B>$<%=ar.getValue("AppFee")%></B> payable to "Campus Crusade for Christ".<BR>
						2. Write your <B>Full Name</B> as entered on this application (<B><%=Name%></B>) on a separate piece of paper and include it in the envelope with your check.
						<P>

						<TABLE WIDTH="100%" CELLSPACING="0">
							<TR>
								<TD ALIGN="RIGHT" CLASS="app" VALIGN="TOP">
									<B>Mail to:
								</TD>
								<TD ALIGN="LEFT" CLASS="app">
									<B>
									Campus Crusade for Christ<br>
									Dept 2500 - Summer Project Coordinator<br>
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
									<A CLASS="button" HREF="JavaScript: doPostFormNextAction('actionProcessPayment', 'goToView', 'payment')" CLASS="button">Click here if you have mailed your payment</A>
								</TD>
								<TD ALIGN="CENTER" CLASS="button">
									<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'payment')">Cancel Payment</A>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
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
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="javascript:history.go(-1)" CLASS="button">&lt;&lt;Back</A></TD>
				<!-- <TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD> -->
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum]%>')" CLASS="button">Next&gt;&gt;</A>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>
