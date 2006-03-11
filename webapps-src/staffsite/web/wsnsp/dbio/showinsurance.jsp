<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Insurance Needed"; %>

<%@ include file="wsnspheader.jspf" %>

<p>Here are all the Summer Project Applicants that have not sent in their Insurance forms or had them approved.
You may submit this list in bulk by pressing <b>Save</b> at
the end of the page. Any entries that are left blank will show up the next time
you come to this page. If you want to copy this list to another program, select the text here before hitting save.

<form method="post" action="/servlet/WsnSpController">
<input type='hidden' name='action' value='insurance'>
<input type='hidden' name='view' value='insuranceconf'>

<table width ='60%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr align='center'><td><%=fontText%>&nbsp;</td><td><%=fontText%><b>Name</td><td><%=fontText%><b>Assigned Project</td>
<td><%=fontText%><b>City</td><td><%=fontText%><b>Start Date</td><td><%=fontText%><b>Stop Date</td>
<td><%=fontText%><b>Operating Account Number</td><td><%=fontText%><b>Insurance Status</td></tr>
	<%
	if (!h.containsKey("0")) {
		%>
		<TH colspan=8><%=font%>Everyone has sent in their Insurance Forms.</font></TH>
		<%
	} else {
		Integer counter= new Integer(0);
		while (h.containsKey(counter.toString())){
			Hashtable app = (Hashtable)h.get(counter.toString());
			%>
			<tr align=center>
				<td><%=fontS%><b><%=counter.intValue()+1%></td>
				<td nowrap><%=fontText%><%=app.get("Name")%>&nbsp;</td>
				<td nowrap><%=fontTextS%><% if (app.get("Assignment")!=null){%><% selProj.setCurrentValue((String)app.get("Assignment"));%> <%=selProj.display()%><%}%>&nbsp;</td>
				<td nowrap><%=fontText%><%=app.get("City")%>&nbsp;</td>
				<td><%=fontText%><%=app.get("StartDate")%>&nbsp;</td>
				<td><%=fontText%><%=app.get("StopDate")%>&nbsp;</td>
				<td><%=fontText%><%=app.get("OperatingAccountNo")%>&nbsp;</td>

				<td><input type='hidden' name="<%=counter.toString()%>" value='<%=app.get("WsnApplicationID")%>'><select name="<%=app.get("WsnApplicationID")%>">
					<option value="false">Not Received</option><option value="true">Received</option></select></td>
			</tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
		%><input type="hidden" name='counter' value='<%=h.get("number")%>'>
			<tr><td colspan='4'><center><input type='Submit' value='Save'></center></td></tr>
		<%
	}
	%>
</table><br>
</form>

<%@ include file="wsnspfooter.jspf" %>

</HTML>