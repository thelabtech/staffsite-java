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
<title>Enter National Allocation</title>
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


		// -->
		</SCRIPT>
</head>
<% String pageTitle = "Enter National Allocation"; %>
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
		<form action="/servlet/FskController" method="post">
		<input type="hidden" name="action" value="saveAlloc">
		<input type="hidden" name="FirstName" value="<%=request.getParameter("fname")%>">
		<input type="hidden" name="LastName" value="<%=request.getParameter("lname")%>">
		<%if (request.getParameter("id") != null) {%><input type="hidden" name="AllocationID" value="<%=request.getParameter("id")%>"><%}%>
		<input type="hidden" name="AccountNo" value="<%=request.getParameter("accountno")%>">
		<%if (!formHelp.value((String)h.get("Region")).equals("")) {%>
			<input type="hidden" name="Region" value="<%=formHelp.value((String)h.get("Region"))%>">
		<%}%>
		<table>
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
			<td><input type="submit" value="Save"></td>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Region:</font></td>
			<td><%
			if (!formHelp.value((String)h.get("Region")).equals("")) {%>
				<%=fontB%><%=formHelp.value((String)h.get("Region"))%></font><%
			} else {%>
			<td><%
			selRegion.setName("Region"); 
			if (h.get("Region")!=null){ selRegion.setCurrentValue((String)h.get("Region"));} %>
			<%=selRegion.print()%>
			</td><%
			}
			%></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Regional Allotment:</font></td>
			<td><%=fontB%><%=formHelp.value((String)h.get("RegionalAllotment"))%></font></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Regionally Raised: </font></td>
			<td><%=fontB%><%=formHelp.value((String)h.get("RegionallyRaised"))%></font></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Regional Notes:</font></td>
			<td><%=fontB%><%=formHelp.value((String)h.get("RegNotes"))%></font></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%>&nbsp;</font></td>
			<td></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Locally Raised:</font></td>
			<td><%=fontB%><%=formHelp.value((String)h.get("LocallyRaised"))%></font></td>
		</TR>
		<TR>
			<TD align="right" valign="top" width=20%><%=fontB%>Local Notes:</font></td>
			<td><%=fontB%><%=formHelp.value((String)h.get("LocalNotes"))%></font></td>
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
