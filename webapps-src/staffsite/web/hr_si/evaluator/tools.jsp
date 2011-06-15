
<HTML>
<HEAD>
<TITLE>Tools</TITLE>
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
		header_05_header_08_over = newImage("/images/header_05-header_08_over.gif");
		header_05_header_09_over = newImage("/images/header_05-header_09_over.gif");
		header_05_header_10_over = newImage("/images/header_05-header_10_over.gif");
		header_05_header_11_over = newImage("/images/header_05-header_11_over.gif");
		header_05_header_12_over = newImage("/images/header_05-header_12_over.gif");
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

</HEAD>
<body BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#336699" VLINK="#336699" leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' ONLOAD="preloadImages();">
<CENTER>
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0><!-- Whole Page table -->
	<TR>
		<TD>
		<!-- Header begin -->
		<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
			<TR>
				<TD ROWSPAN=3><IMG SRC="/images/header_01.gif" WIDTH=51 HEIGHT=77></TD>
				<TD ROWSPAN=2><IMG SRC="/images/header_02.gif" WIDTH=102 HEIGHT=56></TD>
				<TD ROWSPAN=2 VALIGN="TOP" ALIGN="LEFT">
				<!-- White space for text -->
				<FONT FACE="Arial" SIZE="1" COLOR="#336699"><BR></FONT>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>Welcome,&nbsp;Summer&nbsp;Projects!</b>
				<BR><FONT FACE="Arial" SIZE="1" COLOR="#336699">
&lt;Tuesday, August 20, 2002&gt;

				</FONT></FONT>
				</TD>
				<TD COLSPAN=6 ALIGN=RIGHT>
				<!-- other link text -->
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">
				| <A HREF="/sitemap.jsp"><FONT FACE="Arial" SIZE="1" COLOR="#336699">site map</FONT></A>
				| <a href="JavaScript: popupWindow('http://wiki.uscm.org/display/CMIT/Home', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><FONT FACE="Arial" SIZE="1" COLOR="#336699">help</FONT></a>
				| <A HREF="/logout.jsp"><FONT FACE="Arial" SIZE="1" COLOR="#336699">logoff</FONT></A>
				|&nbsp;&nbsp;&nbsp;&nbsp;
				</FONT>
				</TD>
			</TR>
			<TR>
				<TD COLSPAN=6><IMG NAME="header_05" SRC="/images/header_05.gif" WIDTH=298 HEIGHT=35></TD>
			</TR>
			<TR>
				<TD><IMG SRC="/images/header_06.gif" WIDTH=102 HEIGHT=21></TD>
				<TD><IMG SRC="/images/header_07.gif" WIDTH=309 HEIGHT=21></TD>
				<TD><A HREF="/servlet/StaffController?action=showHome"
						ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_08_over.gif', 'header_08', '/images/header_08-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_08', '/images/header_08.gif'); return true;">
						<IMG NAME="header_08" SRC="/images/header_08.gif " WIDTH=53 HEIGHT=21 BORDER=0></A></TD>
				<TD><A HREF="/servlet/StaffController?action=showMPD"
						ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_09_over.gif', 'header_09', '/images/header_09-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_09', '/images/header_09.gif'); return true;">
						<IMG NAME="header_09" SRC="/images/header_09.gif " WIDTH=45 HEIGHT=21 BORDER=0></A></TD>
				<TD><A HREF="/servlet/StaffController?action=showTools"
						ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_10_over.gif', 'header_10', '/images/header_10-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_10', '/images/header_10.gif'); return true;">
						<IMG NAME="header_10" SRC="/images/header_10-over.gif" WIDTH=51 HEIGHT=21 BORDER=0></A></TD>
				<TD><A HREF="/servlet/CmsController"
						ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_11_over.gif', 'header_11', '/images/header_11-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_11', '/images/header_11.gif'); return true;">
						<IMG NAME="header_11" SRC="/images/header_11.gif " WIDTH=85 HEIGHT=21 BORDER=0></A></TD>
				<TD><A HREF="/links.jsp"
						ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_12_over.gif', 'header_12', '/images/header_12-over.gif'); return true;"
						ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_12', '/images/header_12.gif'); return true;">
						<IMG NAME="header_12" SRC="/images/header_12.gif " WIDTH=53 HEIGHT=21 BORDER=0></A></TD>
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
<FONT FACE="Arial" COLOR="#FFFFFF"><font size='5'><b>Staff Tools</b></font></font></TD><td align=right valign=top><img src='/images/box_tr.gif'></td></TR>
<tr><TD BGCOLOR='#CCCC99' colspan=3><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD><FONT FACE="Arial" COLOR="#336699"><font size='1'>
<table width='100%'>
<tr valign=top><td valign=top>
	<p><FONT FACE="Arial" SIZE="2" COLOR="#336699">
	Not having the right tool for the job makes the job twice as difficult. This section of the site includes various tools 
	to help make your job easier. Tools for everything from ordering your FSK packages to registering students for your Summer project can be found here. As time goes on, new and better tools will be introduced here.
	</p></font>
