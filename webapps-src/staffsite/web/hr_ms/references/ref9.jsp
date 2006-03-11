<% boolean displayEditLegend = false; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
		<P>
		Thank you for your time and effort! Your input is invaluable to the application process.
		<P>
		Please select from the following two choices:
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" VALIGN="TOP" WIDTH="75%">
			<P>
			<B>If you have not finished entering the Reference Form and wish to come back and finish at a later time,</B> click on "Save Work/Finish Later."  We will save all of the information you have already entered, and you may finish at a later time.  To come back to this reference form and finish answering the questions, just click on the link in the email invitation you received.
		</TD>
		<TD ALIGN="CENTER" VALIGN="MIDDLE" CLASS="appquestion">
			<A CLASS="button" HREF="JavaScript: doPostFormNextAction('refFormFinishLater')" CLASS="button">Finish Later</A>
		</TD>
	</TR>


	<TR>
		<TD CLASS="appquestion" VALIGN="TOP" WIDTH="75%">
			<P>
			<B>If you are finished entering the Reference Form and would like to submit it for processing,</B> click on "SUBMIT."  This will send the reference form to Campus Crusade for Christ for processing with this applicant's application.
			<P>
			Please note that once you click "SUBMIT," you will not be able to come back to this reference form to see it or to edit it.  If you want to print any part of the form before submitting it, please go to that page of the form and use your browser's print function to print the pages you wish to keep.
		</TD>
		<TD ALIGN="CENTER" VALIGN="MIDDLE" CLASS="appquestion">
			<A CLASS="BUTTON" HREF="JavaScript: doPostFormNextAction('refFormSubmit')">Submit</A> (Click Submit ONLY Once)
			<!--"MSController?action=submitRefForm&refID=<%=refID%>"--> 
		</TD>
	</TR>

	<%
		String missingFields = ar.getValue("MissingFields");
		if (missingFields != null && missingFields != "") {
			// They just clicked Submit button, but it failed.  Display missing fields error message.
	%>
		<TR CLASS="REQUIRED">
			<TD VALIGN="TOP" WIDTH="75%" COLSPAN="2" ALIGN="LEFT">
				<BR>
				<STRONG>Sorry, we could not submit your reference form.</STRONG><BR>
				<TABLE WIDTH="100%" CELLSPACING="0" BORDER=1>
					<TR>
						<TD>
						<%=missingFields%>
					</TD>
				</TR>
				</TABLE>
			Please return to the earlier pages, fix the problems, and return here to click "SUBMIT" again.
			<P>
			</TD>
		</TR>
	<%
		}
	%>


	<TR>
		<TD COLSPAN="8" CLASS="app">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button">&nbsp;</TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button">&nbsp;</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="footer.jspf" %>