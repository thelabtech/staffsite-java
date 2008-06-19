<%@ page import="org.alt60m.servlet.*, org.alt60m.ministry.model.dbio.ReportRow, java.util.*, java.sql.*" %>
<%@page import="org.alt60m.util.DateUtils"%>

<%
ActionResults ar;
ar = ActionResults.getActionResults(session);
	Log log = LogFactory.getLog("org.alt60m.infobase.jsp.report_display_agile");
	
	String periodBegin=ar.getValue("periodBegin");
	String periodEnd=ar.getValue("periodEnd");
	String strategyList=ar.getValue("strategyList");
	String[] displayList=strategyList.replace("'","").split(",");
	String pageTitle="Success Criteria Reports";
	String reportTitle ="";
	String type=ar.getValue("type");
	if(type.equals("custom")){
		reportTitle="Success Criteria Custom Report";
	}
	else if(type.equals("locallevel")){
		reportTitle="Success Criteria Missional Team Report";
	}
	else if(!type.equals("targetarea")){
		reportTitle="Success Criteria "+ar.getValue("type").substring(0,1).toUpperCase()+ar.getValue("type").substring(1).toLowerCase()+" Report";
	}
	else
	{
		reportTitle="Success Criteria Ministry Location Report";
	}
	
	Iterator report= ((Vector<ReportRow>) ar.getCollection("report")).iterator();
	
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
<%@ include file="./reports.css"%>
</style>
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
<%@ include file="/infobase/ibheaderwide.jspf" %>
<TABLE width="100%">
	<TR>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Success Criteria Reports</a></font></TD>
	</TR>
</TABLE>

	<p style="margin-left:20px;">
	<br>
	<%=fontB3%><B><%= reportTitle %></b></font><BR>
	<%=fontB%>
	For dates: <%=periodBegin%> to <%=periodEnd%><br>
	Including strategies: <%
		
	for(int i = 0; i<displayList.length; i++){
        out.print(Strategy.expandStrategy(displayList[i]));
        if(i<(displayList.length-1)) out.print(", ");
	}
		
