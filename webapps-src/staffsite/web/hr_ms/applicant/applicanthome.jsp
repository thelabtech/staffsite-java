




<html>
<head>
<title>Mobilizing System Error Page</title>
<link rel="stylesheet" href="/hr_ms/themes/ussp.css" type="text/css"> <!--NN4 Compatible sheet -->
<style type="text/css"> 
@import url(/hr_ms/themes/ussp.css); /*IE and NN6x styles*/
</style><SCRIPT LANGUAGE="JavaScript">
<!--
	function Highlight(e){
		if(e.className == "required" || e.className == "reqfilled"){
			e.className = "reqactive";
		} else{
			e.className = "active";
		}
	}

	function UnHighlight(e){
		if(e.className == "reqactive"){
			e.className = e.value ? "reqfilled" : "required";
		} else if(e.className == "required"){
			e.className = e.value ? "reqfilled" : "required";
		} else
			e.className = "empty";
	}

	function UnHighlightAll(){
		for(var x = 0; x < document.forms.length; x++)
			for(var y = 0; y < document.forms[x].elements.length; y++){
				UnHighlight(document.forms[x].elements[y]);
		}
	}

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

function init(){
	UnHighlightAll();
	preloadImages();
}
// -->
</SCRIPT>
<META HTTP-EQUIV="CacheControl" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
</HEAD>
<BODY onLoad="init()">
<CENTER>
	<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<tr>
			<td class="header"><!--<a href="http://www.apply4summerproject.com">--><img src="/hr_ms/images/pageheader.gif" border="0"><!--</a>--></td>
		</tr>
	</table><br /><br />
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0><!-- Whole Page table -->
	<TR>
		 <TD BGCOLOR="#FFFFFF" ALIGN="LEFT" CELLSPACING="0">
		 <!--Start all table-->


dddddd
<div align="center" CLASS="small">
<i>© 2002 Campus Crusade for Christ International
</i><br>
</div>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>