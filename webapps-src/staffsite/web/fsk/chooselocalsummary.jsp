<%@ page import="java.util.*" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<html>
<head>
<title>Choose Local Summary</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<% String pageTitle = "Choose Local Summary"; %>
<%@ include file="/fsk/fskheader.jspf"%>

<body bgcolor="#FFFFFF" text="#000000">


<BR>
<%=fontB3%>&nbsp;<B>Choose Which Allocation to Edit Orders for</B><br></font>
<table width="100%" border="0" cellpadding="3" cellspacing="2" align="center" <%=bgcolorW%>>

<%
	Integer counter= new Integer(0);

	while (h.containsKey(counter.toString())){

		Hashtable app = (Hashtable)h.get(counter.toString());
					
		%>
		<tr <%=bgcolorL%>>
		  <td align="center">Allocations for <%=app.get("Region")%> Region<td>
		  <td width="20%" align="center"><%=fontText%><a href="/servlet/FskController?action=viewOrders&accountno=<%=app.get("AccountNo")%>&AllocationID=<%=app.get("AllocationID")%>
							">[view<br>order]</a></font></td>
		</tr>
		<%
		counter=new Integer(counter.intValue()+1);
	}
%>
</table>

</font>

<%@ include file="/footer.jspf" %>

</body>
</html>