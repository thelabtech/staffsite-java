<HTML>
<HEAD>
<TITLE>Websites</TITLE>
</HEAD>
<% int curr_tab = 5; %>
<%@ include file="/header.jspf"%>

<% box.setStyle("rounded");%>
<% box.setColor(color3);%>
<% box.setTitleFontSize("5");	%>
<% box.setTitle("Sites");	%>
<%=box.printTop()%>
<p>

This page is depricated. Update your header.jsp file, delete your ADE_HOME/tomcat/work/localhost8080/ files, and restart tomcat!
<p>
<% box.setStyle("rounded");%>
<%=box.printBottom()%>

<br>
<%@ include file="/footer.jspf" %>
</BODY>
</HTML>

