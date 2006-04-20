<%@ page import="java.util.*" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<% Hashtable summaryHash = (Hashtable) session.getValue("tub"); %>

<html>
<head>
<title>National Summary</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<% String pageTitle = "National User View"; %>
<%@ include file="/fsk/fskheader.jspf"%>

<body bgcolor="#FFFFFF" text="#000000">

<p>
<form action="/servlet/FskController" method="post">
<input type="hidden" name="action" value="listStaff">
<%=fontText%>&nbsp;Allocate kits to person - search by LAST name:&nbsp;<input type="text" name="lastname"></font>
<input type="submit" value="Search">
</form>

<BR>
<%=fontB3%>&nbsp;<B>National Summary</B><br></font>
<table width="100%" border="0" cellpadding="3" cellspacing="2" align="center" <%=bgcolorW%>>
	<tr <%=bgcolorB%>>
    <td width="20%" align="center"><%=fontW%><b>Local Leader</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Nationally<br>
						Raised</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Impact Allocation</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Forerunner Allocation</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Regional Allocation</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Regional Raised</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Locally<br>
						Raised</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Total Kits</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Kit Orders Pending</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Kits Not Yet Ordered</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Kits Previously Ordered (already processed)</b></font></td>
    <td width="20%" align="center">&nbsp;</td>
    <td width="20%" align="center">&nbsp;</td>
  </tr>

<%
	if (!summaryHash.containsKey("0")) {
		%>
		<TH colspan=8><%=fontText%>There are currently no allocations.</font></TH>
		<%
	} else {
		Integer regcounter= new Integer(0);
				
		while (summaryHash.containsKey(regcounter.toString())){

			Hashtable h = (Hashtable)summaryHash.get(regcounter.toString());

			if (!h.containsKey("0")) {
				%>
				<TH colspan=8><%=fontText%>There are currently no allocations.</font></TH>
				<%
			} else {
				Integer counter= new Integer(0);
						
				while (h.containsKey(counter.toString())){

					Hashtable app = (Hashtable)h.get(counter.toString());
					
					%>
					  <tr <%=bgcolorL%>>
						<td width="20%" align="center"><%=fontText%><%=app.get("LastName")%>, <%=app.get("FirstName")%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("NatlDonation"))%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("ImpactAllotment"))%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("ForerunnerAllotment"))%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("RegionalAllotment"))%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("RegionallyRaised"))%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("LocallyRaised"))%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("TotalAlloc"))%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("TotalOrdered"))%></font></td>
						<td width="20%" align="center"><%=fontText%><% if (formHelp.value((String)app.get("Unordered")).startsWith("-")) {%></font><%=fontR%><% ; }%><%=formHelp.value((String)app.get("Unordered"))%></font></td>
						<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("PastOrderedKits"))%></font></td>
						<td width="20%" align="center"><%=fontText%><a href="/servlet/FskController?action=allocKits&id=<%=app.get("AllocationID")%>&accountno=<%=app.get("AccountNo")%>
							&fname=<%=app.get("FirstName")%>&lname=<%=app.get("LastName")%>&region=<%=app.get("Region")%>">[view<br>allocation]</a></font></td>
						<td width="20%" align="center"><%=fontText%><a href="/servlet/FskController?action=viewOrders&accountno=<%=app.get("AccountNo")%>&AllocationID=<%=app.get("AllocationID")%>
							">[view<br>order]</a></font></td>
					  </tr>
					<%
					counter=new Integer(counter.intValue()+1);
				}
			}

			Hashtable app = (Hashtable)h.get("Totals");
			%>
		   <tr <%=bgcolorL%>>
					<td width="20%" align="center"><%=fontText%><B><%=h.get("Region")%> Region Total:</B></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("NatlDonation"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("ImpactAllotment"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("ForerunnerAllotment"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("RegionalAllotment"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("RegionallyRaised"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("LocallyRaised"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("TotalAlloc"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("TotalOrdered"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("Unordered"))%></B></font></td>
					<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("PastOrderedKits"))%></B></font></td>
					<td width="20%" align="center">&nbsp;</td>
					<td width="20%" align="center">&nbsp;</td>
		  </tr><%
			regcounter=new Integer(regcounter.intValue()+1);
		}		
	  }
	Hashtable totals = (Hashtable)summaryHash.get("Totals");
	Hashtable app = (Hashtable)totals.get("Totals");

%>
<tr <%=bgcolorL%>>
		<td width="20%" align="center"><%=fontText%><B>National Total:</B></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("NatlDonation"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("ImpactAllotment"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("ForerunnerAllotment"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("RegionalAllotment"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("RegionallyRaised"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("LocallyRaised"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("TotalAlloc"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("TotalOrdered"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("Unordered"))%></B></font></td>
		<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("PastOrderedKits"))%></B></font></td>
		<td width="20%" align="center">&nbsp;</td>
		<td width="20%" align="center">&nbsp;</td>
</tr><%

%>	 
</table>

</font>

<%@ include file="/footer.jspf" %>
</body>

</html>