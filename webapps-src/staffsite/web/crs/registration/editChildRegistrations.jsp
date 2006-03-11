<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean"/>
<% 
	selBool.setLabels("Yes","No");
%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Registration registration = (Registration)ar.getObject("registration");
	RegistrationType regType = registration.getRegistrationType();
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	Conference conference = (Conference)ar.getObject("conference");
	boolean askChildCare = regType.getAskChildCare(); //Added 1/13/05 SRW
	boolean askAdditionalRooms = regType.getAskAdditionalRooms(); //Added 1/13/05 SRW

	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	String pageTitle = "Child Registrations";

	Hashtable gender = new Hashtable();
	gender.put("M", "Male");
	gender.put("F", "Female");
	gender.put("", "");
	Hashtable maritalStatus = new Hashtable();
	maritalStatus.put("S", "Single");
	maritalStatus.put("M", "Married");
	maritalStatus.put("D", "Divorced");
	maritalStatus.put("P", "Separated");
	maritalStatus.put("W", "Widowed");
%>
<%@ include file="/crs/e_user_header.jspf" %>
<%formatter.setNoDate("");%>
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
<%
		int kids = Integer.parseInt(ar.getValue("kids"));
		for(int i=0; i < kids; i++) {
%>
			} else if(!validDate(form.BirthDate<%=i%>.value)){
				alert("The Birth Date must be entered in the form MM/DD/YYYY for Child #<%=i + 1%>");
				form.BirthDate<%=i%>.focus();
			} else if(!validDateRange(document.theForm.ArriveDate<%=i%>.value, document.theForm.LeaveDate<%=i%>.value)){
				alert("The Arrival Date must be earlier than the Departure Date for Child #<%=i + 1%>");
<%
		}
%>

		} else{
			document.theForm.action.value = action;
			document.theForm.submit();
		}
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150" ROWSPAN="3">
		<%=registrationMenu.display(0)%>
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
	<INPUT TYPE=hidden NAME="action">
	<INPUT TYPE=hidden NAME="kids" VALUE="<%=String.valueOf(kids)%>">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2"><%=registration.getFirstName()%> <%=registration.getLastName()%>'s Children </TD>
		</TR>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2">Enter the following information for each of your children:<BR>(only children going to the conference need to be listed)</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2" ALIGN="CENTER">
