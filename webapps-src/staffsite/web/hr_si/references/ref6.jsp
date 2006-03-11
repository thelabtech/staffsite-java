<!--- ref6.jsp: "Intellectual Flexibility" --->
<% int theWidth = 100/6; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<%
		// for simpler coding and better performance later in page, preload integer variables from reference object
		int _if1=r.get_if1();
		int _if2=r.get_if2();
		int _if3=r.get_if3();
		int _if4=r.get_if4();
	%>

	<TR>
		<TD CLASS="appquestions" colspan="2">
			<B>Relationship with Self: Intellectual Flexibility</B>
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
						<TD CLASS="refinboxblue" valign="bottom">Teachability</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if1" VALUE="0"<%=_if1 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if1" VALUE="1"<%=_if1 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if1" VALUE="2"<%=_if1 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if1" VALUE="3"<%=_if1 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if1" VALUE="4"<%=_if1 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if1" VALUE="5"<%=_if1 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_if1c" size="30" maxlength="50" value="<%=r.get_if1c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Common sense and judgment</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if2" VALUE="0"<%=_if2 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if2" VALUE="1"<%=_if2 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if2" VALUE="2"<%=_if2 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if2" VALUE="3"<%=_if2 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if2" VALUE="4"<%=_if2 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if2" VALUE="5"<%=_if2 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_if2c" size="30" maxlength="50" value="<%=r.get_if2c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Flexibility</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if3" VALUE="0"<%=_if3 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if3" VALUE="1"<%=_if3 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if3" VALUE="2"<%=_if3 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if3" VALUE="3"<%=_if3 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if3" VALUE="4"<%=_if3 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if3" VALUE="5"<%=_if3 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_if3c" size="30" maxlength="50" value="<%=r.get_if3c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Adaptability</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if4" VALUE="0"<%=_if4 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if4" VALUE="1"<%=_if4 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if4" VALUE="2"<%=_if4 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if4" VALUE="3"<%=_if4 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if4" VALUE="4"<%=_if4 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_if4" VALUE="5"<%=_if4 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_if4c" size="30" maxlength="50" value="<%=r.get_if4c()%>"></TD>
					</TR>
				</DIV>
			</TABLE>
		</TD>
	</TR>
	<%=sihtmlutils.printInputArea("How has this applicant demonstrated a desire to grow and/or change?","1", "textarea", 500, "_if5", r.get_if5(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("What is the applicant's response when things don't go as planned?","2", "textarea", 500, "_if6", r.get_if6(), false)%></td></tr>
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
