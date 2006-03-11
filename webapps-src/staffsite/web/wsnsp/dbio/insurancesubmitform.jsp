<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% //String pageTitle = h.get("ProjectName") + " Team Information"; %>

<%//@ include file="wsnspheader.jspf" %>

<%//=fontText%>

<h1 align="center">Insurance Submission Report</h1>

<p align="center"><b>Short Term Travel Only</b> </p>

<table align=center border="0">
    <tr>
        <td align="left">From: </td><td><u><strong><u>Campus Crusade for
        Christ</u></strong> </td><td> &nbsp; </td>
        <td align="center">&nbsp;</td>
        <td>Corporate Account Number: </td><td><u><strong><u>1MMS1048/Z</u></strong>
        </td>
    </tr>
    <tr>
        <td align="left">Issuing Location: </td><td><u><strong><u>Orlando,
        FL</u></strong> </td><td> &nbsp; </td>
        <td align="center">&nbsp;</td>
        <td>Prepared by: </td><td><u><strong><u>Debbie Townsend</u></strong>
        </td>
    </tr>
    <tr>
        <td>Date From: </td><td><u><b><%=h.get("StartDate")%></b></td><td> &nbsp; </td>
        <td>&nbsp;</td>
        <td>Account to be charged: </td><td><u><b><%=h.get("OperatingAccountNo")%></b></td>
    </tr>
    <tr>
        <td>Date To: </td><td><u><b><%=h.get("StopDate")%></b></u></td><td> &nbsp; </td>
    </tr>
<tr><td colspan=6><hr></td></tr>

<tr><td>Project Name:</td><td> <B><%=h.get("ProjectName")%></B></td><td> &nbsp; </td>
        <td>&nbsp;</td>
		<td>Project Leader: </td>
        <td><u><B><A HREF="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=h.get("ProjectPDID")%>"><%=h.get("ProjectPD")%></A></B></u></td></tr>

<tr><td>Country:</td><td> <B><%=h.get("Country")%></B></td><td> &nbsp; </td>
        <td>&nbsp;</td>
		<td>Associate Project Leader: </td>
        <td><u><B><A HREF="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=h.get("ProjectAPDID")%>"><%=h.get("ProjectAPD")%></a></B></u></td></tr>
<tr><td>City:</td><td> <B><%=h.get("City")%></B></td><td> &nbsp; </td>
        <td>&nbsp;</td>
		<td>Project Coordinator: </td>
        <td><u><B><A HREF="/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=h.get("ProjectCoordID")%>"><%=h.get("ProjectCoord")%></a></B></u></td></tr>
<tr><td colspan=6><hr><p>&nbsp;</td></tr>
</table>

<table>
<tr><td rowspan=20> &nbsp; &nbsp; </td></tr>
<tr><td colspan=6>
		<table>
			<tr><td> &nbsp; </td><td><B>Last Name</B></td><td>&nbsp; </td><td><B>First Name</B></td><td> &nbsp; &nbsp; </td><td><B>On Staff?</B></td><td> &nbsp; &nbsp; </td><td><B>Staff Fee?</B></td></tr>
			<tr><td colspan="8"><hr></td></tr>

		<%	if (!h.containsKey("0")) {
				%>
				<tr><td> &nbsp; </td><td colspan=8>There are currently no team members!</font></TH></tr>
				<%
			} else {
				Integer counter= new Integer(0);
				while (h.containsKey(counter.toString())){
					Hashtable app = (Hashtable)h.get(counter.toString());
					%>
					<tr align=left>
						<td align=right><b><%=counter.intValue()+1%> &nbsp; </td>
						<td><%=app.get("LastName")%></td><td>&nbsp; </td>
						<td><%=app.get("FirstName")%></a>&nbsp;</td><td>&nbsp;</td>
						<td><%=app.get("OnStaff")%></a>&nbsp;</td><td>&nbsp;</td>
						<td><input> </td>
					</tr>
					<%
					counter=new Integer(counter.intValue()+1);
				}
			}
			%>
			<tr><td colspan="8"><hr></td></tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><B>Grand Total:</B></td>
				<td>&nbsp;</td>
				<td><input></td>
			</tr>
		</table>
</td></tr>


</table>


<p> &nbsp;
<p>
<p> &nbsp;
<p>
<a href='http://travel.state.gov/travel_warnings.html#<%=h.get("CountryLetter")%>' target='_blank'>Travel Warnings & Consular Information Sheet</a><br>
<a href='http://travel.state.gov/warnings_list.html' target='_blank'>Current Travel Warnings</a>

</HTML>