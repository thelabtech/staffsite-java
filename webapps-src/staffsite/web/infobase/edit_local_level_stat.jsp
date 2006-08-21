<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
	ActionResults ar; 
	ar = ActionResults.getActionResults(session);
	Hashtable<String, Integer> statistic = new Hashtable<String, Integer>();
	String current = request.getParameter("current");
	
	if(ar.getHashtable("statistic") == null){
		statistic.put("Decisions", 0);
		statistic.put("MediaExposures", 0);
		statistic.put("PersonalEvangelismExposures", 0);
		statistic.put("GroupEvangelismExposures", 0);
		statistic.put("LaborersSent", 0);
				
		statistic.put("GrowthGroupMembers", 0);
		statistic.put("Multipliers", 0);
		statistic.put("StudentLeaders", 0);
		statistic.put("InvolvedStudents", 0);

	} else {
		Hashtable<String, Integer> editStat = (Hashtable<String, Integer>) ar.getHashtable("statistic");
		
		if (current.equals("true"))
		{
			statistic.put("Decisions", editStat.get("Decisions"));
			statistic.put("MediaExposures", editStat.get("MediaExposures"));
			statistic.put("PersonalEvangelismExposures", editStat.get("PersonalEvangelismExposures"));
			statistic.put("GroupEvangelismExposures", editStat.get("GroupEvangelismExposures"));
			statistic.put("LaborersSent", editStat.get("LaborersSent"));
		} else {
			statistic.put("Decisions", 0);
			statistic.put("MediaExposures", 0);
			statistic.put("PersonalEvangelismExposures", 0);
			statistic.put("GroupEvangelismExposures", 0);
			statistic.put("LaborersSent", 0);
		}
		
		statistic.put("GrowthGroupMembers", editStat.get("GrowthGroupMembers"));
		statistic.put("Multipliers", editStat.get("Multipliers"));
		statistic.put("StudentLeaders", editStat.get("StudentLeaders"));
		statistic.put("InvolvedStudents", editStat.get("InvolvedStudents"));
		
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
				<tr><th <%=tableRightB%> colspan=3><%=fontW3%>This Week's Criteria</font></th></tr>
				<tr align="left" valign="middle">
					<th><%=fontB%>Media Exposures</font></th>
					<td><input type="text" name="MediaExposures" value="<%=statistic.get("MediaExposures")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>How many people have been exposed to significant gospel content with opportunities to respond in the last month through media exposures? (For instance: everystudent.com; FSKs; Bible, book or magazine giveaways; etc.)</font></i></td>
				</tr>
				<tr align="left" valign="middle">
					<th><%=fontB%>Personal Evangelism</font></th>
					<td><input type="text" name=PersonalEvangelismExposures value="<%=statistic.get("PersonalEvangelismExposures")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>How many people have heard the gospel through personal evangelism? (Include both staff and student evangelism.)</font></i></td>
				</tr>
				<tr align="left" valign="middle">
					<th><%=fontB%>Group Evangelism</font></th>
					<td><input type="text" name="GroupEvangelismExposures" value="<%=statistic.get("GroupEvangelismExposures")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>What was the total number of people who heard the gospel through group evangelism? (For instance: team meetings; evangelistic presentations; etc.)</font></i></td>
				</tr>
				<tr align="left" valign="middle"> 
					<th><%=fontB%>Decisions for Christ</font></th>
					<td><input type="text" name="Decisions" value="<%=statistic.get("Decisions")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>How many people have indicated a decision to receive Christ as their Savior and Lord?</font></i></td>
				</tr>

			</table>
			<br>
			<table width="100%" border="0" cellpadding="5" cellspacing="1" <%=bgcolorW%>>
				<tr><th <%=tableRightB%> colspan=3><%=fontW3%>Campus Snapshot (Demographics)</font></th></tr>
				<% if (current.equals("false")) {%> <tr><th <%=bgcolorL%> colspan=3><%=fontB1%>The fields below are prefilled with the most recently entered numbers. If these numbers have changed, please update them below.</font></th></tr><%}%>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Growth Group Members</font></th>
					<td><input type="text" name="GrowthGroupMembers" size="10" value="<%=statistic.get("GrowthGroupMembers")%>" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Number of students involved in being followed up and beginning to grow in relationship with Christ</font></i>
					</td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Multipliers</font></th>
					<td><input type="text" name="Multipliers" size="10" value="<%=statistic.get("Multipliers")%>" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>How many students are currently involved in spiritual multiplication at the most organic level? That is: (a) seeking to grow in Christ; and (b) seeking to share their faith and pass on to others the foundational concepts of the Christian living they are receiving?</font></i>
					</td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle">
					<th><%=fontB%>Student Leaders</font></th>
					<td><input type="text" name="StudentLeaders" size="10" value="<%=statistic.get("StudentLeaders")%>" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>How many student leaders are leading small groups of win/build/send ministry?</font></i>
					</td>
				</tr>
				<tr <%=bgcolorL%> align="left" valign="middle"> 
					<th><%=fontB%>Students Involved</font></th>
					<td><input type="text" name="InvolvedStudents" size="10" value="<%=statistic.get("InvolvedStudents")%>" onBlur="isInteger(this, this.value)"></td>
					<td><i><%=fontB1%>How many students are regularly involved in Campus Crusade for Christ?</font></i>
					</td>
				</tr>
			</table>
			<br>
			<table width="100%" cellpadding="5" cellspacing="1" <%=bgcolorL%>>
				<tr><th <%=tableRightB%> colspan=3><%=fontW3%>Laborers Sent</font></th></tr>
				<tr align="left" valign="middle">
					<th><%=fontB%></font></th>
					<td><input type="text" name="LaborersSent" value="<%=statistic.get("LaborersSent")%>" size="10" onBlur="isInteger(this, this.value)"></td>
					<td width="90%"><i><%=fontB1%>Number of multiplying disciples who commit to love and serve God with his/her whole heart for life; fulfilling a personal strategy to help fulfill the Great Commission.<br>
This number includes:<br>

   1. Full-time staff<br>
   2. Associate/Volunteer staff<br>
   3. Full-time Christian work with another organization besides Campus Crusade for Christ<br>
   4. Person who is actively involved in fulfilling the Great Commission wherever they serve.<br>
</font></i></td>
				</tr>

			</table>
			
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