<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%@ page import="org.alt60m.staffSite.bean.dbio.*,org.alt60m.staffSite.model.dbio.StaffSitePref" %>
<%
String pileUpSuccessCriteriaIds=""; 
String weekLink="";
java.text.SimpleDateFormat myDate = new java.text.SimpleDateFormat();
myDate.applyPattern("MM/dd/yyyy");
String profileID = (String)session.getValue("loggedIn"); 
 Iterator prefs;
 Integer movs=new Integer(0);

	Bookmarks bookmarks = new Bookmarks();
	StaffSitePref pref = null;
	prefs = bookmarks.getBookmarkValues(profileID, Bookmarks.STATISTIC).iterator();
	if (prefs.hasNext())  {
		
		while(prefs.hasNext()) {
			pref = (StaffSitePref)prefs.next();
			
			pileUpSuccessCriteriaIds += "&activities["+pref.getValue()+"]="+pref.getDisplayName();
			movs++;
			
		}
	}
	if(!(pileUpSuccessCriteriaIds==""))
		{
		weekLink="/servlet/InfoBaseController?action=enterFastSuccessCriteriaForActivity"+pileUpSuccessCriteriaIds+"&weeksBack=";
		
		}	
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
String movementWeek;
String thisOne;
String hoverHelpStyle="display:inline;border:none;margin:0px;padding:0px;padding-right:10px;background-color:white;text-align:right;";
String inputStyle="position:relative;z-index:1;width:50px;margin:0px;";
Boolean topRow=true;
Integer movements=0;
	ar = ActionResults.getActionResults(session);
	
	
	Integer weeksBack= new Integer (Integer.parseInt(ar.getValue("weeksBack")));
%>
<% String pageTitle="Entering Success Criteria";%>
<html>
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
<style>
td.weekTab
{
background-color:<%=color3%>;
width:6%;font-size:10px;
color:<%=color1 %>;
border-bottom-style:solid;
border-bottom-width:1px;
 border-bottom-color:<%=color1%>;
 text-align:center;
}
td.thisWeek
{
border-style:solid; 
border-width:1px;
border-top-width:1px;
border-right-width:1px;
border-left-width:1px;
border-top-style:solid;
border-right-style:solid;
border-left-style:solid;
border-top-color:<%=color1%>;
border-right-color:<%=color1%>;
border-left-color:<%=color1%>;
border-bottom:none;
background-color:white;
text-align:center;
}
</style>
<TABLE width="100%">
	<TR>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Entering Success Criteria</a></font></TD>
	</TR>
