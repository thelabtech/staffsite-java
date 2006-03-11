<!--- ref9.jsp: "Ministry Skills" --->
<% int theWidth = 100/6; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<%
		// for simpler coding and better performance later in page, preload integer variables from reference object
		int _ms1=r.get_ms1();
		int _ms2=r.get_ms2();
		int _ms3=r.get_ms3();
		int _ms4=r.get_ms4();
	%>

	<TR>
		<TD CLASS="appquestions" colspan="2">
			<B>Ministry Skills</B>
			<P>
			Please check the box that best describes the applicant, based on your knowledge and interaction with him or her.
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" colspan="2">
			<TABLE cellpadding="0" cellspacing="0" CLASS="refinbox">
				<TR>
					<TD CLASS="refinboxblue" width="15%" valign="bottom">&nbsp;</TD>
					<TD CLASS="refinboxst" width="3%" align="center" valign="bottom">N<br>o<br>t<br>&nbsp;<br>K<br>n<br>o<br>w<br>n</TD>
					<TD CLASS="refinboxst" width="3%" align="center" valign="bottom">P<br>o<br>o<br>r</TD>
					<TD CLASS="refinboxst" width="3%" align="center" valign="bottom">B<br>e<br>l<br>o<br>w<br>&nbsp;<br>A<br>v<br>g</TD>
					<TD CLASS="refinboxst" width="3%" align="center" valign="bottom">A<br>v<br>g</TD>
					<TD CLASS="refinboxst" width="3%" align="center" valign="bottom">A<br>b<br>o<br>v<br>e<br>&nbsp;<br>A<br>v<br>g</TD>
					<TD CLASS="refinboxst" width="3%" align="center" valign="bottom">E<br>x<br>c<br>e<br>l<br>l<br>e<br>n<br>t</TD>
					<TD CLASS="refinboxblue" valign="bottom">Optional (brief) Comments</TD>
				</TR>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Effectiveness in evangelism</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms1" VALUE="0"<%=_ms1 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms1" VALUE="1"<%=_ms1 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms1" VALUE="2"<%=_ms1 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms1" VALUE="3"<%=_ms1 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms1" VALUE="4"<%=_ms1 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms1" VALUE="5"<%=_ms1 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ms1c" size="30" maxlength="50" value="<%=r.get_ms1c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Effectiveness in follow-up/discipleship</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms2" VALUE="0"<%=_ms2 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms2" VALUE="1"<%=_ms2 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms2" VALUE="2"<%=_ms2 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms2" VALUE="3"<%=_ms2 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms2" VALUE="4"<%=_ms2 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms2" VALUE="5"<%=_ms2 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ms2c" size="30" maxlength="50" value="<%=r.get_ms2c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Small group leadership skills</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms3" VALUE="0"<%=_ms3 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms3" VALUE="1"<%=_ms3 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms3" VALUE="2"<%=_ms3 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms3" VALUE="3"<%=_ms3 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms3" VALUE="4"<%=_ms3 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms3" VALUE="5"<%=_ms3 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ms3c" size="30" maxlength="50" value="<%=r.get_ms3c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Large group skills</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms4" VALUE="0"<%=_ms4 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms4" VALUE="1"<%=_ms4 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms4" VALUE="2"<%=_ms4 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms4" VALUE="3"<%=_ms4 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms4" VALUE="4"<%=_ms4 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ms4" VALUE="5"<%=_ms4 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ms4c" size="30" maxlength="50" value="<%=r.get_ms4c()%>"></TD>
					</TR>
				</DIV>
			</TABLE>
		</TD>
	</TR>
	<%=sihtmlutils.printInputArea("Comment on the applicant's ministry experience (e.g., initiative evangelism, follow-up of new believers, discipleship, etc).","1", "textarea", 500, "_ms5", r.get_ms5(), false)%></td></tr>
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
