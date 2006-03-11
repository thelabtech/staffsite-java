<%@ include file="header.jspf" %>
<%
	Hashtable staffInfo = ar.getHashtable("staffInfo");
%>

<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postFindStaffForPayment";
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
				<TR>
					<TD CLASS="app" COLSPAN="2">
						<STRONG>Transfer from a Staff/Project/Scholarship Fund</STRONG>
			<%
			if((request.getParameter("PayIntent") != null) && (request.getParameter("PayIntent").equals("Staff Intent"))) {
				// DO NOT show applicant search details
			%>
						<P>
						Please note there is a current <B>Staff Intent</B> payment type.  A funds transfer request is in progress.
						<P>
					</TD>
				</TR>
			<%
			}
			else {
				// DO show applicant search details
			%>
						<P>
						Please enter the First and Last name of the Campus Crusade for Christ staff member who will provide the funds for your application, then press "Search for Staff".  From the list of matching staff, select the correct person.  An email will then be sent to them with your payment request.
						<P>
						Please note that your application <B>can not be processed</B> until they initiate the funds transfer.  Once the staff member responds, an email will be sent to you.
						<P>
					</TD>
				</TR>
				<TR>
					<TD CLASS="app" ALIGN="RIGHT" VALIGN="TOP">
						Enter Staff Member's<BR>First & Last Name
					</TD>
					<TD CLASS="app">
						<INPUT type="text" name="firstname" size=10 CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"<%=ar.getValue("firstname")==null?"":" value='"+ar.getValue("firstname")+"'"%>>
						<INPUT type="text" name="lastname" size=20 CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"<%=ar.getValue("lastname")==null?"":" value='"+ar.getValue("lastname")+"'"%>>
					</TD>
				</TR>
				<TR>
					<TD CLASS="app" COLSPAN="2">
						<TABLE WIDTH="100%" CELLSPACING="0">
							<TR>
								<TD ALIGN="CENTER" CLASS="button">
									<A CLASS="button" HREF="JavaScript: doPostForm('payment3')">Search for Staff</A>
								</TD>
								<TD ALIGN="CENTER" CLASS="button">
									<A CLASS="button" HREF="JavaScript: doPostForm('payment')">Cancel Payment</A>
					</TD>
				</TR>
			<%
			}
			%>
			</TABLE>
<%
	if (staffInfo != null)
	{
		if (staffInfo.size()==0)
			out.print("<BR><B>There were no matching Staff people with the First and Last names you entered.  Please try again.</B>");
		else {
			out.print("<P><CENTER>Found " + staffInfo.size() + " staff.  Click on the correct name:<BR><TABLE BORDER='1' WIDTH='200'>");
			for (Iterator i = staffInfo.keySet().iterator(); i.hasNext(); )
			{
			   String key = (String) i.next();
			   String val = (String) staffInfo.get(key);
			   out.println("<TR><TD ALIGN='CENTER'><A HREF='/servlet/SIController?action=chooseStaffForPayment&page=paymentsubmit&Amount="+SIApplication.calcApplicationFee()+"&" + val + "'>" + key + "</A></TD></TR>");
			}
			out.print("</TABLE></CENTER>");
		}
		out.print("</TD></TR>");
	}
%>
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
