<%@ page import="java.util.*,javax.servlet.http.*" %>
<%
	Hashtable tub = (Hashtable)session.getValue("tub");
	String ErrorMsg = "";
	if (tub.get("ErrorMsg")!=null){
		ErrorMsg = (String)tub.get("ErrorMsg");
	}
	else{ ErrorMsg = ""; }
	int curr_tab=3;
%>

<HTML>
<HEAD>
<TITLE>List Staff Site Users</TITLE>
</HEAD>
<%@ include file="/headersmall.jspf" %>

<CENTER>
<p>
<table width='100%'>
<tr><td width='40%' valign=top>
<% box.setTitle("User Administration");%>
<% box.setStyle("classic"); %>
<%=box.printTop()%>
<%=fontXL%><b>Tools:</b></font><p>
<%=fontL%>
<ul>
	<a href="/servlet/StaffController?action=listUsers">List Users</a><p>
	<a href="/servlet/StaffController?action=AddUser&Option=Add">Add User</a><p>
	<a href='/servlet/StaffController?action=showUserAdmin'>Reset User Password</a><p>
</ul>
</font>
<%=box.printBottom()%>
</td><td width='60%' valign=top>

	<%=font%>
			Click on the username to edit/delete that user. Click on "Add User" to add a user.<br> <b>Tip:</b> use your browser's 'find in page' feature to help you find a specific user.</font>
	<center>	<%=fontR%><%=ErrorMsg%></font></center>
	<p>

<!-- --------------------------------------------- LIST USERS------------------------------------ -->
<% box.setTitle("List Users");%>
<% box.setStyle("classic"); %>
<%=box.printTop()%>
<%=font%>
	<table width='100%'><tr><td width='25%'><%=fontS%>
	<%
	int tubSize = new Integer((String)tub.get("numOfUsers")).intValue();
			for (int i = 0; i < tubSize/4; i++) {  %>
				<a href="/servlet/StaffController?action=AddUser&UserName=<%=tub.get(String.valueOf(i))%>&Option=View"><%=tub.get(String.valueOf(i))%></a><br> <%
			}
			%></font></td><td width='25%'><%=fontS%><%
			for (int i = tubSize/4; i < (tubSize/2); i++) {  %>
				<a href="/servlet/StaffController?action=AddUser&UserName=<%=tub.get(String.valueOf(i))%>&Option=View"><%=tub.get(String.valueOf(i))%></a><br> <%
			}
			%></font></td><td width='25%'><%=fontS%><%
			for (int i = (tubSize)/2; i < (3*tubSize)/4; i++) {  %>
				<a href="/servlet/StaffController?action=AddUser&UserName=<%=tub.get(String.valueOf(i))%>&Option=View"><%=tub.get(String.valueOf(i))%></a><br> <%
			}
			%></font></td><td width='25%'><%=fontS%><%
			for (int i = (3*tubSize)/4; i < tubSize; i++) {  %>
				<a href="/servlet/StaffController?action=AddUser&UserName=<%=tub.get(String.valueOf(i))%>&Option=View"><%=tub.get(String.valueOf(i))%></a><br> <%
			}
	%>
	</font>
	</td></tr>
	</table>

<%=box.printBottom()%>
</td>
</tr>
</table>


      <%@ include file="/footer.jspf" %>
 </html>
