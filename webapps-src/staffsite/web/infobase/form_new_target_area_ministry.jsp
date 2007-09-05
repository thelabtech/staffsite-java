<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
%>
<%
String targetAreaID = new String (request.getParameter("targetareaid"));
%>

<% String pageTitle="Add non-CCC ministry at " + ar.getValue("targetAreaName"); %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<script type="text/javascript">
	function submitForm() {
		if (document.addTargetAreaMinistryForm.noncccminid.options[document.addTargetAreaMinistryForm.noncccminid.selectedIndex].value == "none") {
			alert("You must select a Ministry.");
		}
		else {
			document.addTargetAreaMinistryForm.submit();
		}
	}
</script>
	<br>
	<table cellspacing=0 cellpadding=5 border=0 align="center" <%=bgcolorL%>>
		<form method="post" name="addTargetAreaMinistryForm" action="/servlet/InfoBaseController">
			<input type=hidden name=action value="saveAddMinToCampus">
			<input type=hidden name=validate value="go">
			<input type=hidden name="targetareaid" value="<%=targetAreaID%>">

			<tr><td	nowrap align="right"><%=fontB%>Non-CCC Ministry:</font></td>
				<td nowrap><%=fontB%>
					<select name="noncccminid">
						<option value="none"></option>
						<%
						//loop through each record
						Iterator teams = ar.getCollection("ministries").iterator();
						while(teams.hasNext()) {
							Hashtable h = (Hashtable)teams.next();
						%>
							<option value="<%=h.get("NonCccMinId")%>"><%=h.get("Ministry")%>&nbsp;(Contact:&nbsp;<%=h.get("FirstName")%>&nbsp;<%=h.get("LastName")%>)</option>
						<%
						}
						%>

					</select>**</font>
				</td>
			</tr>

			<tr <%=bgcolorL%>><td colspan="2" nowrap><center><br><a href="JavaScript:submitForm()" onMouseOver="document.addstrategyButton.src='/images/add_bon.gif';" onMouseOut="document.addstrategyButton.src='/images/add_boff.gif';"><img name="addstrategyButton" src="/images/add_boff.gif" border="0" align="top"></a></center></td></tr>
			<tr <%=bgcolorL%>>
				<td colspan=2 align=center>
					<br>
					<%=fontB%>** Can't find the ministry?<br>
						Add a new ministry to the InfoBase here: </font>
					<%=fontB%><a href="/servlet/InfoBaseController?action=editNonCCCMin&mode=add&targetareaid=<%= request.getParameter("targetareaid") %>">[New Ministry]</a><br></font><br>
				</td>
			</tr>
		</table>
	</form>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>