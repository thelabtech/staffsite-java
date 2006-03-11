<!--- ref5.jsp: "Dynamic Determination" --->
<% int theWidth = 100/6; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<%
		// for simpler coding and better performance later in page, preload integer variables from reference object
		int _dd1=r.get_dd1();
		int _dd2=r.get_dd2();
		int _dd3=r.get_dd3();
		int _dd4=r.get_dd4();
	%>

	<TR>
		<TD CLASS="appquestions" colspan="2">
			<B>Relationship with Self: Dynamic Determination</B>
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
						<TD CLASS="refinboxblue" valign="bottom">Self-discipline</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd1" VALUE="0"<%=_dd1 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd1" VALUE="1"<%=_dd1 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd1" VALUE="2"<%=_dd1 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd1" VALUE="3"<%=_dd1 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd1" VALUE="4"<%=_dd1 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd1" VALUE="5"<%=_dd1 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_dd1c" size="30" maxlength="50" value="<%=r.get_dd1c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Perseverance</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd2" VALUE="0"<%=_dd2 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd2" VALUE="1"<%=_dd2 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd2" VALUE="2"<%=_dd2 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd2" VALUE="3"<%=_dd2 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd2" VALUE="4"<%=_dd2 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd2" VALUE="5"<%=_dd2 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_dd2c" size="30" maxlength="50" value="<%=r.get_dd2c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Initative/Drive</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd3" VALUE="0"<%=_dd3 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd3" VALUE="1"<%=_dd3 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd3" VALUE="2"<%=_dd3 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd3" VALUE="3"<%=_dd3 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd3" VALUE="4"<%=_dd3 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd3" VALUE="5"<%=_dd3 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_dd3c" size="30" maxlength="50" value="<%=r.get_dd3c()%>"></TD>
					</TR>
				</DIV>
				<DIV>
					<TR>
						<TD CLASS="refinboxblue" valign="bottom">Mental Alertness</TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd4" VALUE="0"<%=_dd4 == 0 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd4" VALUE="1"<%=_dd4 == 1 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd4" VALUE="2"<%=_dd4 == 2 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd4" VALUE="3"<%=_dd4 == 3 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd4" VALUE="4"<%=_dd4 == 4 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb" ALIGN="center"><INPUT TYPE="RADIO" NAME="_dd4" VALUE="5"<%=_dd4 == 5 ? "checked=\"checked\"" : ""%>></TD>
						<TD CLASS="refinboxbb"><INPUT TYPE="TEXT" name="_dd4c" size="30" maxlength="50" value="<%=r.get_dd4c()%>"></TD>
					</TR>
				</DIV>
			</TABLE>
		</TD>
	</TR>
	<%=sihtmlutils.printInputArea("How much coaching/supervision will this applicant need to successfully complete Ministry Partner Development?  To have an effective ministry?","1", "textarea", 500, "_dd5", r.get_dd5(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("How well does the applicant follow through with tasks? decisions?  Please give examples.","2", "textarea", 500, "_dd6", r.get_dd6(), false)%></td></tr>
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
