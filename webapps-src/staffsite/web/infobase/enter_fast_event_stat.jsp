<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%@ page import="org.alt60m.staffSite.bean.dbio.*,org.alt60m.staffSite.model.dbio.StaffSitePref" %>
<%
String pileUpSuccessCriteriaIds=""; 
String weekLink="";
java.text.SimpleDateFormat myDate = new java.text.SimpleDateFormat();
myDate.applyPattern("MM/dd/yyyy");
 
 	
ActionResults ar;
ActionResults mr;
Collection statistics;
Iterator slist ;
Iterator miniResultsCounter;
Integer counter=new Integer(0);
Integer tabIndex=new Integer(1);
Hashtable criteria;

String lastStatID;
String holdstring;
String uniqueStat;
String lastMovement="";
String movementColor="white";
String displayName="";
Boolean flipColor=true;
String thisOne;
String hoverHelpStyle="display:inline;border:none;margin:0px;padding:0px;padding-right:10px;background-color:white;text-align:right;";
String inputStyle="position:relative;z-index:1;width:50px;margin:0px;";
Boolean topRow=true;
Integer movements=0;
Integer errorJog=0;
Integer formHeight=0;
Integer specialHeight=0;
	
ar = ActionResults.getActionResults(session);
	
	
%>
<% String pageTitle=ar.getValue("name");%>

<%@page import="org.alt60m.ministry.model.dbio.Statistic"%><html>
<head>
<title><%= pageTitle %></title>
<META http-equiv="Content-Style-Type" content="text/css">
<script type="text/javascript" language="javascript">
var infoTimer;
var infoBoxEl;
function infoBox(mW,info)
{
document.getElementById(mW+'_info_box').innerHTML=document.getElementById(info+'_info_box').innerHTML;
infoBoxEl=document.getElementById(mW+'_info_box');
infoTimer=setTimeout("infoBoxEl.style.display='block';",200);
}

function infoBoxClear(mW)
{
clearTimeout(infoTimer);
document.getElementById(mW+'_info_box').style.display='none';
document.getElementById(mW+'_info_box').innerHTML='';
}
</script>
</head>
<%@ include file="/infobase/ibheader.jspf" %>
<%@ include file="/validate.js"%>
<div class="wrapper" id="wrapper">
<div style="position:absolute;width:890px;margin:auto;">
<style>
div.weekTab
{
margin:none;
position:absolute;
top:40px;
height:50px;
width:50px;
display:block;
background-color:<%=color3%>;
font-size:10px;
color:<%=color1 %>;
border:none;
 text-align:center;
}
div.thisWeek
{
margin:none;
position:absolute;
z-index:10;
top:40px;
height:52px;
width:50px;
display:block;
border-style:solid; 
border-width:1px;
border-top-width:1px;

border-top-style:solid;

border-top-color:<%=color1%>;
border-right:none;
border-left:none;
border-bottom-style:solid;
border-bottom-color:white;
border-bottom-width:1px;
background-color:white;
text-align:center;
}
div.weekBackground
{
margin:none;
position:absolute;
z-index:9;
top:40px;
height:50px;
width:52px;
display:block;
border:none;
background-color:<%=color1%>;

}
</style>
<TABLE width="100%">
	<TR>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Entering Success Criteria</a></font></TD>
	</TR>
</TABLE>


<%
Vector<org.alt60m.ministry.model.dbio.Statistic> eventStats=(Vector<org.alt60m.ministry.model.dbio.Statistic>)ar.getObject("eventStats");


	
	
%>
<form style="margin:0px;border:none;width:95%;" method="post" name="fast_ll_stat" action="/servlet/InfoBaseController?action=saveFastEventSuccessCriteria">
<input type="hidden" name="redirect" value="<%=ar.getValue("redirect") %>"/>
<input type="hidden" name="activityId" value="<%=ar.getValue("activityID") %>" />