</TABLE>
<P>
<CENTER>
<%
miniResultsCounter = ar.getActionResultsIterator();
if (miniResultsCounter.hasNext()) //start week navigation tabs
{
	thisOne=(String)(miniResultsCounter.next());
	mr=ar.getActionResults(thisOne);
	statistics = mr.getCollection((String)("statistics"));	
	slist = ((Collection)(statistics)).iterator();
	%>
	<TABLE style="width:95%;border:none;border-collapse:collapse;">
	<TR>
	<%
	counter = 0;
	while(slist.hasNext()) // print dates
		{
			criteria = (Hashtable)slist.next();
			if(weeksBack!=(15-counter))
				{ 
					%>						
					<TD class="weekTab" >
					<%if(ar.getValue("message")==null){%>
					<A style="text-decoration:none;" href="<%=weekLink+""+(15-counter)%>">
					<%=criteria.get("PeriodBeginShort")%><br>
					to<br>
					<%=criteria.get("PeriodEndShort")%><BR>
					</A>
					<%} %>
					</TD>						
					<%
				}
			else 
				{
					%>
					<TD class="thisWeek"  ><%=fontB%>
					<%=criteria.get("PeriodBeginShort")%><br>
					to<br>
					<%=criteria.get("PeriodEndShort")%><BR>
					</TD>
					<%
				}
			counter++;
		}
	%>
	</TR>
	</TABLE>
	<%	
} //end week-navigation tabs
%>
<form style="margin:0px;border:none;width:95%;" method="post" name="fast_ll_stat" action="/servlet/InfoBaseController?action=saveFastSuccessCriteria">
<input type="hidden" name="weeksBack" value="<%=""+weeksBack %>"/>
<table cols="16" style="width:100%;border-bottom-width:1px;border-bottom-style:solid;border-bottom-color:<%=color1%>;border-right-width:1px;border-left-width:1px;border-right-style:solid;border-left-style:solid;border-right-color:<%=color1%>;border-left-color:<%=color1%>;border-top:none;margin:none;border-collapse:collapse;background-color:white;">
<tr><td>&nbsp</td></tr>	
<%if(ar.getValue("message")!=null){%>
<tr><td><center><%=fontB%><font color="red">
<%=ar.getValue("message")%>
</center></font></font></td></tr>
<tr><td>&nbsp</td></tr>
<%} %>
<%		
miniResultsCounter = ar.getActionResultsIterator();
while (miniResultsCounter.hasNext()) //start input fields
{
	thisOne=(String)(miniResultsCounter.next());
	mr=ar.getActionResults(thisOne);
	statistics = mr.getCollection((String)("statistics"));
	
	slist = ((Collection)(statistics)).iterator();
	slist = ((Collection)(statistics)).iterator();
	counter = 0;
	while(slist.hasNext())
	{
		criteria = (Hashtable)slist.next();
		movementWeek=mr.getValue("activityid")+"_"+(String)criteria.get("PeriodBegin");
		if(weeksBack==(15-counter))
		{	//note the id attributes below are for a possible future improvement 
			//using javascript.
			%>
			<tr id="tr_week_<%=counter%>" ><td colspan="16" id="td_week_<%=counter%>">
			<%=fontB3%>
			<center><b><%=(String)mr.getValue("displayname")%></b>
			</center></font></td></tr>
			<tr id="tr_week_<%=counter%>" ><td id="td_week_<%=counter%>">
			
			<input id="week_<%=counter%>" type="hidden" name="<%=movementWeek%>[PeriodBegin]" value="<%=new java.sql.Date(myDate.parse((String)criteria.get("PeriodBegin")).getTime())%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=movementWeek%>[PeriodEnd]" value="<%=new java.sql.Date(myDate.parse((String)criteria.get("PeriodEnd")).getTime())%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=movementWeek%>[statisticid]" value="<%=criteria.get("StatisticId")%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=movementWeek%>[activityid]" value="<%=mr.getValue("activityid")%>">
			<input id="week_<%=counter%>" type="hidden" name="<%=movementWeek%>[targetareaid]" value="<%=mr.getValue("targetareaid")%>">
			<div style="position:relative;z-index:1;display:block;padding:0px;width:200px;text-align:right;margin-top:10px;height:200px;">
			<button style="<%=hoverHelpStyle%>width:90px;" onMouseOver="infoBox('<%=movementWeek%>','multipliers');" onMouseOut="infoBoxClear('<%=movementWeek%>');" onClick="return false;"><%=fontB%>Multipliers</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=movementWeek%>[Multipliers]"  value="<%if(criteria.get("Multipliers")!=null){out.print(criteria.get("Multipliers"));}%>" onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:120px;" onMouseOver="infoBox('<%=movementWeek%>','student_leaders');" onMouseOut="infoBoxClear('<%=movementWeek%>');" onClick="return false;"><%=fontB%>Student Leaders</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=movementWeek%>[StudentLeaders]"  value="<%if(criteria.get("StudentLeaders")!=null){out.print(criteria.get("StudentLeaders"));}%>" onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:125px;" onMouseOver="infoBox('<%=movementWeek%>','involved_students');" onMouseOut="infoBoxClear('<%=movementWeek%>');" onClick="return false;"><%=fontB%>Involved Students</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=movementWeek%>[InvolvedStudents]"  value="<%if(criteria.get("InvolvedStudents")!=null){out.print(criteria.get("InvolvedStudents"));}%>" onBlur=""><br>
			</div>
			<div style="position:relative;z-index:1;display:block;padding:0px;width:200px;position:relative;top:-200px;left:200px;text-align:right;height:200px;">
			<button style="<%=hoverHelpStyle%>width:140px;" onMouseOver="infoBox('<%=movementWeek%>','personal_evangelism');" onMouseOut="infoBoxClear('<%=movementWeek%>');" onClick="return false;"><%=fontB%>Personal Evangelism</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=movementWeek%>[PersonalEvangelismExposures]" value="<%if(criteria.get("PersonalEvangelismExposures")!=null){out.print(criteria.get("PersonalEvangelismExposures"));}%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:125px;" onMouseOver="infoBox('<%=movementWeek%>','group_evangelism');" onMouseOut="infoBoxClear('<%=movementWeek%>');" onClick="return false;"><%=fontB%>Group Evangelism</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=movementWeek%>[GroupEvangelismExposures]" value="<%if(criteria.get("GroupEvangelismExposures")!=null){out.print(criteria.get("GroupEvangelismExposures"));}%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:120px;" onMouseOver="infoBox('<%=movementWeek%>','media_exposures');" onMouseOut="infoBoxClear('<%=movementWeek%>');" onClick="return false;"><%=fontB%>Media Exposures</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=movementWeek%>[MediaExposures]" value="<%if(criteria.get("MediaExposures")!=null){out.print(criteria.get("MediaExposures"));}%>"  onBlur="" ><br>
			</div>
			<div style="position:relative;z-index:1;display:block;padding-right:0px;width:200px;position:relative;top:-400px;left:400px;text-align:right;height:200px;margin-bottom:-500px;">
			<button style="<%=hoverHelpStyle%>width:80px;" onMouseOver="infoBox('<%=movementWeek%>','decisions');" onMouseOut="infoBoxClear('<%=movementWeek%>');" onClick="return false;"><%=fontB%>Decisions</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=movementWeek%>[Decisions]" value="<%if(criteria.get("Decisions")!=null){out.print(criteria.get("Decisions"));}%>"  onBlur="" ><br>
			<button style="<%=hoverHelpStyle%>width:100px;" onMouseOver="infoBox('<%=movementWeek%>','laborers_sent');" onMouseOut="infoBoxClear('<%=movementWeek%>');" onClick="return false;"><%=fontB%>Laborers Sent</font></button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" style="<%=inputStyle%>" name="<%=movementWeek%>[LaborersSent]" value="<%if(criteria.get("LaborersSent")!=null){out.print(criteria.get("LaborersSent"));}%>"  onBlur="" ><br>
			</div>
			<div id="<%=movementWeek%>_info_box" 
				style="position:absolute;top:<%=370+(133*movements) %>px;
				margin:10px;
				font-family:verdana,arial,sans-serif;
				padding:5px;
				z-index:20;
				display:none;
				width:470px;
				height:auto;
				border-style:solid;
				border-width:1px;
				border-color:<%=color1%>;
				background-color:<%=color2%>;">
			</div>
			
			</td></tr>
			<%
		}
		counter++;
	}
	movements++;
}	
%>
<tr><td><center>
<input id="noscript_submit" type="submit" value="Submit">

