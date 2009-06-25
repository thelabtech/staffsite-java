<%@ page import="org.alt60m.servlet.*,  java.util.*, java.sql.*" %>
<%@page import="org.alt60m.util.DateUtils"%>
<%@page import="org.alt60m.ministry.servlet.UnlockCampus"%>
<%@ include file="/modules/header.jspf"%>
<%

	Log log = LogFactory.getLog("org.alt60m.infobase.jsp.muster");
	Vector<String> keys=UnlockCampus.keys((String)(ActionResults.getActionResults(session).getValue("userName")));
	String strategyList=ar.getValue("strategyList");
	String[] displayList=strategyList.replace("'","").replace(" ","").split(",");
	
	String reportTitle ="";
	String region=ar.getValue("region");
	String type=ar.getValue("type");
	String report=ar.getValue("report");
	if(type.equals("movement")){
		reportTitle="Count of Movements";
	}
	else if(type.equals("location")){
		reportTitle="Count of Ministry Locations";
	}
	else if(type.equals("teamorg")){
		reportTitle="Count of Missional Teams Coached by "+region;
	}
	else if(type.equals("teamgeo")){
		reportTitle="Count of Missional Teams With Movements in "+org.alt60m.ministry.Regions.expandRegion(region);
	}
	else
	{
		reportTitle="Campus Ministry Tracker";
	}
	
	
	%>
<%@page import="org.alt60m.ministry.Strategy"%>
<%@page import="org.apache.commons.logging.Log"%>
<%@page import="org.apache.commons.logging.LogFactory"%>



<!--% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yy"); %-->


<div id="muster_report">
	<p >
	<B><%= reportTitle %></b><BR>	
	Including strategies: <%
	for(int i = 0; i<displayList.length; i++){
        out.print(Strategy.expandStrategy(displayList[i]));
        if(i<(displayList.length-1)) out.print(", ");
	}%><br>
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
%></p>
<table id="muster_report">

<%
out.print(report);
%>

</table>
</div>

<%if(type.equals("movement")){%>
<style type="text/css">
div#muster_report  td.label_darker_blue
{
width:352px;
}
</style>
<%} %>
<%@ include file="/modules/footer.jspf"%>

