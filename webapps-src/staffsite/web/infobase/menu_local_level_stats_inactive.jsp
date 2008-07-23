<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
	ActionResults ar;
	ar = ActionResults.getActionResults(session);
	Collection statistics = ar.getCollection("statistics");
%>
<% String pageTitle="Inactive Movement";%>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>


<table width="100%" cellpadding=0 cellspacing=0>
	<tr>
		<td align="right" valign="middle">
		<form name=bookmarkForm action='/servlet/InfoBaseController' method='post'>
		<input type=hidden name="action" value="removeInactiveBookmark">
		<input type=hidden name="displayname" value="<%= ar.getValue("displayname") %>">
		<input type=hidden name="type" value="statistic">
		<input type=hidden name="value" value="/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid=<%= ar.getValue("activityid") %>&targetareaid=<%= ar.getValue("targetareaid") %>">
		<input type=hidden name="activityid" value="<%= ar.getValue("activityid") %>">
<%
	   String mode;
		if(!((String)ar.getValue("bookmarkID")).equals("")) {
			mode = "remove";
			out.print("<INPUT TYPE=HIDDEN NAME=targetareaid VALUE=\"" + ar.getValue("targetareaid") + "\">");
		}
		else
			mode = "add";
%>

		<INPUT TYPE=hidden name="bookmarkid" value="<%= ar.getValue("bookmarkID") %>">
		<INPUT TYPE=hidden name="mode" value="<%= mode %>">
		</form>
		
		</TD>
	</TR>
	<TR>
	</TR>
</TABLE>
<P>
<CENTER>
<%=fontB3%><b><%=(String)ar.getValue("displayname")%> Success Criteria </b></font><br><%=fontB%>This movement has been inactivated and success criteria may not be entered. <br>If you arrived here by a Bookmark, there may be a newer version of this Missional Team in the Infobase.
<br><br>
<A HREF="javascript: document.bookmarkForm.submit();"><% if(mode == "remove") { %>Un-<% } %>Bookmark this movement</A>
</font></center><br>
</font>

<%@ include file="/infobase/ibfooter.jspf" %>
