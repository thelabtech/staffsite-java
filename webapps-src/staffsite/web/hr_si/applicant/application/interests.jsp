<%@ include file="header.jspf" %>
<%@ page import="org.alt60m.hr.si.servlet.dbio.*" %>

<%!
private String makeProjectMenuOptions(Collection projects, String defaultValue) {
	String returnString = "";
	Iterator itr = projects.iterator();
	while (itr.hasNext()) {
		Hashtable project = (Hashtable)itr.next();
		String projectID = project.get("SIProjectID").toString();
		returnString += "\n\t\t<option value=\""+projectID+"\"";
		if (projectID.equalsIgnoreCase(defaultValue)) returnString += " selected=\"selected\"";
		returnString += ">"+project.get("DisplayLocation")+"</option>";
	}
	return returnString;
}
%>

<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postMinistryInterests";
-->
</script>

<%
	// Can we find their region?
	String recentSchools = p.getRecentSchools()==null?"":p.getRecentSchools();
	String universityState = p.getUniversityState()==null?"":p.getUniversityState();
	String region = siBean.getCampusRegion(recentSchools, universityState);
	String gender = null;
	String locationAChoice = a.getLocationA()==null?"":a.getLocationA();
	String locationBChoice = a.getLocationB()==null?"":a.getLocationB();
	String locationCChoice = a.getLocationC()==null?"":a.getLocationC();
	/* TO DO: Need a way to get the gender so that checks can be made against
	the maximum values (e.g. MaxNoStudentPMale).
	Right now, since it's always null, gender maximums are ignored. */
	boolean showAll = false;
	showAll = ((request.getParameter("showAll") != null) && !(((String)request.getParameter("showAll")).trim().equals("")));
	Collection projects = siBean.getValidProjects(region, showAll, gender, locationAChoice, locationBChoice, locationCChoice);
%>
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Ministry Interests</STRONG></TD>
	</TR>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">1.</td>
		<TD CLASS="app" ALIGN="left" WIDTH="95%">
<%
		if ((appType != null) && (appType.equals("impact"))) {
%> 			You are applying for a fellowship with the Impact Movement.
<%
		} else {
%>
			I am interested in the following internship(s):
<%
		}
%> 		</td>
			</tr>
	<tr><TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%"></td>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="95%">
		<TABLE WIDTH="100%" CELLSPACING="0" class="insidebox">
		<tr>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP" width="5%"></td>
			<TD CLASS="app" ALIGN="left" VALIGN="BOTTOM" width="60%">Location</td>
			<TD CLASS="app" ALIGN="left" VALIGN="BOTTOM" width="35%">If you selected 'US Internship', please specify the location here. </td>
		</tr>
		<tr>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">A.</td>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">
<%
			if ((appType != null) && (appType.equals("impact"))) {

%> 				<INPUT TYPE=HIDDEN NAME="LocationA" VALUE="448"><B>Impact Fellowship</B>
<%
			} else {

%> 				<SELECT NAME="LocationA" onblur=UnHighlight(this) onfocus=Highlight(this)>
					<%=makeProjectMenuOptions(projects, a.getLocationA())%>
				</SELECT>
<%
				}
%>		
			</td>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">
<%
			if ((appType == null) || (!appType.equals("impact"))) {
%>
				<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="LocationAExplanation" <%=InputValue(isSubmitted, a.getLocationAExplanation(),NoEditAfterSubmit)%> size=30 maxlength=90>
<%
			}
%>
			</td>
		</tr>
		<tr>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">B.</td>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">
<%
				if ((appType != null) && (appType.equals("impact"))) {
%>
					<INPUT TYPE=HIDDEN NAME="LocationB" VALUE="433"><B>Other</B>
<%
				} else {
%>
				<SELECT NAME="LocationB" onblur=UnHighlight(this) onfocus=Highlight(this)>
					<%=makeProjectMenuOptions(projects, a.getLocationB())%>
				</SELECT>
<%
				}
%>
					
			</td>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">
				<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="LocationBExplanation" <%=InputValue(isSubmitted, a.getLocationBExplanation(),NoEditAfterSubmit)%> size=30 maxlength=90>
			</td>
		</tr>
		<tr>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">C.</td>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">
<%
				if ((appType != null) && (appType.equals("impact"))) {
%>
					<INPUT TYPE=HIDDEN NAME="LocationC" VALUE="433"><B>Other</B>
<%
				} else {
%>
				<SELECT NAME="LocationC" onblur=UnHighlight(this) onfocus=Highlight(this)>
					<%=makeProjectMenuOptions(projects, a.getLocationC())%>
				</SELECT>
<%
				}
%>
					
			</td>
			<TD CLASS="app" ALIGN="left" VALIGN="TOP">
				<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="LocationCExplanation" <%=InputValue(isSubmitted, a.getLocationCExplanation(),NoEditAfterSubmit)%> size=30 maxlength=90>
			</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="top" WIDTH="5%"></td>
		<TD CLASS="app" ALIGN="right" VALIGN="top" WIDTH="95%">
