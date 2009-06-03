<%@ page import="org.alt60m.servlet.*, org.alt60m.ministry.model.dbio.ReportRow, java.util.*, java.sql.*, java.text.*" %>
<%@page import="org.alt60m.util.DateUtils"%>
<%@page import="org.alt60m.ministry.Strategy"%>


<%@ include file="/modules/header.jspf"%>

<%

	Log log = LogFactory.getLog("org.alt60m.infobase.jsp.report_display_agile");
	
	String region=ar.getValue("region");
	String longRegion=Regions.expandRegion(region);
	String periodBegin=ar.getValue("periodBegin");
	String periodEnd=ar.getValue("periodEnd");
	String strategyList=ar.getValue("strategyList");
	String[] displayList=strategyList.replace("'","").split(",");
	String pageTitle="Success Criteria Reports";
	String reportTitle ="";
	String type=ar.getValue("type");
	if(type.equals("custom")){
		reportTitle="Custom Report";
	}
	else if(type.equals("locallevel")){
		reportTitle="Missional Team Report: "+ new org.alt60m.ministry.model.dbio.LocalLevel(ar.getValue("teamID")).getName();
	}
	else if(type.equals("national")){
		reportTitle="National Report";
	}
	else if(type.equals("regional")){
		reportTitle="Regional Report: "+longRegion;
	}
	else
	{
		reportTitle="Ministry Location Report";
	}
	
	Iterator report= ((Vector<ReportRow>) ar.getCollection("report")).iterator();
	
	
	%>
<%@page import="org.alt60m.ministry.Strategy"%>
<%@page import="org.apache.commons.logging.Log"%>
<%@page import="org.apache.commons.logging.LogFactory"%>
<%@page import="org.alt60m.ministry.Regions"%>



<script type="text/javascript" language="javascript">
function toggle(x)
{

document.getElementById("start_"+x).style.display="block";
document.getElementById("end_"+x).style.display="none";
}
function untoggle(x)
{
document.getElementById("start_"+x).style.display="none";
document.getElementById("end_"+x).style.display="block";
}
</script>
<ul width="100%">
	<TR>
		<li align=right><a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Success Criteria Reports</a></font></li>
	</TR>
</ul>
<div id="stat_report">
	<p class="report_top">
	<br>
	<B><%= reportTitle %></b></font><BR>
	
	For dates: <%=periodBegin%> up to but not including <%=periodEnd%><br>
	Including strategies: <%
		
	for(int i = 0; i<displayList.length; i++){
		if (!"CM C2 SP".contains(displayList[i])){
        out.print(Strategy.expandStrategy(displayList[i]));
        if(i<(displayList.length-1)) out.print(", ");
		}
	}
		
