<%@ page import="java.util.*" %>

<% Hashtable tub = (Hashtable)session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>Submit a Resource</TITLE>
</HEAD>

<% String pageTitle = "Submit a resource"; %>
<%@ include file="/cms/popupheader.jspf"%>
<br><br>

<table width="90%" align="center"><tr><td>
	<%=fontL%>Your file was NOT uploaded.</font>
	<%=fontB%>
	<p>The file you have selected is an unsupported filetype and cannot be uploaded to the Content Management System.<br>
	Please contact <a href="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</a> if you have any questions.</p>
	</font>
	<A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';">
		<IMG  NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP">
	</A>
</td></tr></table>
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