<%@ page import="java.util.*" %>
<HTML>
<HEAD>
<TITLE>Campus Staff Site - Sorry!</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
</HEAD>
<% String pageTitle = "Sorry!"; %>
<%@ include file="/infobase/ibheader.jspf" %>
<P ALIGN="CENTER">

<CENTER>
<% box.setTitleColor("#336699");%>
<% box.setColor("#FFFFFF");%>
<% box.setWidth("98%");%>
<%
	box.setTitle("&nbsp;Sorry!");
	box.setStyle("Classic");
	box.setTitleAlign("center");
	
	%>
	<%= box.printTop() %>
<%=font%>

That strategy is already active for the specified target area. <BR><BR>

<P ALIGN="CENTER">
<A HREF="JavaScript: history.go(-2)" onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A>
<%= box.printBottom() %>
</CENTER><BR>&nbsp;
<%@ include file="/infobase/ibfooter.jspf" %>
</HTML>				