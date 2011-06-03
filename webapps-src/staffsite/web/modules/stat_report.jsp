<%@ page import="org.alt60m.servlet.*, org.alt60m.ministry.model.dbio.ReportRow, java.util.*, java.sql.*, java.text.*" %>
<%@page import="org.alt60m.util.DateUtils"%>
<%@page import="org.alt60m.ministry.Strategy"%>


<%@ include file="/modules/layout/header.jspf"%>

<%

	Log log = LogFactory.getLog("org.alt60m.infobase.jsp.report_display_agile");
	Boolean isEvent=false;
	String region=ar.getValue("region");
	String longRegion=Regions.expandRegion(region);
	String periodBegin=ar.getValue("periodBegin");
	String periodEnd=ar.getValue("periodEnd");
	String strategyList=ar.getValue("strategyList");
	String[] displayList=strategyList.replace("'","").split(",");
	
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
	<%if (row.getFunction().equals("end")||row.getFunction().equals("detail")){
		
	}else{
	%><div class="regular"><%}%>
	<%if((row.getFunction().equals("top"))||(row.getFunction().equals("bottom"))){ %>
		<table class="row"><tr>
			<%
			if((row.getFunction().equals("top"))&&!newEventType){ 
				%>
				<td>&nbsp;</td></tr><tr>
				<%
			}
			else
			{
				newEventType=false;
			} 
			%>
		
		<%if(type.equals("national")){ %>
		<td class="report_header_label" ><center> Region</center></td>
		<%}
		else if(type.equals("targetarea")){
			String inactiveNote="";
			if((row.getStatus().equals("IN"))&&(row.getEventType().equals("Campus"))){
			inactiveNote="&nbsp;<i>(Inactive)</i>";
			}
			String teamNote="";
			if(!ar.getValue("teamID").equals("")&&!ar.getValue("teamID").equals(row.getLocalLevelId())){
				LocalLevel otherTeam=new LocalLevel(row.getLocalLevelId());
				teamNote="<br><font color=\"red\">(Belongs to another Team: "+otherTeam.getName()+")</font>";
			}
		%>
		<td class="report_header_label" ><center> <%=row.getCampusName()+" - "+org.alt60m.ministry.Strategy.expandStrategy(row.getStrategy())+inactiveNote+teamNote %></center></td>
		<%}else if(type.equals("regional")&&!isEvent){%>
		<td class="report_header_label" > <center>Team - <i>Ministry</i></center></td>
		<%}else if(type.equals("regional")&&isEvent){%>
		<td class="report_header_label" > <center>Event  - <i>Ministry</i></center></td>
		<%}else{ %>
		<td class="report_header_label" > <center>Ministry Location - Ministry (enrollment)</center></td>
		<%} %>
		
		<td class="report_header_double" ><center>Personal Evangelism <ul class="micro"><li>Exp.</li><li> Dec.</li></ul></center></td>
		<td class="report_header_double" ><center>Group Evangelism<ul class="micro"><li>Exp.</li><li> Dec.</li></ul></center></td>
		<td class="report_header_double" ><center>Media Exposures<ul class="micro"><li>Exp.</li><li> Dec.</li></ul></center></td>
		<%
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
		%>
		<td class="report_header"  ><i>Decisions <br>Before 8/1/2008</i></td>
		<%} %>
		<td class="report_header_double" ><center><%=!isEvent? "Sending":""%>
			<ul class="micro"><li>Holy Spirit Pres.</li><li><%=isEvent?"Dollars Raised": "Laborers Sent"%></li></ul>