<A style="margin:0px;border:none;padding:0px;position:absolute;top:<%=220+(133*movements) %>px;display:none;z-index:10;" tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="javascript_submit_link" HREF="JavaScript: document.fast_ll_stat.submit()" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';">
<IMG style="display:none" id="javascript_submit_image" NAME="submitbutton" SRC="/images/submit_boff.gif" BORDER="0" ALIGN="BOTTOM">
</A></center></td></tr>
<script type="text/javascript" language="javascript">
//This script, if scripts are running, will turn off the above submit button 
//and display the nice SC button that doesn't run on <enter>.
document.getElementById('noscript_submit').style.display="none";
document.getElementById('javascript_submit_link').style.display="inline";
document.getElementById('javascript_submit_image').style.display="inline";
</script>
<tr><td>&nbsp
<div style="padding-left:50px;display:block" id="input_key">
<h4>Input Key</h4>
<h5 style="margin:0px;margin-top:10px;">Personal Evangelism</h5>
<div style="display:block" id="personal_evangelism_info_box">
<%=fontB1%>How many people have heard the gospel through personal evangelism? <br>
(Includes both staff and student evangelism
 and personal internet evangelism.)</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Group Evangelism</h5>
<div style="display:block" id="group_evangelism_info_box">
<%=fontB1%>
What was the total number of people who heard the gospel through group evangelism? 
<br>(For instance: team meetings; evangelistic presentations; etc.)
</font>
</div>

<h5 style="margin:0px;margin-top:10px;">Media Exposures</h5>
<div style="display:block" id="media_exposures_info_box">
<%=fontB1%>
How many people have been exposed to significant gospel content with opportunities 
to respond in the last month through media exposures? 
<br>(For instance: myeverystudent.com/ES.com, FSKs; Bible, book or magazine giveaways; etc.)
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Decisions</h5>
<div style="display:block" id="decisions_info_box">
<%=fontB1%>
How many people have indicated a decision to receive Christ as their Savior and Lord?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Involved Students</h5>
<div style="display:block" id="involved_students_info_box">
<%=fontB1%>
How many students are regularly involved in Campus Crusade for Christ?<br>
(Should be updated quarterly).
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Student Leaders</h5>
<div style="display:block" id="student_leaders_info_box">
<%=fontB1%>
How many student leaders are leading small groups of Win, Build, Send ministry? 
<br>(For instance:  groups focused on reaching target audiences, launching movements, etc)
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Multipliers</h5>
<div style="display:block" id="multipliers_info_box">
<%=fontB1%>
How many students are currently involved in spiritual multiplication at the most organic level? 
<br>That is: (a) seeking to grow in Christ; and (b) seeking to share their faith 
and pass on to others the foundational concepts of the Christian living 
they are receiving?
</font>
</div>
<h5 style="margin:0px;margin-top:10px;">Laborers Sent</h5>
<div style="display:block" id="laborers_sent_info_box">
<%=fontB1%>
A graduated Christ-centered laborer is someone who is growing in his/her faith, 
is multiplying his/her life, and has been sent with a personal strategy to help 
fulfill the Great Commission.
</font>
</div>
</div>
<script type="text/javascript" language="javascript">
document.getElementById("input_key").style.display="none";
</script>
</td></tr>
</table>
</form>

<P>
<br/>

<%=fontB%>If you experience any technical problems while either entering your success criteria or running a report, please give us as much information as possible about the problem by using this <A href="/general/feedback.jsp">Help Request form</A>.</font>
<%@ include file="/infobase/ibfooter.jspf" %>