<%if(ar.getValue("strategy").equals("BR")){%>
<input type="hidden" name="strategy" value="BR"/>
<%} else{%>
<%=fontB%>Strategy these stats will be associated with for reports: </font>
<select name="strategy" value="<%=ar.getValue("strategy") %>" >
	<option value="EV" <%=(!Arrays.asList(org.alt60m.ministry.Strategy.strategiesArray()).contains(ar.getValue("strategy")))?"selected":"" %>></option>
<%
for(String s:org.alt60m.ministry.Strategy.strategiesArray()){
	if(!s.equals("BR")){
	%><option value="<%=s %>" <%=s.equals(ar.getValue("strategy"))?"selected":"" %>><%=s.equals("EV")?"Unspecified/All":org.alt60m.ministry.Strategy.expandStrategy(s) %></option><%
}}
%>
</select>
<%}%>
<div class="maindiv" id="maindiv" style="position:absolute;left:20px;top:90px;padding:none;width:860px;border-width:1px;border-style:solid;border-color:<%=color1%>;margin:none;background-color:white;">
<%if(ar.getValue("message")!=null){
errorJog=55;
%>

<center><%=fontB%><font color="red">
<%=ar.getValue("message")%>
</center></font></font>

<%} %>
<center><%=fontB%><font color="black">For criteria definitions, hold your mouse pointer over the statistic name.</font></font></center>

<%	

for(Statistic statistic:eventStats) //start input fields
{

	
	
		
		
		//populate passer parameters for continuous demographics
		
			
		
		uniqueStat=statistic.getStatisticId()+"_"+statistic.getPeopleGroup();
		
			if(ar.getValue("strategy").equals("BR")){
				specialHeight=120;
			}
			else
			{
				specialHeight=150;
			}
			
			displayName=(String)statistic.getPeopleGroup();
			%>			
			
			<div style="position:absolute;z-index:0;top:<%=70+errorJog+(formHeight) %>px;background-color:<%=movementColor%>;height:<%=specialHeight+70 %>px;margin:none;padding:none;border:none;display:block;width:100%" id="div_week_<%=counter%>" >
			<center>
			<%=fontB3%>
			<%=displayName%></font></center>
			</div>
			
			
			<input id="week_<%=counter%>" type="hidden" name="<%=uniqueStat%>[statisticid]" value="<%=statistic.getStatisticId()%>">
			
			<input id="week_<%=counter%>" type="hidden" name="<%=uniqueStat%>[PeopleGroup]" value="<%=statistic.getPeopleGroup()%>">
			<div style="position:absolute;background-color:<%=movementColor%>;top:<%=90+errorJog+(formHeight) %>px;left:20px;z-index:1;display:block;padding:0px;width:200px;text-align:right;height:<%=specialHeight %>px;">
			<button style="<%=hoverHelpStyle%>width:125px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','involved_students');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Student Attendees</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[InvolvedStudents]"  value="<%=(statistic.getInvolvedStudents()==0)?"":statistic.getInvolvedStudents()%>" onBlur=""><br>
			<button style="<%=hoverHelpStyle%>width:125px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','dollars_raised');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Dollars Raised</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[DollarsRaised]"  value="<%=(statistic.getDollarsRaised()==0)?"":statistic.getDollarsRaised()%>" onBlur=""><br>
			<%
			if(ar.getValue("strategy").equals("BR")){
					%>
					<button style="<%=hoverHelpStyle%>width:125px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','seekers');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Seekers</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[Seekers]"  value="<%=statistic.getSeekers()==0?"":statistic.getSeekers()%>" onBlur=""><br>
					<%
			}
			else
			{	%>
				<input   id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[Seekers]"  value="<%if (Integer.valueOf(statistic.getSeekers())!=null){out.print(statistic.getSeekers());}%>" onBlur="">
				<%
			}
			%>
			</div>
			<div style="position:absolute;background-color:<%=movementColor%>;top:<%=90+errorJog+(formHeight) %>px;left:220px;z-index:1;display:block;padding:0px;width:270px;text-align:right;height:<%=specialHeight %>px;">
			<button style="<%=hoverHelpStyle%>width:140px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','personal_evangelism');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Personal Evangelism</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[PersonalEvangelismExposures]" value="<%=statistic.getPersonalEvangelismExposures()==0?"":statistic.getPersonalEvangelismExposures()%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:125px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','group_evangelism');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Group Evangelism</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[GroupEvangelismExposures]" value="<%=statistic.getGroupEvangelismExposures()==0?"":statistic.getGroupEvangelismExposures()%>""  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:120px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','media_exposures');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Media Exposures</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[MediaExposures]" value="<%=statistic.getMediaExposures()==0?"":statistic.getMediaExposures()%>""  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>;width:160px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','holy_spirit_conversations');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Holy Spirit Presentations</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[HolySpiritConversations]" value="<%=statistic.getHolySpiritConversations()==0?"":statistic.getHolySpiritConversations()%>"  onBlur="" ><br>
			
			</div>
			<div style=" position:absolute;background-color:<%=movementColor%>;top:<%=90+errorJog+(formHeight) %>px;left:510px;z-index:1;display:block;padding-right:0px;width:310px;text-align:right;height:<%=specialHeight %>px;margin-bottom:-300px;">
			<input   tabIndex="3000" id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[Decisions]" value=""  onBlur="" >
			<button style="<%=hoverHelpStyle%>width:200px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','decisions_personal');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Personal Evangelism Decisions</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[DecisionsPersonalEvangelismExposures]" value="<%=statistic.getDecisionsPersonalEvangelismExposures()==0?"":statistic.getDecisionsPersonalEvangelismExposures()%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:200px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','decisions_group');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Group Evangelism Decisions</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[DecisionsGroupEvangelismExposures]" value="<%=statistic.getDecisionsGroupEvangelismExposures()==0?"":statistic.getDecisionsGroupEvangelismExposures()%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:180px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','decisions_media');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;"><%=fontB%>Media Exposure Decisions</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[DecisionsMediaExposures]" value="<%=statistic.getDecisionsMediaExposures()==0?"":statistic.getDecisionsMediaExposures()%>"  onBlur="" ><br>
			
			</div>
			<div id="<%=uniqueStat%>_info_box" 
				style="position:absolute;top:<%=formHeight+specialHeight+25 %>px;left:100px;
				margin:10px;
				margin-left:120px;
				font-family:verdana,arial,sans-serif;
				padding:5px;
				font-size:12px;
				z-index:20;
				display:none;
				width:470px;
				height:auto;
				border-style:solid;
				border-width:1px;
				border-color:<%=color1%>;
				background-color:<%=color2%>;">
			</div>
			
			
			<%
		
			movements++;
			formHeight+=specialHeight+30;
}	
%>

