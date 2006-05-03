<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ page import="java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%@ include file="header.jspf" %>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<%
	// Did they already select a project preference?
	String universityFullName = personHash.get("UniversityFullName")==null?"":(String)personHash.get("UniversityFullName");
	String universityState = personHash.get("UniversityState")==null?"":(String)personHash.get("UniversityState");
	String region = personHash.get("Region")==null?"":(String)personHash.get("Region");

	String projectPref1Choice = (String)personHash.get("ProjectPref1")==null?"":(String)personHash.get("ProjectPref1");
	String projectPref2Choice = (String)personHash.get("ProjectPref2")==null?"":(String)personHash.get("ProjectPref2");
	String projectPref3Choice = (String)personHash.get("ProjectPref3")==null?"":(String)personHash.get("ProjectPref3");
	String projectPref4Choice = (String)personHash.get("ProjectPref4")==null?"":(String)personHash.get("ProjectPref4");
	String projectPref5Choice = (String)personHash.get("ProjectPref5")==null?"":(String)personHash.get("ProjectPref5");

	// 2003-01-16 dc: If required fields on Personal Information page not filled in, do not allow choice of projects yet.
	// (Note: Purpose of this is that we need the gender field to show the right projects, but don't want to tell them
	// that Title is required (which loads Gender).
	boolean needPersonalInfo = infoBean.checkPersonalInfoRequiredFields(personHash);
	boolean needSchoolInfo = infoBean.checkSchoolInfoRequiredFields(personHash);
	
	String isDisabled = isSubmitted?"DISABLED":"";
	boolean showAll = false;
	showAll = ((request.getParameter("showAll") != null) && !(((String)request.getParameter("showAll")).trim().equals("")));
	// only fetches projects that aren't full!  this will include their project prefs if they are in another region and the regional choices are being shown, but doesn't make up for it if their project prefs have become full since they selected them!
	Collection projects = infoBean.getValidProjects(region, showAll, (String)personHash.get("Gender"), projectPref1Choice, projectPref2Choice, projectPref3Choice, projectPref4Choice, projectPref5Choice);
%>
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD COLSPAN="2">
<%
		if (needPersonalInfo || needSchoolInfo) {
				isDisabled = "DISABLED";
%>
				<B>Please note: You must enter all required fields on the Personal Information page and School Information page before selecting your Project Preferences.</B>
<%
		} else {
%>
			<P>
			If you are looking for a project that is not shown, that project might not be accepting new applications at this time.  The initial projects that are displayed in the drop down list below include all national projects and those coordinated by your respective local region.  You can click below to see ALL projects available to you in the drop down list (including those coordinated by other regions).  Once the page refreshes, you can then click the option to take you back to the original view of all national projects and those coordinated by your respective local region only.
			<P>
<%
			if (showAll == false) {
				if ((region == null) || (region.trim().equals(""))) {
%>
					Please note: Your project options are limited until you enter your school information on the School Information page.
<%				
				} else {
%>
					<input type="hidden" name="showAll" value="true">
					<a href="javascript:doPostFormNextAction('appFormSave', 'goToView', 'app3')" style="padding: 1px 5px; background-color: #336699; color: white;">Click here to see projects in other regions too.</a>
<%		
				} 
			} else {
%>
				<a href="javascript:doPostFormNextAction('appFormSave', 'goToView', 'app3')" style="padding: 1px 5px; background-color: #336699; color: white;">Click here to only see projects near you.</a>
<%
			}
		}
%>
			<P>
		</TD>
	</TR>
	<TR>
		<TD colspan="3">
			<TABLE WIDTH="100%" CELLSPACING="0">
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%">Project Preference 1</TD>
					<TD CLASS="app">
						<%
						String projectDisplay= makeProjectMenuOptions(projects, "1", projectName[0], (String)personHash.get("ProjectPref1"),isDisabled);
						%>
						
							<%=projectDisplay%>
						
					</TD>
					<TD width="35%" rowspan="5">
						<B>NOTE:</B> While we do our best to place you on your top choice summer project, we cannot guarantee your assignment as project spots fill up quickly.  We ask that once you are accepted to a specific project, you attend that project unless you choose to decline and not go on any summer project.  It is not possible to switch project assignments once you have been accepted to a specific location.

						<P>
						If you are applying for an International Summer Project, <a href="/wsnsp/pdfforms/parentsletter.pdf" target="_blank">click here</a> to download the Parents letter and consent form.
					</TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%">Project Preference 2</TD>
					<TD CLASS="app">
						<%=makeProjectMenuOptions(projects, "2", projectName[1],(String)personHash.get("ProjectPref2"),isDisabled)%>
					</TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%">Project Preference 3</TD>
					<TD CLASS="app">
						<%=makeProjectMenuOptions(projects, "3", projectName[2], (String)personHash.get("ProjectPref3"),isDisabled)%>
					</TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%">Project Preference 4</TD>
					<TD CLASS="app">
						<%=makeProjectMenuOptions(projects, "4", projectName[3], (String)personHash.get("ProjectPref4"),isDisabled)%>
					</TD>
				</TR>
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%">Project Preference 5</TD>
					<TD CLASS="app">
						<%=makeProjectMenuOptions(projects, "5", projectName[4], (String)personHash.get("ProjectPref5"),isDisabled)%>
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD ALIGN="RIGHT" CLASS="app" WIDTH="20%">If your preferences are unavailable, are you willing to participate in another Summer Project?</TD>
		<TD CLASS="app">
			<DIV CLASS="applist">
                <%=PersonYesNo(isSubmitted, personHash, "WillingForDifferentProject",NoEditAfterSubmit)%>
			</DIV>
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
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>