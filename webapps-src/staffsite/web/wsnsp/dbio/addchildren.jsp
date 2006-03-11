<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Add Children"; %>

<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/wsnsummerproject">
<input type="hidden" name="action" value="addChildren">

<%  if (h.get("WsnApplicationID")!=null){
%>	<input type="hidden" name="id" value="<%=h.get("WsnApplicationID")%>">
	<%=fontTextXL%>Edit an applicant</font>
<%}
else{%>	<input type="hidden" name="id" value="new">
	<%=fontTextXL%>Add an Applicant</font>
<%}%>

<table width='100%' border='0'>
<tr valign='top'><td colspan='3'><td rowspan='6' valign='top'>
<tr valign='top'><td colspan='2'><%=fontText%><b>Personal Information</td></tr>
<tr valign='top'><td align="center"><%=font%><b>First Name</b></FONT></TD><td align="center"><%=font%><b>Last Name</b></FONT></TD>><td align="center"><%=font%><b>Social Security Number</b></FONT></TD><td align="center"><%=font%><b>Gender</b></FONT></TD><td align="center"><%=font%><b>Birth Date</b></font></TD></tr>

<tr>
<td><%=font%><INPUT TYPE=Text NAME="FName1" SIZE=40 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("FName1"))%>" ></FONT></TD>
<td><%=font%><INPUT TYPE=Text NAME="LName1" SIZE=40 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("LName1"))%>" ></FONT></TD>
<td><%=font%><INPUT TYPE=Text NAME="Ssn1" SIZE=40 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("Ssn1"))%>" ></FONT></TD>
<td><%=font%><% selGender.setName("Gender1"); if (h.get("Gender1")!=null){ selGender.setCurrentValue((String)h.get("Gender1"));} %><%=selGender.print()%></TD>
<td><%=font%><INPUT TYPE=Text NAME="BDay1" SIZE=40 MAXLENGTH=40 VALUE="<%=formHelp.value((String)h.get("BDay1"))%>" ></FONT></TD>
</tr>

<tr valign='top'><td colspan='1'><%=fontText%><b>Save:</b></td><td><input type='submit' value='Save'></td></tr>

</TABLE>
<p>
<%=hr%>&nbsp; &nbsp; &nbsp; &nbsp; 

<p>
</form>
<%@ include file="wsnspfooter.jspf" %>

<%
//for (Enumeration e = h.keys(); e.hasMoreElements();) {
//	String k = (String) e.nextElement();
//	out.println("key: " + k + " value: " + h.get(k) + " <br>");
//}
%>


</HTML>