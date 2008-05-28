<%@ page import="java.util.*" %>
<HTML>
<HEAD>
<TITLE>Campus Staff Site - Non Numeric Data Entry Error</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
</HEAD>
<% String pageTitle = "Non Numeric Data Entry Error"; %>
<%@ include file="/infobase/ibheader.jspf" %>
<P ALIGN="CENTER">

<CENTER>
<% box.setTitleColor("#336699");%>
<% box.setColor("#FFFFFF");%>
<% box.setWidth("98%");%>
<%
	box.setTitle("&nbsp;Error");
	box.setStyle("Classic");
	box.setTitleAlign("center");
	
	%>
	<%= box.printTop() %>
<%=font%>


You entered letters, symbols or other non-numeric information in a form field that accepts only numbers (digits).  <BR><BR>
Acceptable: <input type="text" style="width:10px;overflow:visible;" value="0">,<input type="text" style="width:10px;overflow:visible;" value="3">,<input type="text" style="width:10px;overflow:visible;"  value="25">, <input type="text"  style="width:10px;overflow:visible;" value="3000"><br><br>
Unacceptable: <input type="text"  style="width:10px;overflow:visible;" value="thirty-seven">,<input type="text"  style="width:10px;overflow:visible;" value="one">,<input type="text"  style="width:10px;overflow:visible;" value="4-6">, <input type="text"  style="width:10px;overflow:visible;" value="7%"><input type="text"  style="width:10px;overflow:visible;" value="'25'"> etc.<br><br>

If this section of the InfoBase continues to give you problems, please email <a href="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</a>.<BR><BR>


Thank you.

<P ALIGN="CENTER">
<A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A>

<%= box.printBottom() %>
</CENTER><BR>&nbsp;
<%@ include file="/infobase/ibfooter.jspf" %>
</HTML>				