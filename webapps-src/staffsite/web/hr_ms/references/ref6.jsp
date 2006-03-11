<% boolean displayEditLegend = true; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="appquestion">
			<%=mshtmlutils.printInputArea("What are the applicant's greatest strengths? [character traits / ablities / skills]<BR>Explain:","1", "textarea", 500, "_1sa", (String)wsnReferenceHash.get("_1sa") == null? "" : (String)wsnReferenceHash.get("_1sa"), true)%>
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion">
			<%=mshtmlutils.printInputArea("What areas need development or attention? [character traits / ablities / skills]<BR>(CCC staff: refer to growth model)", "2", "textarea", 500, "_2sa", (String)wsnReferenceHash.get("_2sa") == null? "" : (String)wsnReferenceHash.get("_2sa"), true)%>
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion">
			<%=mshtmlutils.printInputArea("Describe the applicant's social maturity (confidence and poise in interaction with others)<BR>Explain:", "3", "textarea", 500, "_3sa", (String)wsnReferenceHash.get("_3sa") == null? "" : (String)wsnReferenceHash.get("_3sa"), true)%>
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