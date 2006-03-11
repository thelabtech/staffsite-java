<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<TR>
		<TD CLASS="appquestions" COLSPAN="2">
			<STRONG>About You</STRONG><BR>
			Please verify your information entered by the applicant and make any corrections.
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">Your Name</TD>
		<TD CLASS="app">
		<%
			String title = r.getTitle();
		%>
			<SELECT CLASS="app" NAME="Title">
					<OPTION></OPTION>
					<OPTION VALUE="Mr."<% if (title.equalsIgnoreCase("Mr.")) out.println(" selected=\"selected\""); %>>Mr.</OPTION>
					<OPTION VALUE="Mrs."<% if (title.equalsIgnoreCase("Mrs.")) out.println(" selected=\"selected\""); %>>Mrs.</OPTION>
					<OPTION VALUE="Miss"<% if (title.equalsIgnoreCase("Miss")) out.println(" selected=\"selected\""); %>>Miss</OPTION>
					<OPTION VALUE="Ms."<% if (title.equalsIgnoreCase("Ms.")) out.println(" selected=\"selected\""); %>>Ms.</OPTION>
					<OPTION VALUE="Dr."<% if (title.equalsIgnoreCase("Dr.")) out.println(" selected=\"selected\""); %>>Dr.</OPTION>
					<OPTION VALUE="Rev."<% if (title.equalsIgnoreCase("Rev.")) out.println(" selected=\"selected\""); %>>Rev.</OPTION>
				</SELECT>

			First <INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="FirstName" size=20 maxlength="30" value="<%=r.getFirstName()%>">

			Last <INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="LastName" size=20 maxlength="30" value="<%=r.getLastName()%>">
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">Address 1</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentAddress1" size=30 maxlength="35" value="<%=r.getCurrentAddress1()%>"></TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">Address 2</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentAddress2" size=30 maxlength="35" value="<%=r.getCurrentAddress2()%>"></TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">City/State/Zip</TD>
		<TD CLASS="app">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentCity" size=20 maxlength="35" value="<%=r.getCurrentCity()%>">
			<%
				selState.setCurrentValue(r.getCurrentState());
				selState.setName("CurrentState");
				selState.setRequired("required");
			%><%=selState.print()%>
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentZip" size=10 maxlength="10" value="<%=r.getCurrentZip()%>">
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">Telephones</TD>
		<TD CLASS="app">
		Home <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="HomePhone" size=12 maxlength="24" value="<%=r.getHomePhone()%>">
		Work <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="WorkPhone" size=12 maxlength="24" value="<%=r.getWorkPhone()%>">
		Cell <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CellPhone" size=12 maxlength="24" value="<%=r.getCellPhone()%>">
		<BR>
		(Enter at least one)
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">Email</TD>
		<TD CLASS="app">
			<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentEmail" size=40 maxlength="50"  value="<%=r.getCurrentEmail()%>">
		</TD>
	</TR>


	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">&nbsp;</TD>
		<TD CLASS="app">
			<DIV CLASS="applist">
				Are you CCC staff? 

				<%
					boolean isStaff = r.getIsStaff();
				%>
				<INPUT TYPE=radio NAME="IsStaff" value="true"<%= isStaff ? " checked=\"checked\"" : ""%>> Yes
				<INPUT TYPE=radio NAME="IsStaff" value="false"<%= !isStaff ? " checked=\"checked\"" : ""%>> No

				&nbsp;&nbsp;
				
				Staff Number: <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="StaffNumber" size=16 maxlength="16" value="<%=r.getStaffNumber()%>">
			</DIV>
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Personal Information</STRONG></TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
			In what capacity have you known the applicant?<BR>
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" type="text" name="HowKnown" size=64 maxlength="64" value="<%=r.getHowKnown()%>">
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
			How long have you known the applicant?<BR>
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" type="text" name="HowLongKnown" size=64 maxlength="64" value="<%=r.getHowLongKnown()%>">
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
			<DIV>
			How well do you know the applicant?<BR>
			<INPUT TYPE="RADIO" NAME="HowWellKnown" VALUE="1"<%=r.getHowWellKnown() == 1 ? "checked=\"checked\"" : ""%>> Very Well 
			<INPUT TYPE="RADIO" NAME="HowWellKnown" VALUE="2"<%=r.getHowWellKnown() == 2 ? "checked=\"checked\"" : ""%>>  Well 
			<INPUT TYPE="RADIO" NAME="HowWellKnown" VALUE="3"<%=r.getHowWellKnown() == 3 ? "checked=\"checked\"" : ""%>> Average 
			<INPUT TYPE="RADIO" NAME="HowWellKnown" VALUE="4"<%=r.getHowWellKnown() == 4 ? "checked=\"checked\"" : ""%>> Very Little 
			</DIV>
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
			<DIV>
			How much communication have you had with the applicant in the past year?<BR>
			<INPUT TYPE="RADIO" NAME="HowWellComm" VALUE="1"<%=r.getHowWellComm() == 1 ? "checked=\"checked\"" : ""%>> Frequent 
			<INPUT TYPE="RADIO" NAME="HowWellComm" VALUE="2"<%=r.getHowWellComm() == 2 ? "checked=\"checked\"" : ""%>> Some 
			<INPUT TYPE="RADIO" NAME="HowWellComm" VALUE="3"<%=r.getHowWellComm() == 3 ? "checked=\"checked\"" : ""%>> Infrequent/Very Little 
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" COLSPAN="2">
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
