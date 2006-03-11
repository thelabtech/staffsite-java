<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>

<HTML>
<HEAD>
<TITLE> Query Results </TITLE>
<%@ include file="hrheader.jspf" %>

<%
  ActionResults ar = ActionResults.getActionResults(session);
  out.print("<!--" + ar.toHTML() + "-->");
  String queryID = ar.getValue("queryID");
  int start = Integer.parseInt(ar.getValue("start"));
	int end = Integer.parseInt(ar.getValue("end"));
  int total = Integer.parseInt(ar.getValue("total"));
%>

<CENTER>
<FORM NAME="fieldForm" ACTION="/servlet/HRQueryController">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="executeQuery">
<INPUT TYPE="HIDDEN" NAME="queryID" VALUE="<%= queryID %>">
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0 WIDTH="80%">
<TR><TD ALIGN="CENTER">
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0>
<%
  Collection results = ar.getCollection("queryResults");
	Iterator resultsI = results.iterator();
	if(!resultsI.hasNext()) {
		%><TR><TD ALIGN="CENTER">Your search returned no results.</TD></TR><%
	}
	else { // display the header row
		%>
      <TR> <%
	  Map row = (Map)resultsI.next();
		Iterator keys = row.keySet().iterator();
		String thisKey;
		while(keys.hasNext()) { 
			thisKey = (String)keys.next();
			%>
			<TD CLASS="div">&nbsp;<%= thisKey %></TD>
			<%
		}
		out.print("</TR>");
		resultsI = results.iterator();
		while(resultsI.hasNext()) {
			out.print("<TR>");
			Map thisRow = (Map)resultsI.next();
			keys = row.keySet().iterator();
			while(keys.hasNext()) {
				out.print("<TD>");
				out.print("&nbsp;" + thisRow.get(keys.next()));
				out.print("</TD>");
			}
			out.print("</TR>");
		}
	}
	%>
</TABLE>
</TD></TR></TABLE>

<% 
	if(start>9) {
%>
		<a href="/servlet/HRQueryController?action=showQueryResults&queryID=<%= queryID %>&from=<%= Integer.toString(start-10) %>">Previous 10</a>
<%
}	else {
%>Previous 10 <%
}
	if (total > 0) 
		out.print("&nbsp;<B>Showing results " + (start+1) + " to " + (end+1) + " of " + total + "</B>&nbsp;");
	else
		out.print("&nbsp;<B>No results</B>&nbsp;");
		
	if(end < total-1)
		out.print("<a href=\"/servlet/HRQueryController?action=showQueryResults&queryID="+queryID+"&from="+Integer.toString(start+10)+"\">Next 10</a>");
	else
		out.print("Next 10");

%>
<P>
<a href="/servlet/HRQueryController?action=showStaffQuery">New Query</a>

</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>