<center>
<input id="noscript_submit" type="submit" value="Submit" style="margin:0px;border:none;padding:0px;position:absolute;top:<%=40+errorJog+(formHeight) %>px;display:block;z-index:10;" tabIndex="<%out.print(tabIndex);tabIndex++;%>">

<A style="margin:0px;border:none;padding:0px;position:absolute;left:380px;top:<%=40+errorJog+(formHeight) %>px;display:none;z-index:10;" tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="javascript_submit_link" HREF="JavaScript: document.fast_ll_stat.submit()" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';">
<IMG style="display:none" id="javascript_submit_image" NAME="submitbutton" SRC="/images/submit_boff.gif" BORDER="0" ALIGN="BOTTOM">
</A></center>
<script type="text/javascript" language="javascript">
//This script, if scripts are running, will turn off the above submit button 
//and display the nice SC button that doesn't run on <enter>.
document.getElementById('noscript_submit').style.display="none";
document.getElementById('javascript_submit_link').style.display="block";
document.getElementById('javascript_submit_image').style.display="block";
</script>

<div style="margin:0px;border:none;padding:20px;position:absolute;top:<%=80+errorJog+(formHeight) %>px;display:block;z-index:10;" id="input_key">
<h4>Input Key</h4>
<h5 style="margin:0px;margin-top:10px;">Personal Evangelism</h5>
<div style="display:block" id="personal_evangelism_info_box">
<%=fontB%>How many people have heard the gospel through personal evangelism? <br>
(Includes both staff and student evangelism
 and personal internet evangelism.)</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Group Evangelism</h5>
