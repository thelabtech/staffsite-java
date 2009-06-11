
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

Boolean topRow=true;
Integer movements=0;
Integer errorJog=0;
Integer formHeight=0;
Integer specialHeight=0;
	

	
	Iterator act;
	 Integer movs=new Integer(0);

		String pref = "";
		
		
	Integer weeksBack= new Integer (Integer.parseInt(ar.getValue("weeksBack")));
%>



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


<div class="enter_stat" id="enter_stat">
<ul id="tab_wrapper">


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
					<li class="weekTab" >
					<%if(!ar.getValue("statSuccess").equals("false")){%>
					<A  href="<%="/servlet/Stat?action=index&weeksBack="+(15-counter)%>">
					<%=criteria.get("PeriodBeginShort")%><br>
					to<br>
					<%=criteria.get("PeriodEndShort")%><BR>
					</A>
					<%} %>
					</li>						
					<%
				}
			else 
				{
					%>
					
					<li class="thisWeek"  >
					<%=criteria.get("PeriodBeginShort")%><br>
					to<br>
					<%=criteria.get("PeriodEndShort")%><BR>
					</li>
					<%
				}
			counter++;
			
		}
	%>
	
	<%	
} //end week-navigation tabs
%>
<li class="wideTab" >&nbsp;	</li>	
</ul>
<div  id="maindiv" >
		<form  method="post" id="fast_ll_stat" name="fast_ll_stat" action="/servlet/Stat?action=saveFastSuccessCriteria">
				<input type="hidden" name="weeksBack" value="<%=""+weeksBack %>"/>
				
				<%if(ar.getValue("message")!=null){
				
				%>
				<br>
				<center><font color="red">
				<%=ar.getValue("message")%></font>
				</center>
				
				<%} %>
				<center>For criteria definitions, hold your mouse pointer over the statistic name.</center>
				
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
							
							if (!mr.getValue("activityid").equals(lastMovement)){
								flipColor=!flipColor;lastMovement=mr.getValue("activityid");displayName=(String)mr.getValue("displayname");
								%>
								<div class="<%=(flipColor)?"stats_form_row_darker":"stats_form_row" %>"  >
								<a class="remove_stats_bookmark" href="/servlet/Stat?action=deleteFastSuccessCriteriaBookmark&delBookmark=<%=mr.getValue("activityid")%>">remove bookmark</a>
								<%
							}else{
								displayName=(String)mr.getValue("displayname").split("&%@!")[1];
							}
								%>
										
										
										
										<center><%=displayName.replace("&%@!"," - ")%></center>
										
										
										
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
										
							<br>
						<div class="stats_form_leftmost">
									<button class="stats_hover_help" onMouseOver="infoBox('<%=uniqueStat%>','multipliers');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Multipliers</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[Multipliers]"  value="<%=multipliersPasser==null?"":multipliersPasser%>" onBlur="" ><br>
									<button class="stats_hover_help" onMouseOver="infoBox('<%=uniqueStat%>','student_leaders');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Student Leaders</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[StudentLeaders]"  value="<%=studentLeadersPasser==null?"":studentLeadersPasser%>" onBlur="" ><br>
									<button class="stats_hover_help" onMouseOver="infoBox('<%=uniqueStat%>','involved_students');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Involved Students</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[InvolvedStudents]"  value="<%=involvedStudentsPasser==null?"":involvedStudentsPasser%>" onBlur=""><br>
									<%
									if(mr.getValue("strategy").equals("BR")){
											%>
											<button class="stats_hover_help" onMouseOver="infoBox('<%=uniqueStat%>','seekers');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Seekers</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[Seekers]"  value="<%=seekersPasser==null?"":seekersPasser%>" onBlur=""><br>
											<%
									}
									else
									{	%>
										<input   id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[Seekers]"  value="<%if(criteria.get("Seekers")!=null){out.print(criteria.get("Seekers"));}%>" onBlur="">
										<%
									}
									%>
						</div>
						<div class="stats_form_middle">
									<button class="stats_hover_help_wide" onMouseOver="infoBox('<%=uniqueStat%>','personal_evangelism');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Personal Evangelism</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[PersonalEvangelismExposures]" value="<%if(criteria.get("PersonalEvangelismExposures")!=null){out.print(criteria.get("PersonalEvangelismExposures"));}%>"  onBlur="" ><br>
									<button class="stats_hover_help_wide" onMouseOver="infoBox('<%=uniqueStat%>','group_evangelism');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Group Evangelism</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[GroupEvangelismExposures]" value="<%if(criteria.get("GroupEvangelismExposures")!=null){out.print(criteria.get("GroupEvangelismExposures"));}%>"  onBlur="" ><br>
									<button class="stats_hover_help_wide" onMouseOver="infoBox('<%=uniqueStat%>','media_exposures');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Media Exposures</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[MediaExposures]" value="<%if(criteria.get("MediaExposures")!=null){out.print(criteria.get("MediaExposures"));}%>"  onBlur="" ><br>
									<button class="stats_hover_help_wide" onMouseOver="infoBox('<%=uniqueStat%>','holy_spirit_conversations');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Holy Spirit Presentations</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[HolySpiritConversations]" value="<%if(criteria.get("HolySpiritConversations")!=null){out.print(criteria.get("HolySpiritConversations"));}%>"  onBlur="" ><br>
									
						</div>
						<div class="stats_form_rightmost">
									<input   tabIndex="3000" id="week_<%=counter%>" type="hidden"  name="<%=uniqueStat%>[Decisions]" value=""  onBlur="" >
									<button class="stats_hover_help_widest" onMouseOver="infoBox('<%=uniqueStat%>','decisions_personal');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Personal Evangelism Decisions</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[DecisionsPersonalEvangelismExposures]" value="<%if(criteria.get("DecisionsPersonalEvangelismExposures")!=null){out.print(criteria.get("DecisionsPersonalEvangelismExposures"));}%>"  onBlur="" ><br>
									<button class="stats_hover_help_widest" onMouseOver="infoBox('<%=uniqueStat%>','decisions_group');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Group Evangelism Decisions</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[DecisionsGroupEvangelismExposures]" value="<%if(criteria.get("DecisionsGroupEvangelismExposures")!=null){out.print(criteria.get("DecisionsGroupEvangelismExposures"));}%>"  onBlur="" ><br>
									<button class="stats_hover_help_widest" onMouseOver="infoBox('<%=uniqueStat%>','decisions_media');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Media Exposure Decisions</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[DecisionsMediaExposures]" value="<%if(criteria.get("DecisionsMediaExposures")!=null){out.print(criteria.get("DecisionsMediaExposures"));}%>"  onBlur="" ><br>
									
									<button class="stats_hover_help_widest" onMouseOver="infoBox('<%=uniqueStat%>','laborers_sent');" onMouseOut="infoBoxClear('<%=uniqueStat%>');" onClick="return false;">Laborers Sent</button><input   tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="week_<%=counter%>" type="text" class="stats_input" name="<%=uniqueStat%>[LaborersSent]" value="<%if(criteria.get("LaborersSent")!=null){out.print(criteria.get("LaborersSent"));}%>"  onBlur="" ><br>
						</div>
						<div class="stats_info_surround">	
							<div id="<%=uniqueStat%>_info_box" class="stats_info_box" >
					
							</div>
						</div>
					
					</div>
				
							
							
							<%
						}
						counter++;
					}
					movements++;
					formHeight+=specialHeight+30;
				}	
				%>
		</form>
