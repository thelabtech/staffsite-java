<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="status" class="org.alt60m.html.SelectStatus" />
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
String activityID = new String (ar.getValue("activityid"));
String targetAreaID = new String (request.getParameter("targetareaid"));
String strategy = new String (request.getParameter("strategy"));
String currentTeamID = new String (request.getParameter("locallevelid"));
String referrer = new String (request.getParameter("referrer"));

//expand name of the current strategy type
String strategyName = new String();
if (request.getParameter("strategy").equals("SC")) {strategyName = "Staffed Campus";}
else if (strategy.equals("CA")) {strategyName = "Catalytic";}
else if (strategy.equals("WS")) {strategyName = "WSN STInt";}
else if (strategy.equals("WI")) {strategyName = "WSN ICS";}
else if (strategy.equals("ID")) {strategyName = "Destino";}
else if (strategy.equals("IE")) {strategyName = "Epic";}
else if (strategy.equals("II")) {strategyName = "Impact";}
else if (strategy.equals("BR")) {strategyName = "Bridges";}
%>
<%
String pageTitle= "Update "+ request.getParameter("strategy") + " strategy at " + ar.getValue("targetareaname"); %>
<html>
<head>
<title><%= pageTitle %></title>
<STYLE>
<!--
.definition {
	background-color: #FFFFFF;
	border-style: solid;
	border-width: 1;
	border-color: #003366;
}
-->
</STYLE>
<script language="javascript">
var active = "Indicates that the campus has an active CCC<BR>movement, usually with ten or more students.";
var inactive = "Indicates that there is currently no active<BR>Campus Ministry strategy or potential<BR>student leader on the campus.";
var pioneering = "Catalytic is actively doing something<BR>to start a ministry on this campus.";
var keycontact = "Catalytic has found a key contact on this<BR>campus - student, volunteer, or partner.";
var launched = "Catalytic has a critical mass of ten<BR>students, staff coach, etc.";
var transformational = "Movement of 50 or more students<BR>involved, or 1% of the student body.";
var forerunner = "Catalytic has a person who can resource<BR>this campus to move it to the next level.";
var staffed = "There are staff assigned to this campus<BR>who report through the Staffed Campuses lane.";
var empty = "";

function setDefinition(setTo) {

// if (NS) {
//    with (document["definition"].document) {
//      open();
//      write(setTo);
//      close();
//}
//  } else {
    document.all["definition"].innerHTML = setTo;
//  }

}
</SCRIPT>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<br>

<table cellspacing=0 cellpadding=5 border=0 align="center" <%=bgcolorL%>>
	<form name="updateActivityForm" method="post" action="/servlet/InfoBaseController">
	<input type=hidden name="action" value="saveEditActivity">
	<input type=hidden name="validate" value="go">
	<input type=hidden name="activityid" value="<%=activityID%>">
	<input type=hidden name="strategy" value=<%=strategy%>>
	<input type=hidden name="referrer" value=<%=referrer%>>
	<input type=hidden name="locallevelid" value=<%=request.getParameter("locallevelid")%>>
	<input type=hidden name="targetareaid" value=<%=request.getParameter("targetareaid")%>>
	<input type=hidden name="from" value="editActivity">
	
	<%
	if (request.getParameter("justset")!=null)
		{ %> <tr <%=bgcolorL%>><td nowrap colspan=2><%=fontR%><b>You have just added a new team to the InfoBase. To assign it to <%= ar.getValue("targetareaname") %>,<br> select it from the pull-down menu below and click "ok"</b></font></td></tr> <% }
	%>
	<tr><td align="left" COLSPAN="2">
	<%=fontB%><b>Use the radio buttons to change the status below:<BR>
