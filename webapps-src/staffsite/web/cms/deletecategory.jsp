<%@ page import="java.util.*" %>
<% Hashtable tub = (Hashtable)session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>Delete a Category</TITLE>
</HEAD>

<%@ include file="/cms/popupheader.jspf"%>

<center>

<FORM NAME="myForm" ACTION="/servlet/CmsController" METHOD="POST">
	<input type=hidden name="action" value="deleteCategory">
	<input type=hidden name="id" value="<%=tub.get("CmsCategoryID")%>">
	<br>
	<%=font%>Are you sure you want to delete the category '<%=tub.get("CatName")%>'?</font><p>

	<A HREF="JavaScript: document.myForm.submit();" onMouseOver="document.button1.src='/images/ok_bon.gif';" onMouseOut="document.button1.src='/images/ok_boff.gif';"><IMG NAME="button1" SRC="/images/ok_boff.gif" BORDER="0" ALIGN="TOP"></a>
	<A HREF="JavaScript: self.close();" onMouseOver="document.button2.src='/images/cancel_bon.gif';" onMouseOut="document.button2.src='/images/cancel_boff.gif';"><IMG NAME="button2" SRC="/images/cancel_boff.gif" BORDER="0" ALIGN="TOP"></a>

</FORM>
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