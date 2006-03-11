<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Insurance - (Search Tool)"; %>
<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="listInsurance">
<input type="hidden" name="view" value="showinsurance">

<table width='100%' border='0'>

<TR VALIGN=TOP><td colspan=2><%=fontTextL%><b>Project to search by:</font></b></td><td rowspan=2><%=font%>
	<ul>	<p>
	</ul></FONT></TD></tr>
<tr valign='top'><td><%=font%><b>&nbsp;&nbsp;</b></FONT></TD><td><%=font%><% selProj.setName("Project"); %><%=selProj.print()%></TD></tr>


</table>
<%=searchSubmit%>
</form>
<p> &nbsp;

<%@ include file="wsnspfooter.jspf" %>

</HTML>