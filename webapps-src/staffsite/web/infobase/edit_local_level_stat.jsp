<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
	ActionResults ar; 
	ar = ActionResults.getActionResults(session);
	Hashtable statistic = new Hashtable();
	String current = request.getParameter("current");
	
	if(ar.getHashtable("statistic") == null){
		statistic.put("Decisions", "0");
		statistic.put("MediaDecisions", "0");
		statistic.put("IndividualDecisions", "0");
		statistic.put("GroupDecisions", "0");
		statistic.put("OngoingDecisions", "0");
		statistic.put("StaffStint", "0");
		statistic.put("InvldStudents", "0");
		statistic.put("InvldNewBlvrs", "0");
		statistic.put("InvldSophomores", "0");
		statistic.put("AttendedLastConf", "0");
		statistic.put("StudentLeaders", "0");
		statistic.put("Volunteers", "0");
		statistic.put("InvldJuniors", "0");
		statistic.put("Exposures", "0");
		statistic.put("MediaExposures", "0");
		statistic.put("IndividualPresentations", "0");
		statistic.put("GroupPresentations", "0");
		statistic.put("OngoingRelationships", "0");
		statistic.put("InvldGrads", "0");
		statistic.put("NonStaffStint", "0");
		statistic.put("Staff", "0");
		statistic.put("InvldSeniors", "0");
		statistic.put("InvldFreshmen", "0");		
	} else {
		Hashtable editStat = (Hashtable)ar.getHashtable("statistic");
		
		if (current.equals("true"))
		{
			statistic.put("Exposures", ((Integer)editStat.get("Exposures")).toString());
			statistic.put("MediaExposures", ((Integer)editStat.get("Exposures")).toString());
			statistic.put("IndividualPresentations", ((Integer)editStat.get("Exposures")).toString());
			statistic.put("GroupPresentations", ((Integer)editStat.get("Exposures")).toString());
			statistic.put("OngoingRelationships", ((Integer)editStat.get("Exposures")).toString());
			statistic.put("Decisions", ((Integer)editStat.get("Decisions")).toString());
			statistic.put("MediaDecisions", ((Integer)editStat.get("Decisions")).toString());
			statistic.put("IndividualDecisions", ((Integer)editStat.get("Decisions")).toString());
			statistic.put("GroupDecisions", ((Integer)editStat.get("Decisions")).toString());
			statistic.put("OngoingDecisions", ((Integer)editStat.get("Decisions")).toString());
			statistic.put("AttendedLastConf", ((Integer)editStat.get("AttendedLastConf")).toString());
		} else {
			statistic.put("Exposures", "0");
			statistic.put("MediaExposures", "0");
			statistic.put("IndividualPresentations", "0");
			statistic.put("GroupPresentations", "0");
			statistic.put("OngoingRelationships", "0");
			statistic.put("Decisions", "0");
			statistic.put("MediaDecisions", "0");
			statistic.put("IndividualDecisions", "0");
			statistic.put("GroupDecisions", "0");
			statistic.put("OngoingDecisions", "0");
			statistic.put("Exposures", "0");
			statistic.put("Decisions", "0");
			statistic.put("AttendedLastConf", "0");
		}
		
		statistic.put("StaffStint", ((Integer)editStat.get("StaffStint")).toString());
		statistic.put("InvldStudents", ((Integer)editStat.get("InvldStudents")).toString());
		statistic.put("InvldNewBlvrs", ((Integer)editStat.get("InvldNewBlvrs")).toString());
		statistic.put("InvldSophomores", ((Integer)editStat.get("InvldSophomores")).toString());
		statistic.put("StudentLeaders", ((Integer)editStat.get("StudentLeaders")).toString());
		statistic.put("Volunteers", ((Integer)editStat.get("Volunteers")).toString());
		statistic.put("InvldJuniors", ((Integer)editStat.get("InvldJuniors")).toString());
		statistic.put("InvldGrads", ((Integer)editStat.get("InvldGrads")).toString());
		statistic.put("NonStaffStint", ((Integer)editStat.get("NonStaffStint")).toString());
		statistic.put("Staff", ((Integer)editStat.get("Staff")).toString());
		statistic.put("InvldSeniors", ((Integer)editStat.get("InvldSeniors")).toString());
		statistic.put("InvldFreshmen", ((Integer)editStat.get("InvldFreshmen")).toString());
	}

%>
<% String pageTitle="Entering Success Criteria"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/validate.js"%>
<%@ include file="/infobase/ibheader.jspf" %>

