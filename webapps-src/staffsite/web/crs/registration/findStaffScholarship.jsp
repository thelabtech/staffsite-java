<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean"/>
<% 
	selBool.setLabels("Yes","No");
%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Registration registration = (Registration)ar.getObject("registration");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	Vector sV = (Vector) ar.getCollection("StaffList");
	Iterator slist = sV.iterator(); // Staff list

	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	String pageTitle = "Staff Scholarship Verification";
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
		} else {
			form.action.value = action;
			form.submit();
		}
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150" ROWSPAN="3">
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
	<FORM NAME="theForm" ACTION="/servlet/CRSRegister" METHOD="post">
		<INPUT TYPE=hidden NAME="action" VALUE="findStaff">
		<INPUT TYPE=hidden NAME="RegistrationID" VALUE="<%=registration.getRegistrationID()%>">
		<INPUT TYPE=hidden NAME="PaymentMethod" VALUE="<%=ar.getValue("PaymentMethod")%>">
		<INPUT TYPE=hidden NAME="PaymentAmount" VALUE="<%=ar.getValue("PaymentAmount")%>">
		<INPUT TYPE=hidden NAME="PaymentAmountOther" VALUE="<%=ar.getValue("PaymentAmountOther")%>">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Staff Scholarship Verification</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP" WIDTH="30%">Last Name<%=conference.getIsCloaked() ? " (Family Name)" : "" %></TD>
			<TD CLASS="cell"><INPUT NAME="name" SIZE="40" CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" VALUE="<%=ar.getValue("nameSubString")%>"></TD>
		</TR>
		<tr>
			<td class="hl">&nbsp;</td>
			<td class="cell">
			<p>
			Your scholarship must be verified by a <%=clk1 ? "conference" : "Campus Crusade for Christ" %> staff member. 
			To search for and select the staff member who offered you this scholarship, 
			please enter 3 or more characters of their last name, then click "Search." 
			You will be given a list to choose from.
			</p>
			<p>
			If you came to this page by mistake and have not been offered a scholarship, 
			please click "back" and select a different payment type.
			</p>
			</td>
		</tr>
		<tr>
			<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSRegister?action=reviewPayments" CLASS="button">&lt; &lt; Back</A></TD>
			<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('findStaff')" CLASS="button">Search</A></TD>
		</tr>
	</table>
<%
		if(sV.size() > 0){
%>
	<p>
	<table border="0" cellspacing="0" width="100%" class="box">
		<tr>
			<td colspan="2" class="subboxheader">"<%=ar.getValue("nameSubString")%>" returned <%=sV.size()%> results</td>
		</tr>
		<tr>
			<td colspan="2" class="hl">Please select the staff member that offered you a scholarship by clicking his or her name.</td>
		</tr>
<%
			int counter = 1;
			while (slist.hasNext()) {
				counter++;
				Hashtable myStaff = (Hashtable)slist.next();
				boolean tempBool = true;
				if(counter%2 == 0) tempBool = false;
%>
			<tr>
				<td class="<%=(counter%2 == 0) ? "linkcell" : "linkcell2" %>">
				<A class="<%=(counter%2 == 0) ? "linkcell" : "linkcell2" %>" HREF="/servlet/CRSRegister?action=getPaymentInfo&staffEmail=<%=myStaff.get("Email")%>&staffName=<%=myStaff.get("PreferredName") + "%20" + myStaff.get("LastName")%>&PaymentAmountOther=<%=ar.getValue("PaymentAmountOther")%>&PaymentMethod=<%=ar.getValue("PaymentMethod")%>&PaymentAmount=<%=ar.getValue("PaymentAmount")%>"><%=myStaff.get("PreferredName")%>&nbsp;<%=myStaff.get("LastName")%></A>
				</TD>
				<td class="<%=(counter%2 == 0) ? "linkcell" : "linkcell2" %>"><%=myStaff.get("City")%>, <%=myStaff.get("State")%></td>
			</tr>
<%
			}
%>
	</table>
<%
		}
%>
	</TABLE>
	</FORM>
	<SCRIPT LANGUAGE="JavaScript">
	<!--
		document.submitForm.name.focus();
		document.submitForm.name.blur();
		document.submitForm.name.select();
	// -->
	</SCRIPT>
	</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
