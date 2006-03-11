<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,org.alt60m.util.*" %>

<HTML>
<HEAD>
<TITLE>Campus Staff Site</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>

</HEAD>
<% int curr_tab = 3; %>
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
<%
	if (session.getValue("passwordChange")!=null){
		Hashtable tub = (Hashtable) session.getValue("passwordChange");
		if (tub.get("ErrorMsg")!=null){
			%><%=fontR%><%=tub.get("ErrorMsg")%></font><p><%
		}
		if (tub.get("ResultMsg")!=null){
			%><b><%=tub.get("ResultMsg")%></b><%
		}
	}
%>
<% box.setTitle("Reset user Password");%>
<% box.setStyle("classic"); %>
<%=box.printTop()%>
	<TABLE BORDER="0" CELLPADDING="0">
		<form action="/servlet/StaffController" method="post" >
		<input type=hidden name="action" value="resetPassword">
		<input type=hidden name="view" value="sec">
		<TR> <TD ALIGN=LEFT VALIGN=TOP colspan=3><%=fontL%>Reset User Password </font></td>  </tr>
		<TR> <TD ALIGN=RIGHT VALIGN=TOP><%=fontText%>UserName</font></td><td><input name="UserName" value="user.name@uscm.org"></td><td nowrap><%=fontTextS%>Always use the full<BR>email address / username.</font></td>  </tr>
		<TR> <TD ALIGN=RIGHT VALIGN=TOP><%=fontText%>Password</font></td><td><input name="Password" maxlength=14></td><td><%=fontTextS%>(maxlength:14)</font></td>  </tr>
		<TR> <TD ALIGN=RIGHT VALIGN=TOP nowrap><%=fontText%>Flag for password change</font></td><td><input name="Flag" type=checkbox value=true> <%=fontTextS%>(Staff users only)</font></p></td><td></td>  </tr>
		<TR> <TD colspan=3 ALIGN=center> <input type=submit value="Reset Password"> </TD></TR>
	</TABLE>
<%=box.printBottom()%>
</form>

</td></tr>
</table>

	  <%@ include file="/footer.jspf" %>
 </html>
