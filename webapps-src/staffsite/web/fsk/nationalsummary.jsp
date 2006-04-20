<%@ page import="java.util.*" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<html>
<head>
<title>National Fund Development Summary</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<% String pageTitle = "National Fund Development Summary"; %>
<%@ include file="/fsk/fskheader.jspf"%>

<body bgcolor="#FFFFFF" text="#000000">

<p>
<form action="/servlet/FskController" method="post">
<input type="hidden" name="action" value="listStaff">
<%=fontText%>&nbsp;Allocate nationally donated kits to person - search by LAST name:&nbsp;<input type="text" name="lastname"></font>
<input type="submit" value="Search">
</form>

<BR>
<%=fontB3%>&nbsp;<B>National Donation Summary</B><br></font>
<table width="100%" border="0" cellpadding="3" cellspacing="2" align="center" <%=bgcolorW%>>
	<tr <%=bgcolorB%>>
    <td width="20%" align="center"><%=fontW%><b>Local Leader</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Nationally Raised</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Impact Allotment</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>Forerunner Allotment</b></font></td>
    <td width="20%" align="center"><%=fontW%><b>National Note</b></font></td>
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
				<td width="20%" align="center"><%=fontText%><%=formHelp.value((String)app.get("NatlNotes"))%></font></td>
				<td width="20%" align="center"><%=fontText%><a href="/servlet/FskController?action=allocKits&id=<%=app.get("AllocationID")%>&accountno=<%=app.get("AccountNo")%>
					&fname=<%=app.get("FirstName")%>&lname=<%=app.get("LastName")%>">[view allocation]</a></font></td>
			  </tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
	}
	Hashtable app = (Hashtable)h.get("Totals");
	%>
   <tr <%=bgcolorL%>>
			<td width="20%" align="center"><%=fontText%><B>Total:</B></font></td>
			<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("NatlDonation"))%></B></font></td>
			<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("ImpactAllotment"))%></B></font></td>
			<td width="20%" align="center"><%=fontText%><B><%=formHelp.value((String)app.get("ForerunnerAllotment"))%></B></font></td>
			<td width="20%" align="center">&nbsp;</td>
			<td width="20%" align="center">&nbsp;</td>
  </tr>
</table>
<%=fontText%>(This is a list of all the people who have been allocated National Donations.)</FONT>
</font>
<br><br>

<%@ include file="/footer.jspf" %>
</body>

</html>
