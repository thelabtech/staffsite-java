<%@ page import = "java.util.*, org.alt60m.linczone.LinczoneProcessor" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>LINCZone</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<SCRIPT language=JAVASCRIPT type=TEXT/JAVASCRIPT>
<!--

function popupWindow(cUrl,cName,cFeatures) {
	var childWindow = window.open(cUrl,cName,cFeatures);
	if (childWindow.opener == null) childWindow.opener = self;
	childWindow.focus();
}


function makeMonthArray() {this.length=12;
        this[1] = "January", this[2] = "February"; this[3] = "March"; 
        this[4] = "April", this[5] = "May"; this[6] = "June";
        this[7] = "July", this[8] = "August"; this[9] = "September"; 
        this[10] = "October", this[11] = "November"; this[12] = "December"; 
return(this);
}
function makeDayArray() { 
this.length=7;
        this[1] = "Sunday", this[2] = "Monday"; this[3] = "Tuesday";
        this[4] = "Wednesday", this[5] = "Thursday"; this[6] = "Friday"; 
        this[7] = "Saturday"; 
return(this);
}
function writeDate() { 
        attdate = new Date();
        monthName = new makeMonthArray();
        dayName = new makeDayArray();
        day = attdate.getDay() + 1;
        date = attdate.getDate();
        month = attdate.getMonth() + 1;
       year = attdate.getYear();
        sec = attdate.getSeconds()
        if (90 <=year && year < 2000) { 
                year = 1900 + year;
        } 
		dateStr = dayName[day];
        dateStr += ", "; 
		dateStr += monthName[month];
        dateStr += " "; 
        dateStr += date; 
        dateStr += ", "; 
        dateStr += year;
document.write(dateStr);
}
//-->
</SCRIPT>
<style type="text/css">
<!--
p {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000033;
}
h1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #000033;
}
.body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000033;
}
.sub {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #000033;
}
ul {
	list-style-type: square;
}
ol {
	list-style-type: square;
}
-->
</style>
</head>
<body bgcolor="#ff6500" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('http://www.linczone.com/images03/r1_c4_f2.gif','http://www.linczone.com/images03/r1_c6_f2.gif','http://www.linczone.com/images03/r1_c8_f2.gif','http://www.linczone.com/images03/r1_c10_f2.gif','http://www.linczone.com/images03/r2_c13_f2.gif','http://www.linczone.com/images03/r6_c12_f2.gif','http://www.linczone.com/images03/r10_c13_f2.gif','http://www.linczone.com/images03/r15_c12_f2.gif','http://www.linczone.com/images03/r1_c12_f2.gif','http://www.linczone.com/images03/newmenu/r1_c1_f2.gif','http://www.linczone.com/images03/newmenu/r3_c1_f2.gif','http://www.linczone.com/images03/newmenu/r5_c1_f2.gif','http://www.linczone.com/images03/newmenu/r7_c1_f2.gif','http://www.linczone.com/images03/newmenu/r9_c1_f2.gif','http://www.linczone.com/images03/newmenu/r11_c1_f2.gif')">
<table width="775" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="153" valign="top"> <table width="153" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="2"><img name="r1_c1" src="http://www.linczone.com/images03/r1_c1.gif" width="153" height="105" border="0" alt=""></td>
        </tr>
        <tr> 
          <td colspan="2"><img name="r2_c1" src="http://www.linczone.com/images03/r2_c1.gif" width="153" height="23" border="0" alt=""></td>
        </tr>
        <tr> 
          <td width="118" valign="top"><table border="0" cellpadding="0" cellspacing="0" width="153">
              <!-- fwtable fwsrc="newmenu.png" fwbase="menu.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="1" -->
              <tr> 
                <td><table border="0" cellpadding="0" cellspacing="0" width="118">
                    <tr> 
                      <td><a href="http://www.linczone.com/index03.htm" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('r1_c11','','http://www.linczone.com/images03/newmenu/r1_c1_f2.gif',1)"><img src="http://www.linczone.com/images03/newmenu/r1_c1.gif" alt="" name="r1_c11" width="118" height="51" border="0" id="r1_c11"></a></td>
                    </tr>
                    <tr> 
                      <td><img name="r2_c1" src="http://www.linczone.com/images03/newmenu/r2_c1.gif" width="118" height="13" border="0" alt=""></td>
                    </tr>
                    <tr> 
                      <td><a href="http://www.linczone.com/about03.htm" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('r3_c1','','http://www.linczone.com/images03/newmenu/r3_c1_f2.gif',1)"><img name="r3_c1" src="http://www.linczone.com/images03/newmenu/r3_c1.gif" width="118" height="50" border="0" alt=""></a></td>
                    </tr>
                    <tr> 
                      <td><img name="r4_c1" src="http://www.linczone.com/images03/newmenu/r4_c1.gif" width="118" height="15" border="0" alt=""></td>
                    </tr>
                    <tr> 
                      <td><a href="http://www.linczone.com/articles.htm" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('r5_c1','','http://www.linczone.com/images03/newmenu/r5_c1_f2.gif',1)"><img name="r5_c1" src="http://www.linczone.com/images03/newmenu/r5_c1.gif" width="118" height="50" border="0" alt=""></a></td>
                    </tr>
                    <tr> 
                      <td><img name="r6_c1" src="http://www.linczone.com/images03/newmenu/r6_c1.gif" width="118" height="15" border="0" alt=""></td>
                    </tr>
                    <tr> 
                      <td><a href="http://www.linczone.com/resources.htm" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('r7_c1','','http://www.linczone.com/images03/newmenu/r7_c1_f2.gif',1)"><img name="r7_c1" src="http://www.linczone.com/images03/newmenu/r7_c1.gif" width="118" height="50" border="0" alt=""></a></td>
                    </tr>
                    <tr> 
                      <td><img name="r8_c1" src="http://www.linczone.com/images03/newmenu/r8_c1.gif" width="118" height="14" border="0" alt=""></td>
                    </tr>
                    <tr> 
                      <td><a href="http://www.linczone.com/links.htm" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('r9_c1','','http://www.linczone.com/images03/newmenu/r9_c1_f2.gif',1)"><img name="r9_c1" src="http://www.linczone.com/images03/newmenu/r9_c1.gif" width="118" height="51" border="0" alt=""></a></td>
                    </tr>
                    <tr> 
                      <td><img name="r10_c1" src="http://www.linczone.com/images03/newmenu/r10_c1.gif" width="118" height="15" border="0" alt=""></td>
                    </tr>
                    <tr> 
                      <td><a href="http://www.linczone.com/contact03.htm" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('r11_c1','','http://www.linczone.com/images03/newmenu/r11_c1_f2.gif',1)"><img name="r11_c1" src="http://www.linczone.com/images03/newmenu/r11_c1.gif" width="118" height="50" border="0" alt=""></a></td>
                    </tr>
                    <tr> 
                      <td><img name="r12_c1" src="http://www.linczone.com/images03/newmenu/r12_c1.gif" width="118" height="55" border="0" alt=""></td>
                    </tr>
                    <tr> 
                      <td><img name="r13_c1" src="http://www.linczone.com/images03/newmenu/r13_c1.gif" width="118" height="67" border="0" alt=""></td>
                    </tr>
                  </table></td>
                <td><img name="r1_c2" src="http://www.linczone.com/images03/newmenu/r1_c2.gif" width="35" height="496" border="0" alt=""></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
      </table></td>
    <td width="500" valign="top"><table width="500" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><table border="0" cellpadding="0" cellspacing="0" width="500">
              <tr> 
                <td><img name="r1_c3" src="http://www.linczone.com/images03/r1_c3.gif" width="74" height="105" border="0" alt=""></td>
                <td><a href="http://www.campuscrusadeforchrist.com" target="_blank" onMouseOver="MM_swapImage('r1_c4','','http://www.linczone.com/images03/r1_c4_f2.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="r1_c4" src="http://www.linczone.com/images03/r1_c4.gif" width="89" height="105" border="0" alt=""></a></td>
                <td><img name="r1_c5" src="http://www.linczone.com/images03/r1_c5.gif" width="16" height="105" border="0" alt=""></td>
                <td><a href="http://home.navigators.org/us/collegiate/index.cfm" target="_blank" onMouseOver="MM_swapImage('r1_c6','','http://www.linczone.com/images03/r1_c6_f2.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="r1_c6" src="http://www.linczone.com/images03/r1_c6.gif" width="82" height="105" border="0" alt=""></a></td>
                <td><img name="r1_c7" src="http://www.linczone.com/images03/r1_c7.gif" width="24" height="105" border="0" alt=""></td>
                <td><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('r1_c8','','http://www.linczone.com/images03/r1_c8_f2.gif',1)"><img name="r1_c8" src="http://www.linczone.com/images03/r1_c8.gif" width="86" height="105" border="0" alt=""></a></td>
                <td><img name="r1_c9" src="http://www.linczone.com/images03/r1_c9.gif" width="24" height="105" border="0" alt=""></td>
                <td><a href="http://www.intervarsity.org/" target="_blank" onMouseOver="MM_swapImage('r1_c10','','http://www.linczone.com/images03/r1_c10_f2.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="r1_c10" src="http://www.linczone.com/images03/r1_c10.gif" width="105" height="105" border="0" alt=""></a></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><img name="r2_c3" src="http://www.linczone.com/images03/r2_c3.gif" width="500" height="23" border="0" alt=""></td>
        </tr>
        <tr> 
          <td valign="top"> <table width="500" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="454" valign="top"> <table width="454" border="0" cellpadding="0" cellspacing="0" bgcolor="#000033">
                    <tr> 
                      <td height="2" colspan="3"><img src="http://www.linczone.com/images03/spacer.gif" width="1" height="2"></td>
                    </tr>
                    <tr> 
                      <td width="2"><img src="http://www.linczone.com/images03/spacer.gif" WIDTH="2"></td>
                      <td width="450" valign="top" bgcolor="#FFFFFF"> <table width="450" border="0" cellpadding="0" cellspacing="0" background="http://www.linczone.com/images03/r3_c3_900.gif">
                          <tr> 
                            <td height="18" colspan="3"><img src="http://www.linczone.com/images03/spacer.gif" width="1" height="18"></td>
                          </tr>
                          <tr> 
                            <td width="18"><img src="http://www.linczone.com/images03/spacer.gif" width="18" height="1"></td>
                            <td width="414" valign="top"><p>Thank you for visiting 
                                LINCZone. By requesting information about any 
                                of the ministries listed on our website, you are 
                                indicating that it is important for you to get 
                                connected to a community of faith when you go 
                                away to college. We agree. College life can be 
                                a wonderful experience and can help you to grow 
                                in your faith in ways you never imagined. But 
                                having a community that supports you is crucial 
                                to your growth in your relationship with the Lord. 
                                <BR>
                                <BR>
                                If you would like more information on the ministries 
                                that you have requested, visit their Web site 
                                listed below. <BR>
                                <BR>
                                <%