</center></td>
		<td class="report_header<%=!isEvent?((((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"_quadruple":"_triple"):((((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
						"_double":"") %>" ><center><%=!isEvent? "Demographics":""%>
		<ul class="micro"><li>Students Involved</li><%if(!isEvent){ %><li>Multipliers</li><li>Student Leaders</li><%} %>
		       <%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"<li>Seekers (Bridges)</li>":"" %>
		</li></ul></center></td>
		
		
		</tr></table>
		
		
		<%if(row.getFunction().equals("bottom")){ //show totals%>
			<table class="row"><tr>
	
			
			<td class="report_header_label"><center> Totals </center></td>
			
			
			<td class="report_header"><%=display?row.getEvangelisticOneOnOne():"" %></td>
			<td class="report_header"><%=display?row.getDecisionsPersonalEvangelismExposures():"" %></td>
			<td class="report_header"><%=display?row.getEvangelisticGroup():""%></td>
			<td class="report_header"><%=display?row.getDecisionsGroupEvangelismExposures():"" %></td>
			<td class="report_header"><%=display?row.getExposuresViaMedia():"" %></td>
			<td class="report_header"><%=display?row.getDecisionsMediaExposures():"" %></td>
			<%
			if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
			%>
			<td class="report_header"  ><i><%=display?row.getDecisions():"" %></i></td>
			<%} %>
			<td class="report_header"><%=display?row.getHolySpirit():"" %></td>
			<td class="report_header"><%=display?(isEvent?row.getDollarsRaised(): row.getLaborersSent()):"" %></td>
			<td class="report_header"><%=display?row.getInvldStudents():"" %></td>
			<%if(!isEvent){ %>
			<td class="report_header"><%=display?row.getMultipliers():"" %></td>
			<td class="report_header"><%=display?row.getStudentLeaders():"" %></td>
			<%} %>
			<%if(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR"))){ %>
			<td class="report_header"><i><%=display?row.getSeekers():"" %></i></td>
			<%display=!row.getFunction().equals("start"); // return to standard display %>
			<%} %>
			
			</tr>
			
			
			</tr></table>
			
		<%} %>
	<%	} 
	else if (row.getFunction().equals("eventBlockTop")){
		isEvent=("Conferences Summer Projects").contains(row.getLabel());%>
		<table class="event_block_<%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"bridges":"non_bridges" %>">
		<tr><td >&nbsp;</td></tr>
		</table>
	<% newEventType=true;}
	else if (row.getFunction().equals("eventBlockBottom")){%>
	<table class="event_block_<%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"bridges":"non_bridges" %>">
</table>
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
	if(type.equals("targetarea") || type.equals("national") || row.getFunction().equals("detail")) {%>
		<table class="row_short"><tr>
	<%}
	else
	{%>
		<table class="row"><tr>
	<%}
	%>

	
	
	<td class="label">
	<%if(!row.getFunction().equals("detail")){ %>
		<%if (!type.equals("targetarea")&& ar.getValue("teamID") != null && !ar.getValue("teamID").equals("") && !ar.getValue"teamID".equals(" ")){%>
		<a  href="Report?action=statReport&type=<%
			if(type.equals("national")){out.print("regional");}
			else if (type.equals("regional")&&!isEvent){out.print("locallevel");}
			else {out.print("targetarea");}
			if (row.getLocalLevelID() == null) {	int tempteamID = 0;}
			else {tempteamID = row.getLocalLevelID();}
			%>
			&frommonth=<%=ar.getValue("frommonth")%>
			&fromyear=<%=ar.getValue("fromyear")%>
			&tomonth=<%=ar.getValue("tomonth")%>
			&toyear=<%=ar.getValue("toyear")%>
			&targetareaid=<%=row.getTargetAreaID()%>
			&teamID=<%=tempteamID%>
			&strategyList=<%=ar.getValue("strategyList") %>
			&region=<%=row.getRegion() %>
			"> <%} %>
		<%=row.getLabel().equals("")?"Not Specified": row.getLabel()%><%if (!type.equals("targetarea")){%></a><%} %>&nbsp;
			<%if((row.getStatus().equals("IN"))&&(row.getEventType().equals("Campus"))&&type.equals("locallevel")){%>
			<i>(Inactive)</i>
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
		else if(row.getStrategy().equals("BR")){out.print("No Specific People Group Listed");}
		}
	%>
	</td>
	
	
	<td class="report_light"><%=display?row.getEvangelisticOneOnOne():"" %></td>
	<td class="report_darker"><%=display?row.getDecisionsPersonalEvangelismExposures():"" %></td>
	<td class="report_light"><%=display?row.getEvangelisticGroup():""%></td>
	<td class="report_darker"><%=display?row.getDecisionsGroupEvangelismExposures():"" %></td>
	<td class="report_light"><%=display?row.getExposuresViaMedia():"" %></td>
	<td class="report_darker"><%=display?row.getDecisionsMediaExposures():"" %></td>
	<%
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
		%>
		<td class="report_light"  ><i><%=display?row.getDecisions():"" %></i></td>
		<%} %>
	<td class="report_light"><%=display?row.getHolySpirit():"" %></td>
	<td class="report_darker"><%=display?(isEvent?row.getDollarsRaised(): row.getLaborersSent()):"" %></td>
	<td class="report_light"><%=display?row.getInvldStudents():"" %></td>
<%if(!isEvent){ %>
	<td class="report_darker"><%=display?row.getMultipliers():"" %></td>
	<td class="report_light"><%=display?row.getStudentLeaders():"" %></td>
<%} %>
	<%if(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR"))){ %>
	<%display=(display)&&((row.getStrategy().equals("BR"))||(ar.getValue("type").equals("national"))); //only display if Bridges %>
	<td class="report_darker"><i><%=display?row.getSeekers():"" %></i></td>
	<%display=!row.getFunction().equals("start"); // return to standard display %>
	<%} %>
	
	
	</tr></table>
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
	if (row.getFunction().equals("start")||row.getFunction().equals("detail")){
		
	}else{
	%></div><%}
}

%>
<%if (type.equals("targetarea")&&!ar.getValue("teamID").equals("")){%>
<A href="Report?action=statReport&type=locallevel
			&frommonth=<%=ar.getValue("frommonth")%>
			&fromyear=<%=ar.getValue("fromyear")%>
			&tomonth=<%=ar.getValue("tomonth")%>
			&toyear=<%=ar.getValue("toyear")%>
			&targetareaid=
			&teamID=<%=ar.getValue("teamID") %>
			&strategyList=<%=ar.getValue("strategyList") %>
			&region=<%=region %>
			">
		[Zoom Out to Team]</A>
<%} %>
<%if (type.equals("locallevel")||type.equals("targetarea")){%>
<br>
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
int wide=935;
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
			wide+=59;}
		if(strategyList.contains("BR")){
			wide+=79;}
		%>
<style type="text/css" >
div#wrapper
{

width:<%=wide%>px;
}
div#innerwrapper
{

width:<%=wide%>px;
}
div#content
{

width:<%=wide%>px;
}
div#innercontent
{

width:<%=wide%>px;
}
</style>


<%@ include file="/modules/layout/footer.jspf"%>