<TABLE width="100%">
	<TR>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Entering Success Criteria</a></font></TD>
	</TR>
</TABLE>

<%=fontB3%><b>Campus Success Criteria Form:</b></font>
<TABLE WIDTH="100%"><TR><TD <%=bgcolorW%>>
<TABLE BORDER="0" CELLPADDING="3" CELLSPACING="1" WIDTH="100%">
	<form method="post" name="ll_stat" action="/servlet/InfoBaseController?action=saveSuccessCriteria">
	<input type="hidden" name="activityid" value="<%=ar.getValue("activityid")%>">
	<input type="hidden" name="targetareaid" value="<%=ar.getValue("targetareaid")%>">
<%
	if(request.getParameter("statisticid") != null){
%>
		<input type="hidden" name="statisticid" value="<%=request.getParameter("statisticid")%>">
<%
	}
%>
	<tr>
		<td valign="top"></td>
		<td>
			<img src="/infobase/images/1.gif"><%=fontB%>Make sure this is the correct time period for which you are entering statistics:</font><p>
			<table border="0" cellpadding="3" cellspacing="2">
				<tr>
					<th width="75" align=center <%=bgcolorB%>><%=fontW%>From
					<th width="75" align=center <%=bgcolorB%>><%=fontW%>To
				</tr>
				<tr <%=bgcolorW%>>  
					<td width="50" <%=bgcolorL%> align="center">
						<%=fontB%><%=ar.getValue("periodbegin")%></font>
<%
						// fix dates for putting into the object:
						java.text.SimpleDateFormat myDate = new java.text.SimpleDateFormat();
						myDate.applyPattern("MM/dd/yyyy"); 						
						
%>
						<input type="hidden" name="PeriodBegin" value="<%=new java.sql.Date(myDate.parse((String)ar.getValue("periodbegin")).getTime())%>">
					</td>
					<td width="50" <%=bgcolorL%> align="center">
						<%=fontB%><%=ar.getValue("periodend")%></font>
						<input type="hidden" name="PeriodEnd" value="<%=new java.sql.Date(myDate.parse((String)ar.getValue("periodend")).getTime())%>">
					</td>
				</tr>
			</table>
		</td>
	</tr>
    <tr>
		<td valign="top"></td>
		<td>
			<p><img src="/infobase/images/2.gif"><%=fontB%>Please enter your statistics:</font></p>
			<table width="100%" cellpadding="5" cellspacing="1" <%=bgcolorL%>>
<!-- OLD SUCCESS CRITERIA CATEGORIES -->
				<tr><th <%=tableRightB%> colspan=3><%=fontW3%>This Week's Criteria</font></th></tr>
				<tr align="left" valign="middle">
					<th><%=fontB%>Exposures</font></th>
					<td><input type="text" name="Exposures" value="<%=(String)statistic.get("Exposures")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Number of students exposed to meaningful evangelistic content with some opportunity to respond.</font></i></td>
				</tr>
				<tr align="left" valign="middle"> 
					<th><%=fontB%>Decisions</font></th>
					<td><input type="text" name="Decisions" value="<%=(String)statistic.get("Decisions")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Number of students who have indicated decisions to trust Christ. This doesn't include Holy Spirit decisions.</font></i></td>
				</tr>
				<tr align="left" valign="middle">
					<th><%=fontB%>Attended Conferences</font></th>
					<td><input type="text" name="AttendedLastConf" value="<%=(String)statistic.get("AttendedLastConf")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Number of students who attended conferences during the week covered on this report.</font></i></td>
				</tr>

