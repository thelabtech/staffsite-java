<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
	ActionResults ar;
	ar = ActionResults.getActionResults(session);
	Collection statistics = ar.getCollection("statistics");
%>
<% String pageTitle="Entering Success Criteria";%>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>
<TABLE width="100%">
	<TR>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Entering Success Criteria</a></font></TD>
	</TR>
</TABLE>

<table width="100%" cellpadding=0 cellspacing=0>
	<tr>
		<td align="right" valign="middle">
		<form name=bookmarkForm action='/servlet/InfoBaseController' method='post'>
		<input type=hidden name="action" value="changeBookmark">
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
		<A HREF="javascript: document.bookmarkForm.submit()"><%=fontB%><NOBR><% if(mode.equals("remove")){ out.print("Un-"); } %>Bookmark <%= ar.getValue("displayname") %>'s Success Criteria Page</NOBR></FONT></A></B>
		</TD>
	</TR>
	<TR>
	</TR>
</TABLE>
<P>
<CENTER>
<%=fontB3%><b><%=(String)ar.getValue("displayname")%> Success Criteria</b></font>
<TABLE WIDTH="90%" CELLPADDING="3" CELLSPACING="1" BORDER="1">
<TR>
<%
	// print dates
	Iterator slist = statistics.iterator();
	int counter = 0;
	while(slist.hasNext()){
		Hashtable criteria = (Hashtable)slist.next();
		boolean tempBool = true;
		if(counter%2 == 0) tempBool = false;
%>
		<TD <%=tempBool ? bgcolorW : bgcolorL%> ALIGN="CENTER"><%=fontB%>
			<%=criteria.get("PeriodBeginShort")%><BR>
			to<BR>
			<%=criteria.get("PeriodEndShort")%><BR>
		</TD>
<%
		counter++;
	}
%>
</TR>
<TR>
<%
	// print X/checks
	slist = statistics.iterator();
	counter = 0;

	String lastStatID = null;
	while(slist.hasNext()){
		Hashtable criteria = (Hashtable)slist.next();
		boolean tempBool = true;
		if(counter%2 == 0) tempBool = false;
%>
		<TD <%=tempBool ? bgcolorW : bgcolorL%> ALIGN="CENTER"><%=fontB%>
<%
		if(criteria.get("StatisticId").equals("")){
%>
			<A HREF="/servlet/InfoBaseController?action=editSuccessCriteria&laststatid=<%=lastStatID%>&periodbegin=<%=criteria.get("PeriodBegin")%>&periodend=<%=criteria.get("PeriodEnd")%>&targetareaid=<%=ar.getValue("targetareaid")%>&activityid=<%=ar.getValue("activityid")%>&current=false"><IMG SRC="/infobase/images/reddot.gif" BORDER="0"></A>
<%
		} else {
%>
			<A HREF="/servlet/InfoBaseController?action=editSuccessCriteria&periodbegin=<%=criteria.get("PeriodBegin")%>&periodend=<%=criteria.get("PeriodEnd")%>&statisticid=<%=criteria.get("StatisticId")%>&targetareaid=<%=ar.getValue("targetareaid")%>&activityid=<%=ar.getValue("activityid")%>&current=true"><IMG SRC="/infobase/images/greendot.gif" BORDER="0"></A>
<%			lastStatID = (String)criteria.get("StatisticId");


		}
%>
</TD>

<%
		counter++;
	}

%>
</TR>
</TABLE>
<P>
<%=fontB%>[<A HREF="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=ar.getValue("targetareaid")%>"><%=fontB%>Return</FONT></A>]</FONT><br/>
<br/>
<%=fontB%>If you experience any technical problems while either entering your success criteria or running a report, please give us as much information as possible about the problem by using this <A href="/general/feedback.jsp">Help Request form</A>.</font>
<%@ include file="/infobase/ibfooter.jspf" %>
