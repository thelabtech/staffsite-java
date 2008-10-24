



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
				| <A href="/servlet/SIController?action=goToPage&page=projecttool"><FONT FACE="Arial" SIZE="1" COLOR="#336699">site map</FONT></A>
				| <a href="/servlet/MSController?action=goToPage&page=projecttool"><FONT FACE="Arial" SIZE="1" COLOR="#336699">help</FONT></a>
				| <A href="/servlet/MSController?action=goToPage&page=projecttool"><FONT FACE="Arial" SIZE="1" COLOR="#336699">logoff</FONT></A>
				|&nbsp;&nbsp;&nbsp;&nbsp;
				</FONT>
				</TD>
			</TR>

			<TR>
				<TD ROWSPAN=3><IMG SRC="/images/header_noshield_01.gif" WIDTH=153 HEIGHT=21></TD>
				<TD><IMG SRC="/images/header_07.gif" WIDTH=309 HEIGHT=21></TD>
				<TD><A href="/servlet/MSController?action=goToPage&page=projecttool"
						ONMOUSEOVER="changeImages('header_08', '/images/header_08-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_08', '/images/header_08.gif'); return true;">
						<IMG NAME="header_08" SRC="/images/header_08.gif" WIDTH=53 HEIGHT=21 BORDER=0></A></TD>
				<TD><A href="/servlet/MSController?action=goToPage&page=projecttool"
						ONMOUSEOVER="changeImages('header_09', '/images/header_09-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_09', '/images/header_09.gif'); return true;">
						<IMG NAME="header_09" SRC="/images/header_09.gif" WIDTH=45 HEIGHT=21 BORDER=0></A></TD>
				<TD><A href="/servlet/MSController?action=goToPage&page=projecttool"
						ONMOUSEOVER="changeImages('header_10', '/images/header_10-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_10', '/images/header_10.gif'); return true;">
						<IMG NAME="header_10" SRC="/images/header_10.gif" WIDTH=51 HEIGHT=21 BORDER=0></A></TD>
				<TD><A href="/servlet/MSController?action=goToPage&page=projecttool"
						ONMOUSEOVER="changeImages('header_11', '/images/header_11-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_11', '/images/header_11.gif'); return true;">
						<IMG NAME="header_11" SRC="/images/header_11.gif" WIDTH=85 HEIGHT=21 BORDER=0></A></TD>
				<TD><A href="/servlet/MSController?action=goToPage&page=projecttool"
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



	<table align='center'>
		<tr>
			<td valign='top' width="35%">
				<p>
				<FONT FACE="Arial" SIZE="4" COLOR="#336699"><b>Announcements</font></b><br>

			
			<!--  --------------------Recent Articles MODULE ------------------- --> 			<b><FONT FACE="Arial" SIZE="3" COLOR="#336699">PLEASE CONFIRM YOUR DATES</font></b>				<br><br>
<FONT FACE="Arial" SIZE="2" COLOR="#000000">This section here is designed for announcements.  Leaders can be given information like timelines and deadline, updates, and procedure and policy reminders, to name a few. </font><hr color=#336699 size=1><br>

	<FONT FACE="Arial" SIZE="2" COLOR="#000000">			

	Please be sure to check the <A href="/servlet/MSController?action=goToPage&page=projecttool">past announcements</A>, in
	case you have missed any since your last visit.
<p>
					Click <A href="/servlet/MSController?action=goToPage&page=projecttool">here</A> for old announcements.
			</td>
			<td valign=middle align=center bgcolor="#cccc99" width="30%"><img src='/images/CMlogobig.gif' border='0'></td>
			<td width="35%" valign=top align=right>
				<p align='right'><FONT FACE="Arial" SIZE="2" COLOR="#336699">
				<li><a href="/servlet/MSController?action=goToPage&page=projecttool">Q & A</a></li>
				<li><A href="/servlet/MSController?action=goToPage&page=projecttool">Resource Center</a></li>
				<li><A href="/servlet/MSController?action=goToPage&page=projecttool">Leader's Notebook</a></li>
				<li><a href="/servlet/MSController?action=goToPage&page=projecttool">Old Announcements</a></li>
				</font></p><br>
				
				<p align='right'>
				
				<a href='/servlet/MSController?action=goToPage&page=projectview'><FONT FACE="Arial" SIZE="3" COLOR="#336699"><b>View My Project&nbsp;</b></font></a><br>
					
				</p>

				<p align='right'>
				<!-- project leaders links only show up for PD and AP. Not for RD or Coord. -->
				<!-- Should dynamically create links by checking to see what project they are a PD or APD for -->
				<!-- If not assigned to a project, it should print. Your role is Project Leader, but you're not assigned to any projects. Email xxx -->
				
				</font>
				<p align='right'>
				<br><br>
				<FONT FACE="Arial" SIZE="4" COLOR="#336699"><b>Other Users</b></font><br>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><a href="/servlet/MSController?action=goToPage&page=projecttool">SOS Administrator</a><br>
				<a href="/servlet/MSController?action=goToPage&page=projecttool">CCC Insurance Administrator</a><br>
				<a href="/servlet/MSController?action=goToPage&page=projecttool">Donation Services</a><br>
				<a href="/servlet/MSController?action=goToPage&page=projecttool">WSN Orlando (Waivers)</a><br>
				<a href="/servlet/MSController?action=goToPage&page=projecttool">WSN Orlando (Insurance)</a><br>
				<a href="/servlet/MSController?action=goToPage&page=projecttool">World Travel</a>
				</font></p>
			</td>
		</tr>
	</table>


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