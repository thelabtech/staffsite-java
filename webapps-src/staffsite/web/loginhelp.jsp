<%@ include file="/style.jspf"%>

<jsp:useBean id="box" class="org.alt60m.html.Box"/>

<HTML>
<HEAD>
<TITLE>Campus Crusade Login Help</TITLE>
<body>
<%=fontText%>
<center>
<TABLE WIDTH=550 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD>
			<IMG SRC="/images/login_01.gif"><IMG SRC="/images/login_02.gif">
		</TD>
		<TD>
			<a href="javascript:window.close()"><%=fontB%>[Close]</font></a>
		</TD>
	</TR>
</TABLE>
<% 
	box.setTitle("Help with Campus Staff Site Login!");
	box.setWidth("550");
	box.setColor(colorL);
	box.setBodyColor(colorL);
%>
<%=box.printTop()%>
<table border="0" width="100%">
  <tr>
    <td width="72%">We are sorry you couldn't log in. To help you find out why, we listed the 5 most common reasons below. <BR><BR>
		<a href=#first>Logging in for the first time.</a><BR>
		<a href=#password>Forgot your password.</a><BR>
		<a href=#clock>Your computer clock may be wrong.</a><BR>
		<a href=#cookies>You may not have cookies enabled.</a><BR>
		<a href=#browser>Your web browser may not be compatible.</a><BR><br>
	</td>
  </tr>
</table>

<ul>
<%=fontB3%><li><B><a name=first>Logging in for the first time:</a></B></font><br>
	<%=fontB%><b>1) If you are a Campus Ministry staff member:</b></font>
    <BR>
	<%=fontText%>Your <b>"User Name"</b> is the first part of your USCM.org e-mail address - the part before the at sign "@". 
	For example, if your e-mail address in Joe.Staffer@uscm.org, your "User Name" for the new staff site is joe.staffer. 
	If you do not have a USCM e-mail account, <a href="loginhelp2.jsp">click here</a>.
	<BR>
	Your<B> password</B> is one of two possibilities: if you have recently requested a new email address, your 
	password for this site is the same as your email password.  Or, passwords on older accounts on this 
	site were pre-set to the first name of our misistry's co-founder in lowercase letters. If you don't 
	know this, ask a staff member or email <a href="mailto:Systems.Feedback@uscm.org">Systems.Feedback</a>. 
	<BR>
	If you have a uscm.org email account and still can't log in, please skip to the next section and keep reading.
	<BR><BR>
	<%=fontB%><b>2) If you are NOT a Campus Ministry staff member:</b></font>
	<BR>
	If you have not requested a staff.uscm.org account yet or if you have requested one but not received your username and password yet, 
	<a href="loginhelpnewaccount.jsp">click here</a>.
	<BR>
	If you have your username and password, but they are not working, please continue reading below.</li><br><br><br>

<%=fontB3%><li><B><a name=password>Forgot your staff.uscm.org password:</a></B></font><br>
	We can reset your password to whatever you’d like.  
	Just <a href="mailto:Systems.Feedback@uscm.org?Subject=Reset staff.uscm.org Password (include Account # and Username)">email us</a> 
	and be sure to include your Username and Staff Account #. Please follow the password guidelines 
	<a href='#' onClick="window.open('/loginhelppassword.jsp', 'PasswordCriteria', 'height=450,width=600,dependent=yes,scrollbars=yes,resizable')">here.</a>
	</li><br><br><br>

<%=fontB3%><li><B><a name=clock>Your computer clock may be wrong:</a></B></font><br>
	If you are using Explorer 5, it is important to have the right time set on your computer's clock - am/pm, 
	date, and time-zone.  If any of these are incorrect, you may not be able to login to the site.<br>
	<br>
	The time is usually located at the bottom right of your screen.  By simply double-clicking on it 
	you can check the details and change any of the settings. If the clock isn't at the bottom right you can get to it by clicking 
	"Start", "Settings", "Control Panel", "Date/Time".</li><br><br><br>

<%=fontB3%><li><B><a name=cookies>You may not have cookies enabled:</a></B></font><br>
	For the staff site, your browser needs to allow cookies.
		A cookie is a temporary internet file. (not made of flour and sugar)<p>
		Does your computer allow cookies? It is a setting on your browser that can be enabled or disabled. 
		In Internet Explorer 5.0, go to the the TOOLS menu, then INTERNET OPTIONS, then SECURITY tab, then press the 
		CUSTOM LEVEL button, then scroll down to the Cookies section and make sure both are ENABLED.
		</li><br><br><br>

<%=fontB3%><li><B><a name=browser>Your web browser may not be compatible:</a></B></font><br>
	You may have difficulties if you are not using Internet Explorer version 5.0 or Netscape Navigator version 4.0 and up on a PC. 
	Check your browser version (i.e. found in HELP, About Internet Explorer). 
	You can download free versions of each at their respective websites.<BR>
	<a href="http://www.netscape.com/download/index.html"><img src="/images/netscape.gif" border=1></a>
	  <a href="http://www.microsoft.com/windows/ie"><img src="/images/ie.gif" border=1></a>
	</li><br><br>
</ul>
If you try all of these and still can't log in, please 
<a href="mailto:Systems.Feedback@uscm.org?Subject=staff.uscm.org log in - none of these 5 helped me, now what...">email us</a>. 
Be sure to include your username and the password you are trying.
<BR>
	<BR><BR>
	<a href="javascript:window.close()"><%=fontB%>[Close]</font></a>

</font>
<%=box.printBottom()%>
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
