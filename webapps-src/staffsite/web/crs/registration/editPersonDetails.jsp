<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"
	scope="request" />
<jsp:useBean id="selYIS" class="org.alt60m.html.SelectYearInSchool"
	scope="request" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Registration registration = (Registration)ar.getObject("registration");
	RegistrationType regType = registration.getRegistrationType();
	Person person = registration.getPerson();
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Editing " + person.getFirstName() + " " + person.getLastName() + "'s Personal Info";
	if ("".equals(person.getLastName())) {
		pageTitle = "Editing Personal Info";
	}
	Hashtable gender = new Hashtable();
	gender.put("1", "Male");
	gender.put("0", "Female");
	gender.put("", "");
	Hashtable maritalStatus = new Hashtable();
	maritalStatus.put("S", "Single");
	maritalStatus.put("M", "Married");
	maritalStatus.put("D", "Divorced");
	maritalStatus.put("P", "Separated");
	maritalStatus.put("W", "Widowed");
%>
<%@ include file="/crs/e_user_header.jspf"%>
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
<script LANGUAGE="JavaScript">
	<!--
		function isDigit(num) {
			var string="1234567890";
			if (string.indexOf(num) != -1) {
				return true;
				}
			return false;
		}

		function isInteger (s){
			var i;	
			if ((s == null) || (s.length == 0) || (s == " "))  /* isEmpty*/
			   if (isInteger.arguments.length == 1) return true;
			   else return (isInteger.arguments[1] == true);
			for (i = 0; i < s.length; i++){   
				var c = s.charAt(i);
				if (!isDigit(c)) return false;
			}
			return true;
		}
			
		function isIntegerInRange (s, a, b){
			if ((s == null) || (s.length == 0) || (s == " "))  /* isEmpty*/
			   if (isIntegerInRange.arguments.length == 1) return true;
			   else return (isIntegerInRange.arguments[1] == true);
			if (!isInteger(s, false)) return false;
			var num = parseInt (s);
			return ((num >= a) && (num <= b));
		}

		function goNext(action){
			var form = document.theForm;
			form.Email.value = form.Email.value.toLowerCase();
			form.ConfirmEmail.value = form.ConfirmEmail.value.toLowerCase();
			if(!requiredFilled(form)){
				alert("You must fill out all of the required fields to continue.");
	<%
		if(!isSpouse && regType.decodeProfile(1) >= 1){ //!isSpouse only in there while there is a spouse profile display error, remove later
	%>
			} else if(form.BirthDate.value != "" && !validDate(form.BirthDate.value)){
				alert("The Birth Date must be entered in the form MM/DD/YYYY");
				form.BirthDate.focus();
	<%
		}
	%>
			} else if(!validEmail(form.Email.value)){
				alert("You must enter a valid email address");
				form.Email.focus();
			} else if(form.Email.value != form.ConfirmEmail.value){
				alert("Your email addresses must match.");
				form.ConfirmEmail.focus();
			}
<% 			if(regType.decodeProfile(10) >= 1) { /* travel plans dates*/%>
			else if(!validDate(form.ArriveDate.value)){
				alert("The Arrival Date must be entered in the form MM/DD/YYYY");
				form.ArriveDate.focus();
			} else if(!validDate(form.LeaveDate.value)){
				alert("The Leave Date must be entered in the form MM/DD/YYYY");
				form.LeaveDate.focus();
			} else if(!validDateRange(form.ArriveDate.value, form.LeaveDate.value)){
				alert("The Arrival Date must be earlier than the Departure Date");
				form.ArriveDate.focus();
			}
<%}%>
<%			if(regType.decodeProfile(11) >= 1){	/* asking for account number */%>
			else if (
				(form.AccountNo.value.length<9)	|| 
				(!isInteger(form.AccountNo.value.substring(0,9))) ||
				( (form.AccountNo.value.length==10) && 
					( (isInteger(form.AccountNo.value)) || !((form.AccountNo.value.charAt(9)=="s") || (form.AccountNo.value.charAt(9)=="S")) ) ) )	&& form.AccountNo.value != '' {
				
				alert("Please be sure to enter your staff account number as a 9-digit number.\nYou may need to add zeroes at the beginning of the number.\nWives, if you are adding an \"S\" be sure to put it at the end, AFTER the 9 digits.");
				form.AccountNo.focus();
			}
<%}%>
			else{
				form.action.value = action;
				form.submit();
			}
		}
		
		function copyCurrent(){
			document.theForm.PermanentAddress1.value = document.theForm.Address1.value;
			document.theForm.PermanentAddress2.value = document.theForm.Address2.value;
			document.theForm.PermanentCity.value = document.theForm.City.value;
			document.theForm.PermanentState.value = document.theForm.State.value;
			document.theForm.PermanentZip.value = document.theForm.Zip.value;
			document.theForm.PermanentCountry.value = document.theForm.Country.value;
			document.theForm.PermanentPhone.value = document.theForm.HomePhone.value;
		}
	//-->
