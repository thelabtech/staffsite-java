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
<% box.setStyle("rounded");%>
<% box.setColor(color3);%>
<% box.setTitleFontSize("3");	%>
<% box.setTitle("Access Denied");	%>
<%=box.printTop()%>
<P ALIGN="CENTER"><CENTER>
<%
//	ActionResults results = ActionResults.getActionResults(session);
//	String mode = results.getValue("mode");
//	if (mode.equals("nonstaff")) {
//		out.println(font + "The Staff Resources are only available to Campus Crusade for Christ staff members. If you are on staff with Campus Crusade, please contact our <A HREF=\"mailto: help@campuscrusadeforchrist.com\">Customer Service Team</A> to update your profile.");
//	} else {
		out.println(font + "The Staff Resources are only available to Campus Crusade for Christ staff members. If you are on staff with Campus Crusade, please contact our <A HREF=\"mailto: help@campuscrusadeforchrist.com\">Customer Service Team</A> to update your profile.");
//	}

%>
</CENTER><%=box.printBottom()%>
<%@ include file="/footer.jspf" %>
</HTML>				