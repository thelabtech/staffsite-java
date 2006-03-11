<!--- ref11.jsp: "Overall Recommendation" --->
<% int theWidth = 100/6; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<%
		// for simpler coding and better performance later in page, preload integer variables from reference object
		int _re4=r.get_re4();
	%>

	<TR>
		<TD CLASS="appquestions" colspan="2">
			<B>Overall Recommendation Regarding the Applicant's Readiness</B>
		</TD>
	</TR>
	<%=sihtmlutils.printInputArea("What are the applicant's greatest strengths and abilities?","1", "textarea", 500, "_re1", r.get_re1(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("What areas of the applicant's life need development or attention?","2", "textarea", 500, "_re2", r.get_re2(), false)%></td></tr>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("Please summarize this applicant's readiness for a fellowship with the Impact Movement.","3", "textarea", 500, "_re3", r.get_re3(), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("Please summarize this applicant's readiness for an internship with Campus Crusade for Christ's Campus Ministry.","3", "textarea", 500, "_re3", r.get_re3(), false)%>
<%
		}
%>
	</td></tr>
	<TR>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">4.</TD>
		<TD CLASS="app">
			<DIV>
				Please indicate your overall recommendation:<BR>
				<INPUT TYPE="RADIO" NAME="_re4" VALUE="1"<%=_re4 == 1 ? "checked=\"checked\"" : ""%>> Team leader/associate team leader with major responsbilities<BR>
				<INPUT TYPE="RADIO" NAME="_re4" VALUE="2"<%=_re4 == 2 ? "checked=\"checked\"" : ""%>> Good team person; a good follower<BR>
				<INPUT TYPE="RADIO" NAME="_re4" VALUE="3"<%=_re4 == 3 ? "checked=\"checked\"" : ""%>> Marginal acceptance, have some reservation<BR>
				<INPUT TYPE="RADIO" NAME="_re4" VALUE="4"<%=_re4 == 4 ? "checked=\"checked\"" : ""%>> Definitely not recommend<BR>&nbsp;
			</DIV>
		</TD>
	</TR>
	<%=sihtmlutils.printInputArea("Please offer any additional comments or concerns you have with regard to the applicant.","5", "textarea", 500, "_re5", r.get_re5(), false)%></td></tr>
	<TR>
		<TD CLASS="app" colspan="2">
			<TABLE WIDTH="100%" CELLSPACING="0">
				<TR>
					<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
					<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('ref12')" CLASS="button">Save Work/Finish Later</A></TD>
					<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="footer.jspf" %>
