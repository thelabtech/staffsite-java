<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean" />
<% 
	selBool.setLabels("Yes","No");
%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	ChildRegistration registration = (ChildRegistration)ar.getObject("registration");
	Conference conference = (Conference)ar.getObject("conference");

	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Child Registration of " + registration.getFirstName() + " " + registration.getLastName();
	Hashtable gender = new Hashtable();
	gender.put("M", "Male");
	gender.put("F", "Female");
	gender.put("", "");
	Hashtable maritalStatus = new Hashtable();
	maritalStatus.put("S", "Single");
	maritalStatus.put("M", "Married");
	maritalStatus.put("D", "Divorced");
	maritalStatus.put("", "");
%>
<%@ include file="/crs/e_header.jspf"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.  Please enter your anticipated arrival and departure date. If you can't see the calendar, you probably need to maximize it from the task bar at the bottom of your screen.");
		} else if(!validDateRange(form.ArriveDate.value, form.LeaveDate.value)){
			alert("The Arrival Date must be earlier than the Departure Date.");
		} else{
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
	<TR>
		<TD VALIGN="TOP" WIDTH="150" ROWSPAN="3"><%=toolsMenu.display(0)%>
		<P><%=conferenceMenu.display(2)%>
		</TD>
		<TD VALIGN="TOP" COLSPAN="2">
		<FORM NAME="theForm" ACTION="/servlet/CRSAdmin" METHOD="post"><INPUT
			TYPE=hidden NAME="action"> <INPUT TYPE=hidden
			NAME="ChildRegistrationID"
			VALUE="<%=registration.getChildRegistrationID()%>"> <INPUT
			TYPE=hidden NAME="childRegistrationID"
			VALUE="<%=registration.getChildRegistrationID()%>">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader" COLSPAN="2">Editing <%=registration.getFirstName()%>
				<%=registration.getLastName()%></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" WIDTH="20%">Full Name</TD>
				<TD CLASS="cell"><%=registration.getFirstName()%> <%=registration.getLastName()%></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Arrival Date</TD>
				<TD CLASS="cell"><INPUT CLASS="required" NAME="ArriveDate" SIZE=10
					MAXLENGTH=10 onFocus="pickdate(this)"
					value="<%=formatter.formatDate(registration.getArriveDate())%>"></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Departure Date</TD>
				<TD CLASS="cell"><INPUT CLASS="required" NAME="LeaveDate" SIZE=10
					MAXLENGTH=10 onFocus="pickdate(this)"
					value="<%=formatter.formatDate(registration.getLeaveDate())%>"></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Birth Date</TD>
				<TD CLASS="cell"><INPUT CLASS="required" NAME="BirthDate" SIZE=10
					MAXLENGTH=10 onFocus="pickdate(this)"
					value="<%=formatter.formatDate(registration.getBirthDate())%>"></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">In Child Care?</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(registration.getInChildCare());
			selBool.setName("InChildCare");
%> <%=selBool.printRadioBoolean()%></TD>
			</TR>
			<TR>
				<TD CLASS="button" ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=showChildRegistration&childRegistrationID=<%=registration.getChildRegistrationID()%>"
					CLASS="button">Cancel</A></TD>
				<TD CLASS="button" ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveChildRegistration', 'save')"
					NAME="save" CLASS="button">Save Changes</A></TD>
			</TR>
		</TABLE>
		</FORM>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
