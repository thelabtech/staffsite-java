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
<title>Enter Regional Allocation</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%@ include file="/validate.js"%>
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
<% String pageTitle = "Enter Regional Allocation"; %>
<%@ include file="/fsk/fskheader.jspf"%>

<body>
<TABLE WIDTH="90%" BORDER="0" CELLPADDING="1" CELLSPACING="0">
	<TR>
		<TD>
			<br><%=fontB%>
      <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getParameter("fname")%>&nbsp;<%=request.getParameter("lname")%></FONT></h3>
      	</TD>
	</TR>
	<TR>
	<TD>
		<form action="/servlet/FskController" method="post" name="myForm" onSubmit="return validate()">
		<input type="hidden" name="action" value="saveAlloc">
		<input type="hidden" name="FirstName" value="<%=request.getParameter("fname")%>">
		<input type="hidden" name="LastName" value="<%=request.getParameter("lname")%>">
		<%if (request.getParameter("id") != null) {%><input type="hidden" name="AllocationID" value="<%=request.getParameter("id")%>"><%}
		  else if (!formHelp.value((String)h.get("AllocationID")).equals("")) {%><input type="hidden" name="AllocationID" value="<%=formHelp.value((String)h.get("AllocationID"))%>"><%}%>
		<input type="hidden" name="AccountNo" value="<%=request.getParameter("accountno")%>">
	<%=htmlbox.printTop()%> 
        <table>
          <tr> 
            <td align="right" valign="top" width=28%>&nbsp;</td>
            <td><%=fontB%>*For kit allotments, do NOT use commas or letters. Enter 
              numbers only.</td>
          </tr>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Region:</font></td>
			<td><%
			selRegion.setName("Region"); 
			if (h.get("Region")!=null){ selRegion.setCurrentValue((String)h.get("Region"));} %>
			<%=selRegion.print()%>
			</td>
		</TR>
<!--
          <tr> 
            <td align="right" valign="top" width=20%><%=fontB%>Region:</td>
            <%
			if (!formHelp.value((String)h.get("Region")).equals("")) {
				%>
            <td><input type="hidden" name="Region" value="<%=formHelp.value((String)h.get("Region"))%>">
              <%=fontB%><%=formHelp.value((String)h.get("Region"))%></td>
            <%
			}%>
            <%
			if (formHelp.value((String)h.get("Region")).equals("")) {
				%>
            <td><input type="hidden" name="Region" value="<%=session.getValue("fskUserRegion")%>">
              <%=fontB%><%=session.getValue("fskUserRegion")%></td>
            <%
			}%>
          </tr>
-->
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Regional Allotment:</td>
            <td><input type="type" name="RegionalAllotment" value="<%=formHelp.value((String)h.get("RegionalAllotment"))%>">
              <%=fontB%> *Must be in multiples of 100.</td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Regionally Raised: 
            </td>
            <td><input type="type" name="RegionallyRaised" value="<%=formHelp.value((String)h.get("RegionallyRaised"))%>">
              <%=fontB%> *Must be in multiples of 100.</td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Regional Notes:</td>
            <td><textarea name="RegNotes" cols="50" rows="3"><%=formHelp.value((String)h.get("RegNotes"))%></textarea></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%>&nbsp;</td>
            <td></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Forerunner Allotment:</td>
            <td><input type="type" name="ForerunnerAllotment" value="<%=formHelp.value((String)h.get("ForerunnerAllotment"))%>"></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Forerunner Notes:</td>
            <td><textarea name="ForerunnerNotes" cols="50" rows="3"><%=formHelp.value((String)h.get("ForerunnerNotes"))%></textarea></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%>&nbsp;</td>
            <td></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Locally Raised:</td>
            <td><input type="type" name="LocallyRaised" value="<%=formHelp.value((String)h.get("LocallyRaised"))%>"></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Local Notes:</td>
            <td><textarea name="LocalNotes" cols="50" rows="3"><%=formHelp.value((String)h.get("LocalNotes"))%></textarea></td>
          </tr>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></td>
			<td></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></TD>
			<TD align="left"><%=fontB%>Please enter the local campus chartfield combination:</td>
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
          <tr> 
            <td align="right" valign="top" width=28%>&nbsp;</td>
            <td><input name="submit" type="submit" value="Save"></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%>&nbsp;</td>
            <td></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Nationally Donated:</td>
            <td><%=fontB%><%=formHelp.value((String)h.get("NatlDonation"))%></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>National Notes:</td>
            <td><%=fontB%><%=formHelp.value((String)h.get("NatlNotes"))%></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%>&nbsp;</td>
            <td></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Impact Allotment:</td>
            <td><%=fontB%><%=formHelp.value((String)h.get("ImpactAllotment"))%></td>
          </tr>
          <tr> 
            <td align="right" valign="top" width=28%><%=fontB%>Impact Notes:</td>
            <td><%=fontB%><%=formHelp.value((String)h.get("ImpactNotes"))%></td>
		  </tr>
        </table>
      </form>
	<%=htmlbox.printBottom()%>
	</TD>
	</TR>
</TABLE>

<%@ include file="/footer.jspf" %>
</body>
</html>
