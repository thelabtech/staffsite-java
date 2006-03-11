<% String pageTitle = "Mobalizing System"; %>
<%@ include file="../header.jspf" %>
<TABLE BORDER="0" WIDTH="100%">
	<TR>
		<TD ALIGN="CENTER">
			<% box.setTitle("Sample Email");%>
			<% box.setWidth("70%");%>
			<% box.setTableInside(true);%>
			<%=box.printTop()%>
			<TR>
				<TD ALIGN="RIGHT" WIDTH="10%" CLASS="cell2"><STRONG>Date</STRONG></TD>
				<TD CLASS="cell2">Tue, 18 Jun 2002 16:48:15 -0400</TD>
			</TR>
			<TR>
				<TD ALIGN="RIGHT" CLASS="cell2"><STRONG>From</STRONG></TD>
				<TD CLASS="cell2">john.doe@yahoo.com [add to address book] [add to spam block list]</TD>
			</TR>
			<TR>
				<TD ALIGN="RIGHT" CLASS="cell2"><STRONG>Subject</STRONG></TD>
				<TD CLASS="cell2">Project Reference for John Doe</TD>
			</TR>
			<TR>
				<TD ALIGN="RIGHT" CLASS="cell2"><STRONG>To</STRONG></TD>
				<TD CLASS="cell2">joe.staff@uscm.com</TD>
			</TR>
			<TR>
				<TD COLSPAN="2">
				Mr Staff,<BR>
				<BR>
				John Doe has just applied for a Crusade Summer Project.  He has asked that we contact you to fill out a reference on him. If you
				could take a minute and fill out a reference for him, we can continue to
				process his application and let him know as soon as possible what he is doing this
				summer.<BR>
				<BR>
				The reference will only take a few short minutes and just in case you don't have
				time to finish it, we allow you to save and come back whenever it is convenient for
				you to finish.<BR>
				<BR>
				Please go to the staff site <A HREF="MSController?action=goToPage&page=ref1&as=staff">(staff.campuscrusadeforchrist.com)</A> to fill out your reference.<BR>
				<BR>
				Thank you very much.<BR>
				<BR>
				Sincerely,<BR>
				Summer Projects
				<BR>
				<BR>
				<BR>
				</TD>
			</TR>
			<TR>
				<TD COLSPAN="2">
					<INPUT type=submit value="Reply"> 
					<INPUT type=submit value="Reply All"> 
					<INPUT type=submit value="Delete"> 
					<INPUT type=submit value="Download"> 
					<INPUT type=submit value="Move"> 
					<INPUT type=submit value="All headers"> 
				</TD>
			</TR>
			<%=box.printBottom()%>
		</TD>
	</TR>
</TABLE>
<%@ include file="../footer.jspf" %>
</BODY>
</HTML>