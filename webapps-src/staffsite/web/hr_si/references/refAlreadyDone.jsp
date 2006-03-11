<%
	try {	// the BIG try-catch for the entire JSP page.  We have to include it here since we're not using "./header.jspf"
	// catch is in "./footer.jspf"
%>
<% String pageTitle = "Reference Form"; %>
<%@ include file="../header.jspf" %>
<HR>
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD COLSPAN="2">
			<SPAN CLASS="heading"><B>REFERENCE FORM ALREADY SUBMITTED</B></SPAN>
			<P>
			The Reference Form that you requested has already been completed and submitted.  It can no longer be viewed or edited.
			<P>
			Thank you for your time and effort! Your input is invaluable to the application process.<BR>
			<P>
			Sincerely,<BR>
			Campus Crusade for Christ
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
<!--	</FORM>	-->
<%@ include file="footer.jspf" %>