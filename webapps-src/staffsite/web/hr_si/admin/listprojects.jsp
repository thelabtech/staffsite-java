<%@ page import="org.alt60m.servlet.*,org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>

<%	ActionResults ar = (ActionResults) session.getValue("tub");
	Hashtable h = (Hashtable) ar.getObject("tub"); %>

<HTML>
<HEAD>
<TITLE>Projects Listing</TITLE>
</HEAD>

<% String pageTitle = "Projects Listing"; %>

<%@ include file="/hr_si/evaluator/sitoolheader.jspf" %>
<p align='right'>
<table width='50%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr align='center' valign='center'><td><%=fontTextL%><b>Available Tools:</td>
		<td>
			<form method='post' action='/hr_si/admin/filterlistprojects.jsp'>
			<input type='submit' value='Search'>
			</form>
		</td>
		<td>
			<form method='post' action='/servlet/SIController'>
			<input type='hidden' name='action' value='adminListProjects'>
			<input type='hidden' name='view' value='listprojects'>
			<input type='hidden' name='How' value='all'>
			<input type='submit' value='List All'>
			</form>
		</td>
	</tr>
</table>
</P>
<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr><th><%=fontS%>view</th><th><%=font%>Name</th><th><%=font%>Start Date</th><th><%=font%>End Date</th><th><%=font%>City</th><th><%=font%>Country</th><th><%=font%>AOA</th><th><%=font%>SI Year</th><th><%=font%>Partnership Region</th></tr></tr>
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
					<a href="/servlet/SIController?action=adminEditProject&SIProjectID=<%=proj.get("SIProjectID")%>"><img src='/wsnsp/images/magglass.gif' border='0'></a>
				</td>
				<td><%=fontText%><%=proj.get("Name")%>&nbsp;</td>
				<td><%=fontTextS%><%=proj.get("StartDate")%>&nbsp;</td>
				<td><%=fontTextS%><%=proj.get("StopDate")%>&nbsp;</td>
				<td><%=fontText%><%=proj.get("Country")%>&nbsp;</td>
				<td><%=fontTextS%><% if (proj.get("Country")!=null){ selCountry.setCurrentValue((String)proj.get("Country"));%><%=selCountry.display()%><%}%>&nbsp;</td>
				<td><%=fontText%><%=proj.get("AOA")%>&nbsp;</td>
				<td><%=fontText%><%=proj.get("SiYear")%>&nbsp;</a></td>
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
			<form method='post' action='/hr_si/admin/filterlistprojects.jsp'>
			<input type='submit' value='Search'>
			</form>
		</td>
		<td>
			<form method='post' action='/servlet/SIController'>
			<input type='hidden' name='action' value='adminListProjects'>
			<input type='hidden' name='view' value='listprojects'>
			<input type='hidden' name='How' value='all'>
			<input type='submit' value='List All'>
			</form>
		</td>
	</tr>
</table>
</P>

<p> 

<p> &nbsp;
<%@ include file="adminfooter.jspf" %>