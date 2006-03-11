THIS FILE IS NOT USED.
<%@ include file="header.jspf" %>
<jsp:useBean id="selProj" class="org.alt60m.html.SelectOpp"/>
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Personal Information</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%">Title</TD>
		<TD CLASS="app">
			<SELECT NAME="Title" class=required onblur=UnHighlight(this) onfocus=Highlight(this)>
					<OPTION></OPTION>
					<OPTION VALUE="Mr">Mr</OPTION>
					<OPTION VALUE="Mrs">Mrs</OPTION>
					<OPTION VALUE="Ms">Ms</OPTION>
				</SELECT>
		</TD>
		<TD CLASS="app" ROWSPAN="10"><IMG src="../hr_si/images/picture.gif" border=0></TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app">Gender</TD>
		<TD CLASS="app">
			<SELECT NAME="Gender" class=required onblur=UnHighlight(this) onfocus=Highlight(this)>
				<OPTION></OPTION>
				<OPTION VALUE="1">Male</OPTION>
				<OPTION VALUE="0">Female</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app">First Name</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="FirstName" size=20></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Last Name</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="LastName" size=20></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Social Security Number</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=12></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Birthday</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="pickdate(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=12></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="15%">Marital Status</TD>
		<TD CLASS="app">
			<SELECT NAME="Title" class=required onblur=UnHighlight(this) onfocus=Highlight(this)>
					<OPTION></OPTION>
					<OPTION VALUE="0">Single</OPTION>
					<OPTION VALUE="1">Married</OPTION>
					<OPTION VALUE="2">Divorced</OPTION>
					<OPTION VALUE="3">Seperated</OPTION>
				</SELECT>
		</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Height</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=2>' <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=2>"</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Weight</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=3> lbs</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Date became a Christian</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="pickdate(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=12></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Current Contact Information</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 1</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=30></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=30></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">City</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=20></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">State</TD>
		<TD CLASS="app"><%selState.setName("State");%><%selState.setRequired("required");%><%=selState.print()%> Zip <INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=10></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Last Date at this Address</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="pickdate(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=12></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Telephone</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=12></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Cell Phone</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=12></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Email</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=30></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Emergency Contact Information</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 1</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=30></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=30></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">City</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=20></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">State</TD>
		<TD CLASS="app"><%selState.setName("State");%><%selState.setRequired("required");%><%=selState.print()%> Zip <INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=10></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Telephone</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=12></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Other Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" size=12></TD>
	</TR>
	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button">&nbsp;</TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="/hr_si/siMainFooter.jspf" %>