if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"ccc")) {
	out.print("<A HREF=\"http://www.campuscrusadeforchrist.com\">Campus Crusade for Christ</A><BR>");
}

if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"nav")) {
	out.print("<A HREF=\"http://home.navigators.org/us/collegiate/index.cfm\">The Navigators</A><BR>");
}
if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"iv")) {
	out.print("<A HREF=\"http://www.ivcf.org/\">Intervarsity</A><BR>");
}
if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"fca")) {
	out.print("<A HREF=\"http://www.fca.org/\">Fellowship of Christian Athletes</A><BR>");
}
if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"bsu")) {
	out.print("<A HREF=\"http://www.studentz.com/\">Lifeway Christian Resources (Baptist Student Ministries)</A><BR>");
}
if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"cacm")) {
	out.print("<A HREF=\"http://chialpha.ag.org/homemissions/chi_alpha/\">Chi Alpha Christian Ministries</A><BR>");
}
if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"efca")) {
	out.print("<A HREF=\"http://www.efca.org/sm/fcsmindex.html\">Evangelical Free Church Student Ministries</A><BR>");
}
if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"gcm")) {
	out.print("<A HREF=\"http://www.gcmweb.org\">Great Commission Ministries</A><BR>");
}
if(LinczoneProcessor.isMinistrySelected(request.getParameterValues("ministryInfo"),"wesley")) {
	out.print("<A HREF=\"http://www.gbhem.org/asp/campusmin.asp\">Wesley Foundation</A><BR>");
}


