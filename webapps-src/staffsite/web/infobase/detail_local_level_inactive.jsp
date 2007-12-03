<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
  Hashtable teamTable = ar.getHashtable("team");
	String teamName = (String)teamTable.get("Name");
	String teamID = (String)teamTable.get("LocalLevelId");
	
%>
<html>
<head>
<title><%=teamName%>&nbsp;Details (Team Now Inactive)</title>
</head>

<% String pageTitle = "Inactive Team"; %>
<%@ include file="/infobase/ibheader.jspf" %>
				<form name=bookmarkForm action='/servlet/InfoBaseController' method='post'>
				    <input type=hidden name="action" value="removeInactiveBookmark">
						<input type=hidden name="displayname" value="<%= teamName %>">
						<input type=hidden name="type" value="locallevel">
						<input type=hidden name="locallevelid" value="<%= teamID %>">
						<input type=hidden name="value" value="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= teamID %>">
						<% 
								String mode;
								if(!ar.getValue("bookmarkID").equals("")) {
									mode = "remove";
								} else {
										mode = "add";
									}
							%>
						<INPUT TYPE=hidden name="bookmarkid" value="<%= ar.getValue("bookmarkID") %>"> 
						<INPUT TYPE=hidden name="mode" value="<%= mode %>">
				</form>

				<P ALIGN="CENTER">
				<center><%=fontB3%><b>
<%=teamName%> is currently inactive.</b></font> <br>
<br><%=fontB%>If you reached this page through a Bookmark, there may be a new version of this team in the Infobase. 
<br>If you have reason to think this is an error, please contact the leadership of this team.
<br><br>
<A HREF="javascript: document.bookmarkForm.submit();"><% if(mode == "remove") { %>Un-<% } %>Bookmark this team</A>
</font></center><br>
				
			<%=box.printBottom()%>
<BR>

	<TD VALIGN="TOP">
 
	
	
</TD></TR></TABLE>
	    <!--<%=fontB%><%=ar.toHTML()%></font> -->
<br>

<%@ include file="/infobase/ibfooter.jspf" %>
</html>