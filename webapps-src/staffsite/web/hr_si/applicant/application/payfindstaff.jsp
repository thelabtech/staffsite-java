DEPRECATED!  12-17-02 by dc.  Merged display of staff search results into paystaff.jsp.

<%@ include file="header.jspf" %>
<%
		//ActionResults ar = new ActionResults();
		//ar = ActionResults.getActionResults(session);
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
		<TD CLASS="app" COLSPAN="2"><STRONG>Payment Information</STRONG></TD>
	</TR>

	<TR>
		<TD CLASS="app" COLSPAN="2">The following matches were found.  Click on the staff person below who will pay for your
		application fee.  <BR><BR>IMPORTANT NOTE: When you click the link of the staff person below, an email will be (immediately) generated to them requesting they initiate an Account
 Transfer to pay the fee for this application.  However, it remains your responsibility to see to it that your application payment is made.
Your application will NOT be processed until payment is actually received and processed, but we will note that a payment is pending.</TD></TR>
<TR><TD colspan="2">
<%
if(ar.getValue("ErrorMessage")!=null)
  out.print("There was an error processing your request: <BR><BR>" + (String) ar.getValue("ErrorMessage"));
else
{
	if (staffInfo.size()==0) 
	  out.print("<BR><B>There were no matching Staff people with the First and Last names you entered.  Please try again.</B>");
	else
	  out.print("&nbsp;");
	out.print("</TD></TR>");

	for (Iterator i = staffInfo.keySet().iterator(); i.hasNext(); )
	{
	   String key = (String) i.next();
	   String val = (String) staffInfo.get(key);
	   out.println("<TR><TD><A HREF='/servlet/SIController?action=chooseStaffForPayment&page=paymentsubmit&Amount="+SIApplication.calcApplicationFee()+"&" + val + "'>" + key + "</A></TD></TR>");
	}
}
%>

<TR><TD>&nbsp;</TD></TR>
<TR><TD colspan="2">

<HR><BR>
If you wish to search for a different staff member, enter their name below and click 'Next'.
</TD>
	</TR>
		<TR>
		<TD CLASS="app" COLSPAN="2"><BR><BR><STRONG>Search for a Staff Member</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%"VALIGN="TOP">Staff's First/Last Name</TD>
		<TD CLASS="app"><INPUT type="text" name="firstname" size=10 CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
				<INPUT type="text" name="lastname" size=20 CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"></TD>
	</TR>

<TR><TD><BR><BR><BR></TD></TR>

	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('payment')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('payment3')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="/hr_si/siMainFooter.jspf" %>
