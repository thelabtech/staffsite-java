<% boolean displayEditLegend = true; %>
<% int theWidth = 100/9; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Responsibility:</B> Carries out duties and obligations</TD>
	</TR>
	<TR>
		<%	Integer _1a = (Integer)wsnReferenceHash.get("_1a"); if (_1a == null) _1a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_1a" VALUE="0"<%=_1a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_1a" VALUE="1"<%=_1a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_1a" VALUE="2"<%=_1a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_1a" VALUE="3"<%=_1a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_1a" VALUE="4"<%=_1a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_1a" VALUE="5"<%=_1a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_1a" VALUE="6"<%=_1a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_1a" VALUE="7"<%=_1a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Very Irresponsible</TD>
		<TD CLASS="refradiounder">Irresponsible</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Responsible</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Very Responsible</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Adaptability:</B> Adjusts well to change in circumstances</TD>
	</TR>
	<TR>
		<%	Integer _2a = (Integer)wsnReferenceHash.get("_2a"); if (_2a == null) _2a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_2a" VALUE="0"<%=_2a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_2a" VALUE="1"<%=_2a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_2a" VALUE="2"<%=_2a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_2a" VALUE="3"<%=_2a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_2a" VALUE="4"<%=_2a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_2a" VALUE="5"<%=_2a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_2a" VALUE="6"<%=_2a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_2a" VALUE="7"<%=_2a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Adapts with Difficulty</TD>
		<TD CLASS="refradiounder">Adapts Moderately</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" CLASS="refradio">Adapts Well</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Adapts Very Well</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Perseverance:</B> Moves ahead in the face of adversity</TD>
	</TR>
	<TR>
		<%	Integer _3a = (Integer)wsnReferenceHash.get("_3a"); if (_3a == null) _3a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_3a" VALUE="0"<%=_3a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_3a" VALUE="1"<%=_3a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_3a" VALUE="2"<%=_3a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_3a" VALUE="3"<%=_3a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_3a" VALUE="4"<%=_3a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_3a" VALUE="5"<%=_3a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_3a" VALUE="6"<%=_3a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_3a" VALUE="7"<%=_3a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Quits Often</TD>
		<TD CLASS="refradiounder">Sometimes Quits</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Usually Perseveres</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Always keeps Going</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Personal Appearance and Manners:</B></TD>
	</TR>
	<TR>
		<%	Integer _4a = (Integer)wsnReferenceHash.get("_4a"); if (_4a == null) _4a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_4a" VALUE="0"<%=_4a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_4a" VALUE="1"<%=_4a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_4a" VALUE="2"<%=_4a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_4a" VALUE="3"<%=_4a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_4a" VALUE="4"<%=_4a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_4a" VALUE="5"<%=_4a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_4a" VALUE="6"<%=_4a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_4a" VALUE="7"<%=_4a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Careless</TD>
		<TD CLASS="refradiounder">Fair</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Good</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Very Good</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Cooperation and Teamwork:</B> Works well with others</TD>
	</TR>
	<TR>
		<%	Integer _5a = (Integer)wsnReferenceHash.get("_5a"); if (_5a == null) _5a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_5a" VALUE="0"<%=_5a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_5a" VALUE="1"<%=_5a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_5a" VALUE="2"<%=_5a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_5a" VALUE="3"<%=_5a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_5a" VALUE="4"<%=_5a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_5a" VALUE="5"<%=_5a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_5a" VALUE="6"<%=_5a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_5a" VALUE="7"<%=_5a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Doesn't Cooperate</TD>
		<TD CLASS="refradiounder">Cooperates Poorly</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Cooperates Well</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Cooperates Very Well</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Communication:</B> Presents thoughts with clarity and meaning</TD>
	</TR>
	<TR>
		<%	Integer _6a = (Integer)wsnReferenceHash.get("_6a"); if (_6a == null) _6a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_6a" VALUE="0"<%=_6a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_6a" VALUE="1"<%=_6a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_6a" VALUE="2"<%=_6a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_6a" VALUE="3"<%=_6a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_6a" VALUE="4"<%=_6a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_6a" VALUE="5"<%=_6a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_6a" VALUE="6"<%=_6a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_6a" VALUE="7"<%=_6a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Poor</TD>
		<TD CLASS="refradiounder">Fair</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Good</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Outstanding</TD>
	</TR>

	<TR>
		<TD COLSPAN="8" CLASS="app"><B>Spiritual Maturity:</B> Demonstrates mature walk with God</TD>
	</TR>
	<TR>
		<%	Integer _7a = (Integer)wsnReferenceHash.get("_7a"); if (_7a == null) _7a = new Integer(-1); %>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">N/A <INPUT TYPE="RADIO" NAME="_7a" VALUE="0"<%=_7a.intValue() == 0 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">1 <INPUT TYPE="RADIO" NAME="_7a" VALUE="1"<%=_7a.intValue() == 1 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">2 <INPUT TYPE="RADIO" NAME="_7a" VALUE="2"<%=_7a.intValue() == 2 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">3 <INPUT TYPE="RADIO" NAME="_7a" VALUE="3"<%=_7a.intValue() == 3 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">4 <INPUT TYPE="RADIO" NAME="_7a" VALUE="4"<%=_7a.intValue() == 4 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">5 <INPUT TYPE="RADIO" NAME="_7a" VALUE="5"<%=_7a.intValue() == 5 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">6 <INPUT TYPE="RADIO" NAME="_7a" VALUE="6"<%=_7a.intValue() == 6 ? "checked=\"checked\"" : ""%>></TD>
		<TD NOWRAP WIDTH="<%=theWidth%>%" CLASS="refradio">7 <INPUT TYPE="RADIO" NAME="_7a" VALUE="7"<%=_7a.intValue() == 7 ? "checked=\"checked\"" : ""%>></TD>
	</TR>
	<TR>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder" ALIGN="LEFT" COLSPAN="2">Poor</TD>
		<TD CLASS="refradiounder">Questionable</TD>
		<TD CLASS="refradiounder">&nbsp;</TD>
		<TD CLASS="refradiounder">Good</TD>
		<TD CLASS="refradiounder" ALIGN="RIGHT" COLSPAN="2">Impeccable</TD>
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