<!-- NEW SUCCESS CRITERIA CATEGORIES
				<tr><th <%=tableRightB%> colspan=3><%=fontW3%>This Week's Criteria</font></th></tr>
				<tr align="left" valign="middle">
					<th><%=fontB%>Media Exposures</font></th>
					<td><input type="text" name="MediaExposures" value="<%=(String)statistic.get("MediaExposures")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Number of students exposed to meaningful evangelistic content with some opportunity to respond</font></i></td>
				</tr>

				<tr align="left" valign="middle">
					<th><%=fontB%>Individual Presentations</font></th>
					<td><input type="text" name="IndividualPresentations" value="<%=(String)statistic.get("IndividualPresentations")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Number of students exposed to meaningful evangelistic content with some opportunity to respond.</font></i></td>
				</tr>				
				<tr align="left" valign="middle">
					<th><%=fontB%>Group Presentations</font></th>
					<td><input type="text" name="GroupPresentations" value="<%=(String)statistic.get("GroupPresentations")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Number of students exposed to meaningful evangelistic content with some opportunity to respond</font></i></td>
				</tr>
				<tr align="left" valign="middle">
					<th><%=fontB%>On-going Relationships</font></th>
					<td><input type="text" name="OngoingRelationships" value="<%=(String)statistic.get("OngoingRelationships")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Number of students exposed to meaningful evangelistic content with some opportunity to respond</font></i></td>
				</tr>
				<tr align="left" valign="middle"> 
					<th><%=fontB%>Media Decisions</font></th>
					<td><input type="text" name="MediaDecisions" value="<%=(String)statistic.get("MediaDecisions")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Number of students who have indicated decisions to trust Christ. This doesn't include Holy Spirit decisions.</font></i></td>
				</tr>
				<tr align="left" valign="middle"> 
					<th><%=fontB%>Individual Decisions</font></th>
					<td><input type="text" name="IndividualDecisions" value="<%=(String)statistic.get("IndividualDecisions")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Number of students who have indicated decisions to trust Christ. This doesn't include Holy Spirit decisions.</font></i></td>
				</tr>
				<tr align="left" valign="middle"> 
					<th><%=fontB%>Group Decisions</font></th>
					<td><input type="text" name="GroupDecisions" value="<%=(String)statistic.get("GroupDecisions")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Number of students who have indicated decisions to trust Christ. This doesn't include Holy Spirit decisions.</font></i></td>
				</tr>
				<tr align="left" valign="middle"> 
					<th><%=fontB%>On-going Decisions</font></th>
					<td><input type="text" name="OngoingDecisions" value="<%=(String)statistic.get("OngoingDecisions")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Number of students who have indicated decisions to trust Christ. This doesn't include Holy Spirit decisions.</font></i></td>
				</tr>
-->
			</table>
			<br>
<!-- OLD SUCCESS CRITERIA CATEGORIES -->
			<table width="100%" border="0" cellpadding="5" cellspacing="1" <%=bgcolorW%>>
				<tr><th <%=tableRightB%> colspan=3><%=fontW3%>Campus Snapshot (Demographics)</font></th></tr>
				<% if (current.equals("false")) {%> <tr><th <%=bgcolorL%> colspan=3><%=fontB1%>The fields below are prefilled with the most recently entered numbers. If these numbers have changed, please update them below.</font></th></tr><%}%>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Involved New Believers</font></th>
					<td><input type="text" name="InvldNewBlvrs" size="10" value="<%=(String)statistic.get("InvldNewBlvrs")%>" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Current number of students who became Christians through some direct contact with CCC and are still 
						involved beyond basic follow-up. Include students involved in small groups or weekly meeting. Thus if a student receives 
						Christ as a Freshman, you count him as one of your current "involved new believers" <b>every</b> week he is still involved - 
						not just this year.</font></i>
					</td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle"> 
					<th><%=fontB%>Students Involved</font></th>
					<td><input type="text" name="InvldStudents" size="10" value="<%=(String)statistic.get("InvldStudents")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>This is a snapshot of the total number of students who 
						are currently being developed by Campus Crusade. It includes all students attending 
						the weekly meeting, small groups, and any ethnic meetings or studies which are being 
						served/supported by CCC. Count all the students once.</font></i>
					</td>
				</tr>
				<tr bgcolor="#C0CCEA" align="left" valign="middle">
					<th><%=fontB%>Freshmen Involved</b></th>
					<td><input type="text" name="InvldFreshmen" size="10" value="<%=(String)statistic.get("InvldFreshmen")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Freshman breakout of <i>Students Involved</i>.</font></i></td>
				</tr>
				<tr bgcolor="#COCCEA" align="left" valign="middle">
					<th><%=fontB%>Sophomores Involved</font></th>
					<td><input type="text" name="InvldSophomores" size="10" value="<%=(String)statistic.get("InvldSophomores")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Sophomore breakout of <i>Students Involved</i>.</font></i></td>
				</tr>
				<tr bgcolor="#COCCEA" align="left" valign="middle">
					<th><%=fontB%>Juniors Involved</th>
					<td><input type="text" name="InvldJuniors" size="10" value="<%=(String)statistic.get("InvldJuniors")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Junior breakout of <i>Students Involved</i>.</font></i></td>
				</tr>
				<tr bgcolor="#COCCEA" align="left" valign="middle">
					<th><%=fontB%>Seniors Involved</th>
					<td><input type="text" name="InvldSeniors" size="10" value="<%=(String)statistic.get("InvldSeniors")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Senior breakout of <i>Students Involved</i>.</font></i></td>
				</tr>
				<tr bgcolor="#COCCEA" align="left" valign="middle"> 
					<th><%=fontB%>Graduates Involved</td>
					<td><input type="text" name="InvldGrads" size="10" value="<%=(String)statistic.get("InvldGrads")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Graduate breakout of <i>Students Involved</i>.</font></i></td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Volunteers</font></td>
					<td><input type="text" name="Volunteers" size="10" value="<%=(String)statistic.get("Volunteers")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Any student or non-staff who invests 5 hours per week toward the mission. Includes graduating students who do ministry from the marketplace, church partners and catalytic leaders. Include student leaders on staffed campuses and multiple student leaders on catalytic campuses.</font></i></td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Staff</font></th>
					<td><input type="text" name="Staff" size="10" value="<%=(String)statistic.get("Staff")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Number of full-time staff involved in the campus; including Moms, associate staff and new staff raising support.</font></i></td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>WSN Non-Staff STINT</font></td>
					<td><input type="text" name="NonStaffStint" size="10" value="<%=(String)statistic.get("NonStaffStint")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>(WSN Only) Breakout of WSN non-staff STINT at the campus; including Moms.</font></i></td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>WSN Staff STINT</font></th>
					<td><input type="text" name="StaffStint" size="10" value="<%=(String)statistic.get("StaffStint")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>(WSN Only) Breakout of WSN staff STINT at the campus; including Moms.</font></i></td>
				</tr>
				</p>
			</table>

