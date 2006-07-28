<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*,org.alt60m.servlet.*" %>

<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<%
try {
//    Hashtable h = (Hashtable) session.getValue("tub");
	ActionResults ar = ActionResults.getActionResults(session);
	Hashtable h = ar.getHashtable("tub");
%>

<!--- couldn't the following be put in an header file?! -->
<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
<link rel="stylesheet" href="/hr_si/themes/hr_si_evaluation.css" type="text/css"> <!--NN4 Compatible sheet -->
<style type="text/css">
@import url(/hr_si/themes/hr_si_evaluation.css); /*IE and NN6x styles*/
</style>

<%
	String regionID = (String) (h.get("regionID")==null?"":h.get("regionID"));
	String appType = (String) (h.get("appType")==null?"":h.get("appType"));
	if (appType.equals("R"))
		appType = "Ready";
	else if (appType.equals("I"))
		appType = "In Process";
	else if (appType.equals("S"))
		appType = "Started";
%>
<!-- 3-21-03 kl: added missing JavaScript functions --> 
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

<% String pageTitle = "Database Download"; %>

<%@ include file="/hr_si/evaluator/sitoolheader.jspf" %>
<!--<body BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#336699" VLINK="#336699" leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' ONLOAD="preloadImages();">
<CENTER>
<table WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>--><!-- Whole Page table -->
<!--	<TR>
		<TD>
-->		<!-- Header begin -->
<!--		<table WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
			<TR>
				<TD COLSPAN=8 ALIGN=RIGHT>
-->				<!-- other link text -->
<!--				<FONT FACE="Arial" SIZE="1" COLOR="#336699">
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
		</table>
			<P>
-->		<!-- Header end -->
		</TD>
	</TR>
	<TR>
<!--		 <TD BGCOLOR="#FFFFFF" ALIGN="LEFT" CELLSPACING="0">-->
		 <!--Start all table-->


<!--<table WIDTH='100%' BORDER='0' BGCOLOR='#336699' CELLSPACING='0' CELLPADDING='0'><TR><td align=left valign=top><img src='/images/box_tl.gif'></td><TD ALIGN='CENTER' HEIGHT=7 NOWRAP>
<FONT FACE="Arial" COLOR="#FFFFFF"><font size='2'><b><a href='SIController?action=goToPage&page=projecttool' class=headinggraphic><img src='/hr_si/images/banner1.gif'></a></b></font></font></TD><td align=right valign=top><img src='/images/box_tr.gif'></td></TR>
<tr><TD BGCOLOR='#CCCC99' colspan=3><table WIDTH='100%' CELLSPACING='0' CELLPADDING='5' BORDER='0'><TR><TD><FONT FACE="Arial" COLOR="#336699"><font size='1'>
-->
<body bgcolor="#cccc99" link="#006633" alink="#008833" vlink="#003333" text="#000000">

<p> <FONT FACE="Arial" SIZE="2" COLOR="#000000">


<table width="100%">
	<tr>
		<td align='center'>
			<H3>Database Download for the <%=appType%> Applications in <%=regionID%> Region</H3>
			<p>
			<b><A HREF="<%=h.get("filename")%>" target="_blank">Click here to get the Excel compatible file (CSV format).</A></b>
			<p>
			Click your browser's back button to return to the regional view.
			<p>
		</td>
		<td>
			&nbsp; &nbsp; &nbsp; 
		</td>
<%@ include file="sisidemenu.jspf"%>

<!--		<td align='center' valign='top' nowrap>
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
			</table>
			<FONT FACE="Arial" SIZE="3" COLOR="#000000"><b>Links</font></b><br>
			<table width='100%' border='1' bgcolor="#bbbb88" bordercolor="#bbbb88" BORDERCOLORLIGHT="#cccc99">
				<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></font></TD></tr>
				<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><A HREF="/servlet/CmsController?action=browse&catId=1000029" target='_blank'>Resource Center</a></font></TD></tr>
				<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
				<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
				<tr valign='top'><td colspan=2><FONT FACE="Arial" SIZE="2" COLOR="#000000"><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
			</table>
		</td>
-->	</tr>
</table>

<%@ include file="sitoolfooter.jspf" %>

</HTML>
<%
	} catch (Exception e) {
		System.err.println(e);
		e.printStackTrace();
	}
%>
