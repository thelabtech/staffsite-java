<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.hr.si.model.dbio.*" %>
<%
	// NOTE: This page does not include "header.jspf" because we don't want all the automatic menus, etc.
	// It does include the ../../header although
%>
<% String pageTitle="Receive Payments"; %>

<%@ include file="../header.jspf" %>

	<% box.setTitle("Application Submitted");%>
	<% box.setWidth("80%");%>
	<CENTER>
	<%=box.printTop()%>


<%	
ActionResults ar = ActionResults.getActionResults(session);
Hashtable info = ar.getHashtable("info");
if (info==null) info= new Hashtable();
%>
<script language="javascript">
<!--
	function doPostForm(page) {
		var theform = document.pmtForm;
		theform.page.value = page;
		theform.submit();
	}
-->
</script>

<form name="pmtForm" action="SIController" method="post">
<input type="hidden" name="as" value="student">
<input type="hidden" name="page">

<input type="hidden" name="action" value="postPaymentFromStaff">
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
<TR><TD class="app" colspan="3">
<h2>Staff Account Transfer Payments</h2>
<%
String applicantName=(String)info.get("applicantName");
String applicantEmail = (String)info.get("applicantEmail");
String applicantPhone= (String)info.get("applicantPhone");
String applicationAmount= (String)info.get("applicationAmount");
String staffAccountNo= (String)info.get("staffAccountNo");
String PersonID= (String)info.get("PersonID");
String error = (String)info.get("ErrorMessage");
String ApplicationID = (String)info.get("ApplicationID");
String PaymentID = (String)info.get("paymentId");
%>

<%
if(applicantName==null || "null".equals(applicantName))
{
%>

<!-- The following is displayed if the name is null -->

  <B>Error Message</B>There was a problem with the link you followed.  The Encoded PersonID was not valid.  Please
   check the link and try again or contact the System Administrator.
<%
}
else
{
%>

<!-- The following is displayed if the name isn't null -->

<B><%=applicantName%></B> has just applied for an exciting missions opportunity this 
summer with Campus Crusade for Christ and has indicated you have agreed to 
pay the application fee of $<%=applicationAmount%>.  

<BR><BR>If you could take a minute and indicate the account 
to use, we can continue with the application process.  The application materials 
will then be reviewed and a decision will be given as soon as possible.
<BR><BR>

The applicant's application will not be processed until payment is made.  
Thank you for your help in sending this applicant into the harvest!

<BR><BR>
You may contact the applicant by email at <B><%=applicantEmail%></B> or by phone at <B><%=applicantPhone%></B> .
<BR><BR>
Please choose one of the following options:

</TD></TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%"VALIGN="TOP">Choose Payment type:</TD>
		<TD class="app" colspan="2">
		<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="RADIO" NAME="ChoosePayment" VALUE="No" >I do not want to pay for this applicant's application.</INPUT><BR>
		<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="RADIO" NAME="ChoosePayment" VALUE="MyAccount" CHECKED>I authorize $<%=applicationAmount%> to be transferred from my account (<%=staffAccountNo%>) for this applicant's application.</INPUT><BR>
		<INPUT type="hidden" name="staffAccountNo" value="<%=staffAccountNo%>"/>
		<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="RADIO" NAME="ChoosePayment" VALUE="AnotherAccount">I authorize $<%=applicationAmount%> to be transferred from this specific account: </INPUT>
			<INPUT type="text" class="optional" name="OtherAccount"></INPUT><BR>
			IMPORTANT: If you enter another account and the number you enter is not a valid account, your PERSONAL account (<%=staffAccountNo%>) will be charged.  The account designation should be in the new format similar to: 'CAMPS/NCO/MYDEPT/MYPROJ'


		<INPUT type="hidden" name="PersonID" value="<%=PersonID%>"/>
		<INPUT type="hidden" name="Amount" value="<%=applicationAmount%>"/>
		<INPUT type="hidden" name="ApplicationID" value="<%=ApplicationID%>"/>
		<INPUT type="hidden" name="PaymentID" value="<%=PaymentID%>"/>
		</TD>

	</TR>
<TR><TD class="app">&nbsp;</TD><TD class="app" colspan="2">&nbsp;</TD></TR>
	<TR>
		<TD class="app">&nbsp;</TD>
		<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="65%" CLASS="app"><A CLASS="button" HREF="JavaScript: doPostForm('post')" CLASS="button">Process Payment</A></TD>
		<TD class="app">&nbsp;</TD>
	</TR>
	<TR>
		<TD colspan="3" class="app">&nbsp;</TD>
	</TR>
</table>
</form>
<%
} //end else above
%>

	<%=box.printBottom()%>
<%@ include file="../footer.jspf" %>
</BODY>
</HTML>
