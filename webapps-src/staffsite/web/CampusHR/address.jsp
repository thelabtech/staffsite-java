<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<jsp:useBean id="mySelectS" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="mySelectC" class="org.alt60m.html.SelectCountry"/>
<jsp:useBean id="mySelectS2" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="mySelectC2" class="org.alt60m.html.SelectCountry"/>
<%
	Hashtable staffInfo = (Hashtable)session.getValue("staffInfo");
	String lastName = "";
	String firstName = "";
	String preferredName = "";
	String middleInitial = "";
	String ssn = "";
	String spouseFirstName = "";
	String ministry = "";
	String accountNo = "";
	String homePhone = "";
	String workPhone = "";
	String email = "";
	String spouseEmail = "";
	String primaryEmpLocState = "";
	String primaryEmpLocCity =  "";
	String primaryEmpLocCountry = "";
	String jobStatus = "";
	Hashtable primaryAddress = null;
	String countryStatus = "";
	if (staffInfo != null) {
		lastName = (String)staffInfo.get("LastName");
		firstName = (String)staffInfo.get("FirstName");
		preferredName = (String)staffInfo.get("PreferredName");
		middleInitial = (String)staffInfo.get("MiddleInitial");
		spouseFirstName = (String)staffInfo.get("SpouseFirstName");
		accountNo = (String)staffInfo.get("AccountNo");
		ministry = (String)staffInfo.get("Ministry");
		ssn = (String)staffInfo.get("Ssn");
		homePhone = (String)staffInfo.get("HomePhone");
		workPhone = (String)staffInfo.get("WorkPhone");
		email = (String)staffInfo.get("Email");
		spouseEmail = (String)staffInfo.get("SpouseEmail");
		primaryEmpLocState = (String)staffInfo.get("PrimaryEmpLocState");
		primaryEmpLocCity = (String)staffInfo.get("PrimaryEmpLocCity");
		primaryEmpLocCountry = (String)staffInfo.get("PrimaryEmpLocCountry");
		primaryAddress = (Hashtable)staffInfo.get("primaryAddress");
		countryStatus = (String)staffInfo.get("CountryStatus");
		jobStatus = (String)staffInfo.get("JobStatus");
	}

//	primaryAddress = session.getValue("primaryAddress");

	String primaryAddress1 = "";
	String primaryAddress2 = "";
	String primaryAddress3 = "";
	String primaryAddress4 = "";
	String primaryCity = "";
	String primaryState = "";
	String primaryZip = "";
	String primaryCounty = "";
	String primaryCountry = "";
	if (primaryAddress != null) {
		primaryAddress1 = (String)primaryAddress.get("Address1");
		primaryAddress2 = (String)primaryAddress.get("Address2");
		primaryAddress3 = (String)primaryAddress.get("Address3");
		primaryAddress4 = (String)primaryAddress.get("Address4");
		primaryCity = (String)primaryAddress.get("City");
		primaryState = (String)primaryAddress.get("State");
		primaryZip = (String)primaryAddress.get("Zip");
		primaryCountry = (String)primaryAddress.get("Country");
		// primaryCounty = (String)primaryAddress.get("County");
	}
	mySelectC.setCurrentValue(primaryCountry);
	mySelectC.setName("primaryCountry");
	mySelectS.setCurrentValue(primaryState);
	mySelectS.setName("primaryState");
	mySelectC2.setCurrentValue(primaryEmpLocCountry);
	mySelectC2.setName("emplCountry");
	mySelectS2.setCurrentValue(primaryEmpLocState);
	mySelectS2.setName("emplState");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<SCRIPT LANGUAGE="JavaScript">
<!--

