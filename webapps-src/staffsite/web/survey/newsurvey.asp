<HTML>
<HEAD>
<TITLE>Staff Morale Survey</TITLE>
</HEAD>

<SCRIPT LANGUAGE="JavaScript">

	//------------------------------
	// Adobe ImageReady functions
	//------------------------------
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

	//------------------------------
	// Global Init Function
	//------------------------------
	function header_init() {
		preloadImages();
	}


function submitForms(){
if ( (q1()) && (q2()) && (q3()) && (q4()) && (q5()) && (q6()) && (q7()) && (q8()) && (q9()) && (q10()) && (q11()) && (q12()) && (q13()) && (q14()) && (q15()) && (q16()) && (q17()) && (q18()) && (q19()) && (q20()) && (q21()) &&  (years()) && (gender()) && (family()) && (lane()) && (region()) )
{ 
return true;
}
else
return false;
}

function q1(){
if (document.form1.q1.value == "") {
alert ("\n You did not answer question #1.\n")
return false;
}
return true;
}

function q2(){
if (document.form1.q2.value == "") {
alert ("\n You did not answer question #2.\n")
return false;
}
return true;
}

function q3(){
if (document.form1.q3.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q4(){
if (document.form1.q4.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q5(){
if (document.form1.q5.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q6(){
if (document.form1.q6.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q7(){
if (document.form1.q7.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q8(){
if (document.form1.q8.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q9(){
if (document.form1.q9.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q10(){
if (document.form1.q10.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q11(){
if (document.form1.q11.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q12(){
if (document.form1.q12.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q13(){
if (document.form1.q13.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q14(){
if (document.form1.q14.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q15(){
if (document.form1.q15.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q16(){
if (document.form1.q16.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q17(){
if (document.form1.q17.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q18(){
if (document.form1.q18.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q19(){
if (document.form1.q19.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q20(){
if (document.form1.q20.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function q21(){
if (document.form1.q21.value == "") {
alert ("\n You did not answer all the questions.\n")
return false;
}
return true;
}

function comments(){
if (document.form1.comments.value == "") {
alert ("\n You did not enter any comments.\n")
return false;
}
return true;
}

function years(){
if (document.form1.years.value == "") {
alert ("\n You did not answer the years on staff question.\n")
return false;
}
return true;
}

function gender(){
if (document.form1.gender.value == "") {
alert ("\n You did not answer the gender question.\n")
return false;
}
return true;
}

function family(){
if (document.form1.family.value == "") {
alert ("\n You did not answer the family question.\n")
return false;
}
return true;
}

function lane(){
if (document.form1.lane.value == "") {
alert ("\n You did not answer the lane question.\n")
return false;
}
return true;
}

function region(){
if (document.form1.region.value == "") {
alert ("\n You did not answer the region question.\n")
return false;
}
return true;
}
// -->
</SCRIPT>


<STYLE>
SPAN {cursor: hand ; }
.onme1 {color: #D5DAEA ; }
.offme{color: #7788BB ; }
.style2 {font-family: Arial, Helvetica, sans-serif;font-size: 14px;color:black;}
.style3 {font-family: Arial, Helvetica, sans-serif}
</STYLE> 



<body BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#336699" VLINK="#336699" leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' ONLOAD="header_init();">
<!--OverLib Support goes right after <BODY> -->
<!------------------------------
// Usage: onmouseover="return overlib('text here');" onmouseout="return nd();"
//------------------------------>
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:1000;"></div>
<script language="JavaScript" src="/overlib.js"><!-- overLIB (c) Erik Bosrup --></script>
<!-------------------------------------------->
<CENTER>
	<form action="newsurvey.asp" enctype="application/x-www-form-urlencoded" name="form1" id="form1" onSubmit="return submitForms()">
	  <TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0><!-- Whole Page table -->
	<TR>
		<TD>
		<!-- Header begin -->
		
		
			<SCRIPT LANGUAGE="JavaScript">
<!--
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
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD ROWSPAN=3><IMG SRC="/images/header_01.gif" WIDTH=51 HEIGHT=77></TD>
		<TD ROWSPAN=2><IMG SRC="/images/header_02.gif" WIDTH=102 HEIGHT=56></TD>
		<TD ROWSPAN=2 VALIGN="TOP" ALIGN="LEFT">
		<!-- White space for text -->		<FONT FACE="Arial" SIZE="1" COLOR="#336699"><BR></FONT>
		<FONT FACE="Arial" SIZE="2" COLOR="#336699">&nbsp;</FONT>
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
				<IMG NAME="header_10" SRC="/images/header_10.gif " WIDTH=51 HEIGHT=21 BORDER=0></A></TD>
		<TD><A HREF="/servlet/CmsController"
				ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_11_over.gif', 'header_11', '/images/header_11-over.gif'); return true;"
				ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_11', '/images/header_11.gif'); return true;">
				<IMG NAME="header_11" SRC="/images/header_11.gif " WIDTH=85 HEIGHT=21 BORDER=0></A></TD>
		<TD><A HREF="/links.jsp"
				ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_12_over.gif', 'header_12', '/images/header_12-over.gif'); return true;"
				ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_12', '/images/header_12.gif'); return true;">
				<IMG NAME="header_12" SRC="/images/header_12-over.gif" WIDTH=53 HEIGHT=21 BORDER=0></A></TD>
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






<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='0'><TR><td width="20%" align=left valign=top><img src='/images/box_tl.gif'></td>
<TD HEIGHT=7 ALIGN='CENTER' NOWRAP>
<FONT FACE="Arial" COLOR="#FFFFFF"><font size='5'><b>Staff Morale Survey </b></font></font></TD>
<td width="20%" align=right valign=top><img src='/images/box_tr.gif'></td>
</TR>
<tr><TD BGCOLOR='#CCCC99' colspan=3><TABLE WIDTH='100%' CELLSPACING='1' CELLPADDING='3' BORDER='0'>
  <TR><TD><FONT FACE="Arial" COLOR="#336699"><font size='1'>
</font></font>
<p class="style2 style3">Thank you for taking a few minutes to fill out this survey! Please respond to every question. One survey per staff, please, spouses included.</p>
<FONT FACE="Arial" COLOR="#336699">

	

	
	<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
		<table width='100%' border=0 cellspacing=0 cellpadding=0>
	
		<tr bgcolor="white">
 <td colspan="2"  ALIGN="LEFT" VALIGN="BOTTOM" bgcolor="white">
		  <div align="center">
		      <% if request("action") = "doIt" then %>
		      <strong>Your responses have been recorded. Thanks for participating!</strong>
			  <%
			  		set database = server.CreateObject("adodb.connection")
					database.open "DSN=istprod;UID=istprod;PWD=w5u#AGa"
					sql = "INSERT INTO moraleSurvey(region,lane,family,gender,years,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,q20,q21,comments) VALUES('" & request("region") & "','" & request("lane") & "','" & request("family") & "','" & request("gender") & "','" & request("years") & "','" & request("q1") & "','" & request("q2") & "','" & request("q3") & "','" & request("q4") & "','" & request("q5") & "','" & request("q6") & "','" & request("q7") & "','" & request("q8") & "','" & request("q9") & "','" & request("q10") & "','" & request("q11") & "','" & request("q12") & "','" & request("q13") & "','" & request("q14") & "','" & request("q15") & "','" & request("q16") & "','" & request("q17") & "','" & request("q18") & "','" & request("q19") & "','" & request("q20") & "','" & request("q21") & "','" & request("comments") & "')"
					database.execute(sql)
					database.close
			  %>
			  <% else %>
		      </div>
		  <table width="100%"  border="0" cellspacing="2" cellpadding="6">
              <tr bgcolor="#D0DDEA">
                <td height="46" colspan="12"><table width="100%"  border="0" cellspacing="2" cellpadding="4">
                  <tr height="1">
                    <td width="83" align="right">&nbsp;</td>
                    <td width="150" align="left">&nbsp;</td>
                    <td width="83"><div align="right"></div></td>
                    <td width="150" align="left">&nbsp;</td>
                  </tr>
                  <tr bgcolor="#D0DDEA">
                    <td align="right">Region:</td>
                    <td align="left"><select name="region">
                      <option value="" selected>Select One</option>
                      <option value="Northeast">Northeast</option>
                      <option value="Mid-Atlantic">Mid-Atlantic</option>
                      <option value="MidSouth">MidSouth</option>
                      <option value="Southeast">Southeast</option>
                      <option value="Great Lakes">Great Lakes</option>
                      <option value="Upper Midwest">Upper Midwest</option>
                      <option value="Great Plains Intl">Great Plains Int'l</option>
                      <option value="Red River">Red River</option>
                      <option value="Greater Northwest">Greater Northwest</option>
                      <option value="Pacific Southwest">Pacific Southwest</option>
                      <option value="NCO">NCO</option>
                    </select></td>
                    <td align="right">Family:</td>
                    <td align="left"><select name="family" id="family">
                      <option value="" selected>Select One</option>
                      <option value="single">Single</option>
                      <option value="couple">Married, No Children</option>
                      <option value="parent">Married, Children</option>
                   </select></td>
                  </tr>
                  <tr bgcolor="#D0DDEA">
                    <td align="right">Lane:</td>
                    <td align="left"><select name="lane" id="lane">
					<option value="" selected>Select One</option>
					<option value="catalytic">Catalytic</option>
					<option value="hr">HR</option>
					<option value="operations">Operations</option>
					<option value="staffed">Staffed Campus</option>
					<option value="wsn">WSN</option>
					<option value="fund development">Fund Development</option>
					<option value="esm">ESM</option>
					<option value="bridges">Bridges</option>
                    </select></td>
                    <td align="right">Gender:</td>
                    <td align="left"><select name="gender" id="gender">
                      <option value="" selected>Select One</option>
                      <option value="male">Male</option>
                      <option value="female">Female</option>
                    </select></td>
                  </tr>
                  <tr bgcolor="#D0DDEA">
                    <td colspan="2" align="right">Years on Staff: </td>
                    <td colspan="2" align="right"><div align="left">
                      <input name="years" type="text" id="years" size="5">
                    </div></td>
                    </tr>
                  <tr bgcolor="#D0DDEA">
                    <td colspan="2" align="right">&nbsp;</td>
                    <td colspan="2" align="right">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
			  <tr>
			        <td colspan="2" align="center"></td>
			   		<td colspan="2" align="center">Strongly Disagree</td>
			      	<td colspan="2" align="center"></td>
           			<td colspan="2" align="center">Neutral</td>
		      		<td colspan="2" align="center"></td>
           			<td colspan="2" align="center">Strongly Agree</td>
		   	  </tr>
              <tr>
                <td height="46"><div align="center"></div></td>
                <td><div align="center"><strong>Personal Questions</strong></div></td>
                <td width="30"><div align="center"><strong>1</strong></div></td>
                <td width="30"><div align="center"><strong>2</strong></div></td>
                <td width="30"><div align="center"><strong>3</strong></div></td>
                <td width="30"><div align="center"><strong>4</strong></div></td>
                <td width="30"><div align="center"><strong>5</strong></div></td>
                <td width="30"><div align="center"><strong>6</strong></div></td>
                <td width="30"><div align="center"><strong>7</strong></div></td>
                <td width="30"><div align="center"><strong>8</strong></div></td>
                <td width="30"><div align="center"><strong>9</strong></div></td>
                <td width="30"><div align="center"><strong>10</strong></div></td>
              </tr>
              <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>1</strong></div></td>
                <td> <div align="left">My walk with the Lord has been satisfying </div></td>
                <td><div align="center">
                  <input name="q1" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q1" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q1" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q1" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q1" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q1" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q1" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q1" type="radio" value="8"></td>
                <td width="30"><input name="q1" type="radio" value="9"></td>
                <td width="30"><input name="q1" type="radio" value="10"></td>
              </tr>
			   <tr>
			     <td height="46" class="style2"><div align="center"><strong>2</strong></div></td>
                <td class="style2"> <div align="left">I am enjoying being on staff</div></td>
                <td><div align="center">
                  <input name="q2" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q2" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q2" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q2" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q2" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q2" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q2" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q2" type="radio" value="8"></td>
			    <td width="30"><input name="q2" type="radio" value="9"></td>
			    <td width="30"><input name="q2" type="radio" value="10"></td>
			   </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>3</strong></div></td>
                <td class="style2"> <div align="left">I am hopeful about the future</div></td><td><div align="center">
                  <input name="q3" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q3" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q3" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q3" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q3" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q3" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q3" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q3" type="radio" value="8"></td>
			    <td width="30"><input name="q3" type="radio" value="9"></td>
			    <td width="30"><input name="q3" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td height="46" class="style2"><div align="center"><strong>4</strong></div></td>
                <td class="style2"> <div align="left">I am growing personally</div></td>
                <td><div align="center">
                  <input name="q4" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q4" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q4" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q4" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q4" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q4" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q4" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q4" type="radio" value="8"></td>
			    <td width="30"><input name="q4" type="radio" value="9"></td>
			    <td width="30"><input name="q4" type="radio" value="10"></td>
			   </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>5</strong></div></td>
                <td class="style2"><div align="left">I see specific growth in my character </div></td>
                <td><div align="center">
                  <input name="q5" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q5" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q5" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q5" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q5" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q5" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q5" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q5" type="radio" value="8"></td>
			    <td width="30"><input name="q5" type="radio" value="9"></td>
			    <td width="30"><input name="q5" type="radio" value="10"></td>
			   </tr>			   			 
			   <tr bgcolor="white">
			     <td height="46" class="style2"><div align="center"><strong>6</strong></div></td>
                <td class="style2"><div align="left">I feel cared for and appreciated</div></td>
                <td><div align="center">
                  <input name="q6" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q6" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q6" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q6" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q6" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q6" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q6" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q6" type="radio" value="8"></td>
			    <td width="30"><input name="q6" type="radio" value="9"></td>
			    <td width="30"><input name="q6" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td>&nbsp;</td>
			   </tr>
			   <tr>
                 <td height="46"><div align="center"></div></td>
                 <td><div align="center"><strong>Ministry Questions</strong></div></td>
                 <td><div align="center"><strong>1</strong></div></td>
                 <td><div align="center"><strong>2</strong></div></td>
                 <td><div align="center"><strong>3</strong></div></td>
                 <td><div align="center"><strong>4</strong></div></td>
                 <td><div align="center"><strong>5</strong></div></td>
                 <td><div align="center"><strong>6</strong></div></td>
                 <td><div align="center"><strong>7</strong></div></td>
                 <td><div align="center"><strong>8</strong></div></td>
                 <td><div align="center"><strong>9</strong></div></td>
                 <td><div align="center"><strong>10</strong></div></td>
			     </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>7</strong></div></td>
                <td class="style2"><div align="left"> My support level is adequate</div></td>
                <td><div align="center">
                  <input name="q7" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q7" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q7" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q7" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q7" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q7" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q7" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q7" type="radio" value="8"></td>
			    <td width="30"><input name="q7" type="radio" value="9"></td>
			    <td width="30"><input name="q7" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td height="46" class="style2"><div align="center"><strong>8</strong></div></td>
                <td class="style2"><div align="left">I'm effective in turning lost students into Christ-centered laborers </div></td>
                <td><div align="center">
                  <input name="q8" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q8" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q8" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q8" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q8" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q8" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q8" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q8" type="radio" value="8"></td>
			    <td width="30"><input name="q8" type="radio" value="9"></td>
			    <td width="30"><input name="q8" type="radio" value="10"></td>
			   </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>9</strong></div></td>
                <td class="style2"> <div align="left">I feel well equipped</div></td>
                <td><div align="center">
                  <input name="q9" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q9" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q9" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q9" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q9" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q9" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q9" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q9" type="radio" value="8"></td>
			    <td width="30"><input name="q9" type="radio" value="9"></td>
			    <td width="30"><input name="q9" type="radio" value="10"></td>
			   </tr>
			   	<tr>
			     <td height="46" class="style2"><div align="center"><strong>10</strong></div></td>
                <td class="style2"> <div align="left">I am fruitful in evangelism</div></td>
                <td><div align="center">
                  <input name="q10" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q10" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q10" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q10" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q10" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q10" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q10" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q10" type="radio" value="8"></td>
			    <td width="30"><input name="q10" type="radio" value="9"></td>
			    <td width="30"><input name="q10" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td>&nbsp;</td>
			   </tr>
			   <tr>
                 <td height="46"><div align="center"></div></td>
                 <td><div align="center"><strong>Team Questions</strong></div></td>
                 <td><div align="center"><strong>1</strong></div></td>
                 <td><div align="center"><strong>2</strong></div></td>
                 <td><div align="center"><strong>3</strong></div></td>
                 <td><div align="center"><strong>4</strong></div></td>
                 <td><div align="center"><strong>5</strong></div></td>
                 <td><div align="center"><strong>6</strong></div></td>
                 <td><div align="center"><strong>7</strong></div></td>
                 <td><div align="center"><strong>8</strong></div></td>
                 <td><div align="center"><strong>9</strong></div></td>
                 <td><div align="center"><strong>10</strong></div></td>
			     </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>11</strong></div></td>
                <td class="style2"><div align="left">I am getting good direction and feedback from my directors</div></td>
                <td><div align="center">
                  <input name="q11" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q11" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q11" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q11" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q11" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q11" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q11" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q11" type="radio" value="8"></td>
			    <td width="30"><input name="q11" type="radio" value="9"></td>
			    <td width="30"><input name="q11" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td height="46" class="style2"><div align="center"><strong>12</strong></div></td>
                <td class="style2"> <div align="left"> We are solving the problems we are facing locally </div></td>
                <td><div align="center">                  <input name="q12" type="radio" value="1">
</div></td>
                <td><div align="center">
                  <input name="q12" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q12" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q12" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q12" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q12" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q12" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q12" type="radio" value="8"></td>
			    <td width="30"><input name="q12" type="radio" value="9"></td>
			    <td width="30"><input name="q12" type="radio" value="10"></td>
			   </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>13</strong></div></td>
                <td class="style2"> <div align="left">I understand the vision, priorities and direction of my local team</div></td>
                <td><div align="center">
                  <input name="q13" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q13" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q13" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q13" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q13" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q13" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q13" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q13" type="radio" value="8"></td>
			    <td width="30"><input name="q13" type="radio" value="9"></td>
			    <td width="30"><input name="q13" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td height="46" class="style2"><div align="center"><strong>14</strong></div></td>
                <td class="style2"><div align="left">We are seeing progress toward fulfilling the mission on our campus(es) </div></td>
                <td><div align="center">
                  <input name="q14" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q14" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q14" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q14" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q14" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q14" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q14" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q14" type="radio" value="8"></td>
			    <td width="30"><input name="q14" type="radio" value="9"></td>
			    <td width="30"><input name="q14" type="radio" value="10"></td>
			   </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>15</strong></div></td>
                <td class="style2"><div align="left">My relationships with teammates are strong and satisfying</div></td>
                <td><div align="center">
                  <input name="q15" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q15" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q15" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q15" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q15" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q15" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q15" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q15" type="radio" value="8"></td>
			    <td width="30"><input name="q15" type="radio" value="9"></td>
			    <td width="30"><input name="q15" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td>&nbsp;</td>
			   </tr>
			    <tr>
                 <td height="46"><div align="center"></div></td>
                 <td><div align="center"><strong>Regional/National Questions</strong></div></td>
                 <td><div align="center"><strong>1</strong></div></td>
                 <td><div align="center"><strong>2</strong></div></td>
                 <td><div align="center"><strong>3</strong></div></td>
                 <td><div align="center"><strong>4</strong></div></td>
                 <td><div align="center"><strong>5</strong></div></td>
                 <td><div align="center"><strong>6</strong></div></td>
                 <td><div align="center"><strong>7</strong></div></td>
                 <td><div align="center"><strong>8</strong></div></td>
                 <td><div align="center"><strong>9</strong></div></td>
                 <td><div align="center"><strong>10</strong></div></td>
			     </tr>
			     <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>16</strong></div></td>
                <td class="style2"><div align="left">I know who to call or talk to when I need help </div></td>
                <td><div align="center">
                  <input name="q16" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q16" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q16" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q16" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q16" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q16" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q16" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q16" type="radio" value="8"></td>
			    <td width="30"><input name="q16" type="radio" value="9"></td>
			    <td width="30"><input name="q16" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td height="46" class="style2"><div align="center"><strong>17</strong></div></td>
                <td class="style2"><div align="left">We are seeing progress toward fulfilling the mission in our region</div></td>
                <td><div align="center">
                  <input name="q17" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q17" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q17" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q17" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q17" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q17" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q17" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q17" type="radio" value="8"></td>
			    <td width="30"><input name="q17" type="radio" value="9"></td>
			    <td width="30"><input name="q17" type="radio" value="10"></td>
			   </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>18</strong></div></td>
                <td class="style2"><div align="left">I am confident of where<font color="#336699" size="1" face="Arial"> </font>we're headed regionally </div></td>
                <td><div align="center">
                  <input name="q18" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q18" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q18" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q18" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q18" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q18" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q18" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q18" type="radio" value="8"></td>
			    <td width="30"><input name="q18" type="radio" value="9"></td>
			    <td width="30"><input name="q18" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td height="46" class="style2"><div align="center"><strong>19</strong></div></td>
                <td class="style2"> <div align="left">I understand the vision, priorities and direction of my regional team </div></td>
                <td><div align="center">
                  <input name="q19" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q19" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q19" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q19" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q19" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q19" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q19" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q19" type="radio" value="8"></td>
			    <td width="30"><input name="q19" type="radio" value="9"></td>
			    <td width="30"><input name="q19" type="radio" value="10"></td>
			   </tr>
			   <tr bgcolor="#D0DDEA">
			     <td height="46" class="style2"><div align="center"><strong>20</strong></div></td>
                <td class="style2"> <div align="left">I am confident of where we're headed nationally </div></td>
                <td><div align="center">
                  <input name="q20" type="radio" value="1">
                </div></td>
                <td><div align="center">
                  <input name="q20" type="radio" value="2">
                </div></td>
                <td><div align="center">
                  <input name="q20" type="radio" value="3">
                </div></td>
                <td><div align="center">
                  <input name="q20" type="radio" value="4">
                </div></td>
                <td><div align="center">
                  <input name="q20" type="radio" value="5">
                </div></td>
                <td><div align="center">
                  <input name="q20" type="radio" value="6">
                </div></td>
                <td width="30"><div align="center">
                  <input name="q20" type="radio" value="7">
                </div></td>
                <td width="30"><input name="q20" type="radio" value="8"></td>
			    <td width="30"><input name="q20" type="radio" value="9"></td>
			    <td width="30"><input name="q20" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td height="46" class="style2"><div align="center"><strong>21</strong></div></td>
			     <td class="style2"><div align="left">I understand the vision, priorities and direction of the national team</div></td>
			     <td><input name="q21" type="radio" value="1"></td>
			     <td><input name="q21" type="radio" value="2"></td>
			     <td><input name="q21" type="radio" value="3"></td>
			     <td><input name="q21" type="radio" value="4"></td>
			     <td><input name="q21" type="radio" value="5"></td>
			     <td><input name="q21" type="radio" value="6"></td>
			     <td width="30"><input name="q21" type="radio" value="7"></td>
			     <td width="30"><input name="q21" type="radio" value="8"></td>
			     <td width="30"><input name="q21" type="radio" value="9"></td>
			     <td width="30"><input name="q21" type="radio" value="10"></td>
			   </tr>
			   <tr>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     <td>&nbsp;</td>
			     </tr>
			   <tr>
			     <td><div align="center"></div></td>
			     <td colspan="11"><div align="center"><font size="-1">			       <b>Additional Comments</b><br> 
			       </font><font size="-1">
			         <textarea name=comments cols="60" rows="13" wrap="VIRTUAL" id="comments"></textarea>
			         </font></div></td>
			     </tr>
			   <tr>
			     <td><div align="center">
			       <input name="action" type="hidden" id="action" value="doIt">
			     </div></td>
                <td colspan="11"><div align="center">
                  <input name="submit" type=submit id="submit" value="Submit Survey">
                </div>               </td>
                </tr>
            </table>
			<% end if %>			</td>
		  </tr>
		</table>



	</font> <font size='1'>
<table width='100%' border=0 cellspacing=0 cellpadding=0>
	              <tr>
	                <td colspan="2"  ALIGN="LEFT" VALIGN="BOTTOM">&nbsp;</td>
	                </tr>
                  <!--		<tr><td  ALIGN="LEFT" VALIGN="BOTTOM" BGCOLOR="#FFFFFF" nowrap>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/wsnsummerproject?action=showIndex">WSN Summer Project Tool</a>	</td><td  ALIGN="LEFT" VALIGN="BOTTOM" BGCOLOR="#FFFFFF"> &nbsp; </td><td  ALIGN="LEFT" VALIGN="BOTTOM" BGCOLOR="#FFFFFF"><FONT FACE="Arial" SIZE="1" COLOR="#000000">	Leaders can automatically generate new account numbers for accepted students, track their balances, etc..	</font></td></tr>	-->
  

		                  </table>
	            </font></td>
	</tr></table></td></tr></table>


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
		<td align="center" CLASS="small">
		  <!-- <a href="/general/feedback.jsp"><img src="/images/info.gif" border="0" align="center" alt="Info" WIDTH="42" HEIGHT="41"></a> -->
		  <i>� 2004 Campus Crusade for Christ International</i><br>
		</td>
	</tr>
	<tr>
		<td align="center" CLASS="small">
		  <i><a href="/general/feedback.jsp" target="_blank">Send us feedback.</a></i><br><br>
		</td>
	</tr>
  </table>
  </center>
</form>

</BODY>


</BODY>
</HTML>

