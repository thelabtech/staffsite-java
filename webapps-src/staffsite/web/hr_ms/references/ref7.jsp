<% boolean displayEditLegend = true; %>
<%@ include file="header.jspf" %>
<%
	String outText;
%>
<TABLE WIDTH="100%" CELLSPACING="0">

	<TR>
		<TD CLASS="appquestion">
		<%
			outText = "How does this student respond to authority? (follow? resist? critical attitude?)<BR>";
			if (!isPeerReference)
				outText = outText + "Please describe a situation that shows how this applicant responds to authority.<BR>";
		%>
			<%=mshtmlutils.printInputArea((String) outText,"4", "textarea", 500, "_4sa", (String)wsnReferenceHash.get("_4sa") == null? "" : (String)wsnReferenceHash.get("_4sa"), true)%>
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion">
		<%
			outText = "What type of leadership has the student exhibited? What leadership do you see in him/her?<BR>Please be specific.  (CCC Staff: refer to the leadership model)";
		%>
			<%=mshtmlutils.printInputArea((String) outText,"5", "textarea", 500, "_5sa", (String)wsnReferenceHash.get("_5sa") == null? "" : (String)wsnReferenceHash.get("_5sa"), true)%>
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion">
		<%
			if (isPeerReference)
				outText = "Has the applicant demonstrated a consistency with biblical standards in his/her relationships with the opposite sex?<BR>";
			else
				outText = "Please discuss the issue of sexual purity with the applicant. Now that you've discussed the area of purity with the applicant, are you aware of any sexual immorality that this person has been involved in? (petting, oral sex, sexual intercourse, homosexuality, pornography)<BR>";
		%>
			<%=mshtmlutils.printInputArea((String) outText,"6", "textarea", 500, "_6sa", (String)wsnReferenceHash.get("_6sa") == null? "" : (String)wsnReferenceHash.get("_6sa"), true)%>
		</TD>
	</TR>
		
	<% if (! isPeerReference) { %>
		<TR>
			<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">6b)</TD>
			<TD CLASS="appquestion">
				Are the applicant's present convictions in the area of sexual purity in line with what the Bible teaches?

				<DIV CLASS="applist">
					<%	String _6sb = (String)wsnReferenceHash.get("_6sb") == null ? "" : (String)wsnReferenceHash.get("_6sb"); %>
					<INPUT type=radio name="_6sb" value="Y"<%=_6sb.equalsIgnoreCase("Y") ? " checked=\"checked\"" : ""%>> Yes
					<INPUT type=radio name="_6sb" value="N"<%=_6sb.equalsIgnoreCase("N") ? " checked=\"checked\"" : ""%>> No
				</DIV>
				Explain:
				<div CLASS="applist"><textarea class="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" name="_6sc" rows="7" onkeyup="TrackCount(this,'_6sctextcount',500)" onkeypress="LimitText(this,500)" cols="97"><%=(String)wsnReferenceHash.get("_6sc") == null? "" : (String)wsnReferenceHash.get("_6sc")%></textarea></div>
				<div class="small" align="right">Characters remaining: <input type="text" name="_6sctextcount" size="3" value="500" disabled></div>
			</TD>
		</TR>
	<% } %>

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