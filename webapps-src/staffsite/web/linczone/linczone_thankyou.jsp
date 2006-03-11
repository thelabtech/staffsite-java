<%@ page import = "java.util.*, org.alt60m.linczone.LinczoneProcessor" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Thank You for Registering</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	background-color: #ff6600;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
p {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000033;

}
.body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
h2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #000033;
}
.links {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
h1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
	color: #000033;
	text-transform: capitalize;
}
ul {
	list-style-type: square;
}
.small {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
}
.headlines {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
}
.date {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #333399;
}
.color {
	color: #333399;
	font-weight: bold;

}

-->
</style>
</head>

<body><table width="450" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="25" rowspan="4"><img src="http://www.linczone.com/images03/spacer.gif" width="25"></td>
    <td><img src="http://www.collegewalk.com/images/cwlogo.gif" width="284" height="111"></td>
  </tr>
  <tr>
    <td><table width="450" border="0" cellpadding="0" cellspacing="0" bgcolor="#000033">
  <tr> 
    <td height="2" colspan="3"><img src="images/spacer.gif" width="1" height="2"></td>
  </tr>
  <tr> 
    <td width="2"><img src="images/spacer.gif" WIDTH="2"></td>
    <td width="446" valign="top" bgcolor="#FFFFFF"> <table width="446" border="0" cellpadding="0" cellspacing="0" background="http://www.linczone.com/images03/cellback.gif">
                    <tr> 
          <td height="18" colspan="3"><img src="images/spacer.gif" width="1" height="20"></td>
        </tr>
        <tr> 
          <td width="18"><img src="http://www.linczone.com/images03/spacer.gif" width="1" height="1"></td>
                      <td width="410" valign="top"> <p>Thank you for visiting 
                                <strong>CollegeWalk.com</strong>. By requesting information about any 
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
                                and get connected to a community on your campus.</p>
                        <p><a href="http://www.linczone.com/form2.htm">Enter 
                                another name</a></p>
                        <form>
                          <font color="#003399" size="4" face="Verdana, Arial, Helvetica, sans-serif">
                          <input name="button" type="button" onClick="window.close()" value="Close Window">
                          </font>
                        </form>                        <p>&nbsp;</p></td>
                      <td width="18"><img src="http://www.linczone.com/images03/spacer.gif" width="1" height="1"></td>
        </tr>
        <tr> 
          <td height="18" colspan="3"><img src="images/spacer.gif" width="1" height="1"></td>
        </tr>
      </table></td>
    <td width="2"><img src="images/spacer.gif" WIDTH="2"></td>
  </tr>
  <tr> 
    <td height="2" colspan="3"><img src="images/spacer.gif" width="1" height="2"></td>
  </tr>
</table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><p><strong><span class="sub">&copy; 2003 CollegeWalk, A Ministry of Campus Crusade for Christ, Intl.</span></strong><span class="sub"><br>
  Developed and maintained by Student LINC</span></p>    </td>
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
