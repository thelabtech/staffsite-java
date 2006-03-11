<%@ page import="java.util.*,org.alt60m.servlet.*" %>

<%
	Hashtable tub = (Hashtable)session.getValue("tub");
%>

<HTML>
<HEAD>
<TITLE>Success</TITLE>
<script language="JavaScript"><!--
function supressError() {
    return true;
}

function goBrowse(){ 
    window.onerror = supressError;
	<%
		try {
			if (tub.get("View")!=null) {
				out.println("opener.window.location.href = '"+(String)tub.get("View")+"'");
			} else {
				out.println("opener.location.reload();");
			}
		} catch (NullPointerException e) {
			out.println("opener.location.reload();");
		}
	%>
    setTimeout('self.close()',1000);
}
//--></script>

</HEAD>

<%@ include file="/cms/popupheader.jspf"%>
<br>
<center>
	<%=fontL%><B>Success</B></FONT><br>
	<%=font%>Your new file has been saved to the Resource Center. You can now close this window.</font><br>
	<A HREF="JavaScript:goBrowse();" onMouseOver="document.closebutton.src='/images/close_bon.gif';" onMouseOut="document.closebutton.src='/images/close_boff.gif';"><IMG  NAME="closebutton" SRC="/images/close_boff.gif" BORDER="0" ALIGN="TOP"></A>
	</A></center>
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