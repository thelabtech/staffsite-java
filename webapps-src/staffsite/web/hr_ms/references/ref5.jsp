<% boolean displayEditLegend = true; %>
<% int theWidth = 100/9; %>
<%@ include file="header.jspf" %>

<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD colspan=9 CLASS="app">To what degree are the following traits apparent in the life of the applicant?</TD>
	</TR>
	<TR>
		<TD CLASS="refradio">&nbsp;</TD>
		<TD CLASS="refradio" colspan=3 align=center>Frequently</TD>
		<TD CLASS="refradio" colspan=3 align=center>Average</TD>
		<TD CLASS="refradio" colspan=2 align=center>Rarely</TD>
	</TR>
	<TR>
		<TD CLASS="refradio" WIDTH="10%">&nbsp;</TD>
		<TD CLASS="refradio" NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">&nbsp;&nbsp;?</TD>
		<TD CLASS="refradio" NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">&nbsp;&nbsp;1</TD>
		<TD CLASS="refradio" NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">&nbsp;&nbsp;2</TD>
		<TD CLASS="refradio" NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">&nbsp;&nbsp;3</TD>
		<TD CLASS="refradio" NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">&nbsp;&nbsp;4</TD>
		<TD CLASS="refradio" NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">&nbsp;&nbsp;5</TD>
		<TD CLASS="refradio" NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">&nbsp;&nbsp;6</TD>
		<TD CLASS="refradio" NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">&nbsp;&nbsp;7</TD>
	<TR>

	<TR>
		<TD CLASS="refradio">Procrastination</TD>
		<%	Integer _14a = (Integer)wsnReferenceHash.get("_14a"); if (_14a == null) _14a = new Integer(-1); %>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_14a" VALUE="0"<%=_14a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_14a" VALUE="1"<%=_14a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_14a" VALUE="2"<%=_14a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_14a" VALUE="3"<%=_14a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_14a" VALUE="4"<%=_14a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_14a" VALUE="5"<%=_14a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_14a" VALUE="6"<%=_14a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_14a" VALUE="7"<%=_14a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>

	<TR>
		<TD CLASS="refradio">Critical attitude</TD>
		<%	Integer _15a = (Integer)wsnReferenceHash.get("_15a"); if (_15a == null) _15a = new Integer(-1); %>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_15a" VALUE="0"<%=_15a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_15a" VALUE="1"<%=_15a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_15a" VALUE="2"<%=_15a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_15a" VALUE="3"<%=_15a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_15a" VALUE="4"<%=_15a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_15a" VALUE="5"<%=_15a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_15a" VALUE="6"<%=_15a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_15a" VALUE="7"<%=_15a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>

	<TR>
		<TD CLASS="refradio">Irritablity</TD>
		<%	Integer _16a = (Integer)wsnReferenceHash.get("_16a"); if (_16a == null) _16a = new Integer(-1); %>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_16a" VALUE="0"<%=_16a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_16a" VALUE="1"<%=_16a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_16a" VALUE="2"<%=_16a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_16a" VALUE="3"<%=_16a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_16a" VALUE="4"<%=_16a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_16a" VALUE="5"<%=_16a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_16a" VALUE="6"<%=_16a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_16a" VALUE="7"<%=_16a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>

	<TR>
		<TD CLASS="refradio">Anxiety, worry</TD>
		<%	Integer _17a = (Integer)wsnReferenceHash.get("_17a"); if (_17a == null) _17a = new Integer(-1); %>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_17a" VALUE="0"<%=_17a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_17a" VALUE="1"<%=_17a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_17a" VALUE="2"<%=_17a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_17a" VALUE="3"<%=_17a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_17a" VALUE="4"<%=_17a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_17a" VALUE="5"<%=_17a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_17a" VALUE="6"<%=_17a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_17a" VALUE="7"<%=_17a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>

	<TR>
		<TD CLASS="refradio">Depression</TD>
		<%	Integer _18a = (Integer)wsnReferenceHash.get("_18a"); if (_18a == null) _18a = new Integer(-1); %>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_18a" VALUE="0"<%=_18a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_18a" VALUE="1"<%=_18a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_18a" VALUE="2"<%=_18a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_18a" VALUE="3"<%=_18a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_18a" VALUE="4"<%=_18a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_18a" VALUE="5"<%=_18a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_18a" VALUE="6"<%=_18a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_18a" VALUE="7"<%=_18a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>

	<TR>
		<TD CLASS="refradio">Domineering manner</TD>
		<%	Integer _19a = (Integer)wsnReferenceHash.get("_19a"); if (_19a == null) _19a = new Integer(-1); %>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_19a" VALUE="0"<%=_19a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_19a" VALUE="1"<%=_19a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_19a" VALUE="2"<%=_19a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_19a" VALUE="3"<%=_19a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_19a" VALUE="4"<%=_19a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_19a" VALUE="5"<%=_19a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_19a" VALUE="6"<%=_19a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_19a" VALUE="7"<%=_19a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>

	<TR>
		<TD CLASS="refradio">Rebelliousness</TD>
		<%	Integer _20a = (Integer)wsnReferenceHash.get("_20a"); if (_20a == null) _20a = new Integer(-1); %>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_20a" VALUE="0"<%=_20a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_20a" VALUE="1"<%=_20a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_20a" VALUE="2"<%=_20a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_20a" VALUE="3"<%=_20a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_20a" VALUE="4"<%=_20a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_20a" VALUE="5"<%=_20a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_20a" VALUE="6"<%=_20a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_20a" VALUE="7"<%=_20a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>

	<TR>
		<TD CLASS="refradio">Anger</TD>
		<%	Integer _21a = (Integer)wsnReferenceHash.get("_21a"); if (_21a == null) _21a = new Integer(-1); %>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_21a" VALUE="0"<%=_21a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_21a" VALUE="1"<%=_21a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_21a" VALUE="2"<%=_21a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_21a" VALUE="3"<%=_21a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_21a" VALUE="4"<%=_21a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_21a" VALUE="5"<%=_21a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_21a" VALUE="6"<%=_21a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD CLASS="refradio"><INPUT TYPE="RADIO" NAME="_21a" VALUE="7"<%=_21a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>

	<TR>
		<TD CLASS="refradio">&nbsp;</TD>
		<TD CLASS="refradio" colspan=3 align=center>Frequently</TD>
		<TD CLASS="refradio" colspan=3 align=center>Average</TD>
		<TD CLASS="refradio" colspan=3 align=center>Rarely</TD>
	</TR>

	<!-- row just to get a blue line displayed -->
	<TR>
		<TD COLSPAN="9" CLASS="refradiounder">
			&nbsp;
		</TD>
	</TR>

	<TR>
		<TD COLSPAN="9" CLASS="app">
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