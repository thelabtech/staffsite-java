<% String pageTitle = "Mobalizing System Demo"; %>
<%@ include file="../header.jspf" %>
<TABLE BORDER="0" WIDTH="100%">
	<TR>
		<TD ALIGN="CENTER">
			<% box.setTableInside(true); %>
			<% box.setTitle("Warning!");%>
			<% box.setWidth("70%");%>
			<%=box.printTop()%>
				<TR>
					<TD COLSPAN="2" VALIGN="TOP" ALIGN="CENTER">
						If you use a paper application your acceptence may be delayed for weeks.<BR>
						This will greatly increase the probabily that all the slots on your project<BR>
						will be filled. There is a $15 premium to process paper applications.<br>
						Are you sure you want to do this?
					</TD>
				</TR>
				<TR>
					<TD ALIGN="LEFT" CLASS="button"><A HREF="MSController?action=goToPage&page=login" CLASS="button">&lt;&lt; Back</A></TD>
					<TD ALIGN="RIGHT" CLASS="button"><A HREF="http://staff.campuscrusadeforchrist.com/cms/content/172016001080103427263350900110.pdf" CLASS="button">I Have To</A></TD>
				</TR>
			<%=box.printBottom()%>
		</TD>
	</TR>
</TABLE>
<%@ include file="../footer.jspf" %>
</body>
</html>