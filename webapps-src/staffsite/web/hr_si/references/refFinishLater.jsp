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
			<SPAN CLASS="heading"><B>REFERENCE FORM SAVED FOR LATER</B></SPAN>
			<P>
			Thank you for your time and effort!
			<P>
			We have saved the information you have entered into this applicant's Reference Form so you can return at your convenience to finish it.  Just click on the link in the email you received to return to the form.
			<P>
			We are also sending you another email just in case you have deleted the original email.
			<P>
			Sincerely,<BR>
			Campus Crusade for Christ
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
<%@ include file="footer.jspf" %>