%>
                                <BR>
                                <BR>
                                God bless you as you seek to grow in your faith 
                                and get connected to a community on your campus.</p></p> 
                              <p><a href="http://www.linczone.com/option1.htm">Enter 
                                another name</a></p></td>
                            <td width="18"><img src="http://www.linczone.com/images03/spacer.gif" width="18" height="1"></td>
                          </tr>
                          <tr> 
                            <td height="18" colspan="3"><img src="http://www.linczone.com/images03/spacer.gif" width="1" height="1"></td>
                          </tr>
                        </table></td>
                      <td width="2"><img src="http://www.linczone.com/images03/spacer.gif" WIDTH="2"></td>
                    </tr>
                    <tr> 
                      <td height="2" colspan="3"><img src="http://www.linczone.com/images03/spacer.gif" width="1" height="2"></td>
                    </tr>
                  </table></td>
                <td width="46" valign="top"><img src="http://www.linczone.com/images03/r3_c11.gif" width="46" height="427"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td valign="top"> <p><strong><br>
              <span class="sub">&copy; 2003 LINCZone</span></strong><span class="sub"><br>
              Developed and maintained by Student LINC, a ministry of <a href="http://www.ccci.org" target="_blank">Campus 
              Crusade for Christ, International</a></span></p>
            <p class="sub"><a href="mailto:gswebmaster@uscm.org">Webmaster</a> 
              | <a href="/policy.htm">Privacy Policy</a></p>
            <p class="sub">&nbsp;</p></td>
        </tr>
      </table></td>
    <td width="122" valign="top"><table width="122" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="89"><a href="http://www.fca.org/" target="_blank" onMouseOver="MM_swapImage('r1_c12','','http://www.linczone.com/images03/r1_c12_f2.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="r1_c12" src="http://www.linczone.com/images03/r1_c12.gif" width="85" height="105" border="0" alt=""></a></td>
          <td width="37" height="105"><img src="http://www.linczone.com/images03/spacer.gif" width="37" height="1"></td>
          <td width="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="3"><table border="0" cellpadding="0" cellspacing="0" width="122">
              <tr> 
                <td><table border="0" cellpadding="0" cellspacing="0" width="122">
                    <tr> 
                      <td width="35" height="107"><img src="http://www.linczone.com/images03/spacer.gif" width="35" height="1"></td>
                      <td><a href="http://www.gcmweb.org/" target="_blank" onMouseOver="MM_swapImage('r2_c13','','http://www.linczone.com/images03/r2_c13_f2.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="r2_c13" src="http://www.linczone.com/images03/r2_c13.gif" width="87" height="107" border="0" alt=""></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table border="0" cellpadding="0" cellspacing="0" width="122">
                    <tr> 
                      <td><a href="http://www.chialpha.com/" target="_blank" onMouseOver="MM_swapImage('r6_c12','','http://www.linczone.com/images03/r6_c12_f2.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="r6_c12" src="http://www.linczone.com/images03/r6_c12.gif" width="85" height="107" border="0" alt=""></a></td>
                      <td><img name="r6_c14" src="http://www.linczone.com/images03/r6_c14.gif" width="37" height="107" border="0" alt=""></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table border="0" cellpadding="0" cellspacing="0" width="122">
                    <tr> 
                      <td><img name="r10_c12" src="http://www.linczone.com/images03/r10_c12.gif" width="35" height="104" border="0" alt=""></td>
                      <td><a href="http://www.gbhem.org/asp/campusmin.asp" target="_blank" onMouseOver="MM_swapImage('r10_c13','','http://www.linczone.com/images03/r10_c13_f2.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="r10_c13" src="http://www.linczone.com/images03/r10_c13.gif" width="87" height="104" border="0" alt=""></a></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td><table border="0" cellpadding="0" cellspacing="0" width="122">
                    <tr> 
                      <td><a href="http://web.efca.org/student/" target="_blank" onMouseOver="MM_swapImage('r15_c12','','http://www.linczone.com/images03/r15_c12_f2.gif',1)" onMouseOut="MM_swapImgRestore()"><img name="r15_c12" src="http://www.linczone.com/images03/r15_c12.gif" width="85" height="114" border="0" alt=""></a></td>
                      <td><img name="r15_c14" src="http://www.linczone.com/images03/r15_c14.gif" width="37" height="114" border="0" alt=""></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td width="122" height="18">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</body>
</html>
