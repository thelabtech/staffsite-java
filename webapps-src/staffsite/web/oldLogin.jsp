<%@ page import="javax.servlet.http.*" %>
<%@ include file="/style.jspf"%>
<%
Cookie cookies[] = request.getCookies();
String cookieName = "UserName";
String UserName = "first.last";

if(cookies!=null) {
	for(int i=0; i<cookies.length; i++) {
		Cookie cookie = cookies[i];
		if ((cookieName.equals(cookie.getName())) && (cookie.getValue().indexOf("@uscm.org") > 0)){
			UserName=cookie.getValue().substring(0,cookie.getValue().indexOf("@uscm.org"));
		}
	}
}
    
%>
<HTML>
<HEAD>
<TITLE>Campus Crusade Login Authentication</TITLE>

<SCRIPT LANGUAGE="JavaScript"><!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v3.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function popupWindow(cUrl,cName,cFeatures) {
	var xWin = window.open(cUrl,cName,cFeatures)
}

function submit1() {
    document.loginForm2.Password.focus();
    return false;
}

function submit2() {
    document.loginForm2.UserName.value = document.loginForm1.UserName.value;
    /* perform any validation here */
    if (document.loginForm2.UserName.value == "") {
    	alert("You must enter a Username.");
    	return false;
    } else {
    	return true;
    }
}
function submit3(myForm) {
	if (submit2()) {
		myForm.submit();
	}
}
//--></script>

</HEAD>
<BODY BGCOLOR=#FFFFFF>
<FORM  NAME="loginForm1" METHOD="POST" onSubmit="return submit1()">
<TABLE WIDTH="100%" HEIGHT="100%" ALIGN=center>
<TR HEIGHT="80%"><TD colspan=2 align=center>
<TABLE WIDTH=276 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
  <TR>
		<TD>
			<IMG SRC="/images/spacer.gif" WIDTH=71 HEIGHT=1></TD>
		<TD>
			<IMG SRC="/images/spacer.gif" WIDTH=49 HEIGHT=1></TD>
		<TD>
			<IMG SRC="/images/spacer.gif" WIDTH=79 HEIGHT=1></TD>
		<TD>
			<IMG SRC="/images/spacer.gif" WIDTH=4 HEIGHT=1></TD>
		<TD>
			<IMG SRC="/images/spacer.gif" WIDTH=49 HEIGHT=1></TD>
		<TD>
			<IMG SRC="/images/spacer.gif" WIDTH=24 HEIGHT=1></TD>
	</TR>
	<TR>
		<TD>
			<IMG SRC="/images/login_01.gif" WIDTH=71 HEIGHT=100></TD>
		<TD COLSPAN=2>
			<IMG SRC="/images/login_02.gif" WIDTH=128 HEIGHT=100></TD>
		<TD COLSPAN=3>
			<IMG SRC="/images/login_03.gif" WIDTH=77 HEIGHT=100></TD>
	</TR>
	<TR>
		<TD ROWSPAN=7>
			<IMG SRC="/images/login_04.gif" WIDTH=71 HEIGHT=139></TD>
		<TD COLSPAN=5>
			<IMG SRC="/images/login_05.gif" WIDTH=205 HEIGHT=32></TD>
	</TR>
	<TR>
		
    <TD COLSPAN=5 height="30" valign="bottom"> 
        <input type="text" name="UserName" size="40" value="<%=UserName%>">
    </TD>
	</form>
	</TR>
	<TR>
		<TD COLSPAN=5>
			<IMG SRC="/images/login_07.gif" WIDTH=205 HEIGHT=12></TD>
	</TR>
	<TR>
	<form name="loginForm2" METHOD="POST" ACTION="/servlet/StaffController?action=authenticate" onSubmit="return submit2()">	
    <input name="UserName" type="hidden">
	<TD COLSPAN=5 height="30" valign="bottom"> 
        <input type="PASSWORD" name="Password" size="40">
    </TD>
	</TR>
	<TR>
		<TD COLSPAN=5>
			<IMG SRC="/images/login_09.gif" WIDTH=205 HEIGHT=16></TD>
	</TR>
	<TR>
		<TD>
			<A HREF="javascript:submit3(document.loginForm2)" onMouseOver="document.loginbutton.src='/images/login_bon.gif';" onMouseOut="document.loginbutton.src='/images/login_boff.gif';"><IMG NAME="loginbutton" SRC="/images/login_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
		<TD COLSPAN=2>
			<IMG SRC="/images/login_11.gif" WIDTH=83 HEIGHT=26></TD>
		<TD>
			<a href="JavaScript: popupWindow('/help/help_logging_in.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')" onMouseOver="document.helpbutton.src='/images/help_bon.gif';" onMouseOut="document.helpbutton.src='/images/help_boff.gif';"><IMG NAME="helpbutton" SRC="/images/help_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
		
    <TD>&nbsp; </TD>
	</TR>
	<TR>
		<TD COLSPAN=5 STYLE="font-family: Arial; font-size: 10pt; color: #336699" ALIGN="LEFT">
			<BR>
			If you do not have a "USCM" username, enter your entire username (e.g., "john.doe@ccci.org")
			<BR>
			<BR>
			Forgot your password? Password not working? Reset it by clicking <A HREF="JavaScript: popupWindow('/pwreset.jsp', 'PasswordReset', 'height=250,width=300,dependent=yes,scrollbars=yes,resizable')">here</A>.
		</TD>
	</TR>

</TABLE>
</FORM>
</TD></TR>
<TR height="15%"><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2>
<%=hr%>
</TD></TR>
</TR>
</TABLE>
<div style="position: absolute; bottom: 3px; right: 3px;">
<a href="/servlet/StaffController?action=logInGCX" style="font-family: times new roman, serif;">&#960;</a></div>
<!-- capital pi: &#928;  lowercase pi: &#960; -->
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