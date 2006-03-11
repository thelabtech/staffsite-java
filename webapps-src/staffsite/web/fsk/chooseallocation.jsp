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
			<%=fontText%><B>Click on the name and region to go to their allocation page for that region.</B></FONT>
			<br><br>
		</TD>
	</TR>

<% 
	Hashtable h = (Hashtable) session.getValue("tub"); 
	Collection allocList = (Collection) h.get("allocationList");
	Iterator i = allocList.iterator();
	while (i.hasNext()) {
		Hashtable alloc = (Hashtable) i.next();
	%>
	<tr>
		<td><%=fontB%><a href="/servlet/FskController?action=allocKits&accountno=<%=request.getParameter("accountno")%>&id=<%=alloc.get("AllocationID")%>&fname=<%=alloc.get("FirstName")%>&lname=<%=alloc.get("LastName")%>&region=<%=alloc.get("Region")%>"><%=alloc.get("FirstName")%>&nbsp;<%=alloc.get("LastName")%>&nbsp;-&nbsp;<%=alloc.get("Region")%>&nbsp;Region</a></FONT></td>
	</tr>
	<%
	}
%>
	<tr>
		<td><%=fontB%><a href="/servlet/FskController?action=allocKits&accountno=<%=request.getParameter("accountno")%>&fname=<%=request.getParameter("fname")%>&lname=<%=request.getParameter("lname")%>&region=<%=request.getParameter("region")%>">Create allocation in new region for <%=request.getParameter("fname")%>&nbsp;<%=request.getParameter("lname")%></a></FONT></td>
	</tr>

	<tr>
		<td>
		<br><br>
		
		<BR>
		</td>
	</tr>

</TABLE>


<br><br>
<%@ include file="/footer.jspf" %>
</body>
</html>
