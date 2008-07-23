<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
%>
<%
String targetAreaID = new String (request.getParameter("targetareaid"));
String strategy = new String (request.getParameter("strategy"));

//display the form
//expand name of the current strategy type
String strategyName = new String();
if (strategy.equals("SC")) {strategyName = "Staffed Campus";}

else if (strategy.equals("FS")) {strategyName = "Field Strategies";}
else if (strategy.equals("CA")) {strategyName = "Catalytic";}
else if (strategy.equals("WS")) {strategyName = "WSN STINT";}
else if (strategy.equals("WI")) {strategyName = "WSN ICS";}
else if (strategy.equals("ID")) {strategyName = "Destino";}
else if (strategy.equals("IE")) {strategyName = "Epic";}
else if (strategy.equals("II")) {strategyName = "Impact";}
else if (strategy.equals("BR")) {strategyName = "Bridges";}
%>

<% String pageTitle="Add "+ ar.getValue("strategy") + " strategy at " + ar.getValue("targetAreaName"); %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<script>
	function submitForm() {
		if (document.addTargetAreaActivityForm.locallevelid.options[document.addTargetAreaActivityForm.locallevelid.selectedIndex].value == "") {
			alert("You must select a Missional Team.");
		}
		else {
			document.addTargetAreaActivityForm.submit();
		}
	}
</script>
	<br>
	<table cellspacing=0 cellpadding=5 border=0 align="center" <%=bgcolorL%>>
		<form method="post" name="addTargetAreaActivityForm" action="/servlet/InfoBaseController" onSubmit="return submitForm()">
			<input type=hidden name=action value="saveAddTeamToCampus">
			<input type=hidden name=validate value="go">
			<input type=hidden name="targetareaid" value="<%=targetAreaID%>">
			<input type=hidden name="strategy" value=<%=strategy%>>
			<input type=hidden name="from" value="addTeamToCampus">

			<%
			if (request.getParameter("justSet")!=null) 
				{ %> <tr <%=bgcolorL%>><td nowrap colspan=2><%=fontR%><b>Select the Missional Team that you just added to your region...</b></font></td></tr> <% }
			%>
			<tr><td	nowrap align="right"><%=fontB%>*Missional Team:</font></td>
				<td nowrap><%=fontB%>
					<select name="locallevelid">
						<option value=""></option>
						<%
						//loop through each record
						Iterator teams = ar.getCollection("teams").iterator();
						while(teams.hasNext()) {
							Hashtable h = (Hashtable)teams.next();
						%>
							<option value="<%=h.get("LocalLevelID")%>"><%=h.get("Name")%></option>
						<%
						}
						%>

					</select>**</font>
				</td>
			</tr>
			<%if (strategy.equals("CA")) { %>
				<tr>
					<td align=right valign=top><%=fontB%>Status:</font></td>
					<td nowrap><%=fontB%>
						<!-- <input type=radio name=status value=IN> INACTIVE (So a contact can be added and appear in Campus Locators.)<br> -->
						<input type=radio name=status value=FR CHECKED> FORERUNNER (person who can resource it)<br>
						<input type=radio name=status value=PI> PIONEERING (doing something to initiate ministry)<br>
						<input type=radio name=status value=KE> KEY CONTACT (student, volunteer, or partner)<br>
						<input type=radio name=status value=LA> LAUNCHED (critical mass of 10 students, staff coach, etc.) <br>
						<input type=radio name=status value=TR> TRANSFORMATIONAL COMMUNITY (50+ students or 1% of student body)<br>
						</font>
					</td>
				</tr>
			<%}%>
			<tr> 
				<td nowrap align="right"><%=fontB%>Date this strategy was<br>or will be initiated here:</font></td>
				<td align=left>
					<input type="text" name="periodbegin" size="10" maxlength="10" onFocus="this.blur()" value="<%=((today.get(Calendar.MONTH)+1)+"/"+today.get(Calendar.DATE)+"/"+today.get(Calendar.YEAR))%>">
 					&nbsp;<%=fontB%>
					<a href="javascript:pickdate(document.addTargetAreaActivityForm.periodbegin)">[select date]</font></a>
				</td>
			</tr>
			<tr <%=bgcolorL%>><td colspan="2" nowrap><center><br><tr <%=bgcolorL%>><td colspan="2" nowrap><center><br><a href="javascript:submitForm()" onMouseOver="document.addstrategyButton.src='/images/add_bon.gif';" onMouseOut="document.addstrategyButton.src='/images/add_boff.gif';" ><img name="addstrategyButton" src="/images/add_boff.gif" border="0" align="top"></a></center></td></tr></center></td></tr>
			<tr <%=bgcolorL%>>
				<td colspan=2 align=center>
					<br>
					<%=fontB%>** Can't find the right Missional Team?<br>
						Add a new Missional Team to the InfoBase here: </font>
					<%=fontB%><a href="/servlet/InfoBaseController?action=editTeam&mode=add&targetareaid=<%=targetAreaID%>&strategy=<%=strategy%>&from=addTeamToCampus">[New Team]</a><br></font><br>
				</td>
			</tr>
		</table>
	</form>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>