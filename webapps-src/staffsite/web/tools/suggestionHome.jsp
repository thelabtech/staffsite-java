<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
String detail = ar.getValue("detail");
//Hashtable usage = ar.getHashtable("usage");

%>


<html>
<head>
<title>Usage Report</title>
<% int curr_tab = 3; %>
<%@ include file="/header.jspf" %>

<form method="POST" action="/servlet/SuggestionsController?action=addSuggestion">

<BR>
<table width="100%" border="0" cellspacing="2" align="center" height="118">
	<tr>
		<td colspan=2 STYLE="border-width:1; border-style: solid; border-color: #002244; background-color: #336699; color: #FFFFFF; font-family: Arial, Tahoma">&nbsp;<b>Please enter a suggestion</b></td>
	</tr>
    <tr>
		<td height="23">Summary:</td>
		<td height=23><input type="text" name="title" size="82"></td>
    </tr>
    <tr>
		<td height="62">Description:</td>
		<td height="62"><textarea rows="3" name="description" cols="70"></textarea></td>
    </tr>
    <tr>
		<td height="62">Your name:</td>
		<td height="62"><input type="text" name="name" size="25" value="<%=ar.getValue("name")%>"> (leave blank if you want to remain
          anonymous)</td>
    </tr>
	<tr>
		<td height="62"></td>
		<td height="62"><input type="submit" value="Submit" name="B1"></td>
	</tr>
</table>
</form>

<%
	Hashtable entry;
	if((entry=ar.getHashtable("mostRecent"))!=null){
%>
		The most recent suggestion was from <%=entry.get("submittedBy")%>, dated <%=entry.get("dateSubmitted")%>:
		<BR>
		Title: <I><font color="blue"><%=entry.get("title")%></font></I>
		<BR>
		Description: <I><font color="blue"><%=entry.get("description")%></font></I>
		<BR><BR>
<%	
	}
	if((entry=ar.getHashtable("mostPopular"))!=null){
%>
		The most voted on suggestion was from <%=entry.get("submittedBy")%>, dated <%=entry.get("dateSubmitted")%>, with <%=entry.get("count")%> votes:
		<BR>
		Title: <I><font color="blue"><%=entry.get("title")%></font></I>
		<BR>
		Description: <I><font color="blue"><%=entry.get("description")%></font></I>
		<BR><BR>
<%
	}
%>

<br>

<a href="/servlet/SuggestionsController?action=showSuggestionList">Browse Existing Suggestions</A>

<!--pupWindow('/servlet/SuggestionsController?action=showSuggestionList', 'browseSuggestions', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><img src="/images/small_question.gif" border='0'>Browse existing suggestions!</a><br>
!-->

<%@ include file="/footer.jspf" %>
</html>