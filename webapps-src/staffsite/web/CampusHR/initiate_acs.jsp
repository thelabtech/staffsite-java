<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<HTML>
<HEAD>
<TITLE> Administrative Change of Status - Type in a last name </TITLE>
<%@ include file="hrheader.jspf" %>
<FORM NAME="searchForm" ACTION="/servlet/AuthorizeController?action=findByLastName" METHOD="POST">
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Initiate ACS - Step 1</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=5 CELLSPACING=0 WIDTH="98%">
		<TR>
		<TD>
		<BR>
		<BLOCKQUOTE><NOBR><B>Last Name: </B><INPUT TYPE="text" NAME="lastName"> <INPUT TYPE="SUBMIT" CLASS="button" VALUE="Search"></NOBR></BLOCKQUOTE>
		<A HREF="/servlet/StaffController?action=showTools"><I>back to tools page</I>
		</TD>
		</TR>
	</TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>