<% 
if ((appType == null) || (!appType.equals("impact"))) {
	if (showAll == false) { 
		if ((region == null) || (region.trim().equals(""))){
%>
			<div class="small" style="text-align:right"><span class="reallysmall">Once you enter your school information, we can show you more location options.</span></div>
<% 
		} else { 
%>
		<input type="hidden" name="showAll" value="true">
		<div style="text-align:right"><A CLASS="menuactive" HREF="javascript: doPostForm('interests')"><span class="reallysmall" style="padding: 1px 5px; background-color: #336699; color: white; font-size: 8pt; font-weight: normal;">Show me other regional internships.</span></a></div>
<% 
		} 
	} else { 
%>
		<div style="text-align:right"><A CLASS="menuactive" HREF="javascript: doPostForm('interests')"><span class="reallysmall" style="padding: 1px 5px; background-color: #336699; color: white; font-size: 8pt; font-weight: normal;">Only show me internships sponsored near me.</span></a></div>
<% 
	}
}
%>
	
		<br>&nbsp;</td>
	</tr>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="top" WIDTH="5%">2.</td>
		<TD CLASS="app" ALIGN="left" VALIGN="top" WIDTH="95%">
<%
		if ((appType != null) && (appType.equals("impact"))) {
%>
			Earliest date available for the fellowship (month and year):<br>
<%
		} else {
%>
			Earliest date available for internship (month and year):<br>
<%
		}
%>

		<SELECT NAME="AvailableMonth" onblur=UnHighlight(this) onfocus=Highlight(this) <%=ValueDisabled(isSubmitted, a.getAvailableMonth())%>>
			<OPTION></OPTION>
			<OPTION VALUE="1"<%= "1".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>January</OPTION>
			<OPTION VALUE="2"<%= "2".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>February</OPTION>
			<OPTION VALUE="3"<%= "3".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>March</OPTION>
			<OPTION VALUE="4"<%= "4".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>April</OPTION>
			<OPTION VALUE="5"<%= "5".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>May</OPTION>
			<OPTION VALUE="6"<%= "6".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>June</OPTION>
			<OPTION VALUE="7"<%= "7".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>July</OPTION>
			<OPTION VALUE="8"<%= "8".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>August</OPTION>
			<OPTION VALUE="9"<%= "9".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>September</OPTION>
			<OPTION VALUE="10"<%= "10".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>October</OPTION>
			<OPTION VALUE="11"<%= "11".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>November</OPTION>
			<OPTION VALUE="12"<%= "12".equals(a.getAvailableMonth()) ? " SELECTED": "" %>>December</OPTION>
		</SELECT>
		<SELECT NAME="AvailableYear" onblur=UnHighlight(this) onfocus=Highlight(this) <%=ValueDisabled(isSubmitted, a.getAvailableYear())%>>
			<OPTION></OPTION>
			<%
				for( int i = 2001; i <= SIUtil.CURRENT_SI_YEAR_INT; i++ ) {
			%>
					<OPTION VALUE="<%=i%>"<%= new Integer(i).toString().equals(a.getAvailableYear()) ? " SELECTED": "" %>><%=i%></OPTION>
			<%
				}
			%>
		</SELECT>
		<br>&nbsp;</td>
	</tr>
<%
		if ((appType != null) && (appType.equals("impact"))) {
%>
			<%=sihtmlutils.printInputArea("Do you have any plans that would conflict with your involvement in a fellowship during the time period for which you are applying?","3", "intyesno", 0, "HasMinistryConflict", Integer.toString(a.getHasMinistryConflict()) , false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("Do you have any plans that would conflict with your involvement in an internship during the time period for which you are applying?","3", "intyesno", 0, "HasMinistryConflict", Integer.toString(a.getHasMinistryConflict()), false)%>
<%
		}
%>
	<%=sihtmlutils.printInputArea("If yes, please explain.","", "textarea", 750, "MinistryConflictExplanation", a.getMinistryConflictExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Have you been recruited to a specific location and team?","4", "intyesno", 0, "HasSpecificLocation", Integer.toString(a.getHasSpecificLocation()), false)%>
	By whom?<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="SpecificLocationRecruiterName" <%=InputValue(isSubmitted, a.getSpecificLocationRecruiterName(),NoEditAfterSubmit)%> size=50 maxlength=50>
		<br>&nbsp;</td>
	</tr>
	<%=sihtmlutils.printInputArea("I would like to be on a team with the following people:","5", "textarea", 750, "TeamMembers", a.getTeamMembers(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Are you dating anyone?","6", "intyesno", 0, "IsDating", Integer.toString(a.getIsDating()), false)%>
<%
		if (!(appType == null && appType.equals("impact"))) {
%>
			<%=sihtmlutils.printInputArea("Where will they be during your fellowship year?","", "textarea", 750, "DatingLocation", a.getDatingLocation(), false)%></td></tr>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("Where will they be during your internship year?","", "textarea", 750, "DatingLocation", a.getDatingLocation(), false)%></td></tr>
<%
		}
%>
<%@ include file="bnav2way.jspf" %>