<!-- NEW SUCCESS CRITERIA CATEGORIES
			<table width="100%" border="0" cellpadding="5" cellspacing="1" <%=bgcolorW%>>
				<tr><th <%=tableRightB%> colspan=3><%=fontW3%>Campus Snapshot (Demographics)</font></th></tr>
				<% if (current.equals("false")) {%> <tr><th <%=bgcolorL%> colspan=3><%=fontB1%>The fields below are prefilled with the most recently entered numbers. If these numbers have changed, please update them below.</font></th></tr><%}%>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Involved New Believers</font></th>
					<td><input type="text" name="InvldNewBlvrs" size="10" value="<%=(String)statistic.get("InvldNewBlvrs")%>" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Current number of students who became Christians through some direct contact with CCC and are still 
						involved beyond basic follow-up. Include students involved in small groups or weekly meeting. Thus if a student receives 
						Christ as a Freshman, you count him as one of your current "involved new believers" <b>every</b> week he is still involved - 
						not just this year.</font></i>
					</td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle"> 
					<th><%=fontB%>Students Involved</font></th>
					<td><input type="text" name="InvldStudents" size="10" value="<%=(String)statistic.get("InvldStudents")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>This is a snapshot of the total number of students who 
						are currently being developed by Campus Crusade. It includes all students attending 
						the weekly meeting, small groups, and any ethnic meetings or studies which are being 
						served/supported by CCC. Count all the students once.</font></i>
					</td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Student Leaders</font></td>
					<td><input type="text" name="Volunteers" size="10" value="<%=(String)statistic.get("StudentLeaders")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Any student or non-staff who invests 5 hours per week toward the mission. Includes graduating students who do ministry from the marketplace, church partners and catalytic leaders. Include student leaders on staffed campuses and multiple student leaders on catalytic campuses.</font></i></td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Volunteers</font></td>
					<td><input type="text" name="Volunteers" size="10" value="<%=(String)statistic.get("Volunteers")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Any student or non-staff who invests 5 hours per week toward the mission. Includes graduating students who do ministry from the marketplace, church partners and catalytic leaders. Include student leaders on staffed campuses and multiple student leaders on catalytic campuses.</font></i></td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Staff</font></th>
					<td><input type="text" name="Staff" size="10" value="<%=(String)statistic.get("Staff")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>Number of full-time staff involved in the campus; including Moms, associate staff and new staff raising support.</font></i></td>
				</tr>
				</p>
			</table>
-->
			<table width="100%" height="5"><tr><td <%=bgcolorB%>></td></tr></table>
			<br>
			<img src="/infobase/images/3.gif"><%=fontB%>When you're finished, click this button:</font>
			<A HREF="JavaScript: document.ll_stat.submit()" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';"><IMG NAME="submitbutton" SRC="/images/submit_boff.gif" BORDER="0" ALIGN="BOTTOM"></A>

		</td>
	</tr>
	</form>

</TABLE>
</TD></TR></TABLE>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>