</script>
<table WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
	<tr>
		<td VALIGN="TOP" WIDTH="150" ROWSPAN="3">
		<%=registrationMenu.display(isSpouse ? 4 : 1)%>
		<p>
		<%=otherOptionsMenu.display(0)%>
		<p>
		<table CLASS="box" WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td CLASS="subboxheader">Key</td>
			</tr>
			<tr>
				<td CLASS="cell"><input CLASS="required" VALUE="Required Fields"></td>
			</tr>
			<tr>
				<td CLASS="cell"><input CLASS="empty" VALUE="Optional Fields"></td>
			</tr>
		</table>
		<p><%=accountManagementMenu.display(0)%>
		</td>
		<td VALIGN="TOP" COLSPAN="2">
		<form NAME="theForm" ACTION="/servlet/CRSRegister" METHOD="post"><input
			TYPE="hidden" NAME="action"> 
			<input TYPE="hidden" NAME="PersonID" VALUE="<%=person.getPersonID()%>"> 
			<input TYPE="hidden" NAME="activeID" VALUE="<%=registration.getRegistrationID()%>"> 
			<%
			if(isSpouse){
			%> <input TYPE=hidden VALUE="T" NAME="spouseReg"> <%
			}
			%>
		<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<tr>
				<td CLASS="boxheader" COLSPAN="2">Editing <%=person.getFirstName()%>
				<%=person.getLastName()%></td>
			</tr>
			<tr>
				<td CLASS="cell" COLSPAN="2">
				<%
				if(isSpouse)
				{
					%>
					Enter your spouse's contact information below.
				<%
				}else{
				%>
					Enter your contact information below.
				<%
				}
				%>
				The highlighted boxes are required.</td>
			</tr>
			<tr>
				<td CLASS="subboxheader" COLSPAN="2">Personal Info</td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" WIDTH="20%">First Name<%=conference.getIsCloaked() ? " (Given Name)" : ""%></td>
				<td CLASS="cell">
				<% if(isSpouse&&!"".equals(person.getFirstName())&person.getFirstName()!=null)
				{
				%>
					<input TYPE="hidden" NAME="FirstName" value="<%=person.getFirstName()%>">
					<%=person.getFirstName()%>
				<%
				}else{
				%>
					<input CLASS="required" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="FirstName" size=20 maxlength=30
					value="<%=person.getFirstName()%>">
				<%
				}
				%>
				</td>
			</tr>
			<%
			if(regType.decodeProfile(0) >= 1){
				String css = regType.decodeProfile(0) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Middle Initial</td>
				<td CLASS="cell">
				<% if(isSpouse&!"".equals(person.getMiddleInitial())&person.getMiddleInitial()!=null)
				{
				%>
					<input TYPE="hidden" NAME="MiddleInitial" value="<%=person.getMiddleInitial()%>">
					<%=person.getMiddleInitial()%>
				<%
				}else{
				%>
					<input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="MiddleInitial" size=1 maxlength=1
					value="<%=person.getMiddleInitial()%>">
				<%
				}
				%>
				</td>
			</tr>
			<%
			}
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Last Name<%=conference.getIsCloaked() ? " (Family Name)" : ""%></td>
				<td CLASS="cell">
				<% if(isSpouse&!"".equals(person.getFirstName())&person.getLastName()!=null)
				{
				%>
					<input TYPE="hidden" NAME="LastName" value="<%=person.getLastName()%>">
					<%=person.getLastName()%>
				<%
				}else{
				%>
					<input CLASS="required" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="LastName" size=20 maxlength=30
					value="<%=person.getLastName()%>">
				<%
				}
				%>
				</td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Email</td>
				<td CLASS="cell"><input CLASS="required" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="Email" size=30 maxlength=200
					value="<%=person.getEmail()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Confirm Email</td>
				<td CLASS="cell"><input CLASS="required" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="ConfirmEmail" size=30
					maxlength=200 value="<%=person.getEmail()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Gender</td>
				<td CLASS="cell"><select NAME="Gender" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" CLASS="required">
					<option VALUE=""
						<%=(person.getGender().equals("") ? "SELECTED" : "")%>></option>
					<option VALUE="1"
						<%=(person.getGender().equals("1") ? "SELECTED" : "")%>>Male</option>
					<option VALUE="0"
						<%=(person.getGender().equals("0") ? "SELECTED" : "")%>>Female</option>
				</select></td>
			</tr>
			<%
			if(regType.decodeProfile(1) >= 1){
				String css = regType.decodeProfile(1) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Birth Date (MM/DD/YYYY)</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="BirthDate" size=10 maxlength=10
					value="<%=person.getBirthDate()%>"> <a
					HREF="javascript: pickdate(document.theForm.BirthDate)"
					CLASS="button">Choose</a></td>
			</tr>
			<%
			}
			if((regType.decodeProfile(12) >= 1 || regType.getAskSpouse()) && !isSpouse){
				String css = regType.decodeProfile(12) == 2 || regType.getAskSpouse() ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Marital Status</td>
				<td CLASS="cell"><select NAME="MaritalStatus"
					onFocus="Highlight(this)" onBlur="UnHighlight(this)"
					CLASS="<%=css%>">
					<option VALUE=""
						<%=(person.getMaritalStatus().equals("") ? "SELECTED" : "")%>></option>
					<option VALUE="S"
						<%=(person.getMaritalStatus().equals("S") ? "SELECTED" : "")%>>Single</option>
					<option VALUE="M"
						<%=(person.getMaritalStatus().equals("M") ? "SELECTED" : "")%>>Married</option>
					<option VALUE="D"
						<%=(person.getMaritalStatus().equals("D") ? "SELECTED" : "")%>>Divorced</option>
					<option VALUE="P"
						<%=(person.getMaritalStatus().equals("P") ? "SELECTED" : "")%>>Separated</option>
					<option VALUE="W"
						<%=(person.getMaritalStatus().equals("W") ? "SELECTED" : "")%>>Widowed</option>
				</select></td>
			</tr>
			<%
			}
			if(regType.getAskSpouse() && !isSpouse	){ 
				String css = regType.getAskSpouse()? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Will your spouse be attending this
				event?</td>
				<td CLASS="cell"><input type="radio" name="SpouseComing" value="2"
					<%=(registration.getSpouseComing() == 2 ? "checked" : "")%>> Yes <input
					type="radio" name="SpouseComing" value="1"
					<%=(registration.getSpouseComing() < 2 || !"M".equals(person.getMaritalStatus()) ? "checked" : "")%>> No</td>
			</tr>
			<%
			}
			if(regType.decodeProfile(11) >= 1){
				String css = regType.decodeProfile(11) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" WIDTH="25%">9-digit Staff Account
				Number (please add &quot;S&quot; to the end for wives)</td>
				<td CLASS="cell" VALIGN="TOP"><input CLASS="<%=css%>"
					onFocus="Highlight(this)" onBlur="UnHighlight(this)"
					NAME="AccountNo" size=12 maxlength=10
					value="<%=person.getAccountNo()%>"></td>
			</tr>
			<%
			}
			if(regType.getAskChildren() && !isSpouse){
					%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT">Number of children you are bringing</td>
				<td CLASS="cell"><select name="kids">
					<%
					for(int i = 0; i <= 10; i++){	%>
					<option VALUE="<%=i%>"
						<%=String.valueOf(i).equals(ar.getValue("kids")) ? "SELECTED" : ""%>><%=i%></option>
					<%
					}
			%>
				</select></td>
			</tr>
			<%
			}
			if((regType.decodeProfile(6) >= 1) ||
				(regType.decodeProfile(7) >= 1) ||
				(regType.decodeProfile(8) >= 1) ||
				(regType.decodeProfile(9) >= 1)) {
			%>
			<tr>
				<td CLASS="subboxheader" COLSPAN="2">School Info</td>
			</tr>
			<%
			}
			if(regType.decodeProfile(6) >= 1){
				String css = regType.decodeProfile(6) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Campus</td>
				<td CLASS="cell"><input CLASS="<%=css%>"
					onClick="return overlib('To input a campus you must click Find Campus');"
					onFocus="return overlib('To input a campus you must click Find Campus');"
					onMouseOut="return nd();" NAME="Campus" size=40 maxlength=128
					value="<%=person.getCampus()%>" READONLY> <a class="button"
					href="javascript:popupWindow('/crs/campuslist.jsp','Help','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=400,width=510,height=400'%20)">Find
				Campus</a></td>
			</tr>
			<%
			}
			if(regType.decodeProfile(7) >= 1){
				String css = regType.decodeProfile(7) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Year In School</td>
				<td CLASS="cell"><%
										selYIS.setRequired(css);
										selYIS.setName("YearInSchool");
										if(person.getYearInSchool() != null)
											selYIS.setCurrentValue(person.getYearInSchool());
							%> <%=selYIS.print()%></td>
			</tr>
			<%
			}
			if(regType.decodeProfile(8) >= 1){
				String css = regType.decodeProfile(8) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Graduation Date<br>
				<i>(month and year)</i></td>
				<td CLASS="cell" VALIGN="TOP"><input CLASS="<%=css%>"
					onFocus="Highlight(this)" onBlur="UnHighlight(this)"
					NAME="GraduationDate" size=10 maxlength=50
					value="<%=person.getGraduationDate()%>"></td>
			</tr>
			<%
			}
			if(regType.decodeProfile(9) >= 1){
				String css = regType.decodeProfile(9) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Greek Affiliation</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="GreekAffiliation" size=20
					maxlength=50 value="<%=person.getGreekAffiliation()%>"></td>
			</tr>
			<%
			}
			
			if(!isSpouse){
			
			if((regType.decodeProfile(2) >= 1) ||
				(regType.decodeProfile(3) >= 1)) {
			%>
			<tr>
				<td CLASS="subboxheader" COLSPAN="2">Current Contact Info</td>
			</tr>
			<%
			}
			if(regType.decodeProfile(2) >= 1){
				String css = regType.decodeProfile(2) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address 1</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="Address1" size=20 maxlength=35
					value="<%=person.getAddress1()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address 2</td>
				<td CLASS="cell"><input CLASS="empty" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="Address2" size=20 maxlength=35
					value="<%=person.getAddress2()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">City</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="City" size=20 maxlength=30
					value="<%=person.getCity()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">State</td>
				<td CLASS="cell"><%
										selState.setName("State");
										selState.setRequired("empty");
										if(person.getState() != null)
											selState.setCurrentValue(person.getState());
							%> <%=selState.print()%></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Zip</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="Zip" size=10 maxlength=10
					value="<%=person.getZip()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Country</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="Country" size=20 maxlength=50
					value="<%=person.getCountry()%>"></td>
			</tr>
			<%
			}
			if(regType.decodeProfile(3) >= 1){
				String css = regType.decodeProfile(3) == 2 ? "required" : "empty";
					%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Phone</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="HomePhone" size=10 maxlength=24
					value="<%=person.getHomePhone()%>"></td>
			</tr>
			<%
			}
			if((regType.decodeProfile(4) >= 1) ||
				(regType.decodeProfile(5) >= 1)) {
					%>
			<tr>
				<td CLASS="subboxheader" COLSPAN="2">Permanent Contact Info</td>
			</tr>
			<%
			}
			if(regType.decodeProfile(4) >= 1){
				String css = regType.decodeProfile(4) == 2 ? "required" : "empty";
					%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address 1</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="PermanentAddress1" size=20
					maxlength=35 value="<%=person.getPermanentAddress1()%>"> <%
				if(regType.decodeProfile(2) >= 1){
						%> <a HREF="javascript: copyCurrent()" CLASS="button">Copy
				Current Address to Permanent Address</a> <%
											}
							%></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Address 2</td>
				<td CLASS="cell"><input CLASS="empty" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="PermanentAddress2" size=20
					maxlength=35 value="<%=person.getPermanentAddress2()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">City</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="PermanentCity" size=20
					maxlength=30 value="<%=person.getPermanentCity()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">State</td>
				<td CLASS="cell"><%
										selState.setName("PermanentState");
										selState.setRequired("empty");
										if(person.getPermanentState() != null)
											selState.setCurrentValue(person.getPermanentState());
							%> <%=selState.print()%></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Zip</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="PermanentZip" size=10 maxlength=10
					value="<%=person.getPermanentZip()%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Country</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="PermanentCountry" size=20
					maxlength=50 value="<%=person.getPermanentCountry()%>"></td>
			</tr>
			<%
			}
			if(regType.decodeProfile(5) >= 1){
				String css = regType.decodeProfile(5) == 2 ? "required" : "empty";
					%>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Phone</td>
				<td CLASS="cell"><input CLASS="<%=css%>" onFocus="Highlight(this)"
					onBlur="UnHighlight(this)" NAME="PermanentPhone" size=10
					maxlength=24 value="<%=person.getPermanentPhone()%>"></td>
			</tr>
			<%
			}
			}
			if(regType.decodeProfile(10) >= 1) {
				String css = regType.decodeProfile(10) == 2 ? "required" : "empty";
			%>
			<tr>
				<td CLASS="subboxheader" COLSPAN="2">Travel Plans</td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Arrival Date</td>
				<td CLASS="cell"><input CLASS="<%=css%>" NAME="ArriveDate" SIZE=10
					MAXLENGTH=10 onFocus="Highlight(this)" onBlur="UnHighlight(this)"
					value="<%=formatter.formatDate(registration.getArriveDate() == null ? regType.getDefaultDateArrive() : registration.getArriveDate())%>"></td>
			</tr>
			<tr>
				<td CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Departure Date</td>
				<td CLASS="cell"><input CLASS="<%=css%>" NAME="LeaveDate" SIZE=10
					MAXLENGTH=10 onFocus="Highlight(this)" onBlur="UnHighlight(this)"
					value="<%=formatter.formatDate(registration.getLeaveDate() == null ? regType.getDefaultDateLeave() : registration.getLeaveDate())%>"></td>
			</tr>
			<%
			}
					%>
			<tr>
				<%
						if(isSpouse){
						%>
				<td CLASS="button" ALIGN="LEFT"><a
					HREF="/servlet/CRSRegister?action=listMerchandise" CLASS="button">&lt;
				&lt; Back</a></td>
				<%
						} else {
						%>
				<td CLASS="button" ALIGN="LEFT">&nbsp;</td>
				<%
						}
						%>
				<td CLASS="button" ALIGN="RIGHT"><a
					HREF="javascript: goNext('savePersonDetails')" CLASS="button">Next
				&gt; &gt;</a></td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
<%@ include file="/crs/e_user_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