</td>
<!--
<td valign=top>
	
	
	
	
	<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD ALIGN='CENTER' HEIGHT=7 NOWRAP BGCOLOR='#336699'><FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b>Current Highlights</b></font></font></TD></TR><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
			<table width='100%'>
			<tr><td>
				<a href="/servlet/orderfsks?action=enterSite"><img src="/images/logo_fsk.gif"></a>
				<br><FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>FSK Ordering Tool</b></font>
			</td>
			<td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">Regions can now allocate kits and soon local leaders will be able to order their kits. Questions regarding materials? Email <a href="mailto:dan.hardaway@uscm.org">Dan Hardaway</a>.</font>
			</td>
			</tr>
			</table>
	</font></td></tr></table></td></tr></table>
</td>
<td valign=top>
	
	
	
	
	<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD ALIGN='CENTER' HEIGHT=7 NOWRAP BGCOLOR='#336699'><FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b>Coming Soon...</b></font></font></TD></TR><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
					<a href="/servlet/StaffController?action=showTools"><img src="/images/logo_mystery.gif"></a><br>
					<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>Masterful Mystery Tool</b></font><br>
					<FONT FACE="Arial" SIZE="1" COLOR="#336699">Wouldn't you like to know what will be showing up here soon? So would we!	</font>
	</font></td></tr></table></td></tr></table>
</td>
-->
</tr>
</table>

<br>

<table width="95%" align=center>
	<tr><td width='50%' valign=top>




