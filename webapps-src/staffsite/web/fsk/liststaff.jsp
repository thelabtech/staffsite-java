<%@page import="java.util.*" %>

<html>
<head>
<title>Staff List</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<% String pageTitle = "Staff List"; %>
<%@ include file="/fsk/fskheader.jspf"%>


<body>
<TABLE WIDTH="90%" BORDER="0" CELLPADDING="1" CELLSPACING="0">
	<TR>
		<TD>
			<%=fontText%><B>Click on the name to go to their allocation page.</B></FONT>
			<br><br>
			<%
			if (request.getParameter("frompage") != null) {
			%>  
				<%=fontText%>(*Hint: If you are adding multiple allocations from the regional list, it is quicker to 
				hit the "Back" button twice to return to the list of staff after you save the allocation for each person.)
				<br><br></font>
			<%
			}
			%>
		</TD>
	</TR>

<%
	Hashtable h = (Hashtable) session.getValue("tub"); 
	for (int i = 0; i < h.size(); i++) {
		Hashtable staff = (Hashtable) h.get(String.valueOf(i));
	%>
	<tr>
		<td><%=fontB%><a href="/servlet/FskController?action=allocStaffKits&accountno=<%=staff.get("AccountNo")%>&fname=<%=staff.get("FirstName")%>&lname=<%=staff.get("LastName")%>&region=<%=staff.get("Region")%>"><%=staff.get("FirstName")%>&nbsp;<%=staff.get("LastName")%></a></FONT></td>
	</tr>
	<%
	}
%>
	<tr>
		<td>
		<br><br>
<%
if (request.getParameter("frompage") != null) {
	%>
<table border="0" width="100%">
  <tr>
    <td width="11%" colspan=2><%=fontText3%>Local Leader not listed? </font>&nbsp;</td>
  </tr>
  <tr>
    <td width="11%"colspan=2><%=fontText%>&nbsp;&nbsp;&nbsp;If the person you're looking for is not in this list, it may be because they are associated with the wrong region in their HR record. <u>Click the back button on your browser and search for them by last name. The "last name search" looks for people in every region.</u></font></td>
  </tr>
</table>
	<%
} else {
	%>
<table border="0" width="100%">
  <tr>
    <td width="11%" colspan=2><%=fontText3%>Local Leader not listed? </font>&nbsp;</td>
  </tr>
  <tr>
    <td width="11%"colspan=2><%=fontText%>&nbsp;&nbsp;&nbsp;If the person you're looking for is not listed above, click the "back" button on your browser and search by their last name again, making sure the spelling is correct. If you're not sure of the spelling, try just typing in the first few letters of their last name. If their name is still not listed, please email <a href="mailto:help@campuscrusadeforchrist.com?subject=FSK Choice person not listed">help@campuscrusadeforchrist.com</a> with the person's name and any other pertinent information. </font></td>
  </tr>
</table>
	<%
}
%>
		<BR>
		</td>
	</tr>

</TABLE>


<br><br>

<%@ include file="/footer.jspf" %>
</body>
</html>
