<% String pageTitle = "Mobilizing System Error Page"; %>
<%@ include file="siMainHeader.jspf" %>
<%@ page import="org.alt60m.servlet.*" %>
<%
	String errorString = (String)session.getValue("ErrorString");
%>
Sorry, but an error occured.<br />
<% if (errorString != null) out.println(errorString); %>
<div align="center" CLASS="small">
<i>© 2002 Campus Crusade for Christ International
</i><br>
</div>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</BODY>
</HTML>