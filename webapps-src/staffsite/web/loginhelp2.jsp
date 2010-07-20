
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="box" class="org.alt60m.html.Box"/>

<%@ include file="/style.jspf"%>

<HTML>
<HEAD>
<TITLE>Campus Crusade Login Help</TITLE>
<script type="text/javascript" language="javascript">
var digits = /[0123456789]/g;
var lowers = /[abcdefghijklmnopqrstuvwxyz]/g;
var uppers = /[ABCDEFGHIJKLMNOPQRSTUVWXYZ]/g;
var symbols = /[~!#$%^+*()]/g;
function checkpw()
{
	pw=document.getElementById('pw').value;
	fn=document.getElementById('firstName').value.toLowerCase();
	ln=document.getElementById('lastName').value.toLowerCase();
	var divs = new Array();
	var passes=4;
	var problems="Your password must have 3 out of 4 of : ";
	var fatals="";
	
	if(pw.match(digits)==null) {
		passes=passes-1;
		problems=problems+"at least one digit, ";
		divs.push('digit');
	}
	else
	{
		if(document.getElementById('digit').style.color=="red"){document.getElementById('digit').style.color="green";}
	}
	if(pw.match(uppers)==null) {
		passes=passes-1;
		problems=problems+"at least one UPPERCASE LETTER, ";
		divs.push('upper');
	}
	else
	{
		if(document.getElementById('upper').style.color=="red"){document.getElementById('upper').style.color="green";}
	}
	if(pw.match(lowers)==null) {
		passes=passes-1;
		problems=problems+"at least one lowercase letter, ";
		divs.push('lower');
	}
	else
	{
		if(document.getElementById('lower').style.color=="red"){document.getElementById('lower').style.color="green";}
	}
	if(pw.match(symbols)==null) {
		passes=passes-1;
		problems=problems+"at least one symbol ~!#$%^+*(), ";
		divs.push('symbol');
	}
	else
	{
		if(document.getElementById('symbol').style.color=="red"){document.getElementById('symbol').style.color="green";}
	}
	
	if(pw.toLowerCase().indexOf('password')!=-1) {
		passes=0;
		problems="";
		fatals=fatals+"Password must not contain the word 'password'. ";
		document.getElementById('passwordword').style.color="red";
		divs = new Array();
	}
	else
	{
		if(document.getElementById('passwordword').style.color=="red"){document.getElementById('passwordword').style.color="green";}
	}

	
	if((pw.toLowerCase().indexOf(fn)!=-1)||(pw.toLowerCase().indexOf(ln)!=-1)) {
		passes=0;
		problems="";
		fatals=fatals+"Password must not contain any part of your name. ";
		document.getElementById('your_name').style.color="red";
		divs = new Array();
	}
	else
	{
		if(document.getElementById('your_name').style.color=="red"){document.getElementById('your_name').style.color="green";}
	}
	
	if(pw.length<8) {
		passes=0;
		problems="";
		fatals=fatals+"Password must have 8 or more characters. ";
		document.getElementById('eight').style.color="red";
		divs = new Array();
	}
	else
	{
		if(document.getElementById('eight').style.color=="red"){document.getElementById('eight').style.color="green";}
	}
	
	if(problems.length>0){problems=problems+"to be valid. ";}
	if (passes<3)
	{
		document.getElementById('pw').value="";
		document.getElementById('pwconf').value="";	
		document.getElementById('pw').focus();
		for(i=0;i<divs.length;i++){
		document.getElementById(divs[i]).style.color="red";
		}
	alert (problems+fatals);
	}
	
	
	
}
function checkpwconf(){
	checkpw()
	pw=document.getElementById('pw').value;
	pwc=document.getElementById('pwconf').value;
	if (pw!==pwc){
		
		document.getElementById('pwconf').value="";	
		document.getElementById('pwconf').focus();
		alert('Password and password confirmation do not match!');
		}
}
</script>
<style type="text/css">
div
{display:inline;margin:none;border:none;background-color:none;padding:none;}
</style>
</HEAD>
<body>
<center>
<TABLE WIDTH=600 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD>
			<IMG SRC="/images/login_01.gif"><IMG SRC="/images/login_02.gif">
		</TD>
		<TD>
			<a href="javascript:window.close()"><%=fontB%>[Close]</font></a>
		</TD>
	</TR>
</TABLE>

<table width="600" align=center>
	<tr>
		<td>

			<%=fontB%>
			<br>
			<center>
			<% 
				box.setTitle("Request a Campus Ministry E-mail Account");
				box.setWidth("600");
				box.setColor(colorL);
				box.setBodyColor(colorL);
			%>	
			<%=box.printTop()%>
			
			<table border=0 style="border-collapse:collapse;">
				<form name=myForm method=post action="emailrequest.jsp">
				<tr><td colspan="4">				<%=fontB%>To request a new Campus Ministry email account (i.e. firstname.lastname@uscm.org) please fill out this form: </td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td width="15%">	<%=fontB%>First Name: 		</td><td colspan="2" width="30%">	<input type=text size=12 id="firstName" name="firstName" style="float:left;">	</td></tr>
				<tr><td width="15%">	<%=fontB%>Last Name: 		</td><td colspan="2" width="30%">	<input type=text size=12 id="lastName" name="lastName">	</td></tr>
				<tr><td width="15%">	<%=fontB%>Middle Initial: 		</td><td colspan="2" width="30%">	<input type=text size=12 name="middleInitial">	</td></tr> 
				<tr><td>&nbsp;</td></tr>
				<tr><td width="15%">	<%=fontB%>Staff Account #: 	</td><td colspan="2" width="30%">	<input type=text size=12 name="accountNo">	</td></tr>
				<tr><td>&nbsp;</td></tr>
				
				<tr><td width="15%">	<%=fontB%>Password:<br>
													
					</td><td colspan="1" width="30%">	<input type=password id="pw" onchange="checkpw();" required size=12 name="password"> </td></tr>
<tr><td width="15%">	<%=fontB%>Re-enter password:</td><td colspan="2" width="30%">	<input type=password id="pwconf" required onchange="checkpwconf();" size=12 name="passwordConf"></td></tr>
								
<tr><td colspan="5"><div style="font-family:Arial; font-size:10px; color:#336699;">Your Password must be <div id="eight">at least 8 characters long,&nbsp;</div> 
													and include 3 or 4 of the following types:&nbsp;<br>
													<b><div id="upper">UPPERCASE LETTER,&nbsp;</div></b> 
													<b><div id="lower">lowercase letter,&nbsp;</div></b> 
													<b>number such as <div id="digit">1234567890,&nbsp;</div> </b>
													<b>and/or symbol such as <div id="symbol">~!#$%^+*(). </div></b> 
													<br/>Also, it cannot contain any <div id="spaces">spaces&nbsp;</div>
													 or <div id="your_name">any part of your name&nbsp;</div> 
													or the word <div id="passwordword">"password"&nbsp;</div></div></td></tr>
				<tr><td>&nbsp;</td></tr>
				
				<tr><td width="10%" colspan=3>	<%=fontB%>Campus Region (if you know where you will be assigned): </td></tr>
				
				<tr><td colspan="2" width="15%"> 
					<SELECT NAME="region" >
						<OPTION VALUE=""></OPTION>
						<OPTION VALUE="GL">Great Lakes</OPTION>
						<OPTION VALUE="GP">Great Plains</OPTION>
						<OPTION VALUE="NW">Greater Northwest</OPTION>
						<OPTION VALUE="MA">Mid-Atlantic</OPTION>
						<OPTION VALUE="MS">MidSouth</OPTION>
						<OPTION VALUE="NC">National Campus Office</OPTION>
						<OPTION VALUE="NE">Northeast</OPTION>
						<OPTION VALUE="SW">Pacific Southwest</OPTION>
						<OPTION VALUE="RR">Red River</OPTION>
						<OPTION VALUE="SE">Southeast</OPTION>
						<OPTION VALUE="UM">Upper Midwest</OPTION>
						
					</SELECT>
				</td></tr>
				<tr><td colspan="6">	<br><%=fontB%>How can we contact you when we are finished creating your account? (fill in one)	</td>	</tr>
				<tr><td colspan="1">	<%=fontB%>An existing e-mail:</td><td colspan="2" width="30%">	<input type=text size=20 name="email">		</td></tr>
				<tr><td colspan="1">	<%=fontB%>Phone:			</td><td colspan="2" width="30%">	<input type=text size=12 name="phone">		</td></tr>
				</form>
				<tr><td>&nbsp;</td></tr>
				<tr><td colspan="6">
					<%=fontB %>You will be contacted once your Campus Staff Site account and your uscm e-mail account<br> are set up.
					In the meantime, if you have questions, you can <a href="mailto:help@campuscrusadeforchrist.com">e-mail</a> us.</font>
				</td></tr>
				<tr><td colspan="6"><center>
					<A HREF="JavaScript:document.myForm.submit()" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';"><IMG BORDER="0" NAME="submitbutton" VALIGN="CENTER" SRC="/images/submit_boff.gif"></A>
					</center>
				</td></tr>
			</table>

			<%=box.printBottom()%>
			</center>

			
		</td>
	</tr>
	<TR>
		<TD align=right>
			<BR><BR>
			<a href="javascript:window.close()"><%=fontB%>[Close]</font></a>

		</td>
	</tr>
</table>

</center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>
