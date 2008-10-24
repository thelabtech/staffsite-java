<%@ page import="java.util.*" %> <% 
	String ErrorTitle = "Unknown Error";
	if(request.getParameter("Reason") != null) {
		ErrorTitle = request.getParameter("Reason");
		if(request.getParameter("Reason").equals("Timeout")) {
			ErrorTitle = "Your session has timed out";
		}
	}
%>
<html>

<head>
<title>Campus Staff Site - <%= ErrorTitle %></title>
<style TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</style>
</head>

<style>
SPAN {cursor: hand ; }
.onme1 {color: #D5DAEA ; }
.offme{color: #7788BB ; }
</style>

</head>

<body BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#336699" VLINK="#336699" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" ONLOAD="preloadImages();">

<center>
<table WIDTH="760" BORDER="0" CELLPADDING="0" CELLSPACING="0">
  <!-- Whole Page table -->
  <tr>
    <td>
    <!-- Header begin -->
    <table WIDTH="760" BORDER="0" CELLPADDING="0" CELLSPACING="0">
      <tr>
        <td ROWSPAN="3">
        <img SRC="/images/header_noshield_01.gif" WIDTH="153" HEIGHT="21"></td>
      </tr>
    </table>
    <p>
    <!-- Header end --></p>
    </td>
  </tr>
  <tr>
    <td BGCOLOR="#FFFFFF" ALIGN="LEFT" CELLSPACING="0">
    <!--Start all table-->
    <table WIDTH="100%" BORDER="0" BGCOLOR="#336699" CELLSPACING="0" CELLPADDING="0">
      <tr>
        <td align="left" valign="top"><img src="/images/box_tl.gif"></td>
        <td ALIGN="CENTER" HEIGHT="7" NOWRAP><font FACE="Arial" COLOR="#FFFFFF">
        <font size="3"><b>An Error Has Occured</b></font></font></td>
        <td align="right" valign="top"><img src="/images/box_tr.gif"></td>
      </tr>
      <tr>
        <td BGCOLOR="#CCCC99" colspan="3">
        <table WIDTH="100%" CELLSPACING="0" CELLPADDING="5" BORDER="0">
          <tr>
            <td><font FACE="Arial" COLOR="#336699"><font size="1">
            <font FACE="Arial" SIZE="2" COLOR="#336699"><%
	if(request.getParameter("Reason") != null) {
		if(request.getParameter("Reason").equals("Timeout")) {
%>
            <p ALIGN="CENTER">Either you have not logged in yet or you have been 
            idle for more than 30 minutes and your session has timed-out.<br>
            Please <a target="_blank" href="/login.jsp">click here</a> to log back into the campus 
            ministry staff site.</p>
            <p></p>
            <p><b>Tip: </b>If you were trying to save information and received this 
            message, press &quot;Control&quot; and &quot;n&quot; to open a new browser window, then 
            click the login link and proceed to the page you were trying to save. 
            You can then open the first browser window and click the &quot;Back&quot; button 
            to get the page you were trying to save and copy and paste the information 
            from there to the new window.</p>
            <%
		}
	} else {
%>
            <p ALIGN="CENTER">An unknown error has occurred.</p>
            <p ALIGN="CENTER">Please <a href="/login.jsp">click here</a> to log 
            back into the campus ministry staff site, or use your browsers back 
            button to return to the previous page.</p>
            <%
	}
%> </font></font></font></td>
          </tr>
        </table>
        </td>
      </tr>
      <tr bgcolor="#cccc99">
        <td align="left" valign="bottom"><img src="/images/box_bl.gif"></td>
        <td height="5"><font size="1">&nbsp; </font></td>
        <td align="right" valign="bottom"><img src="/images/box_br.gif"></td>
      </tr>
    </table>
    <br>
    </td>
    <!--Closing global table-->
  </tr>
</table>
<center>
<table width="755" border="0">
  <tr>
    <td align="center">
    <!-- <a href="/general/feedback.jsp?"><img src="/images/info.gif" border="0" align="center" alt="Info" WIDTH="42" 

HEIGHT="41"></a> --><font size="2"><i>© 2002 Campus Crusade for Christ International
 <br>
    </font></td>
  </tr>
  <tr>
    <td align="center"><font size="2"><i><a href="/general/feedback.jsp">Send us feedback.</a></i><br>
    </font></td>
  </tr>
</table>
</center></center>
<%@ include file="/headers/google_analytics.jspf"%>
</body>

</html>
