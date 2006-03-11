<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<%@ page import="java.text.SimpleDateFormat, javax.xml.transform.*, java.net.*, java.util.*, javax.xml.transform.stream.*" %>
<%
	if ((Date)personHash.get("SpringBreakStart") != null)
		personHash.put("SpringBreakStart",new SimpleDateFormat("MM/dd/yyyy").format((Date)personHash.get("SpringBreakStart")));
	if ((Date)personHash.get("SpringBreakEnd") != null)
		personHash.put("SpringBreakEnd",new SimpleDateFormat("MM/dd/yyyy").format((Date)personHash.get("SpringBreakEnd")));
%>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0">
	<tr>
		<TD ALIGN="RIGHT" CLASS="app" colspan="2">
			<TABLE BORDER=1 rules=none border=1>
            <% if(!(isSubmitted && PersonHasValue(personHash, "UniversityState") && PersonHasValue(personHash, "UniversityFullName"))) { %>
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%" valign="top">&nbsp;
						
					</TD>
					<td class="button">
						<A class="button" href="javascript:popupWindow('/hr_ms/campuslist.jsp?state='+document.appForm.UniversityState.value,'Help','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=400,width=510,height=400'%20)">Click here</A> to fill-in the two following questions.<br />
					</td>
				</tr>
             <% } %>
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%" valign="top">
						What State is your school in?
					</TD>
					<TD CLASS="app">
						<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="UniversityState" size=2<%=(String)personHash.get("UniversityState") == null? "" : " value= \""+(String)personHash.get("UniversityState")+"\""%> readonly="readonly">
					</TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%" valign="top">
						University's Full Name:
					</TD>
					<TD CLASS="app">
						<INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="UniversityFullName" size=75<%=(String)personHash.get("UniversityFullName") == null? "" : " value= \""+(String)personHash.get("UniversityFullName")+"\""%> readonly="readonly">
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%" valign="top">Major</TD>
		<TD CLASS="app">
			<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "Major",30,NoEditAfterSubmit)%>></TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app">Class</TD>
		<TD CLASS="app">
		<%	String yearInSchool = (String)personHash.get("YearInSchool");
			if (yearInSchool == null) yearInSchool = ""; %>
			<SELECT NAME="YearInSchool" class=required onblur=UnHighlight(this) onfocus=Highlight(this) <%=PersonValueDisabled(isSubmitted, personHash, "YearInSchool")%>>
				<OPTION></OPTION>
				<OPTION VALUE="Freshman"<% if (yearInSchool.equalsIgnoreCase("Freshman")) out.println(" selected=\"selected\""); %>>Freshman</OPTION>
				<OPTION VALUE="Sophomore"<% if (yearInSchool.equalsIgnoreCase("Sophomore")) out.println(" selected=\"selected\""); %>>Sophomore</OPTION>
				<OPTION VALUE="Junior"<% if (yearInSchool.equalsIgnoreCase("Junior")) out.println(" selected=\"selected\""); %>>Junior</OPTION>
				<OPTION VALUE="Senior"<% if (yearInSchool.equalsIgnoreCase("Senior")) out.println(" selected=\"selected\""); %>>Senior</OPTION>
				<OPTION VALUE="Grad Student"<% if (yearInSchool.equalsIgnoreCase("Grad Student")) out.println(" selected=\"selected\""); %>>Grad Student</OPTION>
				<OPTION VALUE="Alumni"<% if (yearInSchool.equalsIgnoreCase("Alumni")) out.println(" selected=\"selected\""); %>>Alumni</OPTION>
				<OPTION VALUE="Other"<% if (yearInSchool.equalsIgnoreCase("Other")) out.println(" selected=\"selected\""); %>>Other</OPTION>
			</SELECT> 
			If Other, please explain: <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "OtherClassDetails",30,NoEditAfterSubmit)%>>
		</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Graduation Date</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="checkDate(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "GraduationDate",12,NoEditAfterSubmit)%>> 
		<% if (!isSubmittedAndNotEmpty(isSubmitted, (String)personHash.get("GraduationDate"))) { %> (MM/DD/YYYY) &nbsp; [<a href="javascript:pickdate(document.appForm.GraduationDate)">choose date</a>]<% } %></TD>
	</TR>
	<TR>
	<!-- both springbreak fields should be CLASS="required" 11-7-03 kl: change from required to app-->
		<TD CLASS="app" ALIGN="RIGHT">Dates of Your Spring Break</TD>
		<TD CLASS="app"><INPUT class="app" onFocus="Highlight(this)" onBlur="checkDate(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "SpringBreakStart",12,NoEditAfterSubmit)%>> to 
		<INPUT class="app" onFocus="Highlight(this)" onBlur="checkDate(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "SpringBreakEnd",12,NoEditAfterSubmit)%>>
		<% if (!isSubmitted) { %>(MM/DD/YYYY)<br/>[<a href="javascript:pickdate(document.appForm.SpringBreakStart)">Pick your Spring Break Start Date</a>]<br />
		[<a href="javascript:pickdate(document.appForm.SpringBreakEnd)">Pick your Spring Break End Date</a>]<% } %>
		</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Earliest date available (consider finals)</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="checkDate(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "EarliestAvailableDate",12,NoEditAfterSubmit)%>> 
		<% if (!isSubmitted) { %>(MM/DD/YYYY)&nbsp;[<a href="javascript:pickdate(document.appForm.EarliestAvailableDate)">choose date</a>]<% } %></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Date must return</TD>
		<TD CLASS="app"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="checkDate(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "DateMustReturn",12,NoEditAfterSubmit)%>> 
		<% if (!isSubmitted) { %>(MM/DD/YYYY)&nbsp;[<a href="javascript:pickdate(document.appForm.DateMustReturn)">choose date</a>] <% } %></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Will you be in school next fall?</TD>
		<TD CLASS="app">
			<DIV CLASS="applist">
				<%=PersonYesNo(isSubmitted, personHash, "InSchoolNextFall",NoEditAfterSubmit)%><BR>
			</DIV>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN=2 CLASS="app"><BR><B>Please complete the following 2 required questions:</B><BR>&nbsp;<BR></TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app" background="#FFFF99" VALIGN="TOP">On your campus is there</TD>
		<TD CLASS="required">
            <%=PersonCheckBox(isSubmitted, personHash, "CampusHasStaffTeam",NoEditAfterSubmit)%> a CCC staff team<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "CampusHasStaffCoach",NoEditAfterSubmit)%> a CCC staff-coach in another city<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "CampusHasMetroTeam",NoEditAfterSubmit)%> a CCC metro team<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "CampusHasOther",NoEditAfterSubmit)%> other, please explain
			<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" <%=PersonInputValue(isSubmitted, personHash, "CampusHasOtherDetails",30,NoEditAfterSubmit)%>>
		</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">&nbsp;<BR>&nbsp;<BR></TD>
		<TD CLASS="app">&nbsp;<BR>&nbsp;<BR></TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app" VALIGN="TOP">I participate in (check at least one):</TD>
		<TD CLASS="required">
            <%=PersonCheckBox(isSubmitted, personHash, "ParticipateImpact",NoEditAfterSubmit)%> Impact <BR>
            <%=PersonCheckBox(isSubmitted, personHash, "ParticipateDestino",NoEditAfterSubmit)%> Destino <BR>
            <%=PersonCheckBox(isSubmitted, personHash, "ParticipateEpic",NoEditAfterSubmit)%> Epic <BR>
            <%=PersonCheckBox(isSubmitted, personHash, "ParticipateCCC",NoEditAfterSubmit)%> Campus Crusade for Christ <BR>
            <%=PersonCheckBox(isSubmitted, personHash, "ParticipateNone",NoEditAfterSubmit)%> None of the above <BR>
		</TD>
	</TR>

	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
			</TR>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>