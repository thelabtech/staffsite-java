
<%@ include file="/modules/header.jspf"%>
<%
String pileUpSuccessCriteriaIds=""; 
String weekLink="";
java.text.SimpleDateFormat myDate = new java.text.SimpleDateFormat();
myDate.applyPattern("MM/dd/yyyy");
 
 	

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
	
	Iterator act;
	 Integer movs=new Integer(0);

		String pref = "";
		
		
	Integer weeksBack= new Integer (Integer.parseInt(ar.getValue("weeksBack")));
%>
<% String pageTitle="Entering Success Criteria";%>


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


<div class="wrapper" id="wrapper">
<div style="position:absolute;width:1000px;margin:auto;">
<style>
div.weekTab
{
margin:none;
position:absolute;
top:40px;
height:50px;
width:50px;
display:block;
background-color:#888888;
font-size:10px;
color:white;
border:none;
 text-align:center;
}
div.weekTab a
{color:white;
}
div.weekTab a:visited
{color:white;
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

border-top-color:black;
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
background-color:black;

}
</style>
<TABLE width="100%">
	<TR>
		<TD align=right><a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Entering Success Criteria</a></font></TD>
	</TR>
</TABLE>


<%
miniResultsCounter = ar.getActionResultsIterator();
if (miniResultsCounter.hasNext()) //start week navigation tabs
{
	thisOne=(String)(miniResultsCounter.next());
	mr=ar.getActionResults(thisOne);
	statistics = mr.getCollection((String)("statistics"));	
	slist = ((Collection)(statistics)).iterator();
	
	
	counter = 0;
	while(slist.hasNext()) // print dates
		{
			criteria = (Hashtable)slist.next();
			
			
			
			if(weeksBack!=(15-counter))
				{ 
					%>						
					<div class="weekTab" style="left:<%=(counter*60)+20 %>px">
					<%if(!ar.getValue("statSuccess").equals("false")){%>
					<A style="text-decoration:none;" href="<%="/servlet/Stat?action=index&weeksBack="+(15-counter)%>">
					<%=criteria.get("PeriodBeginShort")%><br>
					to<br>
					<%=criteria.get("PeriodEndShort")%><BR>
					</A>
					<%} %>
					</div>						
					<%
				}
			else 
				{
					%>
					<div class="weekBackground" style="left:<%=(counter*60)+19 %>px"></div>
					<div class="thisWeek"  style="left:<%=(counter*60)+20 %>px">
					<%=criteria.get("PeriodBeginShort")%><br>
					to<br>
					<%=criteria.get("PeriodEndShort")%><BR>
					</div>
					<%
				}
			counter++;
			
		}
	%>
	
	<%	
} //end week-navigation tabs
%>
<form style="margin:0px;border:none;width:95%;" method="post" name="fast_ll_stat" action="/servlet/Stat?action=saveFastSuccessCriteria">
<input type="hidden" name="weeksBack" value="<%=""+weeksBack %>"/>
<div class="maindiv" id="maindiv" style="position:absolute;left:10px;top:90px;padding:none;width:985px;border-width:1px;border-style:solid;border-color:black;margin:none;background-color:white;">
<%if(ar.getValue("message")!=null){
errorJog=55;
%>
<br>
<center><font color="red">
<%=ar.getValue("message")%>
</center></font></font>

<%} %>
<center><font color="black">For criteria definitions, hold your mouse pointer over the statistic name.</font></font></center>

