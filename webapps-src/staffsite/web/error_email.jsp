<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>
<HTML>
<HEAD>
<TITLE>Campus Staff Site - Email Setup</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}--> 
</STYLE>
</HEAD>

<%@ include file="/headersmall.jspf" %>
<%
	ActionResults results = ActionResults.getActionResults(session);
	String mode = results.getValue("mode");
	%>
	<% box.setStyle("rounded");%>
	<% box.setColor(color7);%>
	<% box.setWidth("100%");%>
	<% box.setBodyColor(color7);%>
	<% box.setSubPad("5");%>
	<% box.setBodyFontSize("2");%>
	<%=box.printTop()%>
	<%
	if (mode.equals("toomanyattempts")) {
%>

		Sorry. Outlook Web Access does not recognize any of the passwords you have entered. Please contact your <A HREF="">regional tech representative</A> for further assistance.
<%
	} else {
%>
		Sorry. There was problem setting up your email. Please contact your <A HREF="">regional tech representative</A> for further assistance.
<%
	}
  out.print(box.printBottom());
%>

<%@ include file="/footer.jspf" %>
</HTML>