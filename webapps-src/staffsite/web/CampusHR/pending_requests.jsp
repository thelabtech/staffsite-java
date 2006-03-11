<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<HTML>
<HEAD>
<TITLE> Pending Requests </TITLE>
<%@ include file="hrheader.jspf" %>

<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>
<% 
	ActionResults ar = ActionResults.getActionResults(session);
	List pendingResults = (List)ar.getCollection("pendingResults");
%>
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Pending Requests</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="98%">
		<TR>
		<TD>
		<BR><BLOCKQUOTE><B>The following requests (<%=pendingResults.size()%>) are pending:</B>
		<BLOCKQUOTE>
		<%
			if (pendingResults.size() == 0) {%>
			<NOBR><I>No requests are pending at this time.</I></NOBR>
		<%  } else { 
				ListIterator lit = pendingResults.listIterator();
				while (lit.hasNext()) { 
				Hashtable t = (Hashtable)lit.next();%>
		<NOBR><A HREF='/servlet/AuthorizeController?action=viewChangeRequest&changeRequestID=<%=(String)t.get("changeRequestID")%>&authorizationID=<%=(String)t.get("authorizationID")%>'><%=(String)t.get("updateStaffName")%></A> - <%=(String)t.get("changeRequestType")%>, submitted <%=(String)t.get("requestDate")%></NOBR>
		<%		} //end while 
			} %>
		</BLOCKQUOTE>
		<A HREF="/servlet/StaffController?action=showTools"><I>back to tools page</I>
		</BLOCKQUOTE>
		</TR>
	</TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>