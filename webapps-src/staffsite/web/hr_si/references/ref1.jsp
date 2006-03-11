<%@ include file="header.jspf" %>
<%
	// get the person information about the application
	r.loadRelated();
	SIPerson p = r.getSIPerson();
%>
<TABLE WIDTH="100%" CELLSPACING="0">

	<TR>
		<TD CLASS="appquestions" COLSPAN="2">
		<P>
		<B>Welcome to the STINT Reference Form web site.</B>
		<P>
		Your input is invaluable to the application process.  Thank you for your time.
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" VALIGN="TOP" WIDTH="15%">
			<B>
			Your Name:<BR><BR><BR>
			<P>
			Applicant:<BR>
			</B>
		</TD>
		<TD CLASS="appquestion" VALIGN="TOP" ALIGN="LEFT" WIDTH="85%">
			<%=referenceFullName%><BR>
			Reference ID=<%=refID%> Reference Type=<%=referenceType%>
			<P>
			<TABLE WIDTH="100%" CELLSPACING="0">
				<TR>
					<TD CLASS="appquestions">
					Applicant SIPersonID: <BR>
					Applicant Name:<BR>
					Applicant Address: <BR>
					Applicant City, St, Zip: <BR>
					Applicant Phone: <BR>
					</TD>
					<TD CLASS="appquestions">
					<%=p.getSIPersonID()%><BR>
					<%=p.getFirstName() + " " + p.getLastName()%><BR>
					<%=p.getCurrentAddress1()%><BR>
					<%=p.getCurrentCity() + " " + p.getCurrentState() + ", " + p.getCurrentZip()%><BR>
					<%=p.getCurrentHomePhone()%><BR>
					</TD>
				</TR>
			</TABLE>
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
<%@ include file="footer.jspf" %>
