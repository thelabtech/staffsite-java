<%@ page import="java.util.*" %>

<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="htmlbox" class="org.alt60m.html.Box"/>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<%
	//box.setSubSpace("0");
	//box.setSubPad("3");
	//box.setSuperPad("1");
	//box.setTableInside(true);
	htmlbox.setBorderColor("#336699");
	htmlbox.setBodyColor("#336699");
	htmlbox.setColor("#D0DDEA");
	
%>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<html>
<head>
<title>Uber Allocation</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<SCRIPT LANGUAGE="JavaScript">
		<!--
		function validate(what) {
			if (what.value.length > 1024) {
				alert("You've reached the max size for this field!");
				what.value = what.value.substring(0,1024);
				what.select();
				return false;
			}
			else{
				return true;
			}
		}

		function validate() {
			failed = false;

			errorMessage = "The following fields must be multiples of 100:\n";
			if(document.myForm.LocallyRaised.value % 100 != 0) {
				failed = true;
				errorMessage = errorMessage + "\n Locally Raised";
			}
			if(document.myForm.ForerunnerAllotment.value % 100 != 0) {
				failed = true;
				errorMessage = errorMessage + "\n Forerunner Allotment";
			}
			if(document.myForm.RegionalAllotment.value % 100 != 0) {
				failed = true;
				errorMessage = errorMessage + "\n Regional Allotment";
			}
			if(document.myForm.NatlDonation.value % 100 != 0) {
				failed = true;
				errorMessage = errorMessage + "\n National Donation";
			}
			if(document.myForm.ImpactAllotment.value % 100 != 0) {
				failed = true;
				errorMessage = errorMessage + "\n Impact Allotment";
			}
			if (failed) {
				alert(errorMessage);
				return false;
			}
			
			errorMessage = "You didn't enter the following required fields:\n";
			if (!(document.myForm.LocallyRaised.value == "0" || document.myForm.LocallyRaised.value == "")) {
				emptyCheck(document.myForm.LocalAcctNo1,"Business Unit.");
				emptyCheck(document.myForm.LocalAcctNo2,"Operating Unit.");
				emptyCheck(document.myForm.LocalAcctNo3,"Department.");
			}
			if (failed) {
				alert(errorMessage);
				return false;
			} else {
				return true;
			}
		}

		// -->
		</SCRIPT>
</head>
<% String pageTitle = "Allocation"; %>
<%@ include file="/fsk/fskheader.jspf"%>

<body>
<TABLE WIDTH="90%" BORDER="0" CELLPADDING="1" CELLSPACING="0">
	<TR>
		<TD>
			<br><%=fontB%><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("fname")%>&nbsp;<%=request.getParameter("lname")%></FONT></h3>
		</TD>
	</TR>
	<TR>
	<TD>
	<%=htmlbox.printTop()%>
		<form action="/servlet/FskController" method="post" name="myForm" onSubmit="return validate()">
		<input type="hidden" name="action" value="saveAlloc">
		<input type="hidden" name="FirstName" value="<%=request.getParameter("fname")%>">
		<input type="hidden" name="LastName" value="<%=request.getParameter("lname")%>">
		<%if (request.getParameter("id") != null) {%><input type="hidden" name="AllocationID" value="<%=request.getParameter("id")%>"><%}%>
		<input type="hidden" name="AccountNo" value="<%=request.getParameter("accountno")%>">
		<table>
		<TR>
			<TD align="right" valign="top" width=28%>&nbsp;</td>
			<td><%=fontB%>Please enter your region below:</font></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Your Region:</font></td>
			<td><%
			selRegion.setName("Region"); 
			if (h.get("Region")!=null){ selRegion.setCurrentValue((String)h.get("Region"));} %>
			<%=selRegion.print()%>
			</td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=28%>&nbsp;</td>
			<td><%=fontB%>*For kit allotments, do NOT use commas or letters. Enter numbers only.</font></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Nationally Donated:</font></td>
			<td><input type="type" name="NatlDonation" value="<%=formHelp.value((String)h.get("NatlDonation"))%>"></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>National Notes:</font></td>
			<td><textarea name="NatlNotes" cols="50" rows="3" onKeyUp="validate(this)"><%=formHelp.value((String)h.get("NatlNotes"))%></textarea></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></td>
			<td></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Impact Allotment:</font></td>
			<td><input type="type" name="ImpactAllotment" value="<%=formHelp.value((String)h.get("ImpactAllotment"))%>"></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Impact Notes:</font></td>
			<td><textarea name="ImpactNotes" cols="50" rows="3" onKeyUp="validate(this)"><%=formHelp.value((String)h.get("ImpactNotes"))%></textarea></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></td>
			<td></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Forerunner Allotment:</font></td>
			<td><input type="type" name="ForerunnerAllotment" value="<%=formHelp.value((String)h.get("ForerunnerAllotment"))%>"></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Forerunner Notes:</font></td>
			<td><textarea name="ForerunnerNotes" cols="50" rows="3" onKeyUp="validate(this)"><%=formHelp.value((String)h.get("ForerunnerNotes"))%></textarea></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></td>
			<td></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Regional Allotment:</font></td>
			<td><input type="type" name="RegionalAllotment" value="<%=formHelp.value((String)h.get("RegionalAllotment"))%>"></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Regionally Raised: </font></td>
			<td><input type="type" name="RegionallyRaised" value="<%=formHelp.value((String)h.get("RegionallyRaised"))%>"></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Regional Notes:</font></td>
			<td><textarea name="RegNotes" cols="50" rows="3" onKeyUp="validate(this)"><%=formHelp.value((String)h.get("RegNotes"))%></textarea></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></td>
			<td></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Locally Raised:</font></td>
			<td><input type="type" name="LocallyRaised" value="<%=formHelp.value((String)h.get("LocallyRaised"))%>" ></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Local Notes:</font></td>
			<td><textarea name="LocalNotes" cols="50" rows="3" onKeyUp="validate(this)"><%=formHelp.value((String)h.get("LocalNotes"))%></textarea></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></td>
			<td></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></TD>
			<TD align="left"><%=fontB%>Please enter the local campus chartfield combination for locally raised kits:</td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Business Unit:</TD>
			<TD><input type="type" name="LocalAcctNo1" value="<%=formHelp.value((String)h.get("LocalAcctNo1"))%>" ></TD>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Operating Unit:</TD>
			<TD><input type="type" name="LocalAcctNo2" value="<%=formHelp.value((String)h.get("LocalAcctNo2"))%>" ></TD>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Department:</TD>
			<TD><input type="type" name="LocalAcctNo3" value="<%=formHelp.value((String)h.get("LocalAcctNo3"))%>" ></TD>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Project ID:</TD>
			<TD><input type="type" name="LocalAcctNo4" value="<%=formHelp.value((String)h.get("LocalAcctNo4"))%>" ></TD>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></td>
			<td><input type="submit" value="Save"></td>
		</TR>
		</table>
		</form>
	<%=htmlbox.printBottom()%>
	</TD>
	</TR>
</TABLE>

<%@ include file="/footer.jspf" %>
</body>
</html>