function addressVerify(form) {
	var isValid = true;

	if(document.addressForm.addrChangeType[0].checked) {
		isValid = verifyInput(document.addressForm.effectiveMonth, document.addressForm.effectiveDay, document.addressForm.effectiveYear);
		if(isValid == false) {
			alert("You must provide the effective date.");
		}
	}

	else if(document.addressForm.addrChangeType[1].checked) {
		isValid = verifyInput(document.addressForm.beginMonth, document.addressForm.beginDay, document.addressForm.beginYear, document.addressForm.endMonth, document.addressForm.endDay, document.addressForm.endYear);
		if(!isValid) {
			alert("You must provide the beginning and ending dates.");
		} 
		else {
			isValid = (isValid && ((((document.addressForm.endYear.value - document.addressForm.beginYear.value)*365) + ((document.addressForm.endMonth.value - document.addressForm.beginMonth.value)*31) + (document.addressForm.endDay.value - document.addressForm.beginDay.value)) < 93));
			if(!isValid) {
				alert("End date is more than 3 months after begin date.");
			}
		}
	}
	if(isValid) {
	  if(document.addressForm.addrChangeType[1].checked || document.addressForm.addrChangeType[0].checked) {
			isValid = (isValid && verifyInput(document.addressForm.primaryStreet1, document.addressForm.primaryCity, document.addressForm.primaryZip) && ((document.addressForm.primaryCountry.value=="USA" && verifyInput(document.addressForm.primaryState)) || document.addressForm.primaryCountry.value!="USA"));
		}
		if(!isValid) {
			alert("You must provide your new complete address, including street address, city, zip, and state (if USA).");
		}
	}

	if(isValid) {
		isValid = (isValid && ((document.addressForm.emplCountry.value!="USA") || (((!verifyInput(document.addressForm.emplCity) && !verifyInput(document.addressForm.emplState) && !verifyInput(document.addressForm.emplCountry)) || (verifyInput(document.addressForm.emplCity) && verifyInput(document.addressForm.emplState) && verifyInput(document.addressForm.emplCountry))))));
		if(!isValid) {
			alert("You must provide City, State, and Country for primary work location.");
		}
	}
	if(isValid) {
		if(verifyInput(document.addressForm.email)) {
			isValid = (document.addressForm.email.value.indexOf("@uscm.org") > 0);
		}
	  if(verifyInput(document.addressForm.spouseEmail)) {
			isValid = (isValid && (document.addressForm.spouseEmail.value.indexOf("@uscm.org") > 0));
		}
		if(!isValid) {
			alert("E-mail addresses must be uscm.org E-mail addresses.");
		}
	}

	if(isValid) {
		if((document.addressForm.primaryStreet1.value != document.addressForm.primaryStreet1Old.value) ||   	
			 (document.addressForm.primaryStreet2.value != document.addressForm.primaryStreet2Old.value) ||
			 (document.addressForm.primaryStreet3.value != document.addressForm.primaryStreet3Old.value) ||
			 (document.addressForm.primaryStreet4.value != document.addressForm.primaryStreet4Old.value) ||
			 (document.addressForm.primaryCity.value != document.addressForm.primaryCityOld.value) ||
			 (document.addressForm.primaryState.value != document.addressForm.primaryStateOld.value) ||
			 (document.addressForm.primaryZip.value != document.addressForm.primaryZipOld.value) ||
			 (document.addressForm.primaryCountry.value != document.addressForm.primaryCountryOld.value) ||
			 (document.addressForm.workPhone.value != document.addressForm.workPhoneOld.value) ||
			 (document.addressForm.homePhone.value != document.addressForm.homePhoneOld.value))

				isValid = (document.addressForm.addrChangeType[0].checked || document.addressForm.addrChangeType[1].checked);
		if(!isValid) {
			alert("You must choose either permanent or temporary change.");
		}
	}

	if (isValid) {
			if(document.addressForm.addrChangeType[0].checked) {
				isValid = validateDate(document.addressForm.effectiveMonth, document.addressForm.effectiveDay, document.addressForm.effectiveYear); // added 6/17/02 RDH
			}
			else if(document.addressForm.addrChangeType[1].checked) {
				isValid = validateDate(document.addressForm.beginMonth, document.addressForm.beginDay, document.addressForm.beginYear); // added 6/17/02 RDH
				if(!isValid) {
					isValid = validateDate(document.addressForm.endMonth, document.addressForm.endDay, document.addressForm.endYear); // added 6/17/02 RDH
				}
			}
		if (!isValid){ alert("Invalid date. Please re-enter it.\nDates are in the format mm/dd/yyyy\nValid years are between 1970 and 2037."); } // added 6/17/02 RDH
	}
	
	return isValid;
}
// -->
</SCRIPT>
<TITLE> Address Change Form </TITLE>
<%@ include file="hrheader.jspf" %>
<FORM NAME="addressForm" ACTION="/servlet/HRUpdateController?action=addressChangeRequest" METHOD="POST" onSubmit="return addressVerify(document.addressForm)">
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Address Change Form</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="98%">
		<TR>
			<TD>
				<B>Name</B>:&nbsp;&nbsp;
			</TD>
			<TD>
				<NOBR><%=lastName%>,&nbsp;<%=preferredName%>&nbsp;<%=middleInitial%>&nbsp;&nbsp;</NOBR>
			</TD>
			<TD ALIGN=CENTER WIDTH="90%">
				<NOBR><B>Status:</B>&nbsp;<%= jobStatus %></NOBR>
			</TD>
			<TD>
				<NOBR>&nbsp;<B>Account Number</B>:&nbsp;<%=accountNo%></NOBR>
			</TD>
		</TR>
	</TABLE>