<%		
Integer involvedStudentsPasser = 0;
Integer studentLeadersPasser = 0;
Integer multipliersPasser = 0;
Integer seekersPasser = 0;
miniResultsCounter = ar.getActionResultsIterator();
while (miniResultsCounter.hasNext()) //start input fields
{
	thisOne=(String)(miniResultsCounter.next());
	mr=ar.getActionResults(thisOne);
	statistics = mr.getCollection((String)("statistics"));
	
	slist = ((Collection)(statistics)).iterator();
	slist = ((Collection)(statistics)).iterator();
	counter = 0;
	involvedStudentsPasser = 0;
	studentLeadersPasser = 0;
	multipliersPasser = 0;
	seekersPasser = 0;
	while(slist.hasNext())
	{
		
		criteria = (Hashtable)slist.next();
		//populate passer parameters for continuous demographics
		if(criteria.get("InvolvedStudents")!=null){
			involvedStudentsPasser = (Integer)criteria.get("InvolvedStudents");
			studentLeadersPasser = (Integer)criteria.get("StudentLeaders");
			multipliersPasser = (Integer)criteria.get("Multipliers");
			seekersPasser = (Integer)criteria.get("Seekers");
			}
		
		uniqueStat=mr.getValue("activityid")+"_"+(String)criteria.get("PeriodBegin")+"_"+(String)(mr.getValue("peopleGroup"));
		if(weeksBack==(15-counter))
		{	//note the id attributes below are for a possible future improvement 
			//using javascript.
			if(mr.getValue("strategy").equals("BR")){
				specialHeight=120;
			}
			else
			{
				specialHeight=150;
			}
			if (!mr.getValue("activityid").equals(lastMovement)){
				flipColor=!flipColor;lastMovement=mr.getValue("activityid");displayName=(String)mr.getValue("displayname");
				%>
				<a style="position:absolute;top:<%= 70+errorJog+(formHeight)%>;left:20px;z-index:10;font-size:10px;color:#cacaca;" href="/servlet/Stat?action=deleteFastSuccessCriteriaBookmark&delBookmark=<%=mr.getValue("activityid")%>">remove bookmark</a><%
			}
			else{displayName=(String)mr.getValue("displayname").split("&%@!")[1];}
			if (flipColor){movementColor="#eeeeee";}else{movementColor="white";}%>
			
			
			<div style="position:absolute;z-index:0;top:<%=70+errorJog+(formHeight) %>px;background-color:<%=movementColor%>;height:<%=specialHeight+70 %>px;margin:none;padding:none;border:none;display:block;width:100%" id="div_week_<%=counter%>" >
			<center>
			
			<%=displayName.replace("&%@!"," - ")%></font></center>
			</div>
			
			
			<input id="week_<%=counter%>" type="hidden" name="<%=uniqueStat%>[PeriodBegin]" value="<%=new java.sql.Date(myDate.parse((String)criteria.get("PeriodBegin")).getTime())%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=uniqueStat%>[PeriodEnd]" value="<%=new java.sql.Date(myDate.parse((String)criteria.get("PeriodEnd")).getTime())%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=uniqueStat%>[statisticid]" value="<%=criteria.get("StatisticId")%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=uniqueStat%>[activityid]" value="<%=mr.getValue("activityid")%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=uniqueStat%>[PeopleGroup]" value="<%=mr.getValue("peopleGroup")%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=uniqueStat%>[targetareaid]" value="<%=mr.getValue("targetareaid")%>">
			<input    id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[BeforeMultipliers]"  value="<%=multipliersPasser==null?"":multipliersPasser%>"  >
			<input    id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[BeforeStudentLeaders]"  value="<%=studentLeadersPasser==null?"":studentLeadersPasser%>"  >
			<input    id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[BeforeInvolvedStudents]"  value="<%=involvedStudentsPasser==null?"":involvedStudentsPasser%>" >
			<input    id="week_<%=counter%>" type="hidden"   name="<%=uniqueStat%>[BeforePersonalEvangelismExposures]" value="<%if(criteria.get("PersonalEvangelismExposures")!=null){out.print(criteria.get("PersonalEvangelismExposures"));}%>"  onBlur="" >
			<input    id="week_<%=counter%>" type="hidden"   name="<%=uniqueStat%>[BeforeGroupEvangelismExposures]" value="<%if(criteria.get("GroupEvangelismExposures")!=null){out.print(criteria.get("GroupEvangelismExposures"));}%>"  onBlur="" >
			<input    id="week_<%=counter%>" type="hidden"   name="<%=uniqueStat%>[BeforeMediaExposures]" value="<%if(criteria.get("MediaExposures")!=null){out.print(criteria.get("MediaExposures"));}%>"  onBlur="" >
			<input    id="week_<%=counter%>" type="hidden"   name="<%=uniqueStat%>[BeforeHolySpiritConversations]" value="<%if(criteria.get("HolySpiritConversations")!=null){out.print(criteria.get("HolySpiritConversations"));}%>"  onBlur="" >
			<input    id="week_<%=counter%>" type="hidden"   name="<%=uniqueStat%>[BeforeDecisionsPersonalEvangelismExposures]" value="<%if(criteria.get("DecisionsPersonalEvangelismExposures")!=null){out.print(criteria.get("DecisionsPersonalEvangelismExposures"));}%>"  onBlur="" >
			<input    id="week_<%=counter%>" type="hidden"   name="<%=uniqueStat%>[BeforeDecisionsGroupEvangelismExposures]" value="<%if(criteria.get("DecisionsGroupEvangelismExposures")!=null){out.print(criteria.get("DecisionsGroupEvangelismExposures"));}%>"  onBlur="" >
			<input    id="week_<%=counter%>" type="hidden"   name="<%=uniqueStat%>[BeforeDecisionsMediaExposures]" value="<%if(criteria.get("DecisionsMediaExposures")!=null){out.print(criteria.get("DecisionsMediaExposures"));}%>"  onBlur="" >
			<input    id="week_<%=counter%>" type="hidden"   name="<%=uniqueStat%>[BeforeSeekers]" value="<%=seekersPasser==null?"":seekersPasser%>"  onBlur="" >
			<div style="position:absolute;background-color:<%=movementColor%>;top:<%=90+errorJog+(formHeight) %>px;left:20px;z-index:1;display:block;padding:0px;width:200px;text-align:right;height:<%=specialHeight %>px;">
			<button style="<%=hoverHelpStyle%>width:90px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','multipliers');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Multipliers</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[Multipliers]"  value="<%=multipliersPasser==null?"":multipliersPasser%>" onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:120px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','student_leaders');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Student Leaders</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[StudentLeaders]"  value="<%=studentLeadersPasser==null?"":studentLeadersPasser%>" onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:125px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','involved_students');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Involved Students</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[InvolvedStudents]"  value="<%=involvedStudentsPasser==null?"":involvedStudentsPasser%>" onBlur=""><br>
			<%
			if(mr.getValue("strategy").equals("BR")){
					%>
					<button style="<%=hoverHelpStyle%>width:125px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','seekers');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Seekers</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[Seekers]"  value="<%=seekersPasser==null?"":seekersPasser%>" onBlur=""><br>
					<%
			}
			else
			{	%>
				<input   id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[Seekers]"  value="<%if(criteria.get("Seekers")!=null){out.print(criteria.get("Seekers"));}%>" onBlur="">
				<%
			}
			%>
			</div>
			<div style="position:absolute;background-color:<%=movementColor%>;top:<%=90+errorJog+(formHeight) %>px;left:220px;z-index:1;display:block;padding:0px;width:270px;text-align:right;height:<%=specialHeight %>px;">
			<button style="<%=hoverHelpStyle%>width:140px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','personal_evangelism');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Personal Evangelism</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[PersonalEvangelismExposures]" value="<%if(criteria.get("PersonalEvangelismExposures")!=null){out.print(criteria.get("PersonalEvangelismExposures"));}%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:125px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','group_evangelism');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Group Evangelism</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[GroupEvangelismExposures]" value="<%if(criteria.get("GroupEvangelismExposures")!=null){out.print(criteria.get("GroupEvangelismExposures"));}%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:120px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','media_exposures');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Media Exposures</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[MediaExposures]" value="<%if(criteria.get("MediaExposures")!=null){out.print(criteria.get("MediaExposures"));}%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>;width:160px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','holy_spirit_conversations');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Holy Spirit Presentations</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[HolySpiritConversations]" value="<%if(criteria.get("HolySpiritConversations")!=null){out.print(criteria.get("HolySpiritConversations"));}%>"  onBlur="" ><br>
			
			</div>
			<div style=" position:absolute;background-color:<%=movementColor%>;top:<%=90+errorJog+(formHeight) %>px;left:510px;z-index:1;display:block;padding-right:0px;width:310px;text-align:right;height:<%=specialHeight %>px;margin-bottom:-300px;">
			<input   tabIndex="3000" id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[Decisions]" value=""  onBlur="" >
			<button style="<%=hoverHelpStyle%>width:200px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','decisions_personal');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Personal Evangelism Decisions</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[DecisionsPersonalEvangelismExposures]" value="<%if(criteria.get("DecisionsPersonalEvangelismExposures")!=null){out.print(criteria.get("DecisionsPersonalEvangelismExposures"));}%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:200px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','decisions_group');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Group Evangelism Decisions</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[DecisionsGroupEvangelismExposures]" value="<%if(criteria.get("DecisionsGroupEvangelismExposures")!=null){out.print(criteria.get("DecisionsGroupEvangelismExposures"));}%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:180px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','decisions_media');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Media Exposure Decisions</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[DecisionsMediaExposures]" value="<%if(criteria.get("DecisionsMediaExposures")!=null){out.print(criteria.get("DecisionsMediaExposures"));}%>"  onBlur="" ><br>
			
			<button style="<%=hoverHelpStyle%>width:100px;background-color:<%=movementColor%>;" onMouseOver="infoBox('<%=uniqueStat%>','laborers_sent');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Laborers Sent</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=uniqueStat%>[LaborersSent]" value="<%if(criteria.get("LaborersSent")!=null){out.print(criteria.get("LaborersSent"));}%>"  onBlur="" ><br>
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
				border-color:black;
				background-color:white;">
			</div>
			
			
			<%
		}
		counter++;
	}
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
How many people have heard the gospel through personal evangelism? <br>
(Includes both staff and student evangelism
 and personal internet evangelism.)</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Group Evangelism</h5>
