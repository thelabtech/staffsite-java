<%@ include file="header.jspf" %>
<%@ page import="org.alt60m.hr.si.servlet.dbio.*" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postCCardPayment";
-->
</script>

<input type="hidden" name="Fk_ApplicationID" value="<%=a.getApplicationID()%>"/>
<input type="hidden" name="PaymentType" value="CCard">
<input type="hidden" name="PaymentAmt" value="<%=SIApplication.calcApplicationFee()%>">

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
					<TD CLASS="app" COLSPAN="2">
						<STRONG>Credit/Debit Card Payment</STRONG>
						<P>
						Please fill out your payment information below.  NOTE: We will attempt to bill your credit card immediately when you press the 'SUBMIT' button below.
					</TD>
				</TR>
				<TR>
					<TD CLASS="app" COLSPAN="2"><STRONG>Billing Address</STRONG></TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%"VALIGN="TOP">First Name</TD>
					<TD CLASS="app"><INPUT type="text" name="FirstName" size="30" CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" value="<%=util.getRequestValue(request, "FirstName")%>"></TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%"VALIGN="TOP">Last Name</TD>
					<TD CLASS="app"><INPUT type="text" name="LastName" size="30" CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" value="<%=util.getRequestValue(request, "LastName")%>"></TD>
				</TR>

				<TR>
					<TD CLASS="app" ALIGN="RIGHT">Address 1</TD>
					<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Address1" size=30 value="<%=util.getRequestValue(request, "Address1")%>"></TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
					<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Address2" size=30 value="<%=util.getRequestValue(request, "Address2")%>"></TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT">City</TD>
					<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="City" size=20 value="<%=util.getRequestValue(request, "City")%>"></TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT">State</TD>
					<TD CLASS="app"><%selState.setName("State");%><%selState.setRequired("required");selState.setCurrentValue(util.getRequestValue(request, "State"));%><%=selState.print()%> Zip <INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Zip" size=10  value="<%=util.getRequestValue(request, "Zip")%>"></TD>
				</TR>
				<TR>
					<TD CLASS="app" COLSPAN="2"><STRONG>Card Information</STRONG></TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%"VALIGN="TOP">Credit Card Type</TD>
					<TD CLASS="app">

					<SELECT CLASS="required" name="CCardType" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
						<OPTION></OPTION>
						<OPTION <%if( "Visa".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected=\"selected\"");%>>Visa</OPTION>
						<OPTION <%if( "Mastercard".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected=\"selected\"");%>>Mastercard</OPTION>
						<OPTION <%if( "Diners Club".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected=\"selected\"");%>>Diners Club</OPTION>
						<OPTION <%if( "Discover".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected=\"selected\"");%>>Discover</OPTION>
						<OPTION <%if( "American Express".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected=\"selected\"");%>>American Express</OPTION>
					</SELECT>
					</TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%"VALIGN="TOP">Credit Card #</TD>
					<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CCNum" size="16" MAXLENGTH="16" value="<%=util.getRequestValue(request, "CCNum")%>"></TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%"VALIGN="TOP">Expiration Date</TD>
					<TD CLASS="app">
					<SELECT CLASS="required" name="CCExpM" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
						<OPTION></OPTION>
						<OPTION <%if( "01".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>01</OPTION>
						<OPTION <%if( "02".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>02</OPTION>
						<OPTION <%if( "03".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>03</OPTION>
						<OPTION <%if( "04".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>04</OPTION>
						<OPTION <%if( "05".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>05</OPTION>
						<OPTION <%if( "06".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>06</OPTION>
						<OPTION <%if( "07".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>07</OPTION>
						<OPTION <%if( "08".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>08</OPTION>
						<OPTION <%if( "09".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>09</OPTION>
						<OPTION <%if( "10".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>10</OPTION>
						<OPTION <%if( "11".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>11</OPTION>
						<OPTION <%if( "12".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected=\"selected\"");%>>12</OPTION>
					</SELECT>
					<SELECT CLASS="required" name="CCExpY" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
						<OPTION></OPTION>
						<%
							for( int i = 2002; i <= SIUtil.CURRENT_SI_YEAR_INT + 6; i++ ) {
						%>
								<OPTION <%if( new Integer(i).toString().equals(util.getRequestValue(request, "CCExpY"))) out.println(" selected=\"selected\"");%>><%=i%></OPTION>
						<%
							}
						%>
					</SELECT>
					</TD>
				</TR>

				<TR>
					<TD CLASS="app" COLSPAN="2">
						<P>
						
						<P>
						<TABLE WIDTH="100%" CELLSPACING="0">
							<TR>
								<TD ALIGN="CENTER" VALIGN="TOP" CLASS="app" width='50%'>
									<A CLASS="button" HREF="JavaScript: doPostForm('payment3')">Submit</A>
									<P><B>IMPORTANT:</B> Processing may take a minute or two.  Do NOT click 'SUBMIT' more than once to avoid multiple charges to your credit card.
								</TD>
								<TD ALIGN="CENTER" VALIGN="TOP" CLASS="app" width='50%'>
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
