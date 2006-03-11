<%@ page import="java.util.*, org.alt60m.servlet.*, org.alt60m.html.*" %>
<jsp:useBean id="box" class="org.alt60m.html.Box"/>
<%
 Hashtable h = (Hashtable) session.getValue("tub"); 
 String url = (String)h.get("url");
%>
<html>
<META HTTP-EQUIV="REFRESH" CONTENT="1; URL=<%=url%>">
<body BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#336699" VLINK="#336699" leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
<p>&nbsp;
<center>
<p>
<font face=arial>
	<%	box.setColor("#cccc99");
//		box.setBodyColor("#cccc99");
		box.setWidth("30%");
		box.setTitleFontSize("4");
		box.setTitle("Resource Opening..."); %>
	<%=box.printTop()%><center>
		<br>
		<B>one moment please...</B><br>
		we are locating the requested file...<p>
		If the requested resource does not open<br>
		in a couple seconds, click <A HREF="<%=url%>">here</A>.
		<br>
		</center>
	<%=box.printBottom()%>
</font>
</center>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</body>
</html>