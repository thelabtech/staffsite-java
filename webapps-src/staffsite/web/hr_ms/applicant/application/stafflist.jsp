<%@ page import="org.alt60m.servlet.*, javax.xml.transform.*, java.net.*, java.util.*, javax.xml.transform.stream.*"%>



<%
	// check input string / form data for "skin" info
	String ssurl = request.getParameter("ssurl");
	if (ssurl == null || ssurl.trim().equals("")) {
		ssurl = (String)session.getValue("ssurl");
		if (ssurl == null || ssurl.trim().equals("")) ssurl = "/hr_ms/themes/ussp.css";
	}
	String firstName = request.getParameter("firstName");
	String preferredName = request.getParameter("preferredName");
	String lastName = request.getParameter("lastName");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	// ensure all are not null, for easier JSP programming
	if (firstName == null)
		firstName = "";
	if (lastName == null)
		lastName = "";
	if (preferredName == null)
		preferredName = "";
	if (city == null)
		city = "";
	if (state == null)
		state = "";
	String WsnApplicationID = request.getParameter("WsnApplicationID");
	String refType = request.getParameter("refType");
	String header = "Peer Reference";
	if (refType.equals("S1"))
		header = "Spiritual Leader Reference #1";
	else if (refType.equals("S2"))
		header = "Spiritual Leader Reference #2";

%>

<html>
<head>
<title>Staff Selector</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="<%=ssurl%>" type="text/css"> <!--NN4 Compatible sheet -->
<style type="text/css">
@import url(<%=ssurl%>); /*IE and NN6x styles*/
</style>

<SCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
<!--
function updateReference(refType, accountNo) {
	// set the NewStaffNumber field. If one of these NewStaffNumber fields is not empty,
	// appFormSave(), will create a new reference record for that ref (P, S1, S2) for that staff number.
	if (refType == "P") {
	    opener.document.appForm.RefpNewStaffNumber.value = accountNo;
	} else if (refType == "S1") {
	    opener.document.appForm.Refs1NewStaffNumber.value = accountNo;
	} if (refType == "S2") {
	    opener.document.appForm.Refs2NewStaffNumber.value = accountNo;
	}
	opener.document.appForm.action.value = "appFormSave";
	opener.document.appForm.nextAction.value = "goToView";
	opener.document.appForm.nextParm.value = "reference";
	opener.document.appForm.submit();
    self.close();
}
//-->
</script>
</head>


