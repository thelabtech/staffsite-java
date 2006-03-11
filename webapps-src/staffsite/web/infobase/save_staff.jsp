<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="mySelect" class="org.alt60m.html.SelectRegion">
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
Hashtable staffInfo = (Hashtable)ar.getHashtable("staffinfo");
mySelect.setCurrentValue((String)staffInfo.get("Region"));
mySelect.setName("Region");
%>
<% String pageTitle="Update Staff Info"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<P ALIGN="CENTER"><CENTER>
<% box.setTitle("Staff Info:");
   box.setStyle("Classic");
	 box.setWidth("");
	 out.print(box.printTop()); %>
<FORM NAME="updateStaff" METHOD="POST" ACTION="/servlet/InfoBaseController?action=saveStaffInfo">
<INPUT TYPE="HIDDEN" NAME="staffid" VALUE="<%= (String)staffInfo.get("AccountNo") %>">
<TABLE BORDER=0 CELLPADDING=3 CELLSPACING=0>
<TR>
	<TD>&nbsp;</TD>
	<TD><%= fontS %>(* = Required field)</TD>
</TR>
<TR>
	<TD ALIGN="RIGHT" WIDTH="50%"><%= font %>First name: </TD>
	<TD><%= font %><%= staffInfo.get("FirstName") %></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT" WIDTH="50%"><%= font %>Last name:</TD>
	<TD><%= font %><%= staffInfo.get("LastName") %></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>*Region:</TD>
	<TD><%= font %><%= mySelect.print() %> </TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Mobile Phone:</TD>
	<TD><%= font %><INPUT TYPE="text" SIZE="20" VALUE="<%= staffInfo.get("MobilePhone") %>" NAME="MobilePhone"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Pager:</TD>
	<TD><%= font %><INPUT TYPE="text" SIZE="20" VALUE="<%= staffInfo.get("Pager") %>" NAME="Pager"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Fax:</TD>
	<TD><%= font %><INPUT TYPE="text" SIZE="20" VALUE="<%= staffInfo.get("Fax") %>" NAME="Fax"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Website URL:</TD>
	<TD><%= font %><INPUT TYPE="text" SIZE="30" VALUE="<%= staffInfo.get("Url") %>" NAME="Url"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Note: <BR>(less than<BR>2048 characters)</TD>
	<TD><%= font %>
		<textarea name="Note" cols="22" rows="5" wrap="VIRTUAL">
			<%= staffInfo.get("Note") %>
		</textarea></TD>
</TR>
</TABLE><P ALIGN="CENTER">
<INPUT TYPE="Submit" VALUE="Update"></FORM>
<%= box.printBottom() %>
<!--<%=fontB%><%=ar.toHTML()%>-->
<%@ include file="/infobase/ibfooter.jspf" %>
</jsp:useBean>
</html>