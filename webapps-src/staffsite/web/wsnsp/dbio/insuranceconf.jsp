<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Insurance Confirmation"; %>

<%@ include file="wsnspheader.jspf" %>
&nbsp;
<p>
<ul>
<b>The specified people have now been marked as having their Insurance received.
<p>
Make sure that you update your records. Thank you!</a>
<p>
<%=fontXL%><a href='/servlet/WsnSpController?action=showIndex'>Exit</a></font>
<p>
</ul>
<!--
<%
for (Enumeration e = h.keys(); e.hasMoreElements();) {
	String k = (String) e.nextElement();
	out.println("key: " + k + " value: " + h.get(k) + " <br>");
}
%>
-->
<%@ include file="wsnspfooter.jspf" %>

</HTML>