<div style="display:block" id="group_evangelism_info_box">
<%=fontB%>
What was the total number of people who heard the gospel through group evangelism? 
<br>(For instance: team meetings; evangelistic presentations; etc.)
</font>
</div>

<h5 style="margin:0px;margin-top:10px;">Media Exposures</h5>
<div style="display:block" id="media_exposures_info_box">
<%=fontB%>
How many people have been exposed to significant gospel content with opportunities 
to respond in the last month through media exposures? 
<br>(For instance: myeverystudent.com/ES.com, FSKs; Bible, book or magazine giveaways; etc.)
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Personal Evangelism Decisions</h5>
<div style="display:block" id="decisions_personal_info_box">
<%=fontB%>
How many people have indicated a decision to receive Christ as their Savior and Lord through Personal Evangelism?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Group Evangelism Decisions</h5>
<div style="display:block" id="decisions_group_info_box">
<%=fontB%>
How many people have indicated a decision to receive Christ as their Savior and Lord through Group Evangelism?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Media Exposure Decisions</h5>
<div style="display:block" id="decisions_media_info_box">
<%=fontB%>
How many people have indicated a decision to receive Christ as their Savior and Lord through Media Exposures?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Involved Students</h5>
<div style="display:block" id="involved_students_info_box">
<%=fontB%>
How many students are regularly involved in Campus Crusade for Christ?<br>
(Should be updated quarterly).
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Student Leaders</h5>
<div style="display:block" id="student_leaders_info_box">
<%=fontB%>
How many student leaders are leading small groups of Win, Build, Send ministry? 
<br>(For instance:  groups focused on reaching target audiences, launching movements, etc)
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Multipliers</h5>
<div style="display:block" id="multipliers_info_box">
<%=fontB%>
How many students are currently involved in spiritual multiplication at the most organic level? 
<br>That is: (a) seeking to grow in Christ; and (b) seeking to share their faith 
and pass on to others the foundational concepts of the Christian living 
they are receiving?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Laborers Sent</h5>
<div style="display:block" id="laborers_sent_info_box">
<%=fontB%>
A graduated Christ-centered laborer (non-staff & staff) is someone who is growing in his/her faith, 
is multiplying his/her life, and has been sent with a personal strategy to help fulfill the 
Great Commission.
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Holy Spirit Presentations</h5>
<div style="display:block" id="holy_spirit_conversations_info_box">
<%=fontB%>
How many people have heard a presentation of the ministry of the Holy Spirit
with the opportunity to respond?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Dollars Raised</h5>
<div style="display:block" id="dollars_raised_info_box">
<%=fontB%>
How much in <i>whole</i> U.S. dollars was donated by attendees (not including conference fees and gear)?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Seekers</h5>
<div style="display:block" id="seekers_info_box">
<%=fontB%>

This statistic is for Bridges movements only.
</font>
</div>
</div>
<script type="text/javascript" language="javascript">
document.getElementById("input_key").style.display="none";
</script>

</div>
</form>
<div id="lastword" style="position:absolute;top:<%=190+errorJog+(formHeight) %>px;display:block;">
<%=fontB%>If you experience any technical problems while either entering your success criteria or running a report, please give us as much information as possible about the problem by using this <A href="/general/feedback.jsp">Help Request form</A>.</font>
</div>
<script type="text/javascript" language="javascript">
document.getElementById("lastword").style.top="<%=190+errorJog+(formHeight) %>px";
</script>

</div>
</div>
<style type="text/css">
div.wrapper
{
height:<%=(formHeight)+220+errorJog+"" %>px;
}
div.maindiv
{
height:<%=(formHeight)+90+errorJog+"" %>px;
overflow:hidden;
}
</style>

<%@ include file="/infobase/ibfooter.jspf" %>