if (ar.getCollection("report").size()>0){	%>	
	
	



<%
boolean display=true;
boolean alternate=true;
boolean lighter=true;
boolean newEventType=false;
String cell="light";
String cellAlt="dark";

while(report.hasNext()){
	ReportRow row=(ReportRow)report.next();%>
	
	<%if((row.getFunction().equals("top"))||(row.getFunction().equals("bottom"))){ %>
		<div class="regular"><ul class="row">
			<%
			if((row.getFunction().equals("top"))&&!newEventType){ 
				%>
				<tr><li>&nbsp;</li></tr>
				<%
			}
			else
			{
				newEventType=false;
			} 
			%>
		
		<%if(type.equals("national")){ %>
		<li class="report_header_label" ><center> Region</center></li>
		<%}
		else if(type.equals("targetarea")){%>
		<li class="report_header_label" ><center> <%=row.getCampusName()+" - "+org.alt60m.ministry.Strategy.expandStrategy(row.getStrategy()) %></center></li>
		<%}else{ %>
		<li class="report_header_label" > <center>Ministry Location - Strategy (enrollment)</center></li>
		<%} %>
		
		<li class="report_header_double" ><center>Personal Evangelism <ul class="micro"><li>Exp.</li><li> Dec.</li></ul></center></li>
		<li class="report_header_double" ><center>Group Evangelism<ul class="micro"><li>Exp.</li><li> Dec.</li></ul></center></li>
		<li class="report_header_double" ><center>Media Exposures<ul class="micro"><li>Exp.</li><li> Dec.</li></ul></center></li>
		<%
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
		%>
		<li class="report_header"  ><i>Decisions <br>Before 8/1/2008</i></li>
		<%} %>
		<li class="report_header_double" ><center>Sending
			<ul class="micro"><li>Holy Spirit Pres.</li><li>Laborers Sent</li>  </ul>
</center></li>
		<li class="report_header_<%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"quadruple":"triple" %>" ><center>Demographics
		<ul class="micro"><li>Students Involved</li><li>Multipliers</li><li>Student Leaders</li>
		       <%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"<li>Seekers (Bridges)</li>":"" %>
		</ul></center></li>
		
		
		</ul></div>
		
		
		<%if(row.getFunction().equals("bottom")){ //show totals%>
			<div class="regular"><ul class="row">
	
			
			<li class="report_header_label"><center> Totals </center></li>
			
			
			<li class="report_header"><%=display?row.getEvangelisticOneOnOne():"" %></li>
			<li class="report_header"><%=display?row.getDecisionsPersonalEvangelismExposures():"" %></li>
			<li class="report_header"><%=display?row.getEvangelisticGroup():""%></li>
			<li class="report_header"><%=display?row.getDecisionsGroupEvangelismExposures():"" %></li>
			<li class="report_header"><%=display?row.getExposuresViaMedia():"" %></li>
			<li class="report_header"><%=display?row.getDecisionsMediaExposures():"" %></li>
			<%
			if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
			%>
			<li class="report_header"  ><i><%=display?row.getDecisions():"" %></i></li>
			<%} %>
			<li class="report_header"><%=display?row.getHolySpirit():"" %></li>
			<li class="report_header"><%=display?row.getLaborersSent():"" %></li>
			<li class="report_header"><%=display?row.getInvldStudents():"" %></li>
			<li class="report_header"><%=display?row.getMultipliers():"" %></li>
			<li class="report_header"><%=display?row.getStudentLeaders():"" %></li>
			<%if(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR"))){ %>
			<li class="report_header"><i><%=display?row.getSeekers():"" %></i></li>
			<%display=!row.getFunction().equals("start"); // return to standard display %>
			<%} %>
			
			</tr>
			
			
			</ul></div>
			
		<%} %>
	<%	} 
	else if (row.getFunction().equals("eventBlockTop")){%>
		<div class="regular"><ul class="event_block_<%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"bridges":"non_bridges" %>">
		<li >&nbsp;</li>
		<li class="event_block" >Begin <%=row.getLabel()%> Report</li>
		</ul></div>
	<% newEventType=true;}
	else if (row.getFunction().equals("eventBlockBottom")){%>
	<div class="regular"><ul class="event_block_<%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"bridges":"non_bridges" %>">
<li class="event_block" >End <%=row.getLabel()%> Report</li>
	</ul></div>
<%}
	
	else	{//display data rows%>
	
	<%
	display=!row.getFunction().equals("start"); //boolean assignment: show stats if not a split-stat start row
	if (row.getFunction().equals("start")){
		alternate=false;
	%>
	<div id="<%=row.getFunction()+"_"+row.getRowGroup() %>" class="bridges_split" >
	<%} else if (row.getFunction().equals("end")){
	%>
	</div>
	<div id="<%=row.getFunction()+"_"+row.getRowGroup() %>" class="bridges_sum" >
	<%}	%>
	
	
	<%
	if(lighter){%>
		<ul class="row_lighter">
	<%}
	else
	{%>
		<ul class="row">
	<%}
	%>

	
	
	<li class="label">
	<%if(!row.getFunction().equals("detail")){ %>
		<%if (!type.equals("targetarea")){%>
		<A  href="Report?action=statReport&type=<%
			if(type.equals("national")){out.print("regional");}
			else {out.print("targetarea");}
			%>
			&frommonth=<%=ar.getValue("frommonth")%>
			&fromyear=<%=ar.getValue("fromyear")%>
			&tomonth=<%=ar.getValue("tomonth")%>
			&toyear=<%=ar.getValue("toyear")%>
			&targetareaid=<%=row.getTargetAreaID()%>
			&teamID=<%=row.getLocalLevelId()%>
			&strategyList=<%=ar.getValue("strategyList") %>
			&region=<%=row.getRegion() %>
			"> <%} %>
		<%=row.getLabel().equals("")?"Not Specified": row.getLabel()%><%if (!type.equals("targetarea")){%></A><%} %>&nbsp;
			<%if((row.getStatus().equals("IN"))&&(row.getEventType().equals("Campus"))){%>
			(active starting <%=row.getActivityPeriodBegin() %>)
			<%} %>
	<%} %>
	
	<%
	if (row.getFunction().equals("end")){ %><A href="javascript:toggle('<%=row.getRowGroup() %>');">(+)</A><%}
	else if (row.getFunction().equals("start")){ %><A href="javascript:untoggle('<%=row.getRowGroup() %>');">(-)</A>
			
			<%} 
	%>
	<%
	if (row.getFunction().equals("detail")){
		if((row.getPeopleGroup()!=null)&&(!row.getPeopleGroup().equals("null"))){
					out.print(row.getPeopleGroup());
					}
		else if(row.getStrategy().equals("BR")){out.print("stats prior to 4/23/2008");}
		}
	%>
	</li>
	
	
	<li class="report_light"><%=display?row.getEvangelisticOneOnOne():"" %></li>
	<li class="report_darker"><%=display?row.getDecisionsPersonalEvangelismExposures():"" %></li>
	<li class="report_light"><%=display?row.getEvangelisticGroup():""%></li>
	<li class="report_darker"><%=display?row.getDecisionsGroupEvangelismExposures():"" %></li>
	<li class="report_light"><%=display?row.getExposuresViaMedia():"" %></li>
	<li class="report_darker"><%=display?row.getDecisionsMediaExposures():"" %></li>
	<%
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
		%>
		<li class="report_light"  ><i><%=display?row.getDecisions():"" %></i></li>
		<%} %>
	<li class="report_light"><%=display?row.getHolySpirit():"" %></li>
	<li class="report_darker"><%=display?row.getLaborersSent():"" %></li>
	<li class="report_light"><%=display?row.getInvldStudents():"" %></li>
	<li class="report_darker"><%=display?row.getMultipliers():"" %></li>
	<li class="report_light"><%=display?row.getStudentLeaders():"" %></li>
	<%if(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR"))){ %>
	<%display=(display)&&((row.getStrategy().equals("BR"))||(ar.getValue("type").equals("national"))); //only display if Bridges %>
	<li class="report_darker"><i><%=display?row.getSeekers():"" %></i></li>
	<%display=!row.getFunction().equals("start"); // return to standard display %>
	<%} %>
	
	
	</ul>
	<%if (row.getFunction().equals("end")){
		alternate=true;
	%>
	</div>
	
	<%
	
	} %>
	<%
	if(alternate){
		lighter=!lighter;
	}
	}//end topper/data conditional test
	
}

