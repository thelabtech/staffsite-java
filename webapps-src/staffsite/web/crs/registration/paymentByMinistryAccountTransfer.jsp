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
	<input type=hidden name='PaymentMethod' value='<%=ar.getValue("PaymentMethod")%>'>
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Payment by Ministry Account Transfer</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2"> 
			The staff member that you have specified will be notified of this pending
			Ministry Account Transfer via email once you complete the information below.			
			 </TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2"> Please enter the name of the entity/ministry that should be
			 charged for this transfer (this does not have to be a technically exact title; it's just for our reference)
			 </TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Ministry/Entity:</TD>
			<TD CLASS="cell">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Ministry" VALUE="" size=30 maxlength=60>
			 </TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">Enter the chartfield and project that should be charged for this transfer:</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Transfer Amount</TD>
			<TD CLASS="cell">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="PaymentAmt" VALUE="<%=ar.getValue("PaymentAmount")%>" size=5 maxlength=6>
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Business Unit</TD>
			<TD CLASS="cell">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="BU" VALUE="" size=20 maxlength=49>
			</TD
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Operating Unit</TD>
			<TD CLASS="cell">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="OU" VALUE="" size=20 maxlength=49>
			</TD
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Department</TD>
			<TD CLASS="cell">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Dept" VALUE="" size=20 maxlength=49>
			</TD
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Project</TD>
			<TD CLASS="cell">
			<INPUT CLASS="empty" onFocus="Highlight(this)" onBlur="UnHighlight(this)" NAME="Project" VALUE="" size=20 maxlength=49>
			</TD
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Ministry Verifier</TD>
			<TD CLASS="cell"><input type="hidden" name="staffEmail" value="<%=ar.getValue("staffEmail")%>">
			<input type="hidden" name="staffName" value="<%=ar.getValue("staffName")%>"><%=ar.getValue("staffName")%></TD>
		</TR>

		<TR>
			
			<TD CLASS="hl">&nbsp;</TD>
			<TD CLASS="cell">
				
				<%if(ar.getValue("Note")!=null){out.print("<B>Note:</B></font> "+ar.getValue("Note"));}%>
				</font>
			</TD>
		
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">
			If you came to this page by mistake and are not using an account transfer, please change your payment type by clicking the "Change Payment Type" link below.
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="2" CLASS="button" ALIGN="CENTER">
				<A HREF="javascript: goNext('confirmPayment')" CLASS="button">Submit Transfer Request</A>
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