<div style="display:block" id="group_evangelism_info_box">

What was the total number of people who heard the gospel through group evangelism? 
<br>(For instance: team meetings; evangelistic presentations; etc.)
</font>
</div>

<h5 style="margin:0px;margin-top:10px;">Media Exposures</h5>
<div style="display:block" id="media_exposures_info_box">

How many people have been exposed to significant gospel content with opportunities 
to respond in the last month through media exposures? 
<br>(For instance: myeverystudent.com/ES.com, FSKs; Bible, book or magazine giveaways; etc.)
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Personal Evangelism Decisions</h5>
<div style="display:block" id="decisions_personal_info_box">

How many people have indicated a decision to receive Christ as their Savior and Lord through Personal Evangelism?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Group Evangelism Decisions</h5>
<div style="display:block" id="decisions_group_info_box">

How many people have indicated a decision to receive Christ as their Savior and Lord through Group Evangelism?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Media Exposure Decisions</h5>
<div style="display:block" id="decisions_media_info_box">

How many people have indicated a decision to receive Christ as their Savior and Lord through Media Exposures?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Involved Students</h5>
<div style="display:block" id="involved_students_info_box">

How many students are regularly involved in Campus Crusade for Christ?<br>
(Should be updated quarterly).
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Student Leaders</h5>
<div style="display:block" id="student_leaders_info_box">