<body bgcolor="#FFFFFF" text="#000033" link="#ff6600">
<table width="100%" border="0" cellpadding="0" align="center">
	<tr>
		<td align='center'>
			<big>
				<big><big>Staff Selector</big></big><BR>
				<%=header%>
			</big>
		</td>
	</tr>
	<tr>
		<td align='left'>
			<form NAME="selectstaff" METHOD=POST ACTION="stafflist.jsp">
				<INPUT TYPE="hidden" NAME="refType" value='<%=refType%>'>
				<table width="400" border="3" cellpadding="0" align="center" class='app'>
					<tr>
						<td colspan='2' align=center>
							(Capitalization is ignored.  You may enter partial names.)
						</td>
					</tr>
					<tr>
						<td align='right'>
							First Name:
						</td>
						<td>
							<INPUT TYPE="text" NAME="firstName" size=20 maxlength=20 value='<%=firstName%>'>
						</td>
					</tr>
					<tr>
						<td align='right'>
							Preferred Name:
						</td>
						<td>
							<INPUT TYPE="text" NAME="preferredName" size=20 maxlength=20 value='<%=preferredName%>'>
						</td>
					</tr>
					<tr>
						<td align='right'>
							Last Name:
						</td>
						<td>
							<INPUT TYPE="text" NAME="lastName" size=20 maxlength=20 value='<%=lastName%>'> (required)
						</td>
					</tr>
					<tr>
						<td align='right'>
							City:
						</td>
						<td>
							<INPUT TYPE="text" NAME="city" size=20 maxlength=20 value='<%=city%>'>
						</td>
					</tr>
					<tr>
						<td align='right'>
							State:
						</td>
						<td>
							<select name=state>
								<option value="" selected></option>
								<option value="AL" <%=state.equals("AL")?"selected":""%>>Alabama </option>
								<option value="AK" <%=state.equals("AK")?"selected":""%>>Alaska </option>
								<option value="AZ" <%=state.equals("AZ")?"selected":""%>>Arizona </option>
								<option value="AR" <%=state.equals("AR")?"selected":""%>>Arkansas </option>
								<option value="CA" <%=state.equals("CA")?"selected":""%>>California </option>
								<option value="CO" <%=state.equals("CO")?"selected":""%>>Colorado </option>
								<option value="CT" <%=state.equals("CT")?"selected":""%>>Connecticut </option>
								<option value="DE" <%=state.equals("DE")?"selected":""%>>Delaware </option>
								<option value="FL" <%=state.equals("FL")?"selected":""%>>Florida </option>
								<option value="GA" <%=state.equals("GA")?"selected":""%>>Georgia </option>
								<option value="HI" <%=state.equals("HI")?"selected":""%>>Hawaii </option>
								<option value="ID" <%=state.equals("ID")?"selected":""%>>Idaho </option>
								<option value="IL" <%=state.equals("IL")?"selected":""%>>Illinois </option>
								<option value="IN" <%=state.equals("IN")?"selected":""%>>Indiana </option>
								<option value="IA" <%=state.equals("IA")?"selected":""%>>Iowa </option>
								<option value="KS" <%=state.equals("KS")?"selected":""%>>Kansas </option>
								<option value="KY" <%=state.equals("KY")?"selected":""%>>Kentucky </option>
								<option value="LA" <%=state.equals("LA")?"selected":""%>>Louisiana </option>
								<option value="ME" <%=state.equals("ME")?"selected":""%>>Maine </option>
								<option value="MD" <%=state.equals("MD")?"selected":""%>>Maryland </option>
								<option value="MA" <%=state.equals("MA")?"selected":""%>>Massachusetts </option>
								<option value="MI" <%=state.equals("MI")?"selected":""%>>Michigan </option>
								<option value="MN" <%=state.equals("MN")?"selected":""%>>Minnesota </option>
								<option value="MS" <%=state.equals("MS")?"selected":""%>>Mississippi </option>
								<option value="MO" <%=state.equals("MO")?"selected":""%>>Missouri </option>
								<option value="MT" <%=state.equals("MT")?"selected":""%>>Montana </option>
								<option value="NE" <%=state.equals("NE")?"selected":""%>>Nebraska </option>
								<option value="NV" <%=state.equals("NV")?"selected":""%>>Nevada </option>
								<option value="NH" <%=state.equals("NH")?"selected":""%>>New Hampshire </option>
								<option value="NJ" <%=state.equals("NJ")?"selected":""%>>New Jersey </option>
								<option value="NM" <%=state.equals("NM")?"selected":""%>>New Mexico </option>
								<option value="NY" <%=state.equals("NY")?"selected":""%>>New York </option>
								<option value="NC" <%=state.equals("NC")?"selected":""%>>North Carolina </option>
								<option value="ND" <%=state.equals("ND")?"selected":""%>>North Dakota </option>
								<option value="OH" <%=state.equals("OH")?"selected":""%>>Ohio </option>
								<option value="OK" <%=state.equals("OK")?"selected":""%>>Oklahoma </option>
								<option value="OR" <%=state.equals("OR")?"selected":""%>>Oregon </option>
								<option value="PA" <%=state.equals("PA")?"selected":""%>>Pennsylvania </option>
								<option value="RI" <%=state.equals("RI")?"selected":""%>>Rhode Island </option>
								<option value="SC" <%=state.equals("SC")?"selected":""%>>South Carolina </option>
								<option value="SD" <%=state.equals("SD")?"selected":""%>>South Dakota </option>
								<option value="TN" <%=state.equals("TN")?"selected":""%>>Tennessee </option>
								<option value="TX" <%=state.equals("TX")?"selected":""%>>Texas </option>
								<option value="UT" <%=state.equals("UT")?"selected":""%>>Utah </option>
								<option value="VT" <%=state.equals("VT")?"selected":""%>>Vermont </option>
								<option value="VA" <%=state.equals("VA")?"selected":""%>>Virginia </option>
								<option value="WA" <%=state.equals("WA")?"selected":""%>>Washington </option>
								<option value="DC" <%=state.equals("DC")?"selected":""%>>Washington D.C. </option>
								<option value="WV" <%=state.equals("WV")?"selected":""%>>West Virginia </option>
								<option value="WI" <%=state.equals("WI")?"selected":""%>>Wisconsin </option>
								<option value="WY" <%=state.equals("WY")?"selected":""%>>Wyoming </option>
							</select>
						</td>
					</tr>
					<tr>
						<td align='right'>
							&nbsp;
						</td>
						<td>
							<INPUT TYPE="submit" NAME="submit" value="Search">
						</td>
					</tr>
				</table>
			</form>
<%
	if(!lastName.equals("")) {		
		boolean production = (request.getServerName().endsWith("staff.campuscrusadeforchrist.com"));
		String serverName = (production ? "https://" : "http://") + request.getServerName() + (production ? "" : ":" + request.getServerPort());
		String url = serverName + "/servlet/MinistryLocatorController?action=getStaffList&"+
			"&firstName="+firstName+"&preferredName="+preferredName+"&lastName="+lastName+"&city="+city+"&state="+state+"&reftype="+refType;
		URL xmlUrl = new URL(url);
		Source xsl = new StreamSource(this.getServletConfig().getServletContext().getRealPath("/hr_ms/applicant/application/stafflist.xsl"));
		Source xml = new StreamSource(xmlUrl.toExternalForm());

//		System.setProperty("javax.xml.transform.TransformerFactory", "com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl");  //Needed for JDK 1.5.0
		TransformerFactory tFactory = TransformerFactory.newInstance();
		Transformer transformer = tFactory.newTransformer(xsl);
		transformer.transform(xml, new StreamResult(out));
%>
		<P align='center'>
		Don't see the staff member you are looking for?
		<BR>Then close this window and enter the person's contact information as a non-staff person.
		</P>
<%
	}
%>
		</td>
	</tr>
</table>
<%@ include file="/headers/google_analytics.jspf"%>
</body>
</html>

