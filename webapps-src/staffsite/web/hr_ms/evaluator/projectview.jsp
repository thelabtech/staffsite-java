




<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>









<STYLE>
SPAN {cursor: hand ; }
.onme1 {color: #D5DAEA ; }
.offme{color: #7788BB ; }
</STYLE> 

<SCRIPT LANGUAGE="JavaScript">
<!--
function popupWindow(cUrl,cName,cFeatures) {
	var xWin = window.open(cUrl,cName,cFeatures)
}

var theDateElement;

function pickdate(element) {
	theDateElement = element;
    myFloater = window.open('','DatePicker','resizable=no,scrollbars=no,width=250,height=230');
	var goTo = "/selday.jsp";
	if (theDateElement.value!=null){goTo=goTo+'?date='+theDateElement.value;}
    myFloater.location.href = goTo;
}

function setdate(theDate) {
	theDateElement.value=theDate;
	theDateElement.blur();
}

// Greg's Color Picker System
var theColorElement;

function setColor(val) {
	theColorElement.value=val;
	theColorElement.blur();
}
function pickColor(element) {
	theColorElement = element;
    myFloater = window.open('','ColorPicker','resizable=no,scrollbars=no,width=177,height=110');
	var goTo = "/sel_color.jsp";
    myFloater.location.href = goTo;
}
//End color picker

function newImage(arg) {
	if (document.images) {
		rslt = new Image();
		rslt.src = arg;
		return rslt;
	}
}

function changeImages() {
	if (document.images && (preloadFlag == true)) {
		for (var i=0; i<changeImages.arguments.length; i+=2) {
			document[changeImages.arguments[i]].src = changeImages.arguments[i+1];
		}
	}
}
var preloadFlag = false;
function preloadImages() {
	if (document.images) {
		header_08_over = newImage("/images/header_08-over.gif");
		header_09_over = newImage("/images/header_09-over.gif");
		header_10_over = newImage("/images/header_10-over.gif");
		header_11_over = newImage("/images/header_11-over.gif");
		header_12_over = newImage("/images/header_12-over.gif");
		preloadFlag = true;
	}
}
// -->
</SCRIPT>

</head>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#336699" VLINK="#336699" leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' ONLOAD="preloadImages();">
<CENTER>
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0><!-- Whole Page table -->
	<TR>
		<TD>
		<!-- Header begin -->
		<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
			<TR>
				<TD COLSPAN=8 ALIGN=RIGHT>
				<!-- other link text -->
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">
				| <A HREF="/sitemap.jsp"><FONT FACE="Arial" SIZE="1" COLOR="#336699">site map</FONT></A>
				| <a href="JavaScript: popupWindow('/help/help_home.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><FONT FACE="Arial" SIZE="1" COLOR="#336699">help</FONT></a>
				| <A HREF="/logout.jsp"><FONT FACE="Arial" SIZE="1" COLOR="#336699">logoff</FONT></A>
				|&nbsp;&nbsp;&nbsp;&nbsp;
				</FONT>
				</TD>
			</TR>

			<TR>
				<TD ROWSPAN=3><IMG SRC="/images/header_noshield_01.gif" WIDTH=153 HEIGHT=21></TD>
				<TD><IMG SRC="/images/header_07.gif" WIDTH=309 HEIGHT=21></TD>
				<TD><A HREF="/servlet/StaffController?action=showHome"
						ONMOUSEOVER="changeImages('header_08', '/images/header_08-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_08', '/images/header_08.gif'); return true;">
						<IMG NAME="header_08" SRC="/images/header_08.gif" WIDTH=53 HEIGHT=21 BORDER=0></A></TD>
				<TD><A HREF="/servlet/StaffController?action=showMPD"
						ONMOUSEOVER="changeImages('header_09', '/images/header_09-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_09', '/images/header_09.gif'); return true;">
						<IMG NAME="header_09" SRC="/images/header_09.gif" WIDTH=45 HEIGHT=21 BORDER=0></A></TD>
				<TD><A HREF="/servlet/StaffController?action=showTools"
						ONMOUSEOVER="changeImages('header_10', '/images/header_10-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_10', '/images/header_10.gif'); return true;">
						<IMG NAME="header_10" SRC="/images/header_10.gif" WIDTH=51 HEIGHT=21 BORDER=0></A></TD>
				<TD><A HREF="/servlet/CmsController"
						ONMOUSEOVER="changeImages('header_11', '/images/header_11-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_11', '/images/header_11.gif'); return true;">
						<IMG NAME="header_11" SRC="/images/header_11.gif" WIDTH=85 HEIGHT=21 BORDER=0></A></TD>
				<TD><A HREF="/links.jsp"
						ONMOUSEOVER="changeImages('header_12', '/images/header_12-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_12', '/images/header_12.gif'); return true;">
						<IMG NAME="header_12" SRC="/images/header_12.gif" WIDTH=53 HEIGHT=21 BORDER=0></A></TD>
				<TD><IMG SRC="/images/header_13.gif" WIDTH=11 HEIGHT=21></TD>
			</TR>
		</TABLE>
			<P>
		<!-- Header end -->
		</TD>
	</TR>
	<TR>
		 <TD BGCOLOR="#FFFFFF" ALIGN="LEFT" CELLSPACING="0">
		 <!--Start all table-->



	


<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='0'><TR><td align=left valign=top><img src='/images/box_tl.gif'></td><TD ALIGN='CENTER' HEIGHT=7 NOWRAP>
<FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b><a href='MSController?action=goToPage&page=projecttool' class=headinggraphic><img src='/hr_ms/images/banner1.gif'></a></b></font></font></TD><td align=right valign=top><img src='/images/box_tr.gif'></td></TR>
<tr><TD BGCOLOR='#CCCC99' colspan=3><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD><FONT FACE="Arial" COLOR="#336699"><font size='1'>

<body bgcolor="#cccc99" link="#006633" alink="#008833" vlink="#003333" text="#000000">

<p> <FONT FACE="Arial" SIZE="2" COLOR="#000000">

<table width="100%">
<tr align="center"><td>
<center><FONT FACE="Arial" SIZE="4" COLOR="#336699">Acts 29 &nbsp; <FONT FACE="Arial" SIZE="2" COLOR="#336699">(Great Lakes Partnership) </font></center>
</td><td>

<table width='100%' border='1' bgcolor="#bbbb88" bordercolor="#bbbb88" BORDERCOLORLIGHT="#cccc99">
<tr><td colspan='2'><FONT FACE="Arial" SIZE="2" COLOR="#000000"><b>Project Leaders</font></b></td><td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Email</td><td><FONT FACE="Arial" SIZE="1" COLOR="#336699">View</td></tr>


			<TR><td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>PD</b></FONT></TD>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Greg&nbsp;Brown</td>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="mailto:greg.brown@uscm.org"><img src='/wsnsp/images/mailbox.gif' border='0'></a> </td>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000127553"><img src='/wsnsp/images/magglass.gif' border='0'></a></FONT></TD>
			</tr>
			
			<TR><td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>APD</b></FONT></TD>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Janet&nbsp;Oberholtzer</td>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="mailto:janet.oberholtzer@uscm.org"><img src='/wsnsp/images/mailbox.gif' border='0'></a> </td>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000127881"><img src='/wsnsp/images/magglass.gif' border='0'></a></FONT></TD>
			</tr>
			
			<TR><td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>Coord</b></FONT></TD>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Janet&nbsp;Oberholtzer</td>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="mailto:janet.oberholtzer@uscm.org"><img src='/wsnsp/images/mailbox.gif' border='0'></a> </td>
			<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000127881"><img src='/wsnsp/images/magglass.gif' border='0'></a></FONT></TD>
			</tr>
		
</table>

</td></tr>
</table>

<table width='100%' border='1' bordercolor="#bbbb88" BORDERCOLORLIGHT="#cccc99">
<tr valign="top"><td width="80%">
<FONT FACE="Arial" SIZE="3" COLOR="#000000"><b>Team Roster</font></b></br>
<table width='100%' border='1' bordercolor="#bbbb88" BORDERCOLORLIGHT="#cccc99">
<tr valign='top' align='center'><td><FONT FACE="Arial" SIZE="1" COLOR="#000000"> &nbsp;</FONT></TD><td><FONT FACE="Arial" SIZE="1" COLOR="#000000"><b>Email</b></FONT></TD><td><FONT FACE="Arial" SIZE="2" COLOR="#000000">Name</TD><td><FONT FACE="Arial" SIZE="2" COLOR="#000000">Status</td><td><FONT FACE="Arial" SIZE="2" COLOR="#000000">Acct#</td><td><FONT FACE="Arial" SIZE="2" COLOR="#000000">Acct Balance</td><td><FONT FACE="Arial" SIZE="2" COLOR="#000000">Campus</td><td><FONT FACE="Arial" SIZE="2" COLOR="#000000">Passport?</td><td><FONT FACE="Arial" SIZE="2" COLOR="#000000">Visa?</td><td><a href='#' onClick='window.open("/wsnsp/dbio/popupwaiver.jsp","plain","scrollbars,width=350,height=200");'><FONT FACE="Arial" SIZE="2" COLOR="#000000">Waiver?</a></td><td><a href='#' onClick='window.open("/wsnsp/dbio/popupinsurance.jsp","plain","scrollbars,width=350,height=200");'><FONT FACE="Arial" SIZE="2" COLOR="#000000">Insurance Form</a>?</td></tr>


			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>1</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Tara&nbsp;Bowling</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5241891&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$3595&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Bowling Green State University&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>2</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Andrew&nbsp;Brinkman</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5238735&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$3680&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Ball State University&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>3</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Greg&nbsp;Brown</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">0402981&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(staff)&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(-)&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(-)&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>4</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Sean&nbsp;Buehrer</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5210006&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$3450&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">University of Michigan&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>5</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Dana&nbsp;Elwardt</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5217381&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$3550&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">University of Illinois&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>6</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Russell&nbsp;Hedberg</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5217933&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$4003&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">University of Michigan&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>7</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Daniel&nbsp;Hornback</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5231744&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$5580&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">University of Michigan&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>8</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Katie&nbsp;Keeper</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5239748&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$3550&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">The University of Toledo&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>9</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Cynthia&nbsp;Ksycki</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5213130&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$4280&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">University of Michigan&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>10</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Robert &nbsp;Kurth</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5217239&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$3605&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Heidelberg College&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>11</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Janet&nbsp;Oberholtzer</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">0470990&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(staff)&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(-)&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(-)&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>12</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Tom&nbsp;Smyly</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">5238728&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">$3600&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">University of Michigan&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">false&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>13</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Cindy&nbsp;Tirey</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">0499941&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(staff)&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">400719995&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(-)&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(-)&nbsp;</td>
			</tr>
			
			<tr align=center>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><b>14</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">
					<a href="mailto:acbrinkman@yahoo.com"><img src='/images/small_mail.gif' border='0'></a>
				</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=studentview&id=00000194345">Mark&nbsp;Tirey</a>&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Accepted&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">0499941&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(staff)&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">084272273&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(-)&nbsp;</td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">(-)&nbsp;</td>
			</tr>
			

</TABLE>


</td>
<td align='center'>
<FONT FACE="Arial" SIZE="3" COLOR="#000000"><b>Available Tools</font></b><br>
<table width='100%' border='1' bgcolor="#bbbb88" bordercolor="#bbbb88" BORDERCOLORLIGHT="#cccc99">
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=showMainProj&view=adminprojects"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?view=showprojectinfo&action=showProj&id=00000008223"><IMG SRC="/wsnsp/images/wsn_viewproject.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="ProjectInfo"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=appinfo"><IMG SRC="/wsnsp/images/wsn_addapp.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Applicant"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=staffappsearch"><IMG SRC="/wsnsp/images/wsn_addstaff.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Staff"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistapps.jsp"><IMG SRC="/wsnsp/images/wsn_searchpeople.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Applicant"></a></TD></tr>
<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistprojects.jsp"><IMG SRC="/wsnsp/images/wsn_searchproj.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Projects"></a></TD></tr>
<tr valign='top'><td colspan=2><FORM ACTION="/wsnsp/dbio/composeemail.jsp" NAME="email" METHOD="post"><input type=hidden name="EmailList" value="greg.brown@uscm.org, janet.oberholtzer@uscm.org, janet.oberholtzer@uscm.org, e_besecker@yahoo.com, acbrinkman@yahoo.com, greg.brown@uscm.org, sbuehrer@umich.edu, elwardt@uiuc.edu, rhedberg@umich.edu, dhornbac@umich.edu, kkeeper19@yahoo.com, cksycki@umich.edu, rkurth@heidelberg.edu, janet.oberholtzer@uscm.org, tsmyly@umich.edu, cindy.tirey@uscm.org, mark.tirey@uscm.org"><input type=hidden name="fromPage" value="showTeam"><input type=hidden name="id" value="00000008223"><input type=hidden name="view" value="team"><A HREF="JavaScript: email.submit()"><IMG SRC="/wsnsp/images/wsn_emailteam.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Email Team"></a></td></tr></form>
<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=makeDownload&view=download&id=00000008223"><IMG SRC="/wsnsp/images/wsn_getteamdb.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Get Team DB"></a></TD></tr>
	</TABLE>
	<FONT FACE="Arial" SIZE="3" COLOR="#000000"><b>Links</font></b><br>
	<table width='100%' border='1' bgcolor="#bbbb88" bordercolor="#bbbb88" BORDERCOLORLIGHT="#cccc99">
<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></font></TD></tr>
<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><A HREF="/servlet/CmsController?action=browse&catId=1000029" target='_blank'>Resource Center</a></font></TD></tr>
<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
	</TABLE>
</td></tr>
</table>
<BR><BR>
Note: If you have duplicate records for an applicant and need to have records deleted, please email <a href="mailto:wsn@uscm.org">wsn@uscm.org</a> with the applicant's name. To make sure the correct record gets deleted, you may want to change their first name to "Delete" before emailing us. You can do this by clicking on "View", then "Edit", and editing their first name and clicking "Save." This is only to eliminate duplicate records. If an applicant has withdrawn from a project, simply click "View," then "Edit,"  change the person's status to "withdrawn," and click "Save."
<BR><BR>
</font></td></tr></table></td></tr><tr bgcolor='#cccc99'><td align=left valign=bottom><img src='/images/box_bl.gif'></td><TD height=5>
<font size=1> &nbsp; </TD><td align=right valign=bottom><img src='/images/box_br.gif'></td></TR>
</table>
			<BR>
		</TD><!--Closing global table-->
	</TR>
</TABLE>
  <center>
  <table width="755" border="0">
	<tr>
		<td align="center">
		  <!-- <a href="/general/feedback.jsp"><img src="/images/info.gif" border="0" align="center" alt="Info" WIDTH="42" HEIGHT="41"></a> -->
		  <font size="2"><i>© 2002 Campus Crusade for Christ International
		  </i><br>
		</td>
	</tr>
	<tr>
		<td align="center">
		  <font size="2"><i><a href="/general/feedback.jsp">Send us feedback.</a></i><br>
		</td>
	</tr>
  </table>
  </center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>




</HTML>
 