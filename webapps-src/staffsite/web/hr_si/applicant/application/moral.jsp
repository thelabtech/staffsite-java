<%@ include file="header.jspf" %>
<%@ page import="org.alt60m.hr.si.servlet.dbio.*" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postMoralConvictions";
-->
</script>


<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Moral Convictions</STRONG></TD>
	</TR>
	<tr>
		<TD CLASS="app" Colspan="2" ALIGN="left" WIDTH="100%"><p>
<%
		if(appType.equals("impact")){
%>
			The Bible makes it clear that we should avoid sexual immorality (1 Thessalonians 4:3-6).  Being "above reproach" and "having a good reputation" are two of the qualifications for spiritual leadership listed in 1Timothy 3.  In light of this, the Impact Movement is highly concerned about the area of moral purity for our Impact fellows.  It is critical that each fellow exhibit strong convictions and a lifestyle consistent with Biblical standards.</p>
			<p>A past problem in this area does not necessarily disqualify you, provided: 1) it can be determined that convictions are strong and consistent with Scripture, and 2) a sufficient "time-tested" track record of victory has been established.  The information that you share with us will be treated confidentially and will be seen only by those individuals directly involved in your application decision.</p>
			<p>NOTE:  Because of the sensitive nature of these questions (or if you are uncomfortable entering this through the secure web site), you may prefer to discuss your answers over the phone.  If so, indicate your desire for a phone interview.</p>
<%
		} else {
%>
			The Bible makes it clear that we should avoid sexual immorality (1 Thessalonians 4:3-6).  Being "above reproach" and "having a good reputation" are two of the qualifications for spiritual leadership listed in 1Timothy 3.  In light of this, Campus Crusade for Christ is highly concerned about the area of moral purity for our interns.  It is critical that each intern exhibit strong convictions and a lifestyle consistent with Biblical standards.</p>
			<p>A past problem in this area does not necessarily disqualify you, provided: 1) it can be determined that convictions are strong and consistent with Scripture, and 2) a sufficient "time-tested" track record of victory has been established.  The information that you share with us will be treated confidentially and will be seen only by those individuals directly involved in your application decision.</p>
			<p>NOTE:  Because of the sensitive nature of these questions (or if you are uncomfortable entering this through the secure web site), you may prefer to discuss your answers over the phone.  If so, indicate your desire for a phone interview.</p>
<%
		}
