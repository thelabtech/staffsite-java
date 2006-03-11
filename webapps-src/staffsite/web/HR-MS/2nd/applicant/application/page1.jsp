<%@ page import="java.util.*" %>
<%@ include file="../../style.jsp" %>
<jsp:useBean id="util" class="org.alt60m.html.Util"/>

<HTML>
<HEAD>
<TITLE>Index</TITLE>
</HEAD>
<BODY  <%=noMargins%> <%=backColor%> <%=colorLinks%>>
<%=fontA%>
<%@ include file="../header.jsp" %>
<%=tblPage%>

<%=tblTDC%>
	<%=util.tableTop("../HR-MS/2nd/images", "600", "Application", fontTH, barColor)%>
	<form name="theForm" method="post" action="Manager">
	<input type="hidden" name="action" value="goToPage">
	<!-- This value represents the page that the user will be sent to next. -->
	<input type="hidden" name="page" value="2">
	<!-- This value represents this page, the current page of the application. -->
	<input type="hidden" name="currentPage" value="1">
	<TABLE <%=thinBorder%> <%=width600%> <%=backColor%> height=400px background="../HR-MS/2nd/images/beach.jpg">
	<TR><TD valign=top align=left>
 		<TABLE <%=littlePadding%> <%=widthAll%> height=100%>
		<TR><TD colspan=2>
		<INPUT type=radio name=preName checked>Mr. <INPUT type=radio name=preName>Miss <INPUT type=radio name=preName>Mr. & Mrs.
		</TD></TR>
		<TR><TD>Name:</TD><TD><INPUT type=text name=name size=30></TD>
		<TD>Social Security Number:</TD><TD><%=util.phoneInput("ssn")%></TD></TR>

		<TR><TD colspan=2>
		<BR>
		<%=fontB%>Current Mailing Address
		</TD></TR>
		<TR><TD>Street:</TD><TD><INPUT type=text name=street size=30></TD>
		<TD>Telephone:</TD><TD><%=util.phoneInput("phone")%></TD></TR>
		<TR><TD>City:</TD><TD><INPUT type=text name=city size=10> State: <%=util.stateSelect()%></TD>
		<TD>Cell Phone:</TD><TD><%=util.phoneInput("cell")%></TD></TR>
		<TR><TD valign=top>E-mail:</TD><TD><INPUT type=text name=email size=30><BR><INPUT type=checkbox name=often> I check my e-mail often.</TD>
		<TD valign=top>located at address until:</TD><TD valign=top><%=util.dateInput("leave")%></TD></TR>

		<TR><TD colspan=2>
		<BR>
		<%=fontB%>Emergency Contact Address
		</TD></TR>
		<TR><TD>Full Name:</TD><TD><INPUT type=text name=emergency size=30></TD></TR>
		<TR><TD>Street:</TD><TD><INPUT type=text name=street size=30></TD>
		<TD>Telephone:</TD><TD><%=util.phoneInput("phoneE")%></TD></TR>
		<TR><TD>City:</TD><TD><INPUT type=text name=city size=10> State: <%=util.stateSelect()%></TD>
		<TD>Cell Phone:</TD><TD><%=util.phoneInput("cellE")%></TD></TR>

		<TR height=*><TD colspan=4 align=right><input type="image" src="../HR-MS/2nd/images/next.gif" name="submit" valign="bottom" border="0"></TD></TR>
		</TABLE>	
	</TD></TR>
	</TABLE>
</TD>
<%=tblTDR%>
	<%=util.tableTop("../HR-MS/2nd/images", "150", "Right Table", fontTH, barColor)%>

	<TABLE <%=thinBorder%> <%=width150%> <%=backColor%> height=400px>
	<TR><TD bgcolor=white>
	
	
	</TD></TR>
	</TABLE>
</TD>
</TR>
</TABLE>
<%@ include file="../../footer.jsp" %>
</BODY>
</HTML>