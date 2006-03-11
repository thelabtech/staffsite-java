<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
String detail = ar.getValue("detail");
//Hashtable usage = ar.getHashtable("usage");

int total = Integer.parseInt(ar.getValue("total"));
int startAt = Integer.parseInt(ar.getValue("startAt"));
int recsPerPage = Integer.parseInt(ar.getValue("recsPerPage"));

Collection list = ar.getCollection("list");
Iterator mostRecent = list.iterator();
int showingRecs = list.size();

int prev = (startAt > recsPerPage) ? recsPerPage : startAt -1;
int next = (total - (startAt+recsPerPage-1) > recsPerPage) ? recsPerPage : total - (startAt +recsPerPage-1);
int startAtPrev = startAt - (prev<recsPerPage ? prev : recsPerPage);
int startAtNext = startAt + recsPerPage ;
%>


<html>
<head>
<title>Usage Report</title>
<% int curr_tab = 3; %>
<%@ include file="/header.jspf" %>

<form method="POST" action="/servlet/SuggestionsController?action=addSuggestion">

<BR>
<table width="100%" border="0" cellspacing="2" align="center">
	<tr>
		<td STYLE="border-width:1; border-style: solid; border-color: #002244; background-color: #336699; color: #FFFFFF; font-family: Arial, Tahoma" colspan=4><b>Browse existing suggestions</b></td>
	</tr>
	<tr>
		<td STYLE="border-width:1; border-style: solid; border-color: #002244; background-color: #336699; color: #FFFFFF; font-family: Arial, Tahoma">&nbsp;<b>Summary</b></td>
		<td STYLE="border-width:1; border-style: solid; border-color: #002244; background-color: #336699; color: #FFFFFF; font-family: Arial, Tahoma">&nbsp;<b>Entered By</b></td>
		<td STYLE="border-width:1; border-style: solid; border-color: #002244; background-color: #336699; color: #FFFFFF; font-family: Arial, Tahoma">&nbsp;<b>Date Entered</b></td>
		<td STYLE="border-width:1; border-style: solid; border-color: #002244; background-color: #336699; color: #FFFFFF; font-family: Arial, Tahoma">&nbsp;<b>Votes</b></td>
	</tr>


	<% 
	while(mostRecent.hasNext()) {
		Hashtable suggestion = (Hashtable)mostRecent.next();
		String tbgc = (suggestion.get("suggestionID").equals(detail) ? "#FFFFEE" : "#EEEEFF");
	%>
	<tr BGCOLOR="<%= tbgc %>">
		<td STYLE="border-width:1; border-style: solid; border-color: #CCDEFF; font-family: Arial, Tahoma; font-size: 10pt">
			&nbsp;
	
<%		if(!suggestion.get("suggestionID").equals(detail)) {	%>
				<a href="/servlet/SuggestionsController?action=showSuggestionList&detail=<%=suggestion.get("suggestionID")%>">
				<%=suggestion.get("title")%>
				</a>
<%		} else { %>
				<B><%=suggestion.get("title")%></B>
<%		} %>

		</td>

		<td STYLE="border-width:1; border-style: solid; border-color: #CCDEFF; font-family: Arial, Tahoma; font-size: 10pt">
			&nbsp;<%=suggestion.get("submittedBy")%>&nbsp;
		</td>
		<td STYLE="border-width:1; border-style: solid; border-color: #CCDEFF; font-family: Arial, Tahoma; font-size: 10pt">
			&nbsp;<%=suggestion.get("dateSubmitted")%>&nbsp;
		</td>
		<td STYLE="border-width:1; border-style: solid; border-color: #CCDEFF; font-family: Arial, Tahoma; font-size: 10pt">
			<%=suggestion.get("count")%>&nbsp;<a href="/servlet/SuggestionsController?action=incrementCount&startAt=<%=startAt%>&suggestionID=<%=suggestion.get("suggestionID")%>">Add a vote</A>
		</td>

	</tr>
<%		
		if(suggestion.get("suggestionID").equals(detail)) {
%>
	<tr>
		<td ALIGN="RIGHT" STYLE="font-family: Arial, Tahoma; font-size: 10pt">Description:&nbsp;
		</td>
		<td colspan=3 STYLE="font-family: Arial, Tahoma; font-size: 10pt">
			<%=suggestion.get("description")%> 
		</td>
	</tr>
<%
		}
%>
	<%
	}
	%>
</table>
<%if(prev>0) {%>
	<a href="/servlet/SuggestionsController?action=showSuggestionList&startAt=<%=startAtPrev%>">Previous <%=prev%></A>
<%} else {%>
	<font color=gray>Previous <%=recsPerPage%></font>
<%}%>
&nbsp;&nbsp;
<%if(total>0) {%>
(Showing <%=startAt%> to <%=startAt+showingRecs-1%> of <%=total%>)
<%} else {%>
No results
<%}%>
&nbsp;&nbsp;
<%if(next>0) {%>
	<a href="/servlet/SuggestionsController?action=showSuggestionList&startAt=<%=startAtNext%>">Next <%=next%></A>
<%} else {%>
	<font color=gray>Next <%=recsPerPage%></font>
<%}%>
	
<BR><BR>
<a href="/servlet/SuggestionsController?action=showHome">Enter a Suggestion!</A>


<%@ include file="/footer.jspf" %>
</html>