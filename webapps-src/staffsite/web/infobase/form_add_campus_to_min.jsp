<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
Iterator campuses = ar.getCollection("campuses").iterator();
%>
<% String pageTitle="Add Ministry Location to " + request.getParameter("ministryName"); %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
	<br>
	<table <%=tableCenterL%> border=0 cellspacing=2 cellpadding=5>
		<form method="post" name="addCampusForm" action="/servlet/InfoBaseController">
		    <input type=hidden name="action" value="saveAddCampusToMin">
			<input type=hidden name="noncccminid" value="<%=request.getParameter("noncccminid")%>">
			<input type=hidden name="strategy" value="<%=request.getParameter("strategy")%>">
			
			<tr> 
				<td align="right"><%=fontB%>Select Ministry Location:</font></td>
				<td colspan="2" nowrap> 
					<select name="targetareaid">
						<option value="none"></option>
						<%
						//loop through each record
						while(campuses.hasNext()) {
							Hashtable h = (Hashtable)campuses.next();
						%>
								<option value="<%=h.get("TargetAreaId")%>"><%=h.get("Name")%></option>
						<%
						}
						%>
					</select>
				</td>
			</tr>

			<tr><td colspan="2"><center><br><a href="JavaScript: document.addCampusForm.submit()" onMouseOver="document.addstrategyButton.src='/images/add_bon.gif';" onMouseOut="document.addstrategyButton.src='/images/add_boff.gif';"><img name="addstrategyButton" src="/images/add_boff.gif" border="0" align="top"></a></center></td></tr>
		</table>
	</form>
<BR>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>