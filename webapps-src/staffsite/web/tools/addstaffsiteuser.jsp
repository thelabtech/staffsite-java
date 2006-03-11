<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,org.alt60m.util.*" %>
<%
	Hashtable tub = (Hashtable)session.getValue("tub");
	String errorMsg = "";
	String resultMsg = "";
	String Option = "";
	String username = (String)tub.get("UserName");
	String usernameprefix = "";
	String usernamesuffix = ""; 
	int radioOption = 0;  //default to uscm
		
 	if (username != null && !username.equals("")) {
		usernameprefix = username.substring(0, username.indexOf("@"));
		usernamesuffix = username.substring(username.indexOf("@") + 1, username.length());
		if (usernamesuffix.equals("uscm.org"))
		{
			radioOption = 0; //uscm.org
		} else if (usernamesuffix.equals("ccci.org")) {
			radioOption = 1; //ccci.org
		} else {
			radioOption = 2; //custom
		}
	}
	if (tub.get("ErrorMsg")!=null){
		errorMsg = (String)tub.get("ErrorMsg");
	}
	if (tub.get("ResultMsg")!=null){
		resultMsg = (String)tub.get("ResultMsg");
	}
	if (tub.get("Option")!=null){
		Option = (String)tub.get("Option");
	}
	int curr_tab=3;
%>

<HTML>
<HEAD>
<TITLE>Edit Staff Site Users</TITLE>
</HEAD>

<%@ include file="/headersmall.jspf" %>
<SCRIPT LANGUAGE="JavaScript">
<!--

	function submitChanges(){
		
<%
if(Option.equals("Update")) {
	//maybe in future make username editable?
} else {
%>

		var suffix = "none";
		if (document.addauthors.UserNameSuffix[0].checked) {
			suffix = document.addauthors.UserNameSuffix[0].value;
		} else if (document.addauthors.UserNameSuffix[1].checked) {
			suffix = document.addauthors.UserNameSuffix[1].value;
		} else {
			suffix = document.addauthors.CustomSuffix.value;
		}
		document.addauthors.UserName.value = document.addauthors.UserNamePrefix.value 
			+ '@' + suffix;
<%
}
%>	
			
		document.addauthors.submit();
	}
//-->	
</SCRIPT>

<p align=center>
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

<% box.setTitle("Staff Site User Control"); %>
<% box.setStyle("classic"); %>
<%=box.printTop() %>
<TABLE BORDER="0" CELLPADDING="3" align=center>
<FORM NAME="addauthors" ACTION="/servlet/StaffController" METHOD="POST">
<input type=hidden name='action' value='AddUser'>
<input type=hidden name='ID' value='<%=tub.get("ID")%>'>
<%
////////   MESSAGES HERE         ///////////////////////////////////////////////////////////////////////////
    if(!errorMsg.equals("")) {
		%>
		<TR><TD <%=bgcolorL%> COLSPAN="2" ALIGN=LEFT VALIGN=TOP><%=fontR%><B><UL>
			<%=tub.get("ErrorMsg")%></UL></B></FONT></TD>
		</TR>
		<%
    }
	else if(!resultMsg.equals("")) {
		%>
		<TR><TD <%=tableCenterL%> COLSPAN="2"><%=fontB%><B>
			<H1><%=resultMsg%></H1> <%=tub.get("UserName")%></B></FONT></TD>
		</TR>
		<%
        }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
%>
<TR>
    <TD <%=tableLeftL%>><%=fontB%><B>        First Name    </B></FONT></TD>
    <TD <%=tableRightL%>><%=fontB%><INPUT NAME="FirstName" SIZE="30" MAXLENGTH="64" VALUE="<%if(!Option.equals("")) { if(tub.get("FirstName") != null) out.print(tub.get("FirstName")); }%>"></FONT></TD>
</TR>
<TR>
    <TD <%=tableLeftL%>><%=fontB%><B>        Last Name    </B></FONT></TD>
    <TD <%=tableRightL%>><%=fontB%><INPUT NAME="LastName" SIZE="30" MAXLENGTH="64" VALUE="<%if(!Option.equals("")){ if(tub.get("LastName") != null) out.print(tub.get("LastName")); }%>"></FONT></TD>
</TR>
<TR>
    <TD <%=tableLeftL%>><%=fontB%><B>        Account No.    </B></FONT></TD>
    <TD <%=tableRightL%>><%=fontB%><INPUT NAME="AccountNo" SIZE="30" MAXLENGTH="64" VALUE="<%if(!Option.equals("")){ if(tub.get("AccountNo") != null) out.print(tub.get("AccountNo")); }%>"><BR>(9 digits, so add 00 before their 7 digit no. <BR>For wives "S" must be capital.)</FONT></TD>
