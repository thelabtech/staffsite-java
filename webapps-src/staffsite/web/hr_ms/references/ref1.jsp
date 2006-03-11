<% boolean displayEditLegend = false; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<TR>
		<TD CLASS="appquestions" COLSPAN="2">
		<P>
		<B>Welcome to the Summer Projects Reference Form web site.</B>
		<P>
		Hello, <B><%=referenceFullName%></B>.  Thank you for your time.  Your input about this applicant is invaluable to the application process.
		<P>
		The applicant, <B><%=(String)WsnApplicationHash.get("LegalFirstName") == null ? "" : (String)WsnApplicationHash.get("LegalFirstName")%> <%=(String)WsnApplicationHash.get("LegalLastName") == null ? "" : (String)WsnApplicationHash.get("LegalLastName")%></B>, has asked that you complete a reference form as part of the application process.
		<P>
		To get started, click on the NEXT button below.  You can pause at any time by clicking the Save Work/Finish Later button.  We will save what you have already entered and you can come back at a later time to finish entering your information.
		</TD>
	</TR>

	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="footer.jspf" %>