%>
		</td>
	</tr>
	<tr>
		<TD CLASS="app" COLSPAN="2" ALIGN="left" WIDTH="100%"><br>Phone call requested? <INPUT type=radio name="HasRequestedPhoneCall" value="1"<%= a.getHasRequestedPhoneCall()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>> Yes <INPUT type=radio name="HasRequestedPhoneCall" value="0"<%= a.getHasRequestedPhoneCall()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>> No &nbsp;&nbsp;&nbsp;
		Phone #:<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="ContactPhoneNumber" <%=InputValue(isSubmitted, a.getContactPhoneNumber(),NoEditAfterSubmit)%> size=20 maxlength=20>
		<BR>
		Best time of day to call:<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="ContactBestTime" <%=InputValue(isSubmitted, a.getContactBestTime(),NoEditAfterSubmit)%> size=40 maxlength=50>
		&nbsp;&nbsp;&nbsp;Time Zone: <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="ContactTimeZone" <%=InputValue(isSubmitted, a.getContactTimeZone(),NoEditAfterSubmit)%> size=20 maxlength=50>
		<br>&nbsp;</td>
	</tr>
	<%=sihtmlutils.printInputArea("What are your convictions regarding pre-marital and extra-marital physical involvement (e.g. petting, oral sex, sexual intercourse)?  What else would you consider as inappropriate activities outside of marriage?","1", "textarea", 1000, "SexualInvolvementExplanation", a.getSexualInvolvementExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Have you set personal guidelines for the physical area of your relationships to ensure minimal temptation?","2", "intyesno", 0, "HasSexualGuidelines", Integer.toString(a.getHasSexualGuidelines()), false)%>
	<%=sihtmlutils.printInputArea("If so, what are they?  Please be specific.","", "textarea", 500, "SexualGuidelineExplanation", a.getSexualGuidelineExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Are you currently dating anyone?","3", "intyesno", 0, "IsCurrentlyDating", Integer.toString(a.getIsCurrentlyDating()), false)%>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("(If \"no,\" skip to question 4)<br>Where will they most likely be during your fellowship?","", "textarea", 200, "CurrentlyDatingLocation", a.getCurrentlyDatingLocation(), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("(If \"no,\" skip to question 4)<br>Where will they most likely be during your internship?","", "textarea", 200, "CurrentlyDatingLocation", a.getCurrentlyDatingLocation(), false)%>
<%
		}
%>
	</td></tr>
	<%=sihtmlutils.printInputArea("Have you ever been involved in any homosexual activity?","4", "intyesno", 0, "HasHomosexualInvolvement", Integer.toString(a.getHasHomosexualInvolvement()), false)%>
	<%=sihtmlutils.printInputArea("If yes, please explain.","", "textarea", 500, "HomosexualInvolvementExplanation", a.getHomosexualInvolvementExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("In the past 12 months have you had any struggles with pornography?","5", "intyesno", 0, "HasRecentPornographicInvolvement", Integer.toString(a.getHasRecentPornographicInvolvement()), false)%>
	<div>If so, when was the last incident?
		(month & year)
		<SELECT NAME="PornographicInvolvementMonth" onblur=UnHighlight(this) onfocus=Highlight(this) <%=ValueDisabled(isSubmitted, ""+a.getPornographicInvolvementMonth())%>>
			<OPTION></OPTION>
			<OPTION VALUE="1"<%= 1==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>January</OPTION>
			<OPTION VALUE="2"<%= 2==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>February</OPTION>
			<OPTION VALUE="3"<%= 3==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>March</OPTION>
			<OPTION VALUE="4"<%= 4==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>April</OPTION>
			<OPTION VALUE="5"<%= 5==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>May</OPTION>
			<OPTION VALUE="6"<%= 6==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>June</OPTION>
			<OPTION VALUE="7"<%= 7==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>July</OPTION>
			<OPTION VALUE="8"<%= 8==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>August</OPTION>
			<OPTION VALUE="9"<%= 9==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>September</OPTION>
			<OPTION VALUE="10"<%= 10==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>October</OPTION>
			<OPTION VALUE="11"<%= 11==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>November</OPTION>
			<OPTION VALUE="12"<%= 12==a.getPornographicInvolvementMonth() ? " SELECTED": "" %>>December</OPTION>
		</SELECT>
		<SELECT NAME="PornographicInvolvementYear" onblur=UnHighlight(this) onfocus=Highlight(this) <%=ValueDisabled(isSubmitted, ""+a.getPornographicInvolvementYear())%>>
			<OPTION></OPTION>
			<%
				for( int i = SIUtil.CURRENT_SI_YEAR_INT; i >= 2001; i-- ) {
			%>
					<OPTION VALUE="<%=i%>"<%= i==a.getPornographicInvolvementYear() ? " SELECTED": "" %>><%=i%></OPTION>
			<%
				}
			%>
		</SELECT>
	</div>
	<%=sihtmlutils.printInputArea("Please be specific (video, web, magazine, time involved, etc.).","", "textarea", 500, "PornographicInvolvementExplanation", a.getPornographicInvolvementExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("In the past 12 months have you had a relationship, which would not be considered \"above reproach\"? (e.g. light/heavy petting, oral sex, sexual intercourse, etc.)","6", "intyesno", 0, "HasRecentSexualImmorality", Integer.toString(a.getHasRecentSexualImmorality()), false)%>
	<div>When were you last involved in such an incident?
		(month & year)
		<SELECT NAME="SexualImmoralityMonth" onblur=UnHighlight(this) onfocus=Highlight(this) <%=ValueDisabled(isSubmitted, ""+a.getSexualImmoralityMonth())%>>
			<OPTION></OPTION>
			<OPTION VALUE="1"<%= 1==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>January</OPTION>
			<OPTION VALUE="2"<%= 2==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>February</OPTION>
			<OPTION VALUE="3"<%= 3==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>March</OPTION>
			<OPTION VALUE="4"<%= 4==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>April</OPTION>
			<OPTION VALUE="5"<%= 5==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>May</OPTION>
			<OPTION VALUE="6"<%= 6==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>June</OPTION>
			<OPTION VALUE="7"<%= 7==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>July</OPTION>
			<OPTION VALUE="8"<%= 8==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>August</OPTION>
			<OPTION VALUE="9"<%= 9==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>September</OPTION>
			<OPTION VALUE="10"<%= 10==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>October</OPTION>
			<OPTION VALUE="11"<%= 11==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>November</OPTION>
			<OPTION VALUE="12"<%= 12==a.getSexualImmoralityMonth() ? " SELECTED": "" %>>December</OPTION>
		</SELECT>
		<SELECT NAME="SexualImmoralityYear" onblur=UnHighlight(this) onfocus=Highlight(this) <%=ValueDisabled(isSubmitted, ""+a.getSexualImmoralityYear())%>>
			<OPTION></OPTION>
			<%
				for( int i = SIUtil.CURRENT_SI_YEAR_INT; i >= 2001; i-- ) {
			%>
					<OPTION VALUE="<%=i%>"<%= i==a.getSexualImmoralityYear() ? " SELECTED": "" %>><%=i%></OPTION>
			<%
				}
			%>
		</SELECT>
	</div>
	<%=sihtmlutils.printInputArea("What was the extent of physical involvement? (Please be specific.)","", "textarea", 500, "SexualImmoralityExplanation", a.getSexualImmoralityExplanation(), false)%>
	<div><strong>Single:</strong></div>
	<%=sihtmlutils.printInputArea("Have you dated other men/women since the last occurrence?","", "intyesno", 0, "HasOtherDateSinceImmorality", Integer.toString(a.getHasOtherDateSinceImmorality()), false)%>
	<%=sihtmlutils.printInputArea("If so, what has been the extent of your physical relationship with them?","", "textarea", 500, "SingleImmoralityResultsExplanation", a.getSingleImmoralityResultsExplanation(), false)%>
	<div><strong>Married:</strong></div>
	<%=sihtmlutils.printInputArea("How has this affected your relationship with your spouse?","", "textarea", 500, "MarriedImmoralityResultsExplanation", a.getMarriedImmoralityResultsExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("If \"yes\" to 4, 5, or 6, what in your life has changed to prevent a similar incident from reoccurring?  If \"no,\" skip to question 9.","7", "textarea", 500, "ImmoralityLifeChangeExplanation", a.getImmoralityLifeChangeExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Are you currently having any struggles in the moral area such as a habitually impure thought life, homosexual desires, or difficulty applying your guidelines/convictions, etc.?","8", "textarea", 500, "ImmoralityCurrentStrugglesExplanation", a.getImmoralityCurrentStrugglesExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Do you have any additional comments or clarifications?","9", "textarea", 2000, "AdditionalMoralComments", a.getAdditionalMoralComments(), false)%></td></tr>
<%@ include file="bnav2way.jspf" %>
