<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>
<%@ page import="org.alt60m.hr.review360.html.*" %>

<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy"); %>
<%@ include file="/style.jspf" %>
<%
	ActionResults tub;
	tub = ActionResults.getActionResults(session);
	Vector myReviews = (Vector) tub.getCollection("Reviews");
	Hashtable mySession = (Hashtable) tub.getHashtable("ReviewSession");
	Iterator r360list = myReviews.iterator();
	Review360SummaryLight mySummary = new Review360SummaryLight();
	// String fName = tub.getValue("ReviewForPName");
	Review360SummaryLight everybody = new Review360SummaryLight();
	Collection summaries = new LinkedList();
	boolean foundone = false;
	while(r360list.hasNext()){
		Hashtable my360 = (Hashtable)r360list.next();
		Review360SummaryLight temp = new Review360SummaryLight(my360);
		Iterator i = summaries.iterator();
		foundone = false;
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();

			if(mySummary.getLeadershipLevel().equals(my360.get("LeadershipLevel"))){
				mySummary.append(my360);
				everybody.append(my360);
				foundone = true;
				break;
			}
		}
		if(!foundone){
			summaries.add(temp);
			everybody.append(my360);
		}
	}

	Iterator i = summaries.iterator();
	while(i.hasNext()){
		mySummary = (Review360SummaryLight)i.next();
	}

	int tableWidth = 700;
	String bar = "<TR><TD COLSPAN='4'" + bgcolorB + "><IMG SRC='/images/blank.gif' HEIGHT='1' WIDTH='" + tableWidth + "'></TD></TR>";
%>
<%@ include file="questionsInclude.jspf" %>
<%
		QuestionHelper qh = new QuestionHelper(fName); 
%>
	<HTML>
	<HEAD>
		<TITLE>360 Light Summary For <%=tub.getValue("ReviewFor")%></TITLE>
	</HEAD>
	<BODY bgcolor="#FFFFFF" TEXT="#000000" onLoad="alert('Press BACK on your browser to return to the administration page. For best PRINTING results, turn on the print background option in your browser settings. See note on administration page for details.')">
	<CENTER>
	<TABLE WIDTH="<%=tableWidth%>" BORDER="0" CELLPADDING="2" CELLSPACING="0">
		<%=bar%>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4"><IMG SRC="/images/360logo.gif" BORDER="0" ALIGN="BOTTOM"><%=fontB5%>360 Review - Light Summary For <%=tub.getValue("ReviewFor")%></FONT></TD>
		</TR>
		<%=bar%>
		<TR>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="25%"><%=fontB%>Review Name</FONT></TD>
			<TD <%=bgcolorW%> WIDTH="25%"><%=fontB%><%=mySession.get("Name")%></FONT></TD>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="25%"><%=fontB%>Date Review Started</FONT></TD>
			<TD <%=bgcolorW%> WIDTH="25%"><%=fontB%><%=dateFormatter.format((Date)mySession.get("DateStarted"))%></TD>
		</TR>
		<TR>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="20%"><%=fontB%>Review Requested By</FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=tub.getValue("RequestedByName")%></FONT></TD>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="20%"><%=fontB%>Date Review Due</FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%>
			<% if(mySession.get("DateDue") != null) { %>
			<%=dateFormatter.format((Date)mySession.get("DateDue"))%>
			<% } %></TD>
		</TR>
		<%=bar%>
		<TR>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="20%"><%=fontB%>Purpose</FONT></TD>
			<TD <%=bgcolorW%> COLSPAN="3"><%=fontB%><%=mySession.get("Purpose")%></TD>
		</TR>
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>Respose Key:</FONT></TH></TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<%=mySummary.getInfo()%>
<%
		}
%>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			1) <%=q1%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ1()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			2) <%=q2%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ2()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			3) <%=q3%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ3()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			4) <%=q4%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ4()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			5) <%=q5%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ5()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			6) <%=q6%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ6()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			7) <%=q7%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ7()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			8) <%=q8%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ8()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			9) <%=q9%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			mySummary = (Review360SummaryLight)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ9()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<%=bar%>

<%=bar%>



	</TABLE>
<%@ include file="/headers/google_analytics.jspf"%>
	</BODY>
	</HTML>
