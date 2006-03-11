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
	Conference conference = (Conference)ar.getObject("conference");

	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Student Registration of " + registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName();
%>
<%@ include file="/crs/e_header.jspf"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else {
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
			NAME="action"> <INPUT
			TYPE=hidden
			NAME="RegistrationID"
			VALUE="<%=registration.getRegistrationID()%>"> <INPUT
			TYPE=hidden
			NAME="registrationID"
			VALUE="<%=registration.getRegistrationID()%>">
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
				<%=registration.getPerson().getLastName()%></TD>
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
