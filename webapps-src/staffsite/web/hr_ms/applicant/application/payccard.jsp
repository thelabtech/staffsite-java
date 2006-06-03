<%@ page import="org.alt60m.hr.ms.servlet.dbio.*" %>
<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<%
	ActionResults ar = new ActionResults();
	ar = ActionResults.getActionResults(session);
	String ErrorMessage = (String) ar.getValue("ErrorMessage");
	String idName = "PaymentID";  //* kb 10/1/02
	String className = "org.alt60m.hr.ms.model.dbio.MSPayment";  //* kb 10/1/02
%>
<input type="hidden" name="PaymentType" value="CCard">
<input type="hidden" name="PaymentAmt" value="<%=ar.getValue("AppFee")%>">
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<%if(ErrorMessage!=null) out.println("<FONT COLOR=\"RED\">" + ErrorMessage + "</FONT><P>");%>
			<STRONG>Payment Wizard</STRONG>
			<P>
			Application fee: $<%=ar.getValue("AppFee")%>
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
						<option value=""></OPTION>
						<option value="Visa"<%if( "Visa".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected");%>>Visa</OPTION>
						<option value="Mastercard"<%if( "Mastercard".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected");%>>Mastercard</OPTION>
						<option value="Diners Club"<%if( "Diners Club".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected");%>>Diners Club</OPTION>
						<option value="Discover"<%if( "Discover".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected");%>>Discover</OPTION>
						<option value="American Express"<%if( "American Express".equals(util.getRequestValue(request, "CCardType"))) out.println(" selected");%>>American Express</OPTION>
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
						<OPTION value=""></OPTION>
						<OPTION value="01"<%if( "01".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>01</OPTION>
						<OPTION value="02"<%if( "02".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>02</OPTION>
						<OPTION value="03"<%if( "03".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>03</OPTION>
						<OPTION value="04"<%if( "04".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>04</OPTION>
						<OPTION value="05"<%if( "05".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>05</OPTION>
						<OPTION value="06"<%if( "06".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>06</OPTION>
						<OPTION value="07"<%if( "07".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>07</OPTION>
						<OPTION value="08"<%if( "08".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>08</OPTION>
						<OPTION value="09"<%if( "09".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>09</OPTION>
						<OPTION value="10"<%if( "10".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>10</OPTION>
						<OPTION value="11"<%if( "11".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>11</OPTION>
						<OPTION value="12"<%if( "12".equals(util.getRequestValue(request, "CCExpM"))) out.println(" selected");%>>12</OPTION>
					</SELECT>
					<SELECT CLASS="required" name="CCExpY" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
						<OPTION value=""></OPTION>
						<%
							for(int i = 2002; i <= MSInfo.CURRENT_WSN_YEAR_INT + 6; i++) {
						%>
								<OPTION value="<%=i%>"<%if( new Integer(i).toString().equals(util.getRequestValue(request, "CCExpY"))) out.println(" selected");%>><%=i%></OPTION>
						<%
							}
						%>
					</SELECT>
					</TD>
				</TR>
				<TR>
					<TD CLASS="app" COLSPAN="2">
						<P>
						&nbsp;
						<P>
						<TABLE WIDTH="100%" CELLSPACING="0">
							<TR>
								<TD ALIGN="CENTER" VALIGN="TOP" CLASS="app" width='50%'>
									<A CLASS="button" HREF="JavaScript: doPostFormNextAction('actionProcessPayment', 'goToView', 'payment')" CLASS="button">Submit</A>
									<P><B>IMPORTANT:</B> Processing may take a minute or two.  Do NOT click 'SUBMIT' more than once to avoid multiple charges to your credit card.
								</TD>
								<TD ALIGN="CENTER" VALIGN="TOP" CLASS="app" width='50%'>
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
