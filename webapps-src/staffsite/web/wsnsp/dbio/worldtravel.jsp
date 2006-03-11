<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "World Travel"; %>

<%@ include file="wsnspheader.jspf" %>

<p>Here are all the Summer Projects that have filled in their travel information.
You may click on any of them to display their respective information.
<p>

<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top' align='center'><td> &nbsp; </td><td><%=fontText%><b>Project</td><td><%=fontText%><b>Start Date</td><td><%=fontText%><b>Stop Date</td></tr>
<!-- <a href='/servlet/wsnsummerproject?action=showWorldProjTravel'> -->
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
					<a href="/servlet/WsnSpController?action=defaultShowProj&view=showtravelinfo&id=<%=proj.get("WsnProjectID")%>&wt=1"><img src='/wsnsp/images/magglass.gif' border='0'></a>
				</td>
				<td><%=font%><a href="/servlet/WsnSpController?view=teamtravel&action=showTeamTravel&id=<%=proj.get("WsnProjectID")%>&wt=1"><%=proj.get("Name")%>&nbsp; (<%=proj.get("PartnershipRegion")%>)</a></td>
				<td><%=font%><%=proj.get("StartDate")%>&nbsp;</td>
				<td><%=font%><%=proj.get("StopDate")%>&nbsp;</td>
			</tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
	}
	%>
</table><br>

<%@ include file="wsnspfooter.jspf" %>

</HTML>