</div>
<center>
<div class="stats_submit_surround">
<input id="noscript_submit" type="submit" value="Submit" class="stats_submit" tabIndex="<%out.print(tabIndex);tabIndex++;%>">

<A class="stats_submit" tabIndex="<%out.print(tabIndex);tabIndex++;%>" id="javascript_submit_link" HREF="JavaScript: document.fast_ll_stat.submit()" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';">
<IMG style="display:none" id="javascript_submit_image" NAME="submitbutton" SRC="/images/submit_boff.gif" BORDER="0" ALIGN="BOTTOM">
</A></center>
<script type="text/javascript" language="javascript">
//This script, if scripts are running, will turn off the above submit button 
//and display the nice SC button that doesn't run on <enter>.
document.getElementById('noscript_submit').style.display="none";
document.getElementById('javascript_submit_link').style.display="block";
document.getElementById('javascript_submit_image').style.display="block";
</script>
</div>
<div class="stats_input_key" id="input_key">
<h4>Input Key</h4>
<h5 style="margin:0px;margin-top:10px;">Personal Evangelism</h5>
<div style="display:block" id="personal_evangelism_info_box">
How many people have heard the gospel through personal evangelism? <br>
(Includes both staff and student evangelism
 and personal internet evangelism.)
</div>
<h5 style="margin:0px;margin-top:10px;">Group Evangelism</h5>
<div style="display:block" id="group_evangelism_info_box">

