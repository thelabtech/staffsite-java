<%@ page import="java.util.*" %>
<% Hashtable tub = (Hashtable)session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>Add a Category</TITLE>
</HEAD>

<%@ include file="/cms/popupheader.jspf"%>

<br>
<center>
<FORM NAME="myForm" ACTION="/servlet/CmsController" METHOD="POST">
	<input type=hidden name="action" value="addCategory">
	<input type=hidden name="catId" value="<%=tub.get("catId")%>">
	<TABLE BORDER="0" CELLPADDING="3" WIDTH="90%" CELLSPACING="0">
		 <TR>
			<TD><%=font%>New Category:</FONT></TD>
			<td><input type=text name="CatName" size=20></td>
		</TR>
		<TR>
			<td></td>
			<TD align=right>
				<A HREF="JavaScript: document.myForm.submit();" onMouseOver="document.addcategorybutton.src='/images/add_bon.gif';" onMouseOut="document.addcategorybutton.src='/images/add_boff.gif';"><IMG  NAME="addcategorybutton" SRC="/images/add_boff.gif" BORDER="0" ALIGN="TOP"></A>
				</A>
			</TD>
		</TR>
	</TABLE>
</FORM>
</center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>