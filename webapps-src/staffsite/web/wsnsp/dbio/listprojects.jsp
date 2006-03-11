<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Projects Listing"; %>

<%@ include file="wsnspheader.jspf" %>
<p align='right'>
<table width='50%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr align='center' valign='center'><td><%=fontTextL%><b>Available Tools:</td>
		<td>
			<form method='post' action='/wsnsp/dbio/filterlistprojects.jsp'>
			<input type='submit' value='Search'>
			</form>
		</td>
		<td>
			<form method='post' action='/servlet/WsnSpController'>
			<input type='hidden' name='action' value='listProjects'>
			<input type='hidden' name='view' value='listprojects'>
			<input type='hidden' name='How' value='all'>
			<input type='submit' value='List All'>
			</form>
		</td>
	</tr>
</table>
</P>
<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr><th><%=fontS%>view</th><th><%=font%>Name</th><th><%=font%>Start Date</th><th><%=font%>End Date</th><th><%=font%>City</th><th><%=font%>Country</th><th><%=font%>Director</th><th><%=font%>Asst. Director</th><th><%=font%>Coordinator</th><th><%=font%>Partnership Region</th></tr></tr>
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
					<a href="/servlet/WsnSpController?view=showprojectinfo&action=showProj&id=<%=proj.get("WsnProjectID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a>
				</td>
				<td><%=fontText%><%=proj.get("Name")%>&nbsp;</td>
				<td><%=fontTextS%><%=proj.get("StartDate")%>&nbsp;</td>
				<td><%=fontTextS%><%=proj.get("StopDate")%>&nbsp;</td>
				<td><%=fontText%><%=proj.get("City")%>&nbsp;</td>
				<td><%=fontTextS%><% if (proj.get("Country")!=null){ selCountry.setCurrentValue((String)proj.get("Country"));%><%=selCountry.display()%><%}%>&nbsp;</td>
				<td><%=fontText%><%=proj.get("PD")%>&nbsp;</td>
				<td><%=fontText%><%=proj.get("APD")%>&nbsp;</a></td>
				<td><%=fontText%><%=proj.get("Coord")%>&nbsp;</td>
				<td><%=fontTextS%><% if (proj.get("PartnershipRegion")!=null){ selRegion.setCurrentValue((String)proj.get("PartnershipRegion"));%><%=selRegion.display()%><%}%>&nbsp;</td>
			</tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
	}
	%>
</table>
<p align='right'>
<table width='50%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr align='center' valign='center'><td><%=fontTextL%><b>Available Tools:</td>
		<td>
			<form method='post' action='/wsnsp/dbio/filterlistprojects.jsp'>
			<input type='submit' value='Search'>
			</form>
		</td>
		<td>
			<form method='post' action='/servlet/WsnSpController'>
			<input type='hidden' name='action' value='listProjects'>
			<input type='hidden' name='view' value='listprojects'>
			<input type='hidden' name='How' value='all'>
			<input type='submit' value='List All'>
			</form>
		</td>
	</tr>
</table>
</P>

<p> &nbsp;

<p> &nbsp;
<%@ include file="wsnspfooter.jspf" %>