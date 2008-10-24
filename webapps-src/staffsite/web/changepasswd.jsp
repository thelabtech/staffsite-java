<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,org.alt60m.util.*,org.alt60m.servlet.*" %>
<jsp:useBean id="box" class="org.alt60m.html.Box"/>
<%	
	Hashtable tub = (Hashtable) session.getValue("passwordChange");
	Hashtable profile = (Hashtable) session.getValue("profile");

	String ErrorMsg = (String)tub.get("ErrorMsg");
	String ResultMsg = (String)tub.get("ResultMsg");
	String firstLogin = (String)tub.get("firstLogin");
	String UserName = (String)tub.get("userName");


%>
<%@ include file="/style.jspf"%>
<HTML>
<HEAD>
<TITLE>Passwords</TITLE>
</HEAD>

<SCRIPT language="javascript">
<!--
function checkInput(){
	if (document.forms[0].Password.value.length >14){
		alert("Your password must be no more than 14 characters.");
		document.forms[0].Password.value="";
		document.forms[0].VPassword.value="";
		return false;
	}
	if (document.forms[0].Password.value.length <5){
		alert("Your password must be at least 5 characters.");
		document.forms[0].Password.value="";
		document.forms[0].VPassword.value="";
		return false;
	}
	if (document.forms[0].Password.value!=document.forms[0].VPassword.value){
		alert("Your new passwords do not match.");
		document.forms[0].Password.value="";
		document.forms[0].VPassword.value="";
		return false;
	}
}
//-->
</SCRIPT>


<body BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#336699" VLINK="#336699" leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
&nbsp;<p>
<CENTER>
<TABLE WIDTH=400 BORDER=0 CELLPADDING=0 CELLSPACING=0><!-- Whole Page table -->
<TR><TD>

<%	box.setTitle("Change Your Staff Site Password");
	box.setTitleFontSize("5");
	box.setColor(color7);
	box.setBodyColor(color7);
	%>
<%=box.printTop()%>
<%	
    if(!ErrorMsg.equals("")){
%>
	<%=fontR%><UL>
	<%=ErrorMsg%>
	   </UL></FONT>
	<p>
		<A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A>&nbsp;
<%
    }
	else if(!ResultMsg.equals("")){
%>

	<%=font%>
    Password successfully changed<p>
	<center>
		<A HREF="/servlet/StaffController?action=showHome">Go to Home Page</A>
	</center>
	</FONT>

<%
    }
    else {
%>
<table width='100%'>
<TR>
    <TD COLSPAN="2"><%=font%>
        <B>Welcome <%=profile.get("FirstName")%>&nbsp;<%=profile.get("LastName")%>,<P></B>
	<%
    if(firstLogin.equals("true")) {
%>
        You are required to change your password in order to login.
<%
    } else {
%>      To change your password, you must enter your current password and your desired password.
<%
    }
%>
<p>
	Currently, your new password must follow these rules:
	<%=fontS%>
	<li>minimum of 5 characters</li>
	<li>maximum of 14 characters</li>
	<!--<li>you cannot reuse an old password</li>-->
	</font>
	<p>
<p><%=fontR%><I><B>Note</B></I>: This will not change your Outlook Password</font>

</TD></TR>
	<form action="/servlet/StaffController" method="post" onSubmit="return checkInput();">
		<input type=hidden name="action" value="changePassword">
		<input type=hidden name="view" value="userChangePassword">
		<input type=hidden name="UserName" value="<%=UserName%>">
		<TR> <TD ALIGN=RIGHT VALIGN=TOP width='50%'><%=fontText%>Temporary Password</font></td><td><input name="OPassword" type=password></td>  </tr>
		<TR> <TD ALIGN=RIGHT VALIGN=TOP><%=fontText%>Desired Password</font></td><td><input name="Password" type=password maxlength=15></td>  </tr>
		<TR> <TD ALIGN=RIGHT VALIGN=TOP><%=fontText%>Verify Desired Password</font></td><td><input name="VPassword" type=password maxlength=15></td>  </tr>
		<TR> <TD colspan=2 ALIGN=center> <input type=submit value="Change Password"> </TD></TR>
</form>

<TR>
    <TD COLSPAN="2" align=left><%=font%>
<%    if(!firstLogin.equals("true")) { %>
        <A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A>&nbsp;
<% } %>
    </FONT></TD>
</TR>
</TABLE>
<%}		//end form entry view
%>
<%=box.printBottom()%>

</TD></TR>
</TABLE> <!-- whole table close -->
</CENTER>

  <center>
  <table width="755" border="0">
	<tr>
		<td align="center">
		  <font size="1"><i>© 2001 Campus Crusade for Christ International
		  </i><br>
		</td>
	</tr>
  </table>
  </center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY></HTML>