<TABLE ALIGN="CENTER" WIDTH="98%" BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR><TD><NOBR><B>Spouse Name</B>:&nbsp;&nbsp;</NOBR></TD><TD><%=spouseFirstName%>&nbsp;&nbsp;</TD><TD WIDTH="90%" ALIGN="CENTER"><B>Ministry</B>:&nbsp;&nbsp;<%=ministry%>&nbsp;</TD><TD><NOBR><B>Location</B>:&nbsp;<SELECT NAME="countryStatus" CLASS="small"><OPTION VALUE="U.S.">U.S.</OPTION><OPTION VALUE="Intl" <% if (countryStatus != null && countryStatus.equals("Intl")) {%>SELECTED<%}%>>International</OPTION></SELECT></NOBR></TD></TR>
</TABLE>

<TABLE WIDTH="100%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;New Address Information</TD></TR></TABLE>

<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR>
	<TD>
		<INPUT TYPE="radio" NAME="addrChangeType" VALUE="Permanent" CLASS="noborder" CHECKED><NOBR>&nbsp;Permanent Change:&nbsp;&nbsp;</NOBR>
	</TD>
	<TD>
		Effective: 
	</TD>
	<TD>
		<NOBR><INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="effectiveMonth" onKeyUp="KeyPress(this,event,2,'addressForm.effectiveDay.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="effectiveDay" onKeyUp="KeyPress(this,event,2,'addressForm.effectiveYear.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="4" NAME="effectiveYear" onKeyUp="KeyPress(this,event,4,'addressForm.primaryStreet1.focus()')">&nbsp;&nbsp;</NOBR>
	</TD>
	<TD ROWSPAN="5" ALIGN="LEFT" CLASS="address">
		<INPUT TYPE="hidden" NAME="primaryStreet1Old" VALUE="<%=primaryAddress1%>">
		<INPUT TYPE="hidden" NAME="primaryStreet2Old" VALUE="<%=primaryAddress2%>">
		<INPUT TYPE="hidden" NAME="primaryStreet3Old" VALUE="<%=primaryAddress3%>">
		<INPUT TYPE="hidden" NAME="primaryStreet4Old" VALUE="<%=primaryAddress4%>">
		<INPUT TYPE="hidden" NAME="primaryCityOld" VALUE="<%=primaryCity%>">
		<INPUT TYPE="hidden" NAME="primaryStateOld" VALUE="<%=primaryState%>">
		<INPUT TYPE="hidden" NAME="primaryZipOld" VALUE="<%=primaryZip%>">
		<INPUT TYPE="hidden" NAME="primaryCountryOld" VALUE="<%=primaryCountry%>">
		<INPUT TYPE="hidden" NAME="workPhoneOld" VALUE="<%=workPhone%>">
		<INPUT TYPE="hidden" NAME="homePhoneOld" VALUE="<%=homePhone%>">


		&nbsp;&nbsp;Street Address 1: <INPUT TYPE="text" SIZE="30" NAME="primaryStreet1" VALUE="<%=primaryAddress1%>"><BR>
		&nbsp;&nbsp;Street Address 2: <INPUT TYPE="text" SIZE="30" NAME="primaryStreet2" VALUE="<%=primaryAddress2%>"><BR>
		&nbsp;&nbsp;Street Address 3: <INPUT TYPE="text" SIZE="30" NAME="primaryStreet3" VALUE="<%=primaryAddress3%>"><BR>
		&nbsp;&nbsp;Street Address 4: <INPUT TYPE="text" SIZE="30" NAME="primaryStreet4" VALUE="<%=primaryAddress4%>"><BR>
		&nbsp;&nbsp;City:&nbsp;<INPUT TYPE="text" SIZE="15" NAME="primaryCity" VALUE="<%=primaryCity%>">&nbsp;&nbsp;State: <%= mySelectS.print() %><BR><NOBR><!--&nbsp;County: <INPUT TYPE="text" NAME="primaryCounty" VALUE="<%=primaryCounty%>">
		&nbsp;-->&nbsp;Zip:&nbsp;<INPUT TYPE="text" SIZE="10" MAXLENGTH="10" NAME="primaryZip" VALUE="<%=primaryZip%>"></NOBR>&nbsp;Country:&nbsp;<%= mySelectC.print() %><BR>
		<NOBR>&nbsp;&nbsp;Home Phone:&nbsp;<INPUT TYPE="text" NAME="homePhone" SIZE="10" VALUE="<%=homePhone%>">&nbsp;Work Phone:&nbsp; <INPUT TYPE="text" NAME="workPhone" SIZE="10" VALUE="<%=workPhone%>"></NOBR><BR>
		<NOBR>&nbsp;&nbsp;School District (Ohio residents only):&nbsp;<INPUT TYPE="text" NAME="schoolDistrict" SIZE="20">&nbsp;</NOBR>
	</TD>
</TR>
<TR>
	<TD>
		<INPUT TYPE="radio" NAME="addrChangeType" VALUE="Temporary" CLASS="noborder"><NOBR>&nbsp;Temporary Change:&nbsp;&nbsp;</NOBR>
	</TD>
	<TD>
		Beginning: 
	</TD>
	<TD>
		<NOBR><INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="beginMonth" onKeyUp="KeyPress(this,event,2,'addressForm.beginDay.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="beginDay" onKeyUp="KeyPress(this,event,2,'addressForm.beginYear.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="4" NAME="beginYear" onKeyUp="KeyPress(this,event,4,'addressForm.endMonth.focus()')">&nbsp;&nbsp;</NOBR>
	</TD>
</TR>
<TR>
	<TD></TD>
	<TD>
		Ending: 
	</TD>
	<TD>
		<NOBR><INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="endMonth" onKeyUp="KeyPress(this,event,2,'addressForm.endDay.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="endDay" onKeyUp="KeyPress(this,event,2,'addressForm.endYear.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="4" NAME="endYear" onKeyUp="KeyPress(this,event,4,'addressForm.primaryStreet1.focus()')">&nbsp;&nbsp;</NOBR>
	</TD>
</TR>
<TR>
	<TD COLSPAN="3">
		<NOBR>&nbsp;&nbsp; Because of: <INPUT TYPE="radio" CLASS="noborder" NAME="addressReason" VALUE="Job"> Job Change &nbsp;&nbsp; <INPUT TYPE="radio" NAME="addressReason" CLASS="noborder" VALUE="Support"> Support Raising</NOBR>
	</TD>
</TR>
<TR>
	<TD COLSPAN="3">
		<TABLE BORDER="0" CELLPADDING=0 CELLSPACING=0><TR><TD>
		&nbsp;Address Type:&nbsp;
		</TD>
		<TD>
			<INPUT TYPE="radio" CLASS="noborder" NAME="addressType" VALUE="Residence" CHECKED> Residence<BR>
			<INPUT TYPE="radio" CLASS="noborder" NAME="addressType" VALUE="Payroll"> Payroll Only<BR>
			<INPUT TYPE="radio" CLASS="noborder" NAME="addressType" VALUE="All Mail"> All Mail - (Must be U.S. Address)
		</TD></TR></TABLE>
	</TD>
</TR>
</TABLE>
<TABLE WIDTH="98%" BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR>
	<TD>
		<NOBR>&nbsp;Primary location of employment:&nbsp;</NOBR><BR><SPAN CLASS="label"><I>&nbsp;(Required for taxation purposes)</I></SPAN>
	</TD>
	<TD>
		City:&nbsp;<INPUT TYPE="text" NAME="emplCity" SIZE="10" VALUE="<%=primaryEmpLocCity%>">&nbsp;<!--County:&nbsp;<INPUT TYPE="text" NAME="emplCounty" SIZE="10">-->&nbsp;State:&nbsp;<%= mySelectS2.print() %><BR>
		Country:&nbsp;<%= mySelectC2.print() %>
	</TD>
	<TD ALIGN="RIGHT">
		<NOBR>&nbsp;Email address:&nbsp;<INPUT TYPE="text" NAME="email" SIZE="25" VALUE="<%=email%>">&nbsp;</NOBR><BR>
		<NOBR>Spouse Email:&nbsp;<INPUT TYPE="text" NAME="spouseEmail" SIZE="25" VALUE="<%=spouseEmail%>">&nbsp;</NOBR>
	</TD>
</TR>
<TR>
	<TD COLSPAN="3">
		&nbsp;&nbsp;&nbsp;<INPUT TYPE="radio" CLASS="noborder" NAME="intlAssign" VALUE="depart"> I am departing for an International assignment.<BR>
		&nbsp;&nbsp;&nbsp;<INPUT TYPE="radio" CLASS="noborder" NAME="intlAssign" VALUE="return"> I am returning from an International assignment.
	</TD>
</TR>
<TR><TD COLSPAN="3" CLASS="label"><P ALIGN="CENTER">&nbsp;If your primary work location has changed due to a transfer, your <B>HR director</B> must<br>&nbsp;submit an administrative change of status form or your paycheck may not be produced correctly.</TD></TR>
</TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0"><TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" CLASS="button" VALUE="Next >>">&nbsp;</TD></TR></TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>