<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<STRONG>Submit Application</STRONG>
			<P>
		</TD>
	</TR>

	<%
		ActionResults ar = new ActionResults();
		ar = ActionResults.getActionResults(session);
		String missingFields = ar.getValue("MissingFields");
		if (missingFields != null && missingFields != "") {
			// They just clicked Submit button, but it failed.  Display missing fields error message.
	%>
		<TR CLASS="REQUIRED">
			<TD VALIGN="TOP" WIDTH="75%" COLSPAN="2" ALIGN="LEFT">
				<BR>
				<STRONG>Sorry, we could not submit your application because of the following problems.</STRONG><BR>
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
		<TD CLASS="app" colspan="2">
			<p>Campus Crusade for Christ requires that you certify your application by submitting an electronic signature. To certify your application, read the text below and provide an electronic signature (type your name) and click Submit Application.</p>
			<ol><li>I have read, understood, and agree with the enclosed <a href="http://www.campuscrusadeforchrist.com/aboutus/sof.htm" target="_blank">Statement of Faith</a>.</li>
			<li>If accepted for a Summer Project, I am aware that I am responsible to raise whatever financial support is necessary to fund my involvement with Campus Crusade for Christ.</li>
			<li>To the best of my knowledge, all of the information in this application is true and complete.  I also authorize you to make such inquiries as may be necessary in arriving at an acceptance decision, which includes contacting the people completing my references, my local Campus Crusade for Christ staff person, or others.  I hereby release those persons from all liability to inquiries in connection with my application.</li></ol>
			<P>
			Enter Electronic Signature (type your name)<BR>
			<INPUT class="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "ElectronicSignature",50,NoEditAfterSubmit)%>>
			<P>
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" valign="middle">
			If you are sure you are finished with the application, click "Submit Application". After you submit your application, you will not be able to edit your answers in your application, but you will be able to change your your personal information, your school information, and your reference information as necessary.
			<P>
		</TD>
		<TD CLASS="app" width="33%" align="center" valign="middle">
<%			if(isSubmitted) { %>
				<B>Application already submitted on <%=util.formatDate((Date)personHash.get("SubmittedDate"))%><B>
<%			} else { %>
			    <A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'appFormSubmit', '<%=WsnApplicationID%>')" CLASS="button">Submit Application</A>
<%			} %>
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" COLSPAN="2">
			&nbsp;
			<P>
		</TD>
	</TR>

	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button">
				<% if (pageNum == 1) { %>
				&nbsp;
				<% } else { %>
				<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A>
				<% } %>
				</TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[0]%>')">Home&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>