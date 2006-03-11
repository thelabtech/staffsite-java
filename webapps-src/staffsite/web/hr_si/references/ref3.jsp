<!--- ref3.jsp: "Relationship with God" --->
<% int theWidth = 100/6; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<%
		// for simpler coding and better performance later in page, preload integer variables from reference object
		int _rg1=r.get_rg1();
		int _rg2=r.get_rg2();
		int _rg3=r.get_rg3();
		int _rg4=r.get_rg4();
		int _rg5=r.get_rg5();
	%>

	<TR>
		<TD CLASS="appquestions" colspan="2">
			<B>Relationship with God</B>
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
						<TD CLASS="refinboxblue" valign="bottom">Consistent spiritual walk</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg1" VALUE="0"<%=_rg1 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg1" VALUE="1"<%=_rg1 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg1" VALUE="2"<%=_rg1 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg1" VALUE="3"<%=_rg1 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg1" VALUE="4"<%=_rg1 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg1" VALUE="5"<%=_rg1 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_rg1c" size=30 maxlength="50" value="<%=r.get_rg1c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Evidence of Spirit-filled life</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg2" VALUE="0"<%=_rg2 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg2" VALUE="1"<%=_rg2 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg2" VALUE="2"<%=_rg2 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg2" VALUE="3"<%=_rg2 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg2" VALUE="4"<%=_rg2 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg2" VALUE="5"<%=_rg2 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_rg2c" size=30 maxlength="50" value="<%=r.get_rg2c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Knowledge of the Bible</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg3" VALUE="0"<%=_rg3 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg3" VALUE="1"<%=_rg3 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg3" VALUE="2"<%=_rg3 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg3" VALUE="3"<%=_rg3 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg3" VALUE="4"<%=_rg3 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg3" VALUE="5"<%=_rg3 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_rg3c" size=30 maxlength="50" value="<%=r.get_rg3c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Consistency in Prayer</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg4" VALUE="0"<%=_rg4 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg4" VALUE="1"<%=_rg4 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg4" VALUE="2"<%=_rg4 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg4" VALUE="3"<%=_rg4 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg4" VALUE="4"<%=_rg4 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg4" VALUE="5"<%=_rg4 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_rg4c" size=30 maxlength="50" value="<%=r.get_rg4c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Consistency in Bible reading</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg5" VALUE="0"<%=_rg5 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg5" VALUE="1"<%=_rg5 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg5" VALUE="2"<%=_rg5 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg5" VALUE="3"<%=_rg5 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg5" VALUE="4"<%=_rg5 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_rg5" VALUE="5"<%=_rg5 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_rg5c" size=30 maxlength="50" value="<%=r.get_rg5c()%>"></TD>
					</TR>
				</DIV>
			</TABLE>
		</TD>
	</TR>

	<%=sihtmlutils.printInputArea("What evidence is there that God is at work in this applicant's life?  Where is he/she seeing growth?","1", "textarea", 500, "_rg6", r.get_rg6(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Are you aware of any instances of sexual immorality in the applicant's life (inappropriate physical intimacy, pornography, etc.)?","2", "yesno", 0, "_rg7", r.get_rg7() ? "true" : "false", false)%>
	<%=sihtmlutils.printInputArea("Please explain:","", "textarea", 500, "_rg8", r.get_rg8(), false)%>
	<%=sihtmlutils.printInputArea("Have you talked with him/her about his/her moral convictions and his/her behavior?","", "textarea", 500, "_rg9", r.get_rg9(), false)%></td></tr>
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
