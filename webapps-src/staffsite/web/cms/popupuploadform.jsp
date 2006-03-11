<%@ page import="java.util.*" %>
<jsp:useBean id="language" class="org.alt60m.html.SelectLanguage" />
<% 
	Hashtable tub = (Hashtable)session.getValue("tub");
%>

<HTML>
<HEAD>
<TITLE>Submit a Resource</TITLE>
</HEAD>

<% String pageTitle = "Submit a resource"; %>
<%@ include file="/cms/popupheader.jspf"%>

<center>
	<TABLE BORDER="0" CELLPADDING="3" WIDTH="90%" CELLSPACING="0">
		<TR>
			<TD colspan="7"><%=fontB%>How would you like to submit this resource?</FONT><p></TD>
		</TR>
		<TR>
			<TD></TD>
			<TD width="30%" align=center><a href="/servlet/CmsController?action=popupUploadFile&catId=<%=tub.get("CatId")%>"><IMG SRC="/cms/images/submitfile.gif" BORDER=0 ALT="Submit File" NAME="File"></a></TD> 
			<TD></TD>
			<TD width="30%" align=center><a href="/servlet/CmsController?action=popupUploadText&catId=<%=tub.get("CatId")%>"><IMG SRC="/cms/images/submittext.gif" BORDER=0 ALT="Type Text" NAME="Text"></a></TD> 
			<TD></TD>
			<TD width="30%" align=center><a href="/servlet/CmsController?action=popupUploadWeb&catId=<%=tub.get("CatId")%>"><IMG SRC="/cms/images/submitlink.gif" BORDER=0 ALT="Submit Link" NAME="Web"></a></TD> 
			<TD></TD>
		</TR>

	</TABLE>
</center>
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