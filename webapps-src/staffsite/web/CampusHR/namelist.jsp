<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	Collection nameList = ar.getCollection("staffList");
	String requestedBy = ar.getValue("requestedBy");
	Hashtable regionLookup = new Hashtable();
	regionLookup.put("NE", "Northeast");
	regionLookup.put("MA", "Mid-Atlantic");
	regionLookup.put("MS", "MidSouth");
	regionLookup.put("SE", "Southeast");
	regionLookup.put("GL", "Great Lakes");
	regionLookup.put("UM", "Upper Midwest");
	regionLookup.put("GP", "Great Plains");
	regionLookup.put("RR", "Red River");
	regionLookup.put("NW", "Greater Northwest");
	regionLookup.put("SW", "Pacific Southwest");
	regionLookup.put("NC", "National Campus Office");
	regionLookup.put("IN", "Impact National Office");
%>
<HTML>
<HEAD>
<TITLE> Administrative Change of Status - Choose a staff member </TITLE>
<%@ include file="hrheader.jspf" %>
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Initiate ACS - Step 2</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=5 CELLSPACING=0 WIDTH="98%">
		<TR>
		<TD>
		<BR><BLOCKQUOTE><B>The following staff members were found:</B><P ALIGN="CENTER">
		<TABLE WIDTH="60%" BORDER=0>
	<% if (nameList.size() == 0) { %>
		<TR><TD><I>No staff members found.</I></TD></TR>
		<BR>
		<TR><TD><A HREF="/CampusHR/initiate_acs.jsp"><I>Search again</I></A></TD></TR>
	<% } else { %>
		<%  Iterator iter = nameList.iterator();
			while (iter.hasNext()) { 
				Hashtable t = (Hashtable)iter.next(); %>
			<TR><TD><A HREF='/servlet/AuthorizeController?action=viewFormList&accountNo=<%=t.get("AccountNo")%>&requestedBy=<%=requestedBy%>'><NOBR><%=t.get("PreferredName")%> <%=t.get("LastName")%></NOBR></A></TD><TD><NOBR>- <%=regionLookup.get((String)t.get("Region"))%>, <%=t.get("Strategy")%></NOBR></TD></TR>
		<%  } %>	
	<% } %>
		</TABLE></BLOCKQUOTE>
		<P ALIGN="LEFT"><A HREF="/servlet/StaffController?action=showTools"><I>back to tools page</I>
		</TR>
	</TABLE>
</TD></TR></TABLE>
<%@ include file="hrfooter.jspf" %>
</HTML>