<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD ALIGN='CENTER' HEIGHT=7 NOWRAP BGCOLOR='#336699'><FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b>Ministry and Team Tracking</b></font></font></TD></TR><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
	<table border=1 cellpadding=2 bordercolorlight='#ddddaa'>
		<tr>
			<td valign="center" align="center">
				<a href="/servlet/InfoBaseController"><img src="/images/logo_infobase.gif"></a> </td><td>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>The Campus InfoBase</b></font></td><td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">Information on all campuses involved with the Campus Ministry.</font>
			</td>
		</tr>
		<tr>
			<td valign="center" align="center">
				<a href="/servlet/InfoBaseController?action=showSuccessCriteriaHome"><img src="/images/logo_infobase.gif"></a> </td><td>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>Success Criteria</b></font></td><td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">Entering and viewing Success Criteria. <!-- Click <A HREF="/servlet/InfoBaseController">here</A> for entering data and <A HREF="/servlet/InfoBaseController?action=createReport&type=locallevel">here</A> for generating reports. -->
			<td>
		</tr>
		<tr>
			<td valign="center" align="center">
				<img src="/images/logo_fsk.gif"></td><td>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>FSK Ordering Tool</b></font></td><td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">The FSK order site is no longer available.  <br>Questions about an order?  <a href="mailto:Dave.Schlernitzauer@uscm.org">Email Dave Schlernitzauer</a> or call 407-826-2557.  <br>View contents <a href='#1' onClick="window.open('/fsk/Descrip.htm#bagtoy', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">here.</a></font>
			</td>
		</tr>
		<tr>
			<td valign="center" align="center">
				<a href="/quest/index.jsp" target="_blank"><img src="/images/logo_quest.gif"></a></td><td>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>Quest Survey Tool</b></font></td><td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">View and Enter QuEST survey results into the QuEST Database.	</font>
			</td>
		</tr>
	</table>
</font></td></tr></table></td></tr></table>
<br>



<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD ALIGN='CENTER' HEIGHT=7 NOWRAP BGCOLOR='#336699'><FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b>Personal Tasks</b></font></font></TD></TR><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
	<table width='100%' border=0>
		<tr>
		<td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><A HREF="/servlet/StaffController?action=loginPS&section=ReimbServlet" target='_blank'>Personal Reimbursement</A></font></td><td><FONT FACE="Arial" SIZE="1" COLOR="#000000"> Online personal reimbursements.</font></td>
		</tr>
		<tr>
		<td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><A HREF="/servlet/StaffController?action=loginPS&section=ReimbAdvServlet" target='_blank'>Reimbursement Advance</A></font></td><td><FONT FACE="Arial" SIZE="1" COLOR="#000000"> Online reimbursement advances.</font></td>
		</tr>
		<tr>
		<td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><A HREF="/servlet/StaffController?action=loginPS&section=AsrServlet" target='_blank'>Additional Salary Request</A></font></td><td><FONT FACE="Arial" SIZE="1" COLOR="#000000"> Online additional salary requests.</font></td>
		</tr>
		<tr>
		<td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><A HREF="/servlet/StaffController?action=loginPS&section=SalaryCalcServlet" target='_blank'>Salary Calculation</A></font></td><td><FONT FACE="Arial" SIZE="1" COLOR="#000000"> Online salary calculations.</font></td>
		</tr>
		<tr>
		<td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><a href='/servlet/StaffController?action=loginStaffWeb&staffwebpath=forms.htm' target='_blank'>Forms</A></font></td><td><FONT FACE="Arial" SIZE="1" COLOR="#000000"> Downloadable personal and ministry forms.</font></td>
		</tr>
		<tr>
		<td><FONT FACE="Arial" SIZE="2" COLOR="#336699"><A HREF="https://staff.ccci.org/common/finance/fpm/sectione.html" target='_blank'>Financial Policy Manual</A></font></td><td><FONT FACE="Arial" SIZE="1" COLOR="#000000">&nbsp;</font></td>
		</tr>
		<TR>
		<TD COLSPAN="2"><FONT FACE="Arial" SIZE="2" COLOR="#336699"><a href="/servlet/HRUpdateController">Change my personal or job information</a></TD>
		</TR>
	</table>
</font></td></tr></table></td></tr></table>

	</td>
	<td width='50%' valign=top>



<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD ALIGN='CENTER' HEIGHT=7 NOWRAP BGCOLOR='#336699'><FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b>Standard Tools</b></font></font></TD></TR><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
	<table border=1 cellpadding=2 bordercolorlight='#ddddaa'>
		<tr>
			<td valign="center" align="center">
				<a href="/servlet/SIController?action=goToPage&page=projecttool"><img src="/images/logo_stintintern.gif"></a></td><td>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>The STINT/Internship Tool</b></font></td><td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">Applicants can now apply for STINT and Internships online, and this tool allows leaders to evaluate them, plus organize STINT'ers, Interns, and their teams.
				</font>
			</td>
		</tr>
		<tr>
			<td valign="center" align="center">
				<a href="http://staff2.uscm.org/ussp/" target="_blank"><img src="/images/logo_summerplacement.gif"></a></td><td>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>US Summer Projects</b></font></td><td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">Leaders can view which staff and students are assigned to their project and download their contact information.
				</font>
			</td>
		</tr>
		<tr>
			<td valign="center" align="center">
				<a href="/servlet/Review360Controller"><img src="/images/360logo.gif"></a></td><td>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>360 Review Tool</b></font></td><td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">We've all heard of 360 reviews, a tool that helps to make each staff 
				member more effective personally and in ministry. Now the entire process 
				is on the web -- whether simply filling out the form or 
				instantly compiling the results. No more hours of paperwork!!
				</font>
			</td>
		</tr>
		<!-- <tr>
			<td valign="center" align="center">
				<a href="/servlet/orderfsks?action=enterSite"><img src="/images/logo_fsk.gif"></a></td><td>
				<FONT FACE="Arial" SIZE="2" COLOR="#336699"><b>FSK Ordering Tool</b></font></td><td>
				<FONT FACE="Arial" SIZE="1" COLOR="#336699">Regions can now allocate kits and soon local leaders will be able to order their kits. Questions regarding materials? Email <a href="mailto:dan.hardaway@uscm.org">Dan Hardaway</a>.</font>
			</td>
		</tr> -->
	</table>
</font></td></tr></table></td></tr></table>
<BR>




<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD ALIGN='CENTER' HEIGHT=7 NOWRAP BGCOLOR='#336699'><FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b>HR Administrative Tools</b></font></font></TD></TR><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
	<table border=0 cellpadding=2 CELLSPACING=1 bordercolorlight='#ddddaa' WIDTH="100%">
                               <TBODY>
                          <TR><TD><FONT face=Arial color=#336699 size=2><A HREF="/servlet/AuthorizeController?action=showPage"><B>View Pending Requests</B></A></FONT></TD></TR>
                          <TR><TD><FONT face=Arial color=#336699 size=2><A HREF="/servlet/HRQueryController"><B>Query Tool</B></A></FONT></TD></TR>
                          <TR><TD><FONT face=Arial color=#336699 size=2><A HREF="/CampusHR/initiate_acs.jsp"><B>Initiate ACOS</B></A></FONT></TD></TR>

</TR></TBODY>	</table>
</font></td></tr></table></td></tr></table>




<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD ALIGN='CENTER' HEIGHT=7 NOWRAP BGCOLOR='#336699'><FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b>Account Management</b></font></font></TD></TR><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
	<table width=100% border=1 cellpadding=2 bordercolorlight='#ddddaa'>
		<tr>
			<td>
				<a href="/servlet/StaffController?action=showSetupEmail"><FONT FACE="Arial" SIZE="2" COLOR="#336699"><B>Email setup</B></FONT></a></td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Change your email setup</font>
			</td>
		</tr>
		<tr>
			<td>
				<a href="/servlet/StaffController?action=managePS" target="_blank"><FONT FACE="Arial" SIZE="2" COLOR="#336699"><B>PeopleSoft setup</B></FONT></a></td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Change your PeopleSoft setup</font>
			</td>
		</tr>
		<tr>
			<td>
				<a href="/servlet/StaffController?action=changePassword"><FONT FACE="Arial" SIZE="2" COLOR="#336699"><B>Staff Site Password</B></FONT></a></td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Change staff.campuscrusadeforchrist.com password</font>
			</td>
		</tr>
		<tr>
			<td>
				<a href="/servlet/StaffController?action=showCustomize"><FONT FACE="Arial" SIZE="2" COLOR="#336699"><B>Customize</B></FONT></a></td>
				<td><FONT FACE="Arial" SIZE="1" COLOR="#336699">Customize home page items</font>
			</td>
		</tr>
	</table>
	</font></td></tr></table></td></tr></table>

	</td></tr>
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

