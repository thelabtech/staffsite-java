<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Personal Information</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%">Title</TD>
		<TD CLASS="app">
		<%	String title = (String)personHash.get("Title");
			if (title == null) title = ""; %>
			<SELECT NAME="Title" class=required onblur=UnHighlight(this) onfocus=Highlight(this)>
					<OPTION></OPTION>
					<OPTION VALUE="Mr."<% if (title.equalsIgnoreCase("Mr.")) out.println(" selected=\"selected\""); %>>Mr.</OPTION>
					<OPTION VALUE="Mrs."<% if (title.equalsIgnoreCase("Mrs.")) out.println(" selected=\"selected\""); %>>Mrs.</OPTION>
					<OPTION VALUE="Ms."<% if (title.equalsIgnoreCase("Ms.")) out.println(" selected=\"selected\""); %>>Ms.</OPTION>
			</SELECT><br />
		</TD>
	</TR>
	<TR>
	<TD ALIGN="RIGHT" CLASS="app"></TD>
	<TD CLASS="app">Your full legal name, as it appears on your passport.</TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app">First Name</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "LegalFirstName",20,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app">Middle Name</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "LegalMiddleName",20,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Last Name</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "LegalLastName",20,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Birth Date</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="checkDate(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "Birthdate",12,AlwaysEdit)%>> (MM/DD/YYYY)&nbsp;[<a href="javascript:pickdate(document.appForm.Birthdate)">choose date</a>]</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="15%">Marital Status</TD>
		<TD CLASS="app">
		<%	String maritalStatus = (String)personHash.get("MaritalStatus");
			if (maritalStatus == null) maritalStatus = ""; %>
			<SELECT NAME="MaritalStatus" class=required onblur=UnHighlight(this) onfocus=Highlight(this)>
					<OPTION></OPTION>
					<OPTION VALUE="S"<% if (maritalStatus.equalsIgnoreCase("S")) out.println(" selected=\"selected\""); %>>Single</OPTION>
					<OPTION VALUE="M"<% if (maritalStatus.equalsIgnoreCase("M")) out.println(" selected=\"selected\""); %>>Married</OPTION>
					<OPTION VALUE="D"<% if (maritalStatus.equalsIgnoreCase("D")) out.println(" selected=\"selected\""); %>>Divorced</OPTION>
					<OPTION VALUE="P"<% if (maritalStatus.equalsIgnoreCase("P")) out.println(" selected=\"selected\""); %>>Separated</OPTION>
					<OPTION VALUE="W"<% if (maritalStatus.equalsIgnoreCase("W")) out.println(" selected=\"selected\""); %>>Widowed</OPTION>
				</SELECT><br />
				<div class="note">Space is limited for married couples</div>
		</TD>
	</TR>

	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Date Received Christ</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "DateBecameChristian",30,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Current Mailing Address</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 1</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "CurrentAddress",30,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "CurrentAddress2",30,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">City</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "CurrentCity",20,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">State</TD>
		<TD CLASS="app">
		<%
			if((String)personHash.get("CurrentState") != null)
				selState.setCurrentValue((String)personHash.get("CurrentState")); selState.setName("CurrentState");
				selState.setRequired("required");
		%><%=selState.print()%> 
		Zip <INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "CurrentZip",10,AlwaysEdit)%>></TD>
	</TR>
	<!-- <TR>
		<TD CLASS="app" ALIGN="RIGHT">I will be at the above address until:</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="checkDate(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "DateAddressGoodUntil",12,AlwaysEdit)%>> (MM/DD/YYYY)&nbsp;[<a href="javascript:pickdate(document.appForm.DateAddressGoodUntil)">choose date</a>]</TD>
	</TR> -->
		<%
			String phoneRequired = "";
			String temp = "";
			temp += (String)personHash.get("CurrentPhone");
			temp += (String)personHash.get("CurrentCellPhone");
			if (temp == null  ||  temp.trim().equals("")) {
				phoneRequired = "required";
			}
		%>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Telephone</TD>
		<TD CLASS="app"><INPUT CLASS="<%=phoneRequired%>" onFocus="Highlight(this)" onBlur="CheckPhones(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "CurrentPhone",12,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Cell Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="CheckPhones(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "CurrentCellPhone",12,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Email</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="checkEmail(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "CurrentEmail",30,AlwaysEdit)%>>
		</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">How often do you check your email?</TD>
		<TD CLASS="app">
			<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "HowOftenCheckEmail",30,AlwaysEdit)%>><BR>
		</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">What is the easiest way to communicate with you?</TD>
		<TD CLASS="app" ALIGN="LEFT">
			<DIV>
				<%	String method = (String)personHash.get("PreferredContactMethod");
					if (method == null) method = new String("T"); %>
				<INPUT type=radio name="PreferredContactMethod" value="T" <%=method.equals("T") ? " checked=\"checked\"" : ""%>> Telephone
				<INPUT type=radio name="PreferredContactMethod" value="C" <%=method.equals("C") ? " checked=\"checked\"" : ""%>> Cell
				<INPUT type=radio name="PreferredContactMethod" value="E" <%=method.equals("E") ? " checked=\"checked\"" : ""%>> Email
			</DIV>
		</TD>
	</TR>
	<TR>
		<td class="app" align="right" valign="top">Passport</TD>
		<TD CLASS="app" VALIGN="BOTTOM">
			Number: <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "PassportNo",25,AlwaysEdit)%>><br />
			Expires: <INPUT onFocus="Highlight(this)" onBlur="checkDate(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "PassportExpirationDate",12,AlwaysEdit)%>> (MM/DD/YYYY)&nbsp;[<a href="javascript:pickdate(document.appForm.PassportExpirationDate)">choose date</a>]
		</TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Parents'/Emergency Contact Address</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Parents' Full Names</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EmergName",30,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 1</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EmergAddress",30,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EmergAddress2",30,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">City</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EmergCity",20,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">State</TD>
		<TD CLASS="app">
		<%
			if((String)personHash.get("EmergState") != null)
				selState.setCurrentValue((String)personHash.get("EmergState"));
			selState.setName("EmergState");
			selState.setRequired("");
		%>
		<%=selState.print()%> 
		Zip <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EmergZip",10,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Telephone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EmergPhone",12,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Other Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EmergWorkPhone",12,AlwaysEdit)%>></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Email</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="checkEmail(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EmergEmail",30,AlwaysEdit)%>>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="3">
			<TABLE WIDTH="100%" CELLSPACING="0">
				<TR>
					<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
					<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A></TD>
					<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>
