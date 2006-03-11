<% boolean displayEditLegend = true; %>
<% int theWidth = 100/9; %>
<%@ include file="header.jspf" %>
	<TABLE WIDTH="100%" CELLSPACING="0">

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Sensitivity:</B> Sensitive to the needs and feelings of others</TD>
	</TR>
	<TR>
		<%	Integer _8a = (Integer)wsnReferenceHash.get("_8a"); if (_8a == null) _8a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_8a" VALUE="0"<%=_8a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_8a" VALUE="1"<%=_8a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_8a" VALUE="2"<%=_8a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_8a" VALUE="3"<%=_8a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_8a" VALUE="4"<%=_8a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_8a" VALUE="5"<%=_8a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_8a" VALUE="6"<%=_8a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_8a" VALUE="7"<%=_8a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Insensitive</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Sensitive</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Very Sensitive</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Emotional Stability:</B> Responds well to stressful situations</TD></TR>
	<TR>
		<%	Integer _9a = (Integer)wsnReferenceHash.get("_9a"); if (_9a == null) _9a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_9a" VALUE="0"<%=_9a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_9a" VALUE="1"<%=_9a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_9a" VALUE="2"<%=_9a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_9a" VALUE="3"<%=_9a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_9a" VALUE="4"<%=_9a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_9a" VALUE="5"<%=_9a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_9a" VALUE="6"<%=_9a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_9a" VALUE="7"<%=_9a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Difficulty with Stress</TD>
		<TD CLASS="refradiounder">Handles Inconsistently</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Handles Well</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Handles with Skill</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Self-Image:</B> Accepts and understands self</TD>
	</TR>
	<TR>
		<%	Integer _10a = (Integer)wsnReferenceHash.get("_10a"); if (_10a == null) _10a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_10a" VALUE="0"<%=_10a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_10a" VALUE="1"<%=_10a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_10a" VALUE="2"<%=_10a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_10a" VALUE="3"<%=_10a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_10a" VALUE="4"<%=_10a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_10a" VALUE="5"<%=_10a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_10a" VALUE="6"<%=_10a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_10a" VALUE="7"<%=_10a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Very Poor</TD>
		<TD CLASS="refradiounder">Fair</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Good</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Exceptional</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Personal Ministry:</B> Effective personal influence for Christ</TD>
	</TR>
	<TR>
		<%	Integer _11a = (Integer)wsnReferenceHash.get("_11a"); if (_11a == null) _11a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_11a" VALUE="0"<%=_11a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_11a" VALUE="1"<%=_11a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_11a" VALUE="2"<%=_11a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_11a" VALUE="3"<%=_11a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_11a" VALUE="4"<%=_11a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_11a" VALUE="5"<%=_11a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_11a" VALUE="6"<%=_11a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_11a" VALUE="7"<%=_11a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Not Effective</TD>
		<TD CLASS="refradiounder">Limited Effectiveness</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Active Ministry</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Exceptional Effectiveness</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Initiating with others:</B> Begins conversations with ease</TD>
	</TR>
	<TR>
		<%	Integer _12a = (Integer)wsnReferenceHash.get("_12a"); if (_12a == null) _12a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_12a" VALUE="0"<%=_12a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_12a" VALUE="1"<%=_12a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_12a" VALUE="2"<%=_12a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_12a" VALUE="3"<%=_12a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_12a" VALUE="4"<%=_12a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_12a" VALUE="5"<%=_12a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_12a" VALUE="6"<%=_12a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_12a" VALUE="7"<%=_12a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Never Initiates</TD>
		<TD CLASS="refradiounder">Occasionally Initiates</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Often Initiates</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Very Initiative</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Teachablitity:</B> Willing to recieve instruction and counsel</TD>
	</TR>
	<TR>
		<%	Integer _13a = (Integer)wsnReferenceHash.get("_13a"); if (_13a == null) _13a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_13a" VALUE="0"<%=_13a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_13a" VALUE="1"<%=_13a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_13a" VALUE="2"<%=_13a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_13a" VALUE="3"<%=_13a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_13a" VALUE="4"<%=_13a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_13a" VALUE="5"<%=_13a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_13a" VALUE="6"<%=_13a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_13a" VALUE="7"<%=_13a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Unteachable</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Teachable</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Very Teachable</TD>
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