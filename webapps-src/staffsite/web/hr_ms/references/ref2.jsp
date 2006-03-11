<% boolean displayEditLegend = true; %>
<%@ include file="header.jspf" %>
<TABLE WIDTH="100%" CELLSPACING="0">

	<TR>
		<TD CLASS="app" COLSPAN="2">
			<STRONG>About You</STRONG><BR>
			Please verify your information entered by the applicant and make any corrections.
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">Your Name</TD>
		<TD CLASS="app">
		<%
			String title = wsnReferenceHash.get("Title") == null ? "" : (String)wsnReferenceHash.get("Title");
		%>
			<SELECT CLASS="app" NAME="Title">
					<OPTION></OPTION>
					<OPTION VALUE="Mr."<% if (title.equalsIgnoreCase("Mr.")) out.println(" selected=\"selected\""); %>>Mr.</OPTION>
					<OPTION VALUE="Mrs."<% if (title.equalsIgnoreCase("Mrs.")) out.println(" selected=\"selected\""); %>>Mrs.</OPTION>
					<OPTION VALUE="Ms."<% if (title.equalsIgnoreCase("Ms.")) out.println(" selected=\"selected\""); %>>Ms.</OPTION>
					<OPTION VALUE="Dr."<% if (title.equalsIgnoreCase("Dr.")) out.println(" selected=\"selected\""); %>>Dr.</OPTION>
					<OPTION VALUE="Rev."<% if (title.equalsIgnoreCase("Rev.")) out.println(" selected=\"selected\""); %>>Rev.</OPTION>
				</SELECT>

			First <INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="FirstName" size=20 maxlength=30<%=(String)wsnReferenceHash.get("FirstName") == null? "" : " value= \""+(String)wsnReferenceHash.get("FirstName")+"\""%>>

			Last <INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="LastName" size=20 maxlength=30<%=(String)wsnReferenceHash.get("LastName") == null? "" : " value= \""+(String)wsnReferenceHash.get("LastName")+"\""%>>
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE" WIDTH="15%">Address 1</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentAddress1" size=30 maxlength=49<%=(String)wsnReferenceHash.get("CurrentAddress1") == null? "" : " value= \""+(String)wsnReferenceHash.get("CurrentAddress1")+"\""%>></TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE">Address 2</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentAddress2" size=30 maxlength=49<%=(String)wsnReferenceHash.get("CurrentAddress2") == null? "" : " value= \""+(String)wsnReferenceHash.get("CurrentAddress2")+"\""%>></TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE">City/State/Zip</TD>
		<TD CLASS="app">
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentCity" size=20 maxlength=35<%=(String)wsnReferenceHash.get("CurrentCity") == null? "" : " value= \""+(String)wsnReferenceHash.get("CurrentCity")+"\""%>>
			<%
				if((String)wsnReferenceHash.get("CurrentState") != null)
					selState.setCurrentValue((String)wsnReferenceHash.get("CurrentState"));
				selState.setName("CurrentState");
				selState.setRequired("required");
			%><%=selState.print()%>
			<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentZip" size=10 maxlength=10<%=(String)wsnReferenceHash.get("CurrentZip") == null? "" : " value= \""+(String)wsnReferenceHash.get("CurrentZip")+"\""%>>
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT" VALIGN="MIDDLE">Telephones</TD>
		<TD CLASS="app">
		Home <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="HomePhone" size=12 maxlength=24<%=(String)wsnReferenceHash.get("HomePhone") == null? "" : " value= \""+(String)wsnReferenceHash.get("HomePhone")+"\""%>>
		Work <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="WorkPhone" size=12 maxlength=24<%=(String)wsnReferenceHash.get("WorkPhone") == null? "" : " value= \""+(String)wsnReferenceHash.get("WorkPhone")+"\""%>>
		Cell <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CellPhone" size=12 maxlength=24<%=(String)wsnReferenceHash.get("CellPhone") == null? "" : " value= \""+(String)wsnReferenceHash.get("CellPhone")+"\""%>>
		<BR>
		(Enter at least one)
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" VALIGN="TOP" ALIGN="RIGHT" VALIGN="MIDDLE">Email</TD>
		<TD CLASS="app">
			<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentEmail" size=40 maxlength=50<%=(String)wsnReferenceHash.get("CurrentEmail") == null? "" : " value= \""+(String)wsnReferenceHash.get("CurrentEmail")+"\""%>>
		</TD>
	</TR>


	<TR>
		<TD CLASS="app" VALIGN="TOP" ALIGN="RIGHT" VALIGN="MIDDLE">&nbsp;</TD>
		<TD CLASS="app">
		<DIV CLASS="applist">
			Are you CCC staff? 
			<%
				Boolean isStaff = new Boolean(false);
				if (wsnReferenceHash.get("IsStaff") != null)
					isStaff = (Boolean)wsnReferenceHash.get("IsStaff");
			%>
			<INPUT TYPE=radio NAME="IsStaff" value="true"<%= isStaff.booleanValue() == true ? " checked=\"checked\"" : ""%>> Yes
			<INPUT TYPE=radio NAME="IsStaff" value="false"<%= isStaff.booleanValue() == false ? " checked=\"checked\"" : ""%>> No

			&nbsp;&nbsp;
			
			Staff Number: <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="StaffNumber" size=16 maxlength=16<%=(String)wsnReferenceHash.get("StaffNumber") == null? "" : " value= \""+(String)wsnReferenceHash.get("StaffNumber")+"\""%>>
		</DIV>
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
			&nbsp;
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>General Information</STRONG></TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
		In what capacity have you known the applicant?
		<DIV CLASS="applist"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" type="text" name="HowKnown" size=64 maxlength=64<%=(String)wsnReferenceHash.get("HowKnown") == null? "" : " value= \""+(String)wsnReferenceHash.get("HowKnown")+"\""%>></DIV>
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
		How long have you known the applicant?
		<DIV CLASS="applist"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" type="text" name="HowLongKnown" size=64 maxlength=64<%=(String)wsnReferenceHash.get("HowLongKnown") == null? "" : " value= \""+(String)wsnReferenceHash.get("HowLongKnown")+"\""%>></DIV>
		</TD>
	</TR>

	<TR>
		<TD CLASS="appquestion" COLSPAN="2">
		How well do you know the applicant?
		<DIV CLASS="applist"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" type="text" name="HowWellKnown" size=64 maxlength=64<%=(String)wsnReferenceHash.get("HowWellKnown") == null? "" : " value= \""+(String)wsnReferenceHash.get("HowWellKnown")+"\""%>></DIV>
		</TD>
	</TR>

	<% if (! isPeerReference) { %>
		<TR>
			<TD CLASS="appquestion" COLSPAN="2">
			Is it okay for the student's mid-project evaluation to be sent to you?
			<DIV CLASS="applist">
				<%
					Boolean sendMidEval = new Boolean(false);
					if (wsnReferenceHash.get("SendMidEval") != null)
						sendMidEval = (Boolean)wsnReferenceHash.get("SendMidEval");
				%>
				<INPUT TYPE=radio NAME="SendMidEval" value="true"<%= sendMidEval.booleanValue() == true ? " checked=\"checked\"" : ""%>> Yes
				<INPUT TYPE=radio NAME="SendMidEval" value="false"<%= sendMidEval.booleanValue() == false ? " checked=\"checked\"" : ""%>> No
			</DIV>
			</TD>
		</TR>
	<% } %>

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
