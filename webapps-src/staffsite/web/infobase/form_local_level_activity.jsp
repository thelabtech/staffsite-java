<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
String campuses = (String)ar.getValue("campuses");
%>
<% String pageTitle="Add "+ ar.getValue("strategy") +" strategy to " + ar.getValue("teamName"); %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<script>
	function submitForm() {
		if (document.addLocalLevelActivityForm.targetareaid.options[document.addLocalLevelActivityForm.targetareaid.selectedIndex].value == "none") {
			alert("You must select a Ministry Location.");
		}
		else {
			document.addLocalLevelActivityForm.submit();
		}
	}
</script>
	<br>
	<table <%=tableCenterL%> border=0 cellspacing=2 cellpadding=5>
		<form method="post" name="addLocalLevelActivityForm" action="/servlet/InfoBaseController">
		    <input type=hidden name="action" value="saveActivity">
			<input type=hidden name="locallevelid" value="<%=request.getParameter("locallevelid")%>">
			<input type=hidden name="strategy" value="<%=ar.getValue("strategy")%>">
			
		<!-- Brock asks, "what is this line for?" 	if (request.getParameter("justSet")!=null) { <tr><td nowrap colspan=2><fontR><b>Select the local level team that you just added to your region...</b></font></td></tr>  } -->
			
			<tr> 
				<td align="right"><%=fontB%>Ministry Location:<br>(in Missional Team's region<br>or partnership)</font></td>
				<td colspan="2" nowrap> 
					<select name="targetareaid">
						<option value="none"></option>
						<%=campuses %>
						//loop through each record
						
					</select>
				</td>
			</tr>
			<tr> 
				<td align="right"></td>
				<td colspan="2" nowrap> 
					<%=fontB%>This pull-down menu is the list of Ministry Locations in the Missional Team's region<br>
					that do not have an active <%=ar.getValue("strategy")%> strategy. If you would like <br>
					to add a Ministry Location that is not in this list, please do the following:
					<ol>
						<li>Go to the Ministry Location's detail page (you can do this by typing the Ministry Location's<br>
						name in the "search" box in the upper right-hand corner of this screen and<br>
						clicking the "search" button).
						<li>Click the "change" link in the status box for the existing <%=ar.getValue("strategy")%> strategy.
						<li>Use the pull-down menu of Missional Teams to select the team that you want to <br>
						be associated with this Ministry Location.
					</ol></font>
				</td>
			</tr>
			<%
			if (ar.getValue("strategy").equals("CA")) {
				//radios
				%>
				<tr>
					<td align=right><%=fontB%>Status:</font></td>
					<td nowrap><%=fontB%>
						<input type=radio name=status value=FR CHECKED> Make this a FORERUNNER Ministry Location.<br>
						<input type=radio name=status value=PI> Make this a PIONEERING  Ministry Location.<br>
						<input type=radio name=status value=KE> Make this a KEY CONTACT  Ministry Location.<br>
						<input type=radio name=status value=LA> Make this a LAUNCHED  Ministry Location.<br>
						<input type=radio name=status value=TR> Make this a TRANSFORMATIONAL  Ministry Location.<br></font>
					</td>
				</tr>
			<%
			} else {
				//set to active
				%><input type=hidden name="status" value="AC"><%
			}
			%>

			<tr> 
				<td nowrap align="right"><%=fontB%>Date this strategy was<br>or will be initiated here:</font></td>
				<td nowrap><input type="text" name="periodbegin" size="10" maxlength="10" onFocus="this.blur()" value="<%=((today.get(Calendar.MONTH)+1)+"/"+today.get(Calendar.DATE)+"/"+today.get(Calendar.YEAR))%>"> <%=fontB%><a href="javascript:pickdate(document.addLocalLevelActivityForm.periodBegin)"> [select date]</font></a></td>
			</tr>
			<tr> 
				<td nowrap align="right"><%=fontB%>URL for this local strategy:</font></td>
				<td nowrap><input type="text" name="url" size="40" maxlength="40" value=""> <%=fontB%></td>
			</tr>
			<tr><td colspan="2"><center><br><a href="JavaScript: submitForm()" onMouseOver="document.addstrategyButton.src='/images/add_bon.gif';" onMouseOut="document.addstrategyButton.src='/images/add_boff.gif';"><img name="addstrategyButton" src="/images/add_boff.gif" border="0" align="top"></a></center></td></tr>
		</table>
	</form>
<BR>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>