<BR>
</b></font></td></tr>
	<%if (request.getParameter("strategy").equals("SC")) { %>
		<tr>
			<td>
				<%=fontB%>
				<b>This campus is a(n)...</B><BR>
	
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"sc":"nc CHECKED"%>><SPAN NAME="active" onMouseOver="setDefinition(active)" onMouseOut="setDefinition(empty)">ACTIVE</SPAN> Staffed campus.<br>
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"nc CHECKED":"rm"%>> <SPAN NAME="inactive" onMouseOver="setDefinition(inactive)" onMouseOut="setDefinition(empty)">INACTIVE</SPAN> campus.<br>
				<input type=radio name=updateoption value=FR> <SPAN NAME="forerunner" onMouseOver="setDefinition(forerunner)" onMouseOut="setDefinition(empty)">FORERUNNER</SPAN> Catalytic campus.<br>
				<input type=radio name=updateoption value=PI> <SPAN NAME="pioneering" onMouseOver="setDefinition(pioneering)" onMouseOut="setDefinition(empty)">PIONEERING</SPAN> Catalytic campus.<br>
				<input type=radio name=updateoption value=KE> <SPAN NAME="keycontact" onMouseOver="setDefinition(keycontact)" onMouseOut="setDefinition(empty)">KEY CONTACT</SPAN> Catalytic campus.<br>
				<input type=radio name=updateoption value=LA> <SPAN NAME="launched" onMouseOver="setDefinition(launched)" onMouseOut="setDefinition(empty)">LAUNCHED</SPAN> Catalytic campus.<br>
				<input type=radio name=updateoption value=TR> <SPAN NAME="transformational" onMouseOver="setDefinition(transformational)" onMouseOut="setDefinition(empty)">TRANSFORMATIONAL</SPAN> Catalytic campus.<br>
				</font>
			</td>
	<%}%>
	<%if (request.getParameter("strategy").equals("CA")) { %>
		<tr>
			<td>
				<%=fontB%>
				<b>This campus is a(n)...</B><BR>
					<%
					status.setName("status");
					status.setCurrentValue((String)ar.getValue("status"));
					%><%=status.printRadio()%>
				<input type=radio name=updateoption value=sc> <SPAN NAME="active" onMouseOver="setDefinition(staffed)" onMouseOut="setDefinition(empty)">STAFFED</SPAN> campus.<br>
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"nc CHECKED":"rm"%>> <SPAN NAME="inactive" onMouseOver="setDefinition(inactive)" onMouseOut="setDefinition(empty)">INACTIVE</SPAN> campus.<br>
				</font>
			</td>
	<%}%>
	<%if (request.getParameter("strategy").equals("WS")) { %>
		<tr>
			<td>
				<%=fontB%>
				<b>This campus is a(n)...</B><BR>
				<input type=radio name=updateoption value=nc CHECKED> <SPAN NAME="active" onMouseOver="setDefinition(active)" onMouseOut="setDefinition(empty)">ACTIVE</SPAN>WSN STInt campus.<br>
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"nc CHECKED":"rm"%>> <SPAN NAME="inactive" onMouseOver="setDefinition(inactive)" onMouseOut="setDefinition(empty)">INACTIVE</SPAN> campus.<br>
				</font>
			</td>
	<%}%>
	<%if (request.getParameter("strategy").equals("WI")) { %>
		<tr>
			<td>
				<%=fontB%>
				<b>This campus is a(n)...</B><BR>
				<input type=radio name=updateoption value=nc CHECKED> <SPAN NAME="active" onMouseOver="setDefinition(active)" onMouseOut="setDefinition(empty)">ACTIVE</SPAN> WSN ICS campus.<br>
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"nc CHECKED":"rm"%>> <SPAN NAME="inactive" onMouseOver="setDefinition(inactive)" onMouseOut="setDefinition(empty)">INACTIVE</SPAN> campus.<br>
				</font>
			</td>
	<%}%>
	<%if (request.getParameter("strategy").equals("ID")) { %>
		<tr>
			<td>
				<%=fontB%>
				<b>This campus is a(n)...</B><BR>
				<input type=radio name=updateoption value=nc CHECKED> <SPAN NAME="active" onMouseOver="setDefinition(active)" onMouseOut="setDefinition(empty)">ACTIVE</SPAN> Destino campus.<br>
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"nc CHECKED":"rm"%>> <SPAN NAME="inactive" onMouseOver="setDefinition(inactive)" onMouseOut="setDefinition(empty)">INACTIVE</SPAN> campus.<br>
				</font>
			</td>
	<%}%>
	<%if (request.getParameter("strategy").equals("IE")) { %>
		<tr>
			<td>
				<%=fontB%>
				<b>This campus is a(n)...</B><BR>
				<input type=radio name=updateoption value=nc CHECKED> <SPAN NAME="active" onMouseOver="setDefinition(active)" onMouseOut="setDefinition(empty)">ACTIVE</SPAN> Epic campus.<br>
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"nc CHECKED":"rm"%>> <SPAN NAME="inactive" onMouseOver="setDefinition(inactive)" onMouseOut="setDefinition(empty)">INACTIVE</SPAN> campus.<br>
				</font>
			</td>
	<%}%>
	<%if (request.getParameter("strategy").equals("II")) { %>
		<tr>
			<td>
				<%=fontB%>
				<b>This campus is a(n)...</B><BR>
				<input type=radio name=updateoption value=nc CHECKED> <SPAN NAME="active" onMouseOver="setDefinition(active)" onMouseOut="setDefinition(empty)">ACTIVE</SPAN> Impact campus.<br>
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"nc CHECKED":"rm"%>> <SPAN NAME="inactive" onMouseOver="setDefinition(inactive)" onMouseOut="setDefinition(empty)">INACTIVE</SPAN> campus.<br>
				</font>
			</td>
	<%}%>
	<%if (request.getParameter("strategy").equals("BR")) { %>
		<tr>
			<td>
				<%=fontB%>
				<b>This campus is a(n)...</B><BR>
				<input type=radio name=updateoption value=nc CHECKED> <SPAN NAME="active" onMouseOver="setDefinition(active)" onMouseOut="setDefinition(empty)">ACTIVE</SPAN> Bridges campus.<br>
				<input type=radio name=updateoption value=<%=("IN".equals((String)ar.getValue("status")))?"nc CHECKED":"rm"%>> <SPAN NAME="inactive" onMouseOver="setDefinition(inactive)" onMouseOut="setDefinition(empty)">INACTIVE</SPAN> campus.<br>
				</font>
			</td>
	<%}%>
			<TD>
						<TABLE BORDER="0" CELLPADDING="3" CELLSPACING="0"><TR><TD CLASS="definition"><%=font%><SPAN ID="definition">Move your mouse pointer over a <BR>capitalized word to see a short explanation.</SPAN></FONT></TD></TR></TABLE>
			</TD>
		</TR>
	<tr>
		<td	align="left" COLSPAN="2">
			<%=fontB%><b>To change the team that is responsible for this campus, select the name of the new team from this menu.</b>
			</font>
		</td>
	</tr>
	<tr>
		<td nowrap align=left COLSPAN="2"><%=fontB%>
			<select name="teamid">
				<option value="none"></option>
				<%
				//loop through each record
				Iterator teams = ar.getCollection("teams").iterator();
				while(teams.hasNext()) {
					Hashtable h = (Hashtable)teams.next();
				%>
					<option value="<%=h.get("LocalLevelId")%>"><%=h.get("Name")%></option>
				<%
				}
				%>
			</select>**</font><br>
			<%=fontB%>** Can't find the right local level team?  Propose one to be entered here: </font>
			<%=fontB%><a href="/servlet/InfoBaseController?action=proposeNewLocalLevel">[New Team]</a></font>
		</td>
	</tr>
	<tr> 
		<td nowrap align=left COLSPAN="2">
			<%=fontB%><b>If this strategy is becoming inactive, what date did/will this change take place?</b></font>
		</td>
	</tr>

	<tr>
		<td align=left COLSPAN="2">
			<input type="text" name="datechanged" size="10" maxlength="10" onFocus="this.blur()" value="<%=((today.get(Calendar.MONTH)+1)+"/"+today.get(Calendar.DATE)+"/"+today.get(Calendar.YEAR))%>">
			&nbsp;<%=fontB%>
			<a href="javascript:pickdate(document.updateActivityForm.datechanged)">[select date]</font></a>
		</td>
	</tr>
	<tr><td colspan="2" align="center" nowrap><br><a href="JavaScript:document.updateActivityForm.submit()" onMouseOver="document.updateStrategyButton.src='/images/ok_bon.gif';" onMouseOut="document.updateStrategyButton.src='/images/ok_boff.gif';"><img name="updateStrategyButton" src="/images/ok_boff.gif" border="0" align="top"></a></td></tr>
	</table>
	</form>
<p>


<!-- <%=fontB%><%=ar.toHTML()%> -->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>