<%
			Iterator childRegistrations = ar.getCollection("childRegistrations").iterator();

			int size = kids > ar.getCollection("childRegistrations").size() ? kids : ar.getCollection("childRegistrations").size();
				
			for(int i=0; i < size; i++) {
				ChildRegistration childRegistration = new ChildRegistration();
				if(childRegistrations.hasNext())
					childRegistration = (ChildRegistration)childRegistrations.next();
%>
			<TABLE WIDTH="95%" CELLPADDING="0" CELLSPACING="0" CLASS="box">
			<INPUT type="hidden" name="ChildRegistrationID<%=i%>" value="<%=childRegistration.getChildRegistrationID()%>">
			<TR>
				<TD CLASS="subboxheader" COLSPAN="2">Child #<%=i + 1%></TD>
			</TR>
<%
			if(!childRegistration.isPKEmpty()){
%>
				<TR>
					<TD CLASS="hl" ALIGN="RIGHT">Remove this registration</TD>
					<TD CLASS="cell"><INPUT type=checkbox value="true" name="Remove<%=i%>" ></TD>
				</TR>
<%
			}
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" WIDTH="25%">First Name<%=conference.getIsCloaked() ? " (Given Name)" : ""%></TD>
				<TD CLASS="cell"><INPUT CLASS="required" type=text name="FirstName<%=i%>" value="<%=childRegistration.getFirstName()%>" size=15 maxlength=50 onFocus="Highlight(this)" onBlur="UnHighlight(this)"></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Last Name<%=conference.getIsCloaked() ? " (Family Name)" : ""%></TD>
				<TD CLASS="cell"><INPUT CLASS="required" type=text name="LastName<%=i%>" value="<%="".equals(childRegistration.getLastName()) ? registration.getLastName() : childRegistration.getLastName()%>" size=15 maxlength=50 onFocus="Highlight(this)" onBlur="UnHighlight(this)"></TD>
			</TR>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Gender</td>
				<td CLASS="cell"><select NAME="Gender<%=i%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" CLASS="required">
					<option VALUE=""
						<%=(childRegistration.getGender().equals("") ? "SELECTED" : "")%>></option>
					<option VALUE="M"
						<%=(childRegistration.getGender().equals("M") ? "SELECTED" : "")%>>Male</option>
					<option VALUE="F"
						<%=(childRegistration.getGender().equals("F") ? "SELECTED" : "")%>>Female</option>
				</select></td>
			</tr>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Date Arrives</TD>
				<TD CLASS="cell"><INPUT CLASS="required" type=text name="ArriveDate<%=i%>" value="<%=formatter.formatDate(childRegistration.getArriveDate() == null ? (registration.getArriveDate()== null ? regType.getDefaultDateArrive(): registration.getArriveDate()) : childRegistration.getArriveDate())%>" size=10 maxlength=10 onFocus="Highlight(this)" onBlur="UnHighlight(this)"> <A CLASS="button" HREF='javascript:pickdate(document.theForm.ArriveDate<%=i%>)'>Choose</A></font></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Date Leaves</TD>
				<TD CLASS="cell"><INPUT CLASS="required" type=text name="LeaveDate<%=i%>" value="<%=formatter.formatDate(childRegistration.getLeaveDate() == null ? (registration.getLeaveDate()== null? regType.getDefaultDateLeave(): registration.getLeaveDate()) : childRegistration.getLeaveDate())%>" size=10 maxlength=10 onFocus="Highlight(this)" onBlur="UnHighlight(this)"> <A CLASS="button" HREF='javascript:pickdate(document.theForm.LeaveDate<%=i%>)'>Choose</A></font></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Birth Date (MM/DD/YYYY)</TD>
				<TD CLASS="cell"><INPUT CLASS="required" type=text name="BirthDate<%=i%>" value="<%=formatter.formatDate(childRegistration.getBirthDate())%>" size=10 maxlength=10 onFocus="Highlight(this)" onBlur="UnHighlight(this)"> <A CLASS="button" HREF='javascript:pickdate(document.theForm.BirthDate<%=i%>)'>Choose</A></font></TD>
			</TR>
			<%if (regType.getAskChildCare()==true) { //checks if conference is providing childcare; added 1/13/05 SRW%>
			<TR> 
				<TD CLASS="hl" ALIGN="RIGHT">Requires Childcare?</TD>
				<TD CLASS="cell"><INPUT type=checkbox value="true" name="ChildCare<%=i%>" <%=childRegistration.getInChildCare() ? "CHECKED" : ""%>></TD>
			</TR>
			<% } //end of childcare checking if statment%>
			</TABLE>
			<P>
<% 
			} //end for loop
%>

			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" COLSPAN="2">
				<%=askAdditionalRooms ? "How many additional rooms will you need for your children?" : ""%></TD><%--hides this text if askAdditionalRooms is false --%>
		</TR>
		<%if (askAdditionalRooms==true) { //beginning of Additional Rooms if statement%>
		<TR>
			<TD CLASS="cell" COLSPAN="2" ALIGN="CENTER">
			<select name="AdditionalRooms">
				<option value=0 <%=registration.getAdditionalRooms() == 0 ? "SELECTED" : ""%>>None</option>
				<option value=1 <%=registration.getAdditionalRooms() == 1 ? "SELECTED" : ""%>>1</option>
				<option value=2 <%=registration.getAdditionalRooms() == 2 ? "SELECTED" : ""%>>2</option>
				<option value=3 <%=registration.getAdditionalRooms() == 3 ? "SELECTED" : ""%>>3</option>
			</select>
			</TD>
		</TR>
		<% } else { %>
		<input type="hidden" name="AdditionalRooms" value=0><%-- additionalRooms in crs_Registration table needs
		a value otherwise Null exception is thrown. This hidden input makes sure a value of 0 is placed in the table. --%>
		<% } //end of Additional Room if statement %>
		<TR>
			<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSRegister?action=editPersonDetails" CLASS="button">&lt; &lt; Back</A></TD>
			<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('saveChildRegistrations')" CLASS="button">Next &gt; &gt;</A></TD>
		</TR>
	</TABLE>
	</FORM>
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
