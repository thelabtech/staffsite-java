<%@ page import="org.alt60m.servlet.*, java.util.Date" %>
<% String pageTitle = "Reference Form"; %>
<%@ include file="../header.jspf" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	String parmPage;
	String parmRefId;
	parmPage = (ar.getValue("page") != null ? ar.getValue("page") : "");
	parmRefId = (ar.getValue("refId") != null ? ar.getValue("refId") : "");
%>
<P CLASS="pageheading">Summer Project Reference Form</P>
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
parmPage=<%=parmPage%>=<BR>
parmRefId=<%=parmRefId%>=<BR>
<%=box.printBottom()%>
<!--	</FORM>	-->
<%@ include file="footer.jspf" %>