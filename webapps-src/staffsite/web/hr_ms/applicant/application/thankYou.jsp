<%@ page import="java.util.*" %>
<%@ include file="../../style.jsp" %>
<jsp:useBean id="util" class="org.alt60m.html.Util"/>
<HTML>
<HEAD>
<TITLE>Application</TITLE>
</HEAD>
<BODY  <%=noMargins%> <%=backColor%> <%=colorLinks%>>
<%=fontA%>
<%@ include file="../header.jsp" %>
<BR>
<BR>
<BR>
<BR>
<CENTER>
<%=util.tableTop("../hr_ms/images", "600", "Have a great day!", fontTH, barColor,"","")%>
<TABLE <%=thinBorder%> <%=width600%>>
<TR><TD>
	<TABLE <%=bigPadding%> <%=widthAll%> height=100% bgcolor=white>
	<TR><TD align=center colspan=2>
	<IMG src="../hr_ms/images/thankyou.gif" border=0><BR>
	Your application is now beginning to be processed.  You should logout now<BR>
	and bookmark the login screen.  From now on, when you would like to know the<BR>
	status of your application, simply log in and we will let you know how things<BR>
	are moving along.<BR>
	</TD></TR>
	<TR><TD align=right><A HREF="Manager?action=goToPage&page=login&Page=thankYou&ApplicationID=<%=applicationID%>"><%=fontS%>logout</A></TD></TR>
	</TABLE>
</TD></TR>
</TABLE>
</CENTER>
<BR>
<BR>
<BR>
<BR>
<%@ include file="../../footer.jsp" %>
</BODY>
</HTML>