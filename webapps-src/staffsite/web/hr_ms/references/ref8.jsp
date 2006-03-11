<% boolean displayEditLegend = true; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<% if (! isPeerReference) { %>
		<TR>
			<TD CLASS="appquestion">
				<%=mshtmlutils.printInputArea("Do you believe the applicant struggles with an eating disorder?","7", "textarea", 500, "_7sa", (String)wsnReferenceHash.get("_7sa") == null? "" : (String)wsnReferenceHash.get("_7sa"), true)%>
			</TD>
		</TR>
	<% } %>

	<% if (! isPeerReference) { %>
		<TR>
			<TD CLASS="appquestion">
				<%=mshtmlutils.printInputArea("What is the applicant's attitude towards initiative evangelism and Campus Crusade's ministry philosophy?","8", "textarea", 500, "_8sa", (String)wsnReferenceHash.get("_8sa") == null? "" : (String)wsnReferenceHash.get("_8sa"), true)%>
			</TD>
		</TR>
	<% } %>

	<TR>
		<TD CLASS="appquestion">
			<%=mshtmlutils.printInputArea("<STRONG>Closing Remark</STRONG><BR>Do you have any reservations about this person participating in a summer project?<BR>If so, please explain:","9", "textarea", 500, "ClosingRemarks", (String)wsnReferenceHash.get("ClosingRemarks") == null? "" : (String)wsnReferenceHash.get("ClosingRemarks"), true)%>
		</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('ref9')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="footer.jspf" %>
