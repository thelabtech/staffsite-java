DEPRECATED - 12-17-02 BY DC Folded into payment.jsp
<%@ include file="header.jspf" %>

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Payment Information</STRONG></TD>
	</TR>

	<TR>
		<TD CLASS="app" COLSPAN="2">We have recorded your intent to pay via 
<% if ("Staff".equals((String)ar.getValue("PaymentType")))
	out.write("Staff Member Account Transfer.  An e-mail has been sent to the staff person you selected.  "); 
   else
   	out.write("Mailing in your payment."); 
%>

Please remember that your application will NOT be processed until payment is received.  
<BR><BR>
Thanks again for being a part of helping to fulfill the Great Commission (Matt 28:18-20)!
</TD>
	</TR>

<TR><TD>&nbsp;</TD></TR>


	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('payment')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('submit')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="/hr_si/siMainFooter.jspf" %>
