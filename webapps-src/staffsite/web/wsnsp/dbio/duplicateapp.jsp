<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Duplicate applicant"; %>

<%@ include file="wsnspheader.jspf" %>

<p>
<table width='100%' border='0'>
<TR VALIGN=TOP>
	<td> &nbsp; </td>
	<td> <%=fontTextXL%>Warning</font> </TD>
	<td> &nbsp; </td>

</tr>
<TR VALIGN=TOP>
	<td>
		&nbsp;
	</TD>
	<td>
	<%=fontText%>A person with the same <%=h.get("sameString")%> already exists in the Summer Project Tool database. Here is that person's info:<p>

	<table width='100%' border='0'>
		<tr><td colspan='1' align=right width=20%><%=font%><b>First Name: </font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameLegalFirstName")%></font></td></tr>
		<tr><td colspan='1' align=right width=20%><%=font%><b>Last Name:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameLegalLastName")%></font></td></tr>
		<%if (h.get("sameIsStaff").equals("student")) {%><tr><td colspan='1' align=right width=20%><%=font%><b>University:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameUniversityFullName")%></font></td></tr><%}%>
		<tr><td colspan='1' align=right width=20%><%=font%><b>Address:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameCurrentAddress")%></font></td></tr>
		<tr><td colspan='1' align=right width=20%><%=font%><b>City:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameCurrentCity")%></font></td></tr>
		<tr><td colspan='1' align=right width=20%><%=font%><b>State:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameCurrentState")%></font></td></tr>
		<tr><td colspan='1' align=right width=20%><%=font%><b>Zip:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameCurrentZip")%></font></td></tr>
		<tr><td colspan='1' align=right width=20%><%=font%><b>Phone:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameCurrentPhone")%></font></td></tr>
		<tr><td colspan='1' align=right width=20%><%=font%><b>Ssn:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameSsn")%></font></td></tr>
		<tr><td colspan='1' align=right width=20%><%=font%><b>Account No.:</font></b></td><td width=5%> &nbsp;&nbsp; </td><td align=left><%=font%><%=h.get("sameAccountNo")%></font></td></tr>
	</table>

	<p>
	What would you like to do?<p>
	<a href="/servlet/WsnSpController?action=adminSaveApp&view=showappinfo&id=<%=h.get("sameid")%>&ApplAccountNo=<%=h.get("sameAccountNo")%>">Oops, my bad. This is the same person. Please just show me the existing record, and I'll edit it as necessary.</a><p>
	<a href="JavaScript: history.go(-1)">I must have mis-typed the <%=h.get("sameString")%>.  Lemme change the <%=h.get("sameString")%> that I just typed in.</a><p>
	<%if (h.get("accountNoCheck").equals("True")) {
		%><form action="/servlet/WsnSpController" name="saveApp" method="post"><input type="hidden" name="view" value="showappinfo"><input type="hidden" name="action" value="adminSaveApp"><input type="hidden" name=saveAnyway value="yes"><%
		Enumeration r = request.getParameterNames();
		while (r.hasMoreElements()) {
			String thisParameter = (String) r.nextElement();
			%><input type=hidden name="<%=thisParameter%>" value="<%=request.getParameter(thisParameter)%>"><%
		}%>
		<A HREF="JavaScript: saveApp.submit()">Nope, I'm all good.  This is a family member.  They're supposed to have the same account number.</a></FONT>		
		</form>
	<%}%>
	</td>
	<td>
		&nbsp;
	</td>
</tr>


</table>
<p> &nbsp;

<%@ include file="wsnspfooter.jspf" %>

</HTML>