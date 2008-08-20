<%@ page import="org.alt60m.servlet.*,  java.util.*, java.sql.*" %>
<%@page import="org.alt60m.util.DateUtils"%>
<%@page import="org.alt60m.ministry.servlet.UnlockCampus"%>
<%
ActionResults ar;
ar = ActionResults.getActionResults(session);
	Log log = LogFactory.getLog("org.alt60m.infobase.jsp.muster");
	Vector<String> keys=UnlockCampus.keys((String)(ActionResults.getActionResults(session).getValue("userName")));
	String strategyList=ar.getValue("strategyList");
	String[] displayList=strategyList.replace("'","").replace(" ","").split(",");
	String pageTitle="Ministry Rollcall";
	String reportTitle ="";
	String type=ar.getValue("type");
	String report=ar.getValue("report");
	if(type.equals("movement")){
		reportTitle="Movement Rollcall";
	}
	else if(type.equals("location")){
		reportTitle="Ministry Location Rollcall";
	}
	else if(type.equals("team")){
		reportTitle="Missional Team Rollcall";
	}
	else
	{
		reportTitle="Campus Ministry Rollcall";
	}
	
	String region=ar.getValue("region");
	%>
<%@page import="org.alt60m.ministry.Strategy"%>
<%@page import="org.apache.commons.logging.Log"%>
<%@page import="org.apache.commons.logging.LogFactory"%>
<html>
<head>

<title><%= pageTitle %></title>
<!--% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yy"); %-->
<style>
<%@ include file="./muster.css"%>
</style>

<%@ include file="/infobase/ibheader.jspf" %>


	<p style="margin-left:20px;">
	<br>
	<%=fontB3%><B><%= reportTitle %></b></font><BR>
	<%=fontB%>
	Including strategies: <%
		
	for(int i = 0; i<displayList.length; i++){
        out.print(Strategy.expandStrategy(displayList[i]));
        if(i<(displayList.length-1)) out.print(", ");
	}
		%><br>
	Sorted By:
<%

Hashtable translateSortOrder=new Hashtable();
		translateSortOrder.put("campus","Campus Name, ");
		translateSortOrder.put("city","City/State, ");
		translateSortOrder.put("team","Missional Team Name, ");
		translateSortOrder.put("region","Region, ");
		translateSortOrder.put("status","Status, ");
		translateSortOrder.put("strategy","Strategy, ");
String sort="";
for (String s:(Vector<String>)ar.getCollection("order")){
	sort+=translateSortOrder.keySet().contains(s)?translateSortOrder.get(s):"";
}
if(sort.length()>2){
	sort=sort.substring(0,sort.length()-2);
}
out.print(sort);
%>
	
	</font></p>
	
<center>
<table class="report">
<tr><td >
<%
out.print(report);
%>
</td></tr>
</table>
</center>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>

