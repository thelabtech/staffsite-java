<%@ page import="java.util.*" %>

<% Hashtable tub = (Hashtable)session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>Upload Error</TITLE>
</HEAD>

<% String pageTitle = "Upload Error"; %>
<%@ include file="/cms/popupheader.jspf"%>
<br><br>

<table width="90%" align="center"><tr><td>
<%=fontB%>
	<p>
	An error has occurred and your file has not been uploaded. Please click Back and try again. If the problem persists, 
	please contact <a href="mailto:help@campuscrusadeforchrist.com?subject=Resource_Center_file_upload_problem">help@campuscrusadeforchrist.com</a>.</p>
</font>
</td></tr></table>

<br><br><br>
	<A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/cms/images/back_bon.gif';" onMouseOut="document.backbutton.src='/cms/images/back_boff.gif';">
		<IMG  NAME="backbutton" SRC="/cms/images/back_boff.gif" BORDER="0" ALIGN="TOP">
	</A>
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