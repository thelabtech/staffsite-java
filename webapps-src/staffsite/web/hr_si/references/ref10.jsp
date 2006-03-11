<!--- ref10.jsp: "Leadership Skills" --->
<% int theWidth = 100/6; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<%
		// for simpler coding and better performance later in page, preload integer variables from reference object
		int _ls1=r.get_ls1();
		int _ls2=r.get_ls2();
		int _ls3=r.get_ls3();
		int _ls4=r.get_ls4();
		int _ls5=r.get_ls5();
	%>

	<TR>
		<TD CLASS="appquestions" colspan="2">
			<B>Leadership Skills</B>
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
						<TD CLASS="refinboxblue" valign="bottom">Potential ability to lead others</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls1" VALUE="0"<%=_ls1 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls1" VALUE="1"<%=_ls1 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls1" VALUE="2"<%=_ls1 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls1" VALUE="3"<%=_ls1 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls1" VALUE="4"<%=_ls1 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls1" VALUE="5"<%=_ls1 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ls1c" size="30" maxlength="50" value="<%=r.get_ls1c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Demonstrated ability to lead others</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls2" VALUE="0"<%=_ls2 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls2" VALUE="1"<%=_ls2 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls2" VALUE="2"<%=_ls2 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls2" VALUE="3"<%=_ls2 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls2" VALUE="4"<%=_ls2 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls2" VALUE="5"<%=_ls2 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ls2c" size="30" maxlength="50" value="<%=r.get_ls2c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Ability to organize projects/events</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls3" VALUE="0"<%=_ls3 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls3" VALUE="1"<%=_ls3 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls3" VALUE="2"<%=_ls3 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls3" VALUE="3"<%=_ls3 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls3" VALUE="4"<%=_ls3 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls3" VALUE="5"<%=_ls3 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ls3c" size="30" maxlength="50" value="<%=r.get_ls3c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Effectively manages and motivates others</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls4" VALUE="0"<%=_ls4 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls4" VALUE="1"<%=_ls4 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls4" VALUE="2"<%=_ls4 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls4" VALUE="3"<%=_ls4 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls4" VALUE="4"<%=_ls4 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls4" VALUE="5"<%=_ls4 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ls4c" size="30" maxlength="50" value="<%=r.get_ls4c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Willingness to take on responsibility</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls5" VALUE="0"<%=_ls5 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls5" VALUE="1"<%=_ls5 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls5" VALUE="2"<%=_ls5 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls5" VALUE="3"<%=_ls5 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls5" VALUE="4"<%=_ls5 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_ls5" VALUE="5"<%=_ls5 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_ls5c" size="30" maxlength="50" value="<%=r.get_ls5c()%>"></TD>
					</TR>
				</DIV>
			</TABLE>
		</TD>
	</TR>
	<%=sihtmlutils.printInputArea("Comment on the applicant's readiness and ability to lead<BR>&nbsp;&nbsp;&nbsp;&nbsp;a. those he/she ministers <u>to</u>:","1", "textarea", 500, "_ls6", r.get_ls6(), false)%>
	<%=sihtmlutils.printInputArea("&nbsp;&nbsp;&nbsp;&nbsp;b. peers (those he/she ministers <u>with</u>:","", "textarea", 500, "_ls7", r.get_ls7(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Where has the applicant demonstrated leadership during this past year?","2", "textarea", 500, "_ls8", r.get_ls8(), false)%></td></tr>
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