%>

<%if (type.equals("targetarea")){%>
<A href="Report?action=statReport&type=regional
			&frommonth=<%=ar.getValue("frommonth")%>
			&fromyear=<%=ar.getValue("fromyear")%>
			&tomonth=<%=ar.getValue("tomonth")%>
			&toyear=<%=ar.getValue("toyear")%>
			&targetareaid=
			&teamID=
			&strategyList=<%=ar.getValue("strategyList") %>
			&region=<%=region %>
			">
		[Zoom Out to Regional]</A>
<%} %>
<%if (!type.equals("national")){%>
<br>
<A href="Report?action=statReport&type=national
			&frommonth=<%=ar.getValue("frommonth")%>
			&fromyear=<%=ar.getValue("fromyear")%>
			&tomonth=<%=ar.getValue("tomonth")%>
			&toyear=<%=ar.getValue("toyear")%>
			&targetareaid=
			&teamID=
			&strategyList=<%=ar.getValue("strategyList") %>
			&region=
			">
		[Zoom Out to National]</A>
<%} 
}
else
{%>
	<p class="report_top"> no stats recorded for requested scope</p>
	<%
}
%>
</center>
	</div>	
		
	
<%
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
		%>
<style type="text/css" >
div#panel_main
{

width:1060px;
}
div#total
{

width:1060px;
}
ul.event_block_bridges
{
	width:1032px;

}
ul.event_block_non_bridges
{
	width:970px;

}
</style>
<%} %>

<%@ include file="/modules/footer.jspf"%>