How many student leaders are leading small groups of Win, Build, Send ministry? 
<br>(For instance:  groups focused on reaching target audiences, launching movements, etc)
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Multipliers</h5>
<div style="display:block" id="multipliers_info_box">

How many students are currently involved in spiritual multiplication at the most organic level? 
<br>That is: (a) seeking to grow in Christ; and (b) seeking to share their faith 
and pass on to others the foundational concepts of the Christian living 
they are receiving?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Laborers Sent</h5>
<div style="display:block" id="laborers_sent_info_box">

A graduated Christ-centered laborer (non-staff) is someone who is growing in his/her faith, 
is multiplying his/her life, and has been sent with a personal strategy to help fulfill the 
Great Commission.
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Holy Spirit Presentations</h5>
<div style="display:block" id="holy_spirit_conversations_info_box">

How many people have heard a presentation of the ministry of the Holy Spirit
with the opportunity to respond?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Seekers</h5>
<div style="display:block" id="seekers_info_box">


This statistic is for Bridges movements only.
</font>
</div>
</div>
<script type="text/javascript" language="javascript">
document.getElementById("input_key").style.display="none";
</script>

</div>
</form>
<div id="lastword" style="position:absolute;top:<%=980+errorJog+(formHeight) %>px;display:block;">
If you experience any technical problems while either entering your success criteria or running a report, please give us as much information as possible about the problem by using this <A href="/general/feedback.jsp">Help Request form</A>.</font>
</div>
<script type="text/javascript" language="javascript">
document.getElementById("lastword").style.top="<%=180+errorJog+(formHeight) %>px";
</script>

</div>
</div>
<style type="text/css">
div.wrapper
{
height:<%=(formHeight)+1020+errorJog+"" %>px;
}
div.maindiv
{
height:<%=(formHeight)+870+errorJog+"" %>px;
overflow:hidden;
}
</style>
<script type="text/javascript">
document.getElementById('maindiv').style.height='<%=(formHeight)+70+errorJog+"" %>px';
document.getElementById('wrapper').style.height='<%=(formHeight)+220+errorJog+"" %>px';
</script>
<%@ include file="/modules/footer.jspf"%>