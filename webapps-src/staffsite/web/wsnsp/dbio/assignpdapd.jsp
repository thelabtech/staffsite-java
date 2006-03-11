<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Add a Site User"; %>

<%@ include file="wsnspheader.jspf" %>
<p> &nbsp;
<%=fontTextXL%>Assign&nbsp;<%=h.get("LegalFirstName")%>&nbsp;<%=h.get("LegalLastName")%>&nbsp;to a project</font>
<p>
<table width='100%' border='0'>

<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="adminSaveUserPdApd"> 
<input type="hidden" name="view" value="appinfo"> 
<input type="hidden" name="id" value="<%=formHelp.value((String)h.get("id"))%>"> 
<input type="hidden" name="leadrole" value="pd"> 
<%  
if (h.get("frompage")!=null){
%>	<input type="hidden" name="frompage" value="<%=h.get("frompage")%>">
<%}
%>

<tr valign='top'><td colspan='3'><td rowspan='6' valign='top'>
<tr valign='top'>
	<td><%=font%><b>&nbsp;&nbsp;Project Director of: </b></FONT></TD>
	<td><%=font%><% selProj.setName("Project"); if (h.get("Project") != null) {selProj.setCurrentValue((String)h.get("Project"));}%><%=selProj.print()%></font>&nbsp;&nbsp;<input type='submit' value='Next'>
	</TD>
</tr>
</form>

<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="adminSaveUserPdApd"> 
<input type="hidden" name="view" value="appinfo"> 
<input type="hidden" name="id" value="<%=formHelp.value((String)h.get("id"))%>"> 
<input type="hidden" name="leadrole" value="apd">
<%  
if (h.get("frompage")!=null){
%>	<input type="hidden" name="frompage" value="<%=h.get("frompage")%>">
<%}
%>

<tr valign='top'>
	<td><%=font%><b>&nbsp;&nbsp;Associate Project Director of: </b></FONT></TD>
	<td><%=font%><% selProj.setName("Project"); if (h.get("Project") != null) {selProj.setCurrentValue((String)h.get("Project"));}%><%=selProj.print()%></font>&nbsp;&nbsp;<input type='submit' value='Next'>
	</TD>
</tr>
</form>

</FONT></TD>
</tr>

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