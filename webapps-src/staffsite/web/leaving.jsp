<jsp:useBean id="box" class="org.alt60m.html.Box"/>
<HTML>
<HEAD>
<TITLE>Leaving Campus Staff Site</TITLE>
<META http-equiv="Refresh" content="8; url=<%= request.getParameter("url") %>">
</HEAD>
<%@ include file="/style.jspf" %>
<body>
<center>
<br><br><br>
<% 
	box.setTitle("You're on your way...");
	box.setWidth("400");
	box.setColor(color3);
%>
<center>
<%=box.printTop()%>
	<%=font%><b><center>
	<br>
	<p>You are now leaving the Campus Staff Site. We are not responsible for content on the site you are going to.</p>
    <P>You will be taken there automatically in 8 seconds, or you can <A HREF="<%=request.getParameter("url")%>">Click Here</A> to go immediately.
	<p>Close this window to return to the staff site.</p>
	<BR>
	<br>
    </b></FONT></center>
<%=box.printBottom()%>
</center>
<%@ include file="/headers/google_analytics.jspf"%>
</body>
</HTML>

