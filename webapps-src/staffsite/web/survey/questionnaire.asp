<HTML>
<HEAD>
<TITLE>Acts 6 - Questionnaire</TITLE>
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
if ( (phone()) && (lane()) &&  (jobtitle()) && (region()) && (lastname()) && (firstname()) )
{ 
return true;
}
else
return false;
}

function saveForm(){
	document.form1.action.value = "save";
	return true;
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

function firstname(){
if (document.form1.firstname.value == "") {
alert ("\n You did not enter your first name.\n")
return false;
}
return true;
}

function lastname(){
if (document.form1.lastname.value == "") {
alert ("\n You did not enter your last name.\n")
return false;
}
return true;
}

function region(){
if (document.form1.region.value == "") {
alert ("\n You did not enter your region.\n")
return false;
}
return true;
}

function jobtitle(){
if (document.form1.jobtitle.value == "") {
alert ("\n You did not enter your job title.\n")
return false;
}
return true;
}

function lane(){
if (document.form1.lane.value == "") {
alert ("\n You did not enter your lane.\n")
return false;
}
return true;
}

function phone(){
if (document.form1.phone.value == "") {
alert ("\n You did not enter your phone.\n")
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

// -->
</SCRIPT>

<%
Sub insertDB()
	set database = server.CreateObject("adodb.connection")
	database.open "DSN=istprod;UID=istprod;PWD=w5u#AGa"
	sql = "INSERT INTO questionnaireActs6(firstname,lastname,region,jobtitle,lane,phone,textarea1a,textarea1b,textarea1c,textarea2a,textarea2b,textarea2c,textarea3a,textarea3b,textarea3c,textarea4a,textarea4b,textarea4c,textarea5a,textarea5b,textarea5c,textarea6a,textarea6b,textarea6c,textarea7a,textarea7b,textarea7c,textarea8a,textarea8b,textarea8c,textarea9a,textarea9b,textarea9c,textarea10a,textarea10b,textarea10c,textarea11a,textarea11b,textarea11c,textarea12a,textarea12b,textarea12c,textarea13a,textarea13b,textarea13c,textarea14a,textarea14b,textarea14c,textarea15a,textarea15b,textarea15c,textarea16a,textarea16b,textarea16c,comments) VALUES('" & Replace(request.form("firstname"), "'" , "''" ) & "','" & Replace(request.form("lastname"), "'" , "''" ) & "','" & Replace(request.form("region"), "'" , "''" ) & "','" & Replace(request.form("jobtitle"), "'" , "''" ) & "','" & Replace(request.form("lane"), "'" , "''" ) & "','" & Replace(request.form("phone"), "'" , "''" ) & "','" & Replace(request.form("textarea1a"), "'" , "''" ) & "','" & Replace(request.form("textarea1b"), "'" , "''" ) & "','" & Replace(request.form("textarea1c"), "'" , "''" ) & "','" & Replace(request.form("textarea2a"), "'" , "''" ) & "','" & Replace(request.form("textarea2b"), "'" , "''" ) & "','" & Replace(request.form("textarea2c"), "'" , "''" ) & "','" & Replace(request.form("textarea3a"), "'" , "''" ) & "','" & Replace(request.form("textarea3b"), "'" , "''" ) & "','" & Replace(request.form("textarea3c"), "'" , "''" ) & "','" & Replace(request.form("textarea4a"), "'" , "''" ) & "','" & Replace(request.form("textarea4b"), "'" , "''" ) & "','" & Replace(request.form("textarea4c"), "'" , "''" ) & "','" & Replace(request.form("textarea5a"), "'" , "''" ) & "','" & Replace(request.form("textarea5b"), "'" , "''" ) & "','" & Replace(request.form("textarea5c"), "'" , "''" ) & "','" & Replace(request.form("textarea6a"), "'" , "''" ) & "','" & Replace(request.form("textarea6b"), "'" , "''" ) & "','" & Replace(request.form("textarea6c"), "'" , "''" ) & "','" & Replace(request.form("textarea7a"), "'" , "''" ) & "','" & Replace(request.form("textarea7b"), "'" , "''" ) & "','" & Replace(request.form("textarea7c"), "'" , "''" ) & "','" & Replace(request.form("textarea8a"), "'" , "''" ) & "','" & Replace(request.form("textarea8b"), "'" , "''" ) & "','" & Replace(request.form("textarea8c"), "'" , "''" ) & "','" & Replace(request.form("textarea9a"), "'" , "''" ) & "','" & Replace(request.form("textarea9b"), "'" , "''" ) & "','" & Replace(request.form("textarea9c"), "'" , "''" ) & "','" & Replace(request.form("textarea10a"), "'" , "''" ) & "','" & Replace(request.form("textarea10b"), "'" , "''" ) & "','" & Replace(request.form("textarea10c"), "'" , "''" ) & "','" & Replace(request.form("textarea11a"), "'" , "''" ) & "','" & Replace(request.form("textarea11b"), "'" , "''" ) & "','" & Replace(request.form("textarea11c"), "'" , "''" ) & "','" & Replace(request.form("textarea12a"), "'" , "''" ) & "','" & Replace(request.form("textarea12b"), "'" , "''" ) & "','" & Replace(request.form("textarea12c"), "'" , "''" ) & "','" & Replace(request.form("textarea13a"), "'" , "''" ) & "','" & Replace(request.form("textarea13b"), "'" , "''" ) & "','" & Replace(request.form("textarea13c"), "'" , "''" ) & "','" & Replace(request.form("textarea14a"), "'" , "''" ) & "','" & Replace(request.form("textarea14b"), "'" , "''" ) & "','" & Replace(request.form("textarea14c"), "'" , "''" ) & "','" & Replace(request.form("textarea15a"), "'" , "''" ) & "','" & Replace(request.form("textarea15b"), "'" , "''" ) & "','" & Replace(request.form("textarea15c"), "'" , "''" ) & "','" & Replace(request.form("textarea16a"), "'" , "''" ) & "','" & Replace(request.form("textarea16b"), "'" , "''" ) & "','" & Replace(request.form("textarea16c"), "'" , "''" ) & "','" & Replace(request.form("comments"), "'" , "''" ) & "')"
	database.execute(sql)
	database.close
End Sub

Function updateDB()
	set database = server.CreateObject("adodb.connection")
	database.open "DSN=istprod;UID=istprod;PWD=w5u#AGa"
	sql = "UPDATE questionnaireActs6 SET firstname = '" & Replace(request.form("firstname"), "'" , "''" ) & "', lastname = '" & Replace(request.form("lastname"), "'" , "''" ) & "', region = '" & Replace(request.form("region"), "'" , "''" ) & "', jobtitle = '" & Replace(request.form("jobtitle"), "'" , "''" ) & "', lane = '" & Replace(request.form("lane"), "'" , "''" ) & "', phone = '" & Replace(request.form("phone"), "'" , "''" ) & "', textarea1a = '" & Replace(request.form("textarea1a"), "'" , "''" ) & "', textarea1b = '" & Replace(request.form("textarea1b"), "'" , "''" ) & "', textarea1c = '" & Replace(request.form("textarea1c"), "'" , "''" ) & "', textarea2a = '" & Replace(request.form("textarea2a"), "'" , "''" ) & "', textarea2b = '" & Replace(request.form("textarea2b"), "'" , "''" ) & "', textarea2c = '" & Replace(request.form("textarea2c"), "'" , "''" ) & "', textarea3a = '" & Replace(request.form("textarea3a"), "'" , "''" ) & "', textarea3b = '" & Replace(request.form("textarea3b"), "'" , "''" ) & "', textarea3c = '" & Replace(request.form("textarea3c"), "'" , "''" ) & "', textarea4a = '" & Replace(request.form("textarea4a"), "'" , "''" ) & "', textarea4b = '" & Replace(request.form("textarea4b"), "'" , "''" ) & "', textarea4c = '" & Replace(request.form("textarea4c"), "'" , "''" ) & "', textarea5a = '" & Replace(request.form("textarea5a"), "'" , "''" ) & "', textarea5b = '" & Replace(request.form("textarea5b"), "'" , "''" ) & "', textarea5c = '" & Replace(request.form("textarea5c"), "'" , "''" ) & "', textarea6a = '" & Replace(request.form("textarea6a"), "'" , "''" ) & "', textarea6b = '" & Replace(request.form("textarea6b"), "'" , "''" ) & "', textarea6c = '" & Replace(request.form("textarea6c"), "'" , "''" ) & "', textarea7a = '" & Replace(request.form("textarea7a"), "'" , "''" ) & "', textarea7b = '" & Replace(request.form("textarea7b"), "'" , "''" ) & "', textarea7c = '" & Replace(request.form("textarea7c"), "'" , "''" ) & "', textarea8a = '" & Replace(request.form("textarea8a"), "'" , "''" ) & "', textarea8b = '" & Replace(request.form("textarea8b"), "'" , "''" ) & "', textarea8c = '" & Replace(request.form("textarea8c"), "'" , "''" ) & "', textarea9a = '" & Replace(request.form("textarea9a"), "'" , "''" ) & "', textarea9b = '" & Replace(request.form("textarea9b"), "'" , "''" ) & "', textarea9c = '" & Replace(request.form("textarea9c"), "'" , "''" ) & "', textarea10a = '" & Replace(request.form("textarea10a"), "'" , "''" ) & "', textarea10b = '" & Replace(request.form("textarea10b"), "'" , "''" ) & "', textarea10c = '" & Replace(request.form("textarea10c"), "'" , "''" ) & "', textarea11a = '" & Replace(request.form("textarea11a"), "'" , "''" ) & "', textarea11b = '" & Replace(request.form("textarea11b"), "'" , "''" ) & "', textarea11c = '" & Replace(request.form("textarea11c"), "'" , "''" ) & "', textarea12a = '" & Replace(request.form("textarea12a"), "'" , "''" ) & "', textarea12b = '" & Replace(request.form("textarea12b"), "'" , "''" ) & "', textarea12c = '" & Replace(request.form("textarea12c"), "'" , "''" ) & "', textarea13a = '" & Replace(request.form("textarea13a"), "'" , "''" ) & "', textarea13b = '" & Replace(request.form("textarea13b"), "'" , "''" ) & "', textarea13c = '" & Replace(request.form("textarea13c"), "'" , "''" ) & "', textarea14a = '" & Replace(request.form("textarea14a"), "'" , "''" ) & "', textarea14b = '" & Replace(request.form("textarea14b"), "'" , "''" ) & "', textarea14c = '" & Replace(request.form("textarea14c"), "'" , "''" ) & "', textarea15a = '" & Replace(request.form("textarea15a"), "'" , "''" ) & "', textarea15b = '" & Replace(request.form("textarea15b"), "'" , "''" ) & "', textarea15c = '" & Replace(request.form("textarea15c"), "'" , "''" ) & "', textarea16a = '" & Replace(request.form("textarea16a"), "'" , "''" ) & "', textarea16b = '" & Replace(request.form("textarea16b"), "'" , "''" ) & "', textarea16c = '" & Replace(request.form("textarea16c"), "'" , "''" ) & "', comments = '" & Replace(request.form("comments"), "'" , "''" ) & "' WHERE id = " & request.form("id")
	database.execute(sql)
	database.close

	updateDB = request.form("id")
End Function

Function getID()
	set database = server.CreateObject("adodb.connection")
	database.open "DSN=istprod;UID=istprod;PWD=w5u#AGa"
	set rs = server.CreateObject("adodb.recordset")
	rs.Open "Select max(id) as max_id from questionnaireActs6", database
	for each x in rs.Fields
		getID = x.value
	next
	rs.close
	database.close
End Function

Sub makeSelectMenuOptions(list(), selected)
	for each x in list
		Response.Write("<option value=" & Chr(34) & x & Chr(34))
		if x=selected then
			Response.Write(" selected=" & Chr(34) & "selected" & Chr(34))
		end if
		Response.Write("> " & x & "</option>")
	next
End Sub
%>


<STYLE>
SPAN {cursor: hand ; }
.onme1 {color: #D5DAEA ; }
.offme{color: #7788BB ; }
.style2 {font-family: Arial, Helvetica, sans-serif;font-size: 14px;color:black;}
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
	<form action="questionnaire.asp" method="post" name="form1" id="form1" onSubmit="return submitForms()">
	  <TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0><!-- Whole Page table -->
	<TR>
		<TD>
		<!-- Header begin -->
		
		
			<SCRIPT LANGUAGE="JavaScript">
<!--
var preloadFlag = false;
function preloadImages() {
	if (document.images) {
		preloadFlag = true;
	}
}
// -->
</SCRIPT>
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD width="57" ROWSPAN=3><IMG SRC="/images/header_01.gif" WIDTH=51 HEIGHT=77></TD>
		<TD width="198" ROWSPAN=2><IMG SRC="/images/header_02.gif" WIDTH=102 HEIGHT=56></TD>
		<TD width="6" ROWSPAN=2 ALIGN="LEFT" VALIGN="TOP">
		<!-- White space for text -->		
		<FONT FACE="Arial" SIZE="1" COLOR="#336699"><BR></FONT>
		<FONT FACE="Arial" SIZE="2" COLOR="#336699">&nbsp;</FONT>
		</TD>
		<TD width="499" COLSPAN=6 ALIGN=RIGHT>
		<!-- other link text -->
		<FONT FACE="Arial" SIZE="1" COLOR="#336699">
		| <A HREF="/logout.jsp"><FONT FACE="Arial" SIZE="1" COLOR="#336699">logoff</FONT></A>
		|&nbsp;
		</FONT>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN=6><IMG NAME="header_05" SRC="/images/header_05.gif" WIDTH=298 HEIGHT=35></TD>
	</TR>
	<TR>
		<TD><IMG SRC="/images/header_06.gif" WIDTH=102 HEIGHT=21></TD>
	</TR>
</TABLE>
		
		<P>
		<!-- Header end -->
		</TD>
	</TR>
	<TR>
		 <TD BGCOLOR="#FFFFFF" ALIGN="LEFT" CELLSPACING="0">
		 <!--Start all table-->


<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#D0DDEA' CELLSPACING='0' CELLPADDING='0'><TR><td width="20%" align=left valign=top><img src='/images/box_tl.gif'></td>
<TD HEIGHT=7 ALIGN='CENTER' NOWRAP>
<FONT FACE="Arial" COLOR="#336699"><font size='6'><b>Acts 6 - Questionnaire </b></font></font></TD>
<td width="20%" align=right valign=top><img src='/images/box_tr.gif'></td>
</TR>
<tr><TD BGCOLOR='#CCCC99' colspan=3><TABLE WIDTH='100%' CELLSPACING='1' CELLPADDING='9' BORDER='0'>
  <TR><TD><FONT FACE="Arial" COLOR="#336699"><font size='1'>
</font></font>

<FONT FACE="Arial" COLOR="#336699">
	
	<TABLE WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='1'><TR><TD BGCOLOR='#336699'><TABLE WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD HEIGHT='' BGCOLOR='#D0DDEA'><FONT FACE="Arial" COLOR="#336699"><font size='1'>
		<table width='100%' border=0 cellspacing=0 cellpadding=0>
	
		<tr bgcolor="white">
 		<td colspan="2"  ALIGN="LEFT" VALIGN="BOTTOM" bgcolor="white">
		  <div align="center">
			<% if request.form("action") = "doIt" then %>
				<strong>Your responses have been recorded. Thanks for participating!</strong>
				<% 
				if request.form("id") = "0" then
					call insertDB()
				else 
					updateDB()
				end if
				%>
			<% elseif request.form("action") = "save" then %>
				<%
				if request.form("id") = "0" then
					call insertDB()
					%>
					<input type="hidden" name="id" id="id" value="<%=getID()%>">
					<%
				else
					%>
					<input type="hidden" name="id" id="id" value="<%=updateDB()%>">
					<%
				end if
				%>
			<% else %>
				<input type="hidden" name="id" id="id" value="0">
			<% end if %>
		    </div>
			<% if request.form("action") <> "doIt" then %>
		  <table width="100%"  border="0" cellspacing="2" cellpadding="6">
              <tr bgcolor="#D0DDEA">
                <td height="46" colspan="12"><table width="100%"  border="0" cellspacing="2" cellpadding="4">
                  <tr height="1">
                    <td width="113" align="right">&nbsp;</td>
                    <td width="231" align="left">&nbsp;</td>
                    <td width="104"><div align="right"></div></td>
                    <td width="244" align="left">&nbsp;</td>
                  </tr>
                  <tr bgcolor="#D0DDEA">
                    <td align="right">First Name:</td>
                    <td align="left"><input name="firstname" type="text" id="firstname" size="20" value="<%=request.form("firstname")%>">
                             </td>
                    <td align="right">Last Name:</td>
                    <td align="left"><input name="lastname" type="text" id="lastname" size="20" value="<%=request.form("lastname")%>"></td>
                  </tr>
				  <tr bgcolor="#D0DDEA">
                    <td align="right">Region:</td>
                    <td align="left"><select name="region">
					<%
						dim regions(11)
						regions(0)=""
						regions(1)="Northeast"
						regions(2)="Mid-Atlantic"
						regions(3)="MidSouth"
						regions(4)="Southeast"
						regions(5)="Great Lakes"
						regions(6)="Upper Midwest"
						regions(7)="Great Plains Intl"
						regions(8)="Red River"
						regions(9)="Greater Northwest"
						regions(10)="Pacific Southwest"
						regions(11)="NCO"
						Call makeSelectMenuOptions(regions, request.form("region"))
					%>
					</select>
					</td>
                    <td align="right">Job Title:</td>
                    <td align="left"><input name="jobtitle" type="text" id="jobtitle" size="30" value="<%=request.form("jobtitle")%>"> 
                    *** 
                  </td>
                  </tr>
				  <tr bgcolor="#D0DDEA">
                    <td align="right">Lane:</td>
                    <td align="left"><select name="lane">
					<%
						dim lanes(8)
						lanes(0)=""
						lanes(1)="Catalytic"
						lanes(2)="HR"
						lanes(3)="Operations"
						lanes(4)="Staffed Campus"
						lanes(5)="WSN"
						lanes(6)="Fund Development"
						lanes(7)="ESM"
						lanes(8)="Bridges"
						Call makeSelectMenuOptions(lanes, request.form("lane"))
					%>
					</select>
					</td>
                    <td align="right">Phone:</td>
                    <td align="left" bgcolor="#D0DDEA"><input name="phone" type="text" id="phone" size="15" value="<%=request.form("phone")%>"></td>
                  </tr>
                   <tr bgcolor="#D0DDEA">
                    <td colspan="2" align="right">&nbsp;</td>
                    <td colspan="2" align="right">&nbsp;</td>
                  </tr>
                </table></td>
              </tr>
			  <tr>
                <td width="17" height="46"><div align="center"></div></td>
                <td colspan="3"><div align="center"><strong>*** The questionnaire needs to be answered seperately for each unique job title/position that you have.  This would include any job role that took up more than two weeks of time within the last year.  For example, if you are the HR regional director, HR recruiter, and led a summer project this year, you would answer and submit this questionnaire 3 times.</strong></div></td>
              </tr>
			  
			    <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>1</strong></div></td>
                <td width="205"><div align="left">
				<p>Do you have written instructions or procedures on this job function? </p>
                    <p><font size="-1">
                    <textarea name=textarea1a cols="40" rows="13" wrap="VIRTUAL" id="textarea1a"><%=request.form("textarea1a")%></textarea>
                    <br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p>Enter any concerns you have about the process.<br></p>
                    <p><font size="-1"> <textarea name=textarea1b cols="30" rows="13" wrap="VIRTUAL" id="textarea1b"><%=request.form("textarea1b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p>Enter any recommendations for improvement. <br></p>
                    <p><font size="-1"> <textarea name=textarea1c cols="30" rows="13" wrap="VIRTUAL" id="textarea1c"><%=request.form("textarea1c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
			  <tr class="style2">
                <td height="46"><div align="center"><strong>2</strong></div></td>
                <td width="205"><div align="left">
				<p>What do you use (system, tool, software, pen, and paper, memory, jot on a napkin, etc.) to perform this function? </p>
                    <p><font size="-1">
                    <textarea name=textarea2a cols="40" rows="13" wrap="VIRTUAL" id="textarea2a"><%=request.form("textarea2a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p><br>Enter any concerns you have about the process. <br><br><br></p>
                    <p><font size="-1"> <textarea name=textarea2b cols="30" rows="13" wrap="VIRTUAL" id="textarea2b"><%=request.form("textarea2b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p><br>Enter any recommendations for improvement. <br><br><br></p>
                    <p><font size="-1"> <textarea name=textarea2c cols="30" rows="13" wrap="VIRTUAL" id="textarea2c"><%=request.form("textarea2c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
			  <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>3</strong></div></td>
                <td width="205"><div align="left">
				<p>What do you like or dislike about your method of doing this?</p>
                    <p><font size="-1">
                    <textarea name=textarea3a cols="40" rows="13" wrap="VIRTUAL" id="textarea3a"><%=request.form("textarea3a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p>Enter any concerns you have about the process.</p>
                    <p><font size="-1"> <textarea name=textarea3b cols="30" rows="13" wrap="VIRTUAL" id="textarea3b"><%=request.form("textarea3b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p>Enter any recommendations for improvement. </p>
                    <p><font size="-1"> <textarea name=textarea3c cols="30" rows="13" wrap="VIRTUAL" id="textarea3c"><%=request.form("textarea3c")%></textarea><br></font></p>
                 </div>
              </tr>

			  <tr>
			     <td><div align="center">
			     </div></td>
                <td colspan="3"><div align="right">
				  <input name="save" type="submit" id="save" value="Save & Continue" onClick="return saveForm()">
                </div>               </td>
                </tr>

			   
			  
			  <tr class="style2">
                <td height="46"><div align="center"><strong>4</strong></div></td>
                <td width="205"><div align="left">
				<p>What information do you need in order to perform this function?</p>
                    <p><font size="-1">
                    <textarea name=textarea4a cols="40" rows="13" wrap="VIRTUAL" id="textarea4a"><%=request.form("textarea4a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p>Enter any concerns you have about the process. <br>
                    </p>
                    <p><font size="-1"> <textarea name=textarea4b cols="30" rows="13" wrap="VIRTUAL" id="textarea4b"><%=request.form("textarea4b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p>Enter any recommendations for improvement. <br></p>
                    <p><font size="-1"> <textarea name=textarea4c cols="30" rows="13" wrap="VIRTUAL" id="textarea4c"><%=request.form("textarea4c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
              <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>5</strong></div></td>
                <td width="205"><div align="left"><br>
				<p>How does the information come to you?<br><br><br><br></p>
                    <p><font size="-1">
                    <textarea name=textarea5a cols="40" rows="13" wrap="VIRTUAL" id="textarea5a"><%=request.form("textarea5a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p><br>Enter any concerns you have about the process.<br><br><br><br></p>
                    <p><font size="-1"> <textarea name=textarea5b cols="30" rows="13" wrap="VIRTUAL" id="textarea5b"><%=request.form("textarea5b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p><br>Enter any recommendations for improvement. <br><br><br><br></p>
                    <p><font size="-1"> <textarea name=textarea5c cols="30" rows="13" wrap="VIRTUAL" id="textarea5c"><%=request.form("textarea5c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
			  <tr class="style2">
                <td height="46"><div align="center"><strong>6</strong></div></td>
                <td width="205"><div align="left"><br>
				<p>Who do you provide information to?<br><br></p>
                    <p><font size="-1">
                    <textarea name=textarea6a cols="40" rows="13" wrap="VIRTUAL" id="textarea6a"><%=request.form("textarea6a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p><br>Enter any concerns you have about the process. <br></p>                   
                    <p><font size="-1"> <textarea name=textarea6b cols="30" rows="13" wrap="VIRTUAL" id="textarea6b"><%=request.form("textarea6b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p><br>Enter any recommendations for improvement. <br></p>
                    <p><font size="-1"> <textarea name=textarea6c cols="30" rows="13" wrap="VIRTUAL" id="textarea6c"><%=request.form("textarea6c")%></textarea><br></font></p>
                 </div>
              </tr>

			  <tr>
			     <td><div align="center">
			       
			     </div></td>
                <td colspan="3"><div align="right">
				  <input name="save" type="submit" id="save" value="Save & Continue" onClick="return saveForm()">
                </div>               </td>
                </tr>

			 

			  <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>7</strong></div></td>
                <td width="205"><div align="left"><br><br>
				<p>If you do any reports, can I see a copy of one of these reports with real data (within reason, would it take too long / use too much paper)?<br><br><br></p>
                    <p><font size="-1">
                    <textarea name=textarea7a cols="40" rows="13" wrap="VIRTUAL" id="textarea7a"><%=request.form("textarea7a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left"><br><br>
                    <p>Enter any concerns you have about the process. <br><br><br><br><br><br></p>

                    <p><font size="-1"> <textarea name=textarea7b cols="30" rows="13" wrap="VIRTUAL" id="textarea7b"><%=request.form("textarea7b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left"><br><br>
                    <p>Enter any recommendations for improvement. <br><br><br><br><br><br></p>
                    <p><font size="-1"> <textarea name=textarea7c cols="30" rows="13" wrap="VIRTUAL" id="textarea7c"><%=request.form("textarea7c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
			  <tr class="style2">
                <td height="46"><div align="center"><strong>8</strong></div></td>
                <td width="205"><div align="left"><br>
				<p>What needs do you feel are not met by the system/tool/process you are using?<br><br><br></p>
                    <p><font size="-1">
                    <textarea name=textarea8a cols="40" rows="13" wrap="VIRTUAL" id="textarea8a"><%=request.form("textarea8a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p><br>Enter any concerns you have about the process.</p>
                    <p>&nbsp;</p>
                    <p><font size="-1"> <textarea name=textarea8b cols="30" rows="13" wrap="VIRTUAL" id="textarea8b"><%=request.form("textarea8b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p><br>Enter any recommendations for improvement. </p>
                    <p>&nbsp;</p>
                    <p><font size="-1"> <textarea name=textarea8c cols="30" rows="13" wrap="VIRTUAL" id="textarea8c"><%=request.form("textarea8c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
			  <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>9</strong></div></td>
                <td width="205"><div align="left">
				<p>What is the number one thing that drives you up the wall? </p>
                    <p><font size="-1">
                    <textarea name=textarea9a cols="40" rows="13" wrap="VIRTUAL" id="textarea9a"><%=request.form("textarea9a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p>Enter any concerns you have about the process. </p>
                    <p><font size="-1"> <textarea name=textarea9b cols="30" rows="13" wrap="VIRTUAL" id="textarea9b"><%=request.form("textarea9b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p>Enter any recommendations for improvement. </p>
                    <p><font size="-1"> <textarea name=textarea9c cols="30" rows="13" wrap="VIRTUAL" id="textarea9c"><%=request.form("textarea9c")%></textarea><br></font></p>
                 </div>
              </tr>

			  <tr>
			     <td><div align="center">
			       
			     </div></td>
                <td colspan="3"><div align="right">
				  <input name="save" type="submit" id="save" value="Save & Continue" onClick="return saveForm()">
                </div>               </td>
                </tr>

			  
			  
			  <tr class="style2">
                <td height="46"><div align="center"><strong>10</strong></div></td>
                <td width="205"><div align="left">
				<p>Are there any parts of your job that could be automated? </p>
                    <p><font size="-1">
                    <textarea name=textarea10a cols="40" rows="13" wrap="VIRTUAL" id="textarea10a"><%=request.form("textarea10a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p>Enter any concerns you have about the process.</p>
                    <p><font size="-1"> <textarea name=textarea10b cols="30" rows="13" wrap="VIRTUAL" id="textarea10b"><%=request.form("textarea10b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p>Enter any recommendations for improvement. </p>
                    <p><font size="-1"> <textarea name=textarea10c cols="30" rows="13" wrap="VIRTUAL" id="textarea10c"><%=request.form("textarea10c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
			  <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>11</strong></div></td>
                <td width="205"><div align="left">
				<p>Are there any bottlenecks that keep you from performing this function? </p>
                    <p><font size="-1">
                    <textarea name=textarea11a cols="40" rows="13" wrap="VIRTUAL" id="textarea11a"><%=request.form("textarea11a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p><br>Enter any concerns you have about the process. <br>
                    </p>
                    <p><font size="-1"> <textarea name=textarea11b cols="30" rows="13" wrap="VIRTUAL" id="textarea11b"><%=request.form("textarea11b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p><br>Enter any recommendations for improvement. <br>
                    </p>
                    <p><font size="-1"> <textarea name=textarea11c cols="30" rows="13" wrap="VIRTUAL" id="textarea11c"><%=request.form("textarea11c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
			  <tr class="style2">
                <td height="46"><div align="center"><strong>12</strong></div></td>
                <td width="205"><div align="left">
				<p>Are there any policies in place that hinder your work? What do they prevent you from doing? Are there policies that you feel would be helpful if implemented? </p>
                    <p><font size="-1">
                    <textarea name=textarea12a cols="40" rows="13" wrap="VIRTUAL" id="textarea12a"><%=request.form("textarea12a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p><br>Enter any concerns you have about the process.</p>
                    <p>&nbsp;</p>
                    <p><font size="-1"> <textarea name=textarea12b cols="30" rows="13" wrap="VIRTUAL" id="textarea12b"><%=request.form("textarea12b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p><br>Enter any recommendations for improvement. </p>
                    <p>&nbsp;</p>
                    <p><font size="-1"> <textarea name=textarea12c cols="30" rows="13" wrap="VIRTUAL" id="textarea12c"><%=request.form("textarea12c")%></textarea><br></font></p>
                 </div>
              </tr>

			  <tr>
			     <td><div align="center">
			       
			     </div></td>
                <td colspan="3"><div align="right">
				  <input name="save" type="submit" id="save" value="Save & Continue" onClick="return saveForm()">
                </div>               </td>
                </tr>

			  
			  
			 
			  
              <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>13</strong></div></td>
                <td wid th="205"><div align="left">
				<p>In what areas are you uncertain of how you are to do your job? If you are not sure, what do you do? </p>
                    <p><font size="-1">
                    <textarea name=textarea13a cols="40" rows="13" wrap="VIRTUAL" id="textarea13a"><%=request.form("textarea13a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p>Enter any concerns you have about the process.<br><br>
                    </p>
                    <p><font size="-1"> <textarea name=textarea13b cols="30" rows="13" wrap="VIRTUAL" id="textarea13b"><%=request.form("textarea13b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p>Enter any recommendations for improvement. <br><br>
                    </p>
                    <p><font size="-1"> <textarea name=textarea13c cols="30" rows="13" wrap="VIRTUAL" id="textarea13c"><%=request.form("textarea13c")%></textarea><br></font></p>
                 </div>
              </tr>
			  
			  <tr  class="style2">
                <td height="46"><div align="center"><strong>14</strong></div></td>
                <td width="205"><div align="left">
				<p>Is there ever a situation where you don't have the information that you need to do your job? Do you always have them? </p>
                    <p><font size="-1">
                    <textarea name=textarea14a cols="40" rows="13" wrap="VIRTUAL" id="textarea14a"><%=request.form("textarea14a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p>Enter any concerns you have about the process. </p>
                    <p>&nbsp;</p>
                    <p><font size="-1"> <textarea name=textarea14b cols="30" rows="13" wrap="VIRTUAL" id="textarea14b"><%=request.form("textarea14b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p>Enter any recommendations for improvement. </p>
                    <p>&nbsp;</p>
                    <p><font size="-1"> <textarea name=textarea14c cols="30" rows="13" wrap="VIRTUAL" id="textarea14c"><%=request.form("textarea14c")%></textarea><br></font></p>
                 </div>
              </tr>

		
			  
			  <tr bgcolor="#D0DDEA" class="style2">
                <td height="46"><div align="center"><strong>15</strong></div></td>
                <td width="205"><div align="left">
				<p>What do you see as the purpose of your role? How do you see your role fitting into the big picture? </p>
                    <p><font size="-1">
                    <textarea name=textarea15a cols="40" rows="13" wrap="VIRTUAL" id="textarea15a"><%=request.form("textarea15a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left">
                    <p>Enter any concerns you have about the process.</p>
                    <p>&nbsp;</p>
                    <p><font size="-1"> <textarea name=textarea15b cols="30" rows="13" wrap="VIRTUAL" id="textarea15b"><%=request.form("textarea15b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left">
                    <p>Enter any recommendations for improvement. </p>
                    <p>&nbsp;</p>
                    <p><font size="-1"> <textarea name=textarea15c cols="30" rows="13" wrap="VIRTUAL" id="textarea15c"><%=request.form("textarea15c")%></textarea><br></font></p>
                 </div>
              </tr>

			  <tr>
			     <td><div align="center">
			       
			     </div></td>
                <td colspan="3"><div align="right">
				  <input name="save" type="submit" id="save" value="Save & Continue" onClick="return saveForm()">
                </div>               </td>
                </tr>
			  
			    
			  <tr class="style2">
                <td height="46"><div align="center"><strong>16</strong></div></td>
                <td width="205"><div align="left">
				<p>Do you feel that you have enough time to do this job effectively? If yes, and you could spend less time performing this function, would you be able to do more of something else? What would that be?</p>
                    <p><font size="-1">
                    <textarea name=textarea16a cols="40" rows="13" wrap="VIRTUAL" id="textarea16a"><%=request.form("textarea16a")%></textarea><br></font></p>
                 </div>
                    <td width="205"><div align="left"><br>
                    <p><br>Enter any concerns you have about the process.<br><br><br><br><br></p>
                    <p><font size="-1"> <textarea name=textarea16b cols="30" rows="13" wrap="VIRTUAL" id="textarea16b"><%=request.form("textarea16b")%></textarea><br></font></p>
                 </div>
                <td width="205"><div align="left"><br>
                    <p><br>Enter any recommendations for improvement.<br><br><br><br><br></p>
                    <p><font size="-1"> <textarea name=textarea16c cols="30" rows="13" wrap="VIRTUAL" id="textarea16c"><%=request.form("textarea16c")%></textarea><br></font></p>
                    </div>
              </tr>
			  
              <tr>
			     <td>&nbsp;</td>
			   </tr>
			   <tr>
			     <td><div align="center"></div></td>
			     <td colspan="11"><div align="center"><font size="-1">			       <b>Additional Comments</b><br> 
			       </font><font size="-1">
			         <textarea name=comments cols="60" rows="13" wrap="VIRTUAL" id="comments"><%=request.form("comments")%></textarea>
			         </font></div></td>
			     </tr>
			   <tr>
			     <td><div align="center">
			       <input name="action" type="hidden" id="action" value="doIt">
			     </div></td>
                <td colspan="3"><div align="center">
                  <input name="submit" type=submit id="submit" value="Save & Submit Questionnaire">
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
 </table>
	            </font></td>
	</tr></table></td></tr></table>


</font></td></tr></table></td></tr><tr bgcolor='#D0DDEA'><td align=left valign=bottom><img src='/images/box_bl.gif'></td><TD height=5>
<font size=6> &nbsp; </TD><td align=right valign=bottom><img src='/images/box_br.gif'></td></TR>
</table>

			<BR>
		</TD><!--Closing global table-->
	</TR>
</TABLE>
  <center>
  <table width="755" border="0">
	<tr>
		<td align="center" CLASS="small">
		  <i>© 2004 Campus Crusade for Christ International</i><br>
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