What was the total number of people who heard the gospel through group evangelism? 
<br>(For instance: team meetings; evangelistic presentations; etc.)

</div>

<h5 style="margin:0px;margin-top:10px;">Media Exposures</h5>
<div style="display:block" id="media_exposures_info_box">

How many people have been exposed to significant gospel content with opportunities 
to respond in the last month through media exposures? 
<br>(For instance: myeverystudent.com/ES.com, FSKs; Bible, book or magazine giveaways; etc.)

</div>
<h5 style="margin:0px;margin-top:10px;">Personal Evangelism Decisions</h5>
<div style="display:block" id="decisions_personal_info_box">

How many people have indicated a decision to receive Christ as their Savior and Lord through Personal Evangelism?

</div>
<h5 style="margin:0px;margin-top:10px;">Group Evangelism Decisions</h5>
<div style="display:block" id="decisions_group_info_box">

How many people have indicated a decision to receive Christ as their Savior and Lord through Group Evangelism?

</div>
<h5 style="margin:0px;margin-top:10px;">Media Exposure Decisions</h5>
<div style="display:block" id="decisions_media_info_box">

How many people have indicated a decision to receive Christ as their Savior and Lord through Media Exposures?

</div>
<h5 style="margin:0px;margin-top:10px;">Involved Students</h5>
<div style="display:block" id="involved_students_info_box">

How many students are regularly involved in Campus Crusade for Christ?<br>
(Should be updated quarterly).

</div>
<h5 style="margin:0px;margin-top:10px;">Student Leaders</h5>
<div style="display:block" id="student_leaders_info_box">

How many student leaders are leading small groups of Win, Build, Send ministry? 
<br>(For instance:  groups focused on reaching target audiences, launching movements, etc)

</div>
<h5 style="margin:0px;margin-top:10px;">Multipliers</h5>
<div style="display:block" id="multipliers_info_box">

How many students are currently involved in spiritual multiplication at the most organic level? 
<br>That is: (a) seeking to grow in Christ; and (b) seeking to share their faith 
and pass on to others the foundational concepts of the Christian living 
they are receiving?

</div>
<h5 style="margin:0px;margin-top:10px;">Laborers Sent</h5>
<div style="display:block" id="laborers_sent_info_box">

A graduated Christ-centered laborer (non-staff) is someone who is growing in his/her faith, 
is multiplying his/her life, and has been sent with a personal strategy to help fulfill the 
Great Commission.

</div>
<h5 style="margin:0px;margin-top:10px;">Holy Spirit Presentations</h5>
<div style="display:block" id="holy_spirit_conversations_info_box">

How many people have heard a presentation of the ministry of the Holy Spirit
with the opportunity to respond?

</div>
<h5 style="margin:0px;margin-top:10px;">Seekers</h5>
<div style="display:block" id="seekers_info_box">


This statistic is for Bridges movements only.

</div>
</div>
<script type="text/javascript" language="javascript">
document.getElementById("input_key").style.display="none";
</script>

</div>
</form>



</div>
</div>


<%@ include file="/modules/footer.jspf"%>