<%@ page import="java.util.*" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<html>
<head>
<title>Regional UserView</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<% String pageTitle = "Regional User View"; %>
<%@ include file="/fsk/fskheader.jspf"%>

<body bgcolor="#FFFFFF" text="#000000">
<BR>
<%=fontB3%>&nbsp;<B>Allocation Options:</B></font>
<table border="0" width="100%">
  <tr>
    <td width="100%">
	<form action="/servlet/FskController" method="post">
	<input type="hidden" name="action" value="listStaff">
	<%=fontText%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. Find specific person to allocate kits to - Enter LAST name:&nbsp;<input type="text" name="lastname"></font>
	<input type="submit" value="search">
	</form>
	</td>
  </tr>
</table>

<%=fontText%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. To choose from a list of all staff in your region, click <a href="/servlet/FskController?action=listStaff&region=<%=session.getValue("fskUserRegion")%>&frompage=regionallist">HERE.</a>&nbsp;&nbsp;(takes about 1 minute)</font>

<br><BR>
<%=fontB3%>&nbsp;<B>Regional Summary:</B></font><%=fontText%>&nbsp;&nbsp;(*The column, "Total Kits" must be in multiples of 100.)</font><br>
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
			<td width="20%" align="center"><%=fontText%><B>Total:</B></td>
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
  </tr>
</table>

<br><br><%=fontText%>*If someone you have allocated kits to does not show up in this list,
please <A HREF="mailto:dan.hardaway@uscm.org?subject=FSK Choice - Region not set (include name and region)">email us</a> with 
their name and region and we'll fix it. Don't worry, their allocation has been saved. The problem is that they aren't associated 
with your region yet.
</FONT>

<br><br><%=fontText%>**If you haven't emailed your regional account number for ongoing ministry money to Jonathan Haight yet, 
please do so by clicking <A HREF="mailto:Jonathan.Haight@uscm.org?subject=FSK Site - regional account #">Jonathan.Haight@uscm.org</a>. 
Be sure to include your region name. Thank you.</FONT>
<br>

<%@ include file="/footer.jspf" %>
</body>
</html>
