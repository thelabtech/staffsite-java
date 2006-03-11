<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<% 
	selBool.setLabels("Yes","No");
%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Registration registration = (Registration)ar.getObject("registration");
	RegistrationType regType = registration.getRegistrationType();
	Conference conference = (Conference)ar.getObject("conference");

	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = regType.getLabel() +" Registration of " + registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName();
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
			alert("You must fill out all of the yellow fields to continue.");
		} else if(!validDateRange(document.theForm.ArriveDate.value, document.theForm.LeaveDate.value)){
			alert("The Arrival Date must be earlier than the Departure Date");
		} else{
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}
//-->
</SCRIPT>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"
			ROWSPAN="3"><%=toolsMenu.display(0)%>
		<P><%=conferenceMenu.display(2)%>
		</TD>
		<TD
			VALIGN="TOP"
			COLSPAN="2">
		<FORM
			NAME="theForm"
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action">
			<% /* WHY IS THIS DUPLICATED???? */ %>
			<INPUT TYPE=hidden NAME="RegistrationID" VALUE="<%=registration.getRegistrationID()%>">
			<INPUT TYPE=hidden NAME="registrationID" VALUE="<%=registration.getRegistrationID()%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Editing <%=registration.getPerson().getFirstName()%> <%=registration.getPerson().getMiddleInitial()%>
				<%=registration.getPerson().getLastName()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Full Name</TD>
				<TD CLASS="cell"><%=registration.getPerson().getFirstName()%> <%=registration.getPerson().getMiddleInitial()%>
				<%=registration.getPerson().getLastName()%>
				<% if (!registration.getPerson().getAccountNo().equals("")){%>
				<A
					CLASS="button"
					TARGET=_blank
					HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%=registration.getPerson().getAccountNo()%>">Lookup
				<%=registration.getPerson().getFirstName()%> <%=registration.getPerson().getLastName()%>
				in the Infobase</A>
				<%}%>
				</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Email</TD>
				<TD CLASS="linkcell"><A
					CLASS="linkcell"
					HREF="mailto:<%=registration.getPerson().getEmail()%>"><%=registration.getPerson().getEmail()%></A></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Registration Date</TD>
				<TD CLASS="cell"><INPUT
					NAME="RegistrationDate"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(registration.getRegistrationDate())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="25%">Account No</TD>
				<TD CLASS="cell"><INPUT
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="AccountNo"
					size=35
					maxlength=80
					value="<%=registration.getPerson().getAccountNo()%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Arrival Date</TD>
				<TD CLASS="cell"><INPUT
					NAME="ArriveDate"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(registration.getArriveDate() == null ? regType.getDefaultDateArrive() : registration.getArriveDate())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Departure Date</TD>
				<TD CLASS="cell"><INPUT
					NAME="LeaveDate"
					SIZE=10
					MAXLENGTH=10
					onFocus="pickdate(this)"
					value="<%=formatter.formatDate(registration.getLeaveDate() == null ? regType.getDefaultDateLeave() : registration.getLeaveDate())%>"></TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=showRegistration&registrationID=<%=registration.getRegistrationID()%>"
					CLASS="button">Cancel</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveRegistration', 'save')"
					NAME="save"
					CLASS="button">Save Changes</A></TD>
			</TR>
		</TABLE>
		</FORM>
		<BR>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="7">Children</TD>
			</TR>
<% if (regType.getAskChildren()){
		if(registration.getChildRegistrations().size() > 0){		
			formatter.setHeaderNames(new String[] {"Name", "Dates at Conference", "Birth Date", "Age", "Needs<BR>Child Care", "Delete"});
			formatter.setHeaderSorts(new boolean[] {false, false, false, false, false, false});
			formatter.setHeaderWidths(new String[] {"15%", "20%", "7%", "5%", "7%", "5%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "LEFT", "RIGHT", "RIGHT", "RIGHT"});
%>
			<%=formatter.displayHeader("5","", "Children Table", "")%>
			<%
				Iterator children = registration.getChildRegistrations().iterator();
				for(int i = 1; children.hasNext(); i++){
					ChildRegistration cr = (ChildRegistration)children.next();

					// Create a calendar object with the date of birth
					Calendar dateOfBirth = new GregorianCalendar();
					dateOfBirth.setTime(cr.getBirthDate());
						
					// Get age based on year
					int age = today.get(Calendar.YEAR) - dateOfBirth.get(Calendar.YEAR);
					
					// Add the tentative age to the date of birth to get this year's birthday
					dateOfBirth.add(Calendar.YEAR, age);
					
					// If this year's birthday has not happened yet, subtract one from age
					if (today.before(dateOfBirth)) {
						age--;
					}
%>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><%=cr.getFirstName()%> <%=cr.getLastName()%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><%=formatter.formatDate(cr.getArriveDate())%> - <%=formatter.formatDate(cr.getLeaveDate())%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><%=formatter.formatDate(cr.getBirthDate())%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="RIGHT"><%=age%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="RIGHT"><%=cr.getInChildCare() ? "Yes" : "No"%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="RIGHT"><A
					HREF="/servlet/CRSAdmin?action=confirmDeleteChildRegistration&registrationID=<%=cr.getChildRegistrationID()%>"
					CLASS="button">Delete</A></TD>
			</TR>
			<%
				}
			} else {
%>
			<TR>
				<TD	CLASS="cell" COLSPAN="7" ALIGN="CENTER">
					<B><%=registration.getPerson().getFirstName()%> <%=registration.getPerson().getLastName()%></B>
				has indicated no children coming to this conference</TD>
			</TR>
			<%
			}
	}
	else{ %>
			<TR><TD	CLASS="cell" COLSPAN="7" ALIGN="CENTER">Children are not allowed
				for this registration type.</TD>
			</TR>
<%}%>
		</TABLE>
		</FORM>
		<%@ include file="/crs/e_footer_help.jspf"%>
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
