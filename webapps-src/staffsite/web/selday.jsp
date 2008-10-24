<%@ page import="java.util.*, org.alt60m.html.*, java.text.*" %>
<jsp:useBean id="HtmlCal" scope="session" class="org.alt60m.html.HtmlCalendar" />
<%@ include file="/style.jspf"%>
<html>
<head>
</HEAD>
<title>Select a Day</title>

<SCRIPT LANGUAGE="JavaScript">
<!--
function selectdate(theDate) {
  opener.setdate(theDate);
  opener.theDateElement.blur();
  self.close();
  return false;
}
-->
</SCRIPT>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="<%=colorB%>" VLINK="<%=colorB%>" onUnload="opener.theDateElement.blur()">
<%
	//convert date string into date, figure out next month, last month, next year, last year
	Date theDate = new Date();
	String dateString = "";
	GregorianCalendar myCalendar = new GregorianCalendar();
	try {
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("MM/dd/yyyy");
		dateString = request.getParameter("date");
		theDate = format.parse(dateString);
	} catch (NullPointerException npe) {
		// leave the date as today
	} catch (ParseException pe) {
		// leave the date as today
	}

	myCalendar.setTime(theDate);
	
	myCalendar.add(Calendar.MONTH, -1);
	String lastMonth = (myCalendar.get(Calendar.MONTH)+1)+"/"+myCalendar.get(Calendar.DATE)+"/"+myCalendar.get(Calendar.YEAR);
	myCalendar.add(Calendar.MONTH, 2);
	String nextMonth = (myCalendar.get(Calendar.MONTH)+1)+"/"+myCalendar.get(Calendar.DATE)+"/"+myCalendar.get(Calendar.YEAR);
	myCalendar.add(Calendar.MONTH, -1);
	myCalendar.add(Calendar.YEAR, 1);
	String nextYear = (myCalendar.get(Calendar.MONTH)+1)+"/"+myCalendar.get(Calendar.DATE)+"/"+myCalendar.get(Calendar.YEAR);
	myCalendar.add(Calendar.YEAR, -2);
	String lastYear = (myCalendar.get(Calendar.MONTH)+1)+"/"+myCalendar.get(Calendar.DATE)+"/"+myCalendar.get(Calendar.YEAR);
	myCalendar.add(Calendar.YEAR, 1);
%>
<center>
<input type="hidden" name="ret">
<table border=0 cellspacing=2 cellpadding=2 <%=bgcolorW%>>
	<tr><td colspan=4 nowrap <%=bgcolorL%>>
		<%
			HtmlCal.setYear(myCalendar.get(Calendar.YEAR));
			HtmlCal.setJspPage("selday.jsp");
			HtmlCal.setMonth(myCalendar.get(Calendar.MONTH)+1);
			HtmlCal.setFont(font);
		%>
		<%=HtmlCal.getPickHtml()%> 
	</td></tr>
</table> 
</center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>