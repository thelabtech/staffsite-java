<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*" %>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState" scope="request"/>
<jsp:useBean id="selMonth" class="org.alt60m.html.SelectMonth" scope="request"/>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSRegister");
	}
	Registration registration = (Registration)ar.getObject("registration");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	Conference conference = (Conference)ar.getObject("conference");
    Person person = registration.getPerson();

    String pageTitle = "Online Payment";
%>
<%@ include file="/crs/e_user_header.jspf" %>
<%
	registrationMenu.setActives(new boolean[]{
		true,
		true, 
		true, 
		true, 
		true, 
		true, 
		true, 
		true, 
		false, 
		true
	});
otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

	accountManagementMenu.setActives(new boolean[]{
		true
	});
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		var form = document.theForm;

		if(!requiredFilled(form)){
			alert("You must fill out all of the required fields to continue.");
		} else if(!validFloat(form.PaymentAmt.value)){
			alert("You can enter only a number is this field");
			form.PaymentAmt.focus();
		} else{
			form.action.value = action;
			form.submit();
		}
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
		<%=registrationMenu.display(registration.getSpouseComing() == 2 ? 7 : 4)%>
		<p>
		<%=otherOptionsMenu.display(0)%>
		<P>
		<TABLE CLASS="box" WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
			<TR><TD CLASS="subboxheader">Key</TD></TR>
			<TR><TD CLASS="cell"><INPUT CLASS="required" VALUE="Required Fields"></TD></TR>
			<TR><TD CLASS="cell"><INPUT CLASS="empty" VALUE="Optional Fields"></TD></TR>
		</TABLE>
		<P>
		<%=accountManagementMenu.display(0)%>
	</TD>
	<TD VALIGN="TOP" COLSPAN="2">
	<form method=post action="/servlet/CRSRegister" name="theForm">
	<input type=hidden name='action' value='confirmPayment'>
	<input type=hidden name='PaymentMethod' value='Scholarship'>
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Payment by Scholarship</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">The staff member you have specified will be notified of this pending scholarship via email, and will need to verify it by providing us with the account to charge. You are responsible for making sure that he or she does this by the registration deadline. Otherwise, this scholarship and any discounts associated with it will be reversed.
			<p>
			If you came to this page by mistake and are not getting a scholarship, please change your payment type by clicking the "Change Payment Type" link below.</TD>
		</TR>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Scholarship Information</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Scholarship Amount</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="PaymentAmt" VALUE="<%=ar.getValue("PaymentAmount")%>" size=5 maxlength=10></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Staff Verifier</TD>
			<TD CLASS="cell"><input type="hidden" name="Comment" value="<%=ar.getValue("staffEmail")%>"><input type="hidden" name="staffName" value="<%=ar.getValue("staffName")%>"><%=ar.getValue("staffName")%></TD>
		</TR>
		<TR>
			<TD CLASS="hl">&nbsp;</TD>
			<TD CLASS="cell">
				<B>Note:</B></font> 
				<% if(true) { // (!((Boolean)person.getPreRegistered()).booleanValue()){%>
					To guarantee your pre-registration you must pay at least the pre-registration cost (including any scholarships).<br>
				<%}%>
				<B>You may pay the full amount now or at the event.</B>
				</font>
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="2" CLASS="button" ALIGN="CENTER">
				<A HREF="javascript: goNext('confirmPayment')" CLASS="button">Submit Scholarship</A>
				<BR><BR>
				<A HREF="javascript: history.go(-1)" CLASS="button">Change Payment Type</A>
			</TD>
		</TR>
	</TABLE>
	</form>
</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>