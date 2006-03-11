<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "SOS - WSN"; %>

<%@ include file="wsnspheader.jspf" %>
<p> &nbsp;
<center><%=fontXL%>WSN International Summer Project Listing for SOS</font></center>
<p>
<table width='100%' border='1' cellpadding=3 bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top' align='center'><td> &nbsp; </td><td nowrap><%=fontTextL%><b>Departure Date</td><td nowrap><%=fontTextL%><b>Return Date</td><td nowrap><%=fontTextL%><b>Project Name</td>
<td rowspan="30"> &nbsp;
<td rowspan="30">
	<p align='left'>This is a display of all the projects in order of when they depart from the US gateway city. You may click
	on the Magnifying Glass (<img src='/wsnsp/images/magglass.gif' border='0'>) or the name of a project
	to pull up its SOS form.
</td></tr>
	<%
	if (!h.containsKey("0")) {
		%>
		<TH colspan=8><%=font%>There are currently no projects in the database that match this criteria.</font></TH>
		<%
	} else { 
		Integer counter= new Integer(0);
		while (h.containsKey(counter.toString())){
			Hashtable proj = (Hashtable)h.get(counter.toString());
			%>
			<tr align=center>
				<td>
					<a href="/servlet/WsnSpController?view=sosform&action=sosForm&id=<%=proj.get("WsnProjectID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a>
				</td>
				<td><%=font%><%=proj.get("DepartureDate")%>&nbsp;</td>
				<td><%=font%><%=proj.get("ReturnDate")%>&nbsp;</td>
				<td><%=font%><a href="/servlet/WsnSpController?view=sosform&action=sosForm&id=<%=proj.get("WsnProjectID")%>"><%=proj.get("Name")%>&nbsp; (<%=proj.get("PartnershipRegion")%>)</a></td>
			</tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
	}
	%>
</table>

<p> &nbsp;
<%@ include file="wsnspfooter.jspf" %>

</HTML>