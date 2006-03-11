<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Coordinator roles"; %>

<%@ include file="wsnspheader.jspf" %>
<p>
<table width='100%' border='0'>
<tr valign="top"><td><%=fontB3%><b><%=h.get("LegalFirstName")%>&nbsp;<%=h.get("LegalLastName")%></font></b><br><BR></td></tr>
<tr><td>
	
	<table>

	<%
	if (h.containsKey("0")) {
		%>
		<tr valign="top"><td colspan=3><%=fontTextL%><b>Already Coordinating:</font></b></td></tr>
		<%
		Integer counter= new Integer(0);
		while (h.containsKey(counter.toString())){
			Hashtable app = (Hashtable)h.get(counter.toString());
			%>
			<form method="post" action="/servlet/WsnSpController">
			<input type="hidden" name="action" value="adminSaveUserCoord"> 
			<input type="hidden" name="view" value="assigncoord"> 
			<input type="hidden" name="id" value="<%=h.get("id")%>"> 
			<input type="hidden" name="Project" value="<%=app.get("id")%>"> 
			<input type="hidden" name="mode" value="remove"> 

			<%  
			if (h.get("frompage")!=null) {
			%>	<input type="hidden" name="frompage" value="<%=h.get("frompage")%>">
			<% } %>
			<tr>
				<td width="5%"><%=fontText%><b><%=counter.intValue()+1%></font></td>
				<td width="30%"><%=fontText%><%=app.get("name")%>&nbsp;</font></td>
				<td width="65%" align="left"><%=fontText%><input type='submit' value='Unassign'></font></td>
			</tr>
			</form>
			<%
			counter=new Integer(counter.intValue()+1);
		}
		%>
		<tr>
			<td></td>
			<td></td>
			<td><%=fontText1%>*What does this do?: Clicking "Unassign" removes this person from being connected
			to the project as Coordinator. If they were also going on the project (but no longer are), and you want 
			to remove them from the team roster, click "Unassign" next to the project they are "Already Going to" down below.<br>
			**If you click unassign and the project still appears, click the Refresh button on your brower and then "yes".
			</font></td></tr>
		<%
	}
	%>
		
	<% if (h.get("IsMemberOf") != null) { %>

		<form method="post" action="/servlet/WsnSpController">
		<input type="hidden" name="action" value="adminSaveUserCoord"> 
		<input type="hidden" name="view" value="assigncoord">
		<input type="hidden" name="id" value="<%=h.get("id")%>"> 
		<input type="hidden" name="Project" value="<%=h.get("IsMemberOfID")%>"> 
		<input type="hidden" name="mode" value="removeproject"> 

		<%  
		if (h.get("frompage")!=null){
		%>	<input type="hidden" name="frompage" value="<%=h.get("frompage")%>">
		<%} %>
		
		<tr valign="top"><td colspan=3><%=fontTextL%><b>Already Going to:</font></b></td></tr>
			<tr>
			<td width="5%"></td>
			<td width="30%"><%=fontText%><%=h.get("IsMemberOf")%>&nbsp;</font></td>
			<td width="65%" align="left"><%=fontText%><input type='submit' value='Unassign'></font></td>
		</tr>
		</form>
	
		<tr>
			<td></td>
			<td></td>
			<td><%=fontText1%>*What does this do?: Clicking "Unassign" removes this person from going on this project. If they were also coordinating the project (but no longer are), and you want 
			to remove them from that assignment, click "Unassign" next to the project they are "Already Coordinating" up above.<br>
			**If you click unassign and the project still appears, click the Refresh button on your brower and then "yes".
		</font></td></tr>

	<% } %>
	</table>

</td></tr>
<tr><td>
<table>
<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="adminSaveUserCoord"> 
<input type="hidden" name="view" value="assigncoord"> 
<input type="hidden" name="id" value="<%=h.get("id")%>"> 
<input type="hidden" name="mode" value="add"> 

<tr valign='top'>
	<td colspan="3"><%=fontTextL%><b>Add as Coordinator to: </b></FONT></TD>
	<td></TD>
</tr>
<tr valign='top'>
	<td width="10%"><%=fontText%><b>Project:&nbsp;</b></FONT></TD>
	<td width="10%"><%=fontText%><% selProj.setName("Project"); %><%=selProj.print()%></font></TD>
	<td width="80%"></TD>
</tr>
<tr valign='top'>
	<td align="right" colspan="2"><%=fontText%><b>Is team member also?:&nbsp;<% selBoolean.setLabels("Yes","No"); selBoolean.setName("going"); selBoolean.setCurrentValue("0"); %><%=selBoolean.printBoolean()%></b></FONT></TD>
	<td><%=fontText1%><b>*Note: Sometimes coordinators coordinate stateside, 
	but don't go on the project. Is this person going on this project also?</b></FONT></TD>
</tr>
<tr valign='top'>
	<td></td>
	<td align="right"><input type='submit' value='Add'></td>
	<td></TD>
</tr>
</form>
<tr>
	<td colspan="3"><br>
		<form method="post" action="/servlet/WsnSpController">
		<input type="hidden" name="action" value="adminEditApp"> 
		<input type="hidden" name="view" value="appinfo"> 
		<input type="hidden" name="id" value="<%=formHelp.value((String)h.get("id"))%>"> 
		<%  
		if (h.get("frompage")!=null){
		%>	<input type="hidden" name="frompage" value="<%=h.get("frompage")%>">
		<%}
		%>
		<%=fontText%>&nbsp;After adding all projects this person is coordinating, click here.</font><input type='submit' value='Next'>
		</form>
	</td>

</tr>
</TABLE>

</td></TR>
</TABLE>

<p>
<%=hr%>&nbsp; &nbsp; &nbsp; &nbsp; 

<p>

<%@ include file="wsnspfooter.jspf" %>

<%
//for (Enumeration e = h.keys(); e.hasMoreElements();) {
//	String k = (String) e.nextElement();
//	out.println("key: " + k + " value: " + h.get(k) + " <br>");
//}
%>


</HTML>