</TR>
<TR>
    <TD <%=tableLeftL%>><%=fontB%><B>        Username</B><BR>&nbsp;required    </FONT></TD>
    <TD <%=tableRightL%>><%=fontB%>
<%
%>
        <INPUT TYPE=HIDDEN NAME="UserName" VALUE="<%=username%>">
<%
        if(Option.equals("Update")) {
			out.print(username); 
			//maybe in future make username editable?

        } else {
%>
        <TABLE>
        <TR>
        <TD VALIGN="TOP"> <%=fontB%>
        <INPUT NAME="UserNamePrefix" SIZE="18" MAXLENGTH="64" VALUE="<%=usernameprefix%>">
	   </TD>
	   <TD ALIGN="LEFT"> <%=fontB%>
	   <INPUT NAME="UserNameSuffix" TYPE="radio" VALUE="uscm.org" <% if(radioOption == 0) {%> CHECKED <%} %>>
	   @uscm.org<br>
	   <INPUT NAME="UserNameSuffix" TYPE="radio" VALUE="ccci.org" <% if(radioOption == 1) {%> CHECKED <%} %>>
	   @ccci.org<br>
	   <INPUT NAME="UserNameSuffix" TYPE="radio" VALUE="custom" <% if(radioOption == 2) {%> CHECKED <%} %>>
	   @<INPUT NAME="CustomSuffix" SIZE="6" MAXLENGTH="16" VALUE="<% if(radioOption == 2){%><%=usernamesuffix%><%} %>">
	   </TD>
	   </TR>
	   </TABLE>

<%
        }
%> <!--@uscm.org-->
    </FONT></TD>
</TR>
<TR>
    <TD <%=tableLeftL%>><%=fontB%><B>        Password		</B></FONT></TD>
    <TD <%=tableRightL%>><%=fontB%>
<%
        if(Option.equals("Update")) {
			out.print("If you want to have this users password changed,<BR> check the change password on next login box."); 
        }
		else {
%>
        <INPUT TYPE=PASSWORD NAME="Passwd" SIZE="30" MAXLENGTH="20">
<%
        }
%>
    </FONT></TD>
</TR>
<TR>
    <TD <%=tableLeftL%>><%=fontB%><B>        Verify Password		</B></FONT></TD>
    <TD <%=tableRightL%>><%=fontB%>
<%
        if(Option.equals("Update")) {
			%>&nbsp;<%
        }
		else {
%>
        <INPUT TYPE=PASSWORD NAME="Vpasswd" SIZE="30" MAXLENGTH="20">
<%
        }
%>
    </FONT></TD>
</TR>
<TR>
    <TD <%=tableCenterL%> COLSPAN=2>
        <INPUT TYPE="CHECKBOX" NAME="ChangePassword" VALUE="true" <% if("Y".equals(tub.get("ChangePassword"))) {%>CHECKED<%}%>>&nbsp;
        <%=fontB%>Must change password on next login</FONT>
    </TD>
</TR>
<TR>
    <TD <%=tableCenterL%> COLSPAN=2>
        <INPUT TYPE="CHECKBOX" NAME="IsStaff" VALUE="true" <% if("Y".equals(tub.get("IsStaff"))) {%>CHECKED<%}%>>&nbsp;
        <%=fontB%>Is a Staff Member?</FONT>
    </TD>
</TR>
<TR>
    <TD <%=bgcolorL%> VALIGN=CENTER ALIGN=CENTER><%=fontB%><B>
        <A HREF="Javascript: history.go(-1)"BACK</A>
    </B></FONT></TD>
    <TD <%=tableCenterL%>><%=fontB%><B>
        <SELECT NAME="Option">
            <OPTION VALUE="Create" <% if(Option.equals("Create")) out.print("SELECTED");%>>Create
            <OPTION VALUE="Update" <% if(Option.equals("Update")) out.print("SELECTED");%>>Edit
            <OPTION VALUE="Delete" <% if(Option.equals("Delete")) out.print("SELECTED");%>>Delete
        </SELECT>
        <A HREF="JavaScript: submitChanges()" >SUBMIT</A>
    </B></FONT></TD>
</TR>
<TR>
    <TD COLSPAN="2" <%=tableCenterL%>><%=fontB%><B>
        <A HREF="/servlet/StaffController?action=showHome" >HOME</A>
    </B></FONT></TD>
</TR>
</FORM>
</TABLE>
<%=box.printBottom() %>

</td></tr>
</table>


</CENTER>
<p>
<%@ include file="/footer.jspf" %>
</HTML>