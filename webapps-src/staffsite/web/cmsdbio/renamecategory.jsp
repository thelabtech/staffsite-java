<%@ page import="java.util.*" %>
<% Hashtable tub = (Hashtable)session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>Rename a Category</TITLE>
</HEAD>

<% String pageTitle = "Rename a Category"; %>
<%@ include file="/cms/popupheader.jspf"%>

<center>

<FORM NAME="myForm" ACTION="/servlet/CmsController" METHOD="POST">
	<input type=hidden name="action" value="renameCategory">
	<input type=hidden name="id" value="<%=tub.get("CategoryId")%>">
	<TABLE BORDER="0" CELLPADDING="3" WIDTH="90%" CELLSPACING="0">
		<TR>
			<TD><%=font%>Current Name:</FONT></TD>
			<TD><%=font%><%=tub.get("CatName")%></FONT></TD>
		</TR>
		 <TR>
			<TD><%=font%>New Name:</FONT></TD>
			<td><input type=text name="CatName" size=20></td>
		</TR>
		<TR>
			<td></td>
			<TD align=right>
				<A HREF="JavaScript: document.myForm.submit();"  onMouseOver="document.renamecategorybutton.src='/images/rename_bon.gif';" onMouseOut="document.renamecategorybutton.src='/images/rename_boff.gif';"><IMG  NAME="renamecategorybutton" SRC="/images/rename_boff.gif" BORDER="0" ALIGN="TOP"></A>
				</A>
			</TD>
		</TR>
	</TABLE>
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