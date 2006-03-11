<% String pageTitle = "Mobalizing System Demo"; %>
<%@ include file="../header.jspf" %>
<TABLE BORDER="0" WIDTH="100%">
	<TR>
		<TD ALIGN="CENTER">
			<% box.setTableInside(true); %>
			<% box.setTitle("Registration");%>
			<% box.setWidth("70%");%>
			<%=box.printTop()%>
				<TR>
					<TD ALIGN="RIGHT" NOWRAP>Email</TD>
					<TD><INPUT type=text name=email size=20></TD>
					<TD ROWSPAN="3">&nbsp;</TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" NOWRAP>Password</TD>
					<TD><INPUT type=password name=password size=20></TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" NOWRAP>Confirm Password</TD>
					<TD><INPUT type=password name=password size=20></TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" NOWRAP>Secret Question</TD>
					<TD><INPUT type=password name=password size=20></TD>
					<TD VALIGN="TOP" ROWSPAN="3">
						Your secret question will be your only way to recover you password if forget or lose it, so be sure to ask something you will always know the answer to.
					</TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" NOWRAP>Secret Answer</TD>
					<TD><INPUT type=password name=password size=20></TD>
				</TR>
				<TR>
					<TD COLSPAN="2" ALIGN="RIGHT" CLASS="button"><A HREF="SIController?action=goToPage&page=login" CLASS="button">Register</A></TD>
				</TR>
			<%=box.printBottom()%>
		</TD>
	</TR>
</TABLE>
<%@ include file="/footer.jspf" %>
</BODY>
</HTML>