if (ar.getCollection("report").size()>0){	%>	
		<br>
	<%if(!(ar.getHashtable("census")==null))
			{
		out.print(ar.getHashtable("census").get("movements")+" Active, Launched or Transformational Movements, "+ar.getHashtable("census").get("enrollment")+" Enrollment (as of today)");
		out.print("<br><i>(Note: not all of the movements shown below are necessarily included in this count, and vice versa. Only movements with stats are listed below.)</i>");
			}%>
	
	</font></p>
	
<center>
<table class="report">
<tr><td >


<%
boolean display=true;
boolean alternate=true;
boolean lighter=true;
String cell="light";
String cellAlt="dark";

while(report.hasNext()){
	ReportRow row=(ReportRow)report.next();%>
	
	<%if((row.getFunction().equals("top"))||(row.getFunction().equals("bottom"))){ %>
		<table class="row">
		<tr>
		<td class="label_darker_blue" > &nbsp;</td>
		
		<td class="report_light_blue" style="width:140px"><center>Personal Evangelism </center></td>
		<td class="report_darker_blue" style="width:140px"><center>Group Evangelism</center></td>
		<td class="report_light_blue" style="width:140px"><center>Media Exposures</center></td>
		<%
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
		%>
		<td class="report_Verydark_blue" >&nbsp;</td>
		<%} %>
		<td class="report_darker_blue" style="width:140px"><center>Sending</center></td>
		<td class="report_light_blue" <%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"style=\"width:280px\"":"style=\"width:210px\"" %>><center>Demographics</center></td>
		
		</tr>
		</table>
		<table class="row">
		<tr>
		<%if(type.equals("national")){ %>
		<td class="label_darker_blue" ><center> Region</center></td>
		<%}
		else if(type.equals("targetarea")){%>
		<td class="label_darker_blue" ><center> <%=row.getCampusName()+" - "+org.alt60m.ministry.Strategy.expandStrategy(row.getStrategy()) %></center></td>
		<%}else{ %>
		<td class="label_darker_blue" > <center>Campus - Strategy (enrollment)</center></td>
		<%} %>
		<td class="report_light_blue" >Exp.</td>
		<td class="report_light_blue" >Dec. <%=row.getFunction().equals("top")? "(Starting 8/1/2008)":""%></td>
		<td class="report_darker_blue" >Exp.</td>
		<td class="report_darker_blue" >Dec. <%=row.getFunction().equals("top")? "(Starting 8/1/2008)":""%></td>
		<td class="report_light_blue" >Exp.</td>
		<td class="report_light_blue" >Dec. <%=row.getFunction().equals("top")? "(Starting 8/1/2008)":""%></td>
		<%
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
		%>
		<td class="report_Verydark_blue">Lump Decisions <%=row.getFunction().equals("top")? "(Before 8/1/2008)":""%></td>
		<%} %>
		<td class="report_darker_blue" >Holy Spirit Pres. <%=row.getFunction().equals("top")? "(Starting 8/1/2008)":""%> </td>
		<td class="report_darker_blue" >Laborers Sent</td>
		<td class="report_light_blue" > Multipliers </td>
		<td class="report_light_blue" >Student Leaders</td>
		<td class="report_light_blue" > Students Involved</td>
		<%=(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR")))?
				"<td class=\"report_light_blue\" > Seekers (Bridges) </td>":"" %>
		</tr>
		</table>
		
		<%if(row.getFunction().equals("bottom")){ //show totals%>
			<table class="row">
	
			<tr >
			<td class="label_darker_blue">Totals &nbsp;</td>
			
			
			<td class="report_light_blue"><%=display?row.getEvangelisticOneOnOne():"" %></td>
			<td class="report_light_blue"><%=display?row.getDecisionsPersonalEvangelismExposures():"" %></td>
			<td class="report_darker_blue"><%=display?row.getEvangelisticGroup():""%></td>
			<td class="report_darker_blue"><%=display?row.getDecisionsGroupEvangelismExposures():"" %></td>
			<td class="report_light_blue"><%=display?row.getExposuresViaMedia():"" %></td>
			<td class="report_light_blue"><%=display?row.getDecisionsMediaExposures():"" %></td>
			<%
			if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
			%>
			<td class="report_Verydark_blue"  ><%=display?row.getDecisions():"" %></td>
			<%} %>
			<td class="report_darker_blue"><%=display?row.getHolySpirit():"" %></td>
			<td class="report_darker_blue"><%=display?row.getLaborersSent():"" %></td>
			<td class="report_light_blue"><%=display?row.getInvldStudents():"" %></td>
			<td class="report_light_blue"><%=display?row.getMultipliers():"" %></td>
			<td class="report_light_blue"><%=display?row.getStudentLeaders():"" %></td>
			<%if(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR"))){ %>
			<td class="report_light_blue"><i><%=display?row.getSeekers():"" %></i></td>
			<%display=!row.getFunction().equals("start"); // return to standard display %>
			<%} %>
			
			</tr>
			
			<tr><td style="background-color:none;">&nbsp;</td></tr>
			</table>
			
		<%} %>
	<%	} else	{//display data rows%>
	
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
	<%} %>
		
	<table class="row">
	
	<tr >
	<%
	if(lighter){
		cell="light";
		cellAlt="darker";
	}
	else
	{
		cell="darker";
		cellAlt="veryDark";
	}
	%>
	<td class="label_<%=cell %>">
	<%if(!row.getFunction().equals("detail")){ %>
		<%if (!type.equals("targetarea")){%>
		<A href="InfoBaseController?action=showReportAgile&type=<%
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
		<%=row.getLabel() %><%if (!type.equals("targetarea")){%></A><%} %>&nbsp;
			<%if(row.getStatus().equals("IN")){%>
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
	</td>
	
	
	<td class="report_<%=cellAlt %>"><%=display?row.getEvangelisticOneOnOne():"" %></td>
	<td class="report_<%=cell %>"><%=display?row.getDecisionsPersonalEvangelismExposures():"" %></td>
	<td class="report_<%=cellAlt %>"><%=display?row.getEvangelisticGroup():""%></td>
	<td class="report_<%=cell %>"><%=display?row.getDecisionsGroupEvangelismExposures():"" %></td>
	<td class="report_<%=cellAlt %>"><%=display?row.getExposuresViaMedia():"" %></td>
	<td class="report_<%=cell %>"><%=display?row.getDecisionsMediaExposures():"" %></td>
	<%
		if(DateUtils.parseDate(periodBegin).before(DateUtils.parseDate("8/1/2008"))){
		%>
		<td class="report_light" style="background-color:<%=lighter?"#dddddd":"#cccccc" %>" ><i><%=display?row.getDecisions():"" %></i></td>
		<%} %>
	<td class="report_<%=cellAlt %>"><%=display?row.getHolySpirit():"" %></td>
	<td class="report_<%=cell %>"><%=display?row.getLaborersSent():"" %></td>
	<td class="report_<%=cellAlt %>"><%=display?row.getInvldStudents():"" %></td>
	<td class="report_<%=cell %>"><%=display?row.getMultipliers():"" %></td>
	<td class="report_<%=cellAlt %>"><%=display?row.getStudentLeaders():"" %></td>
	<%if(((!type.equals("targetarea"))&&strategyList.contains("BR"))||(type.equals("targetarea"))&&(row.getStrategy().equals("BR"))){ %>
	<%display=(display)&&((row.getStrategy().equals("BR"))||(ar.getValue("type").equals("national"))); //only display if Bridges %>
	<td class="report_<%=cell %>"><i><%=display?row.getSeekers():"" %></i></td>
	<%display=!row.getFunction().equals("start"); // return to standard display %>
	<%} %>
	
	</tr>
	</table>
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
</td></tr>

</table>
<%if (type.equals("targetarea")){%>
<A href="InfoBaseController?action=showReportAgile&type=regional
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
<A href="InfoBaseController?action=showReportAgile&type=national
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
	<p style="text-align:center"> no stats recorded for requested scope</p>
	<%
}
%>
</center>
		
		
	


<%@ include file="/infobase/ibfooter.jspf" %>
</html>

