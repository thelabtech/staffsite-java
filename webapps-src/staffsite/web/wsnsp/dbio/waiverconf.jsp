<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Waiver Confirmation"; %>

<%@ include file="wsnspheader.jspf" %>
&nbsp;
<p>
<ul>
<b>The specified people have now been marked as having their Waivers received.
<p>
Make sure that you update your records. Thank you!</a>
<p>
<%=fontXL%><a href='/servlet/WsnSpController?action=showIndex'>Return to WSN SPT home page</a></font>
<p>
</ul>

<%@ include file="wsnspfooter.jspf" %>

</HTML>