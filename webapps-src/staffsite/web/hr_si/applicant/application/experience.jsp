<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postMinistryExperience";
-->
</script>

<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Ministry Experience</STRONG></TD>
	</TR>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("Church / Impact / other ministry training.  Please list specific training and involvement.","1", "textarea", 500, "MinistryTraining", a.getMinistryTraining(), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("Church / Campus Crusade / other ministry training.  Please list specific training and involvement.","1", "textarea", 500, "MinistryTraining", a.getMinistryTraining(), false)%>
<%
		}
%>
	</td></tr>
	<%=sihtmlutils.printInputArea("What is your understanding of and attitude toward initiative evangelism?","2", "textarea", 500, "EvangelismAttitude", a.getEvangelismAttitude(), false)%></td></tr>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("As an impact fellow your primary responsibilities will focus around initiative evangelism.<br>Are you willing to be trained in initiative evangelism?","3", "intyesno", 0, "IsEvangelismTrainable", Integer.toString(a.getIsEvangelismTrainable()), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("As an intern your primary responsibilities will focus around initiative evangelism.<br>Are you willing to be trained in initiative evangelism?","3", "intyesno", 0, "IsEvangelismTrainable", Integer.toString(a.getIsEvangelismTrainable()), false)%>
<%
		}
%>
	</td></tr>
	<%=sihtmlutils.printInputArea("Do you feel most comfortable being the leader or a team participant? Please explain.","4", "textarea", 500, "ParticipationExplanation", a.getParticipationExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("How do you respond to someone in an authority position?","5", "textarea", 500, "AuthorityResponseExplanation", a.getAuthorityResponseExplanation(), false)%></td></tr>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">6.</td>
		<TD CLASS="app" ALIGN="left" WIDTH="95%">Please indicate your experience with regard to the following ministry tools.</td>
	</tr>
	<tr>
		<td CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%"></td>
		<td CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="95%">
		<table WIDTH="95%" CELLSPACING="0" class="insidebox">
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="BOTTOM" rowspan="2" width="50%"><b>Ministry Tool</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" colspan="2" width="12%"><b>Familiar<br>With</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" colspan="2" width="12%"><b>Have Use<br>in Ministry</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="26%"><b>Level of<br>Confidence</b></td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="6%"><b>Yes</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="6%"><b>No</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="6%"><b>Yes</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="6%"><b>No</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="26%"><b>Low&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;High</b></td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">
<%
				if(appType.equals("impact")){
%>
					Four Spiritual Laws/The Passage
<%
				} else {
%>
					Four Spiritual Laws
<%
				}
%>
				</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarFourSpiritualLaws" value="1"<%= a.getIsFamiliarFourSpiritualLaws()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarFourSpiritualLaws" value="0"<%= a.getIsFamiliarFourSpiritualLaws()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceFourSpiritualLaws" value="1"<%= a.getHasExperienceFourSpiritualLaws()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceFourSpiritualLaws" value="0"<%= a.getHasExperienceFourSpiritualLaws()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceFourSpiritualLaws" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceFourSpiritualLaws())%>>
				<INPUT type=radio name="ConfidenceFourSpiritualLaws" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceFourSpiritualLaws())%>>
				<INPUT type=radio name="ConfidenceFourSpiritualLaws" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceFourSpiritualLaws())%>>
				<INPUT type=radio name="ConfidenceFourSpiritualLaws" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceFourSpiritualLaws())%>>
				<INPUT type=radio name="ConfidenceFourSpiritualLaws" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceFourSpiritualLaws())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Life at Large</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarLifeAtLarge" value="1"<%= a.getIsFamiliarLifeAtLarge()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarLifeAtLarge" value="0"<%= a.getIsFamiliarLifeAtLarge()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceLifeAtLarge" value="1"<%= a.getHasExperienceLifeAtLarge()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceLifeAtLarge" value="0"<%= a.getHasExperienceLifeAtLarge()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceLifeAtLarge" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceLifeAtLarge())%>>
				<INPUT type=radio name="ConfidenceLifeAtLarge" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceLifeAtLarge())%>>
				<INPUT type=radio name="ConfidenceLifeAtLarge" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceLifeAtLarge())%>>
				<INPUT type=radio name="ConfidenceLifeAtLarge" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceLifeAtLarge())%>>
				<INPUT type=radio name="ConfidenceLifeAtLarge" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceLifeAtLarge())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Personal 3 Minute Testimony</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarPersonalTestimony" value="1"<%= a.getIsFamiliarPersonalTestimony()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarPersonalTestimony" value="0"<%= a.getIsFamiliarPersonalTestimony()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperiencePersonalTestimony" value="1"<%= a.getHasExperiencePersonalTestimony()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperiencePersonalTestimony" value="0"<%= a.getHasExperiencePersonalTestimony()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidencePersonalTestimony" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidencePersonalTestimony())%>>
				<INPUT type=radio name="ConfidencePersonalTestimony" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidencePersonalTestimony())%>>
				<INPUT type=radio name="ConfidencePersonalTestimony" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidencePersonalTestimony())%>>
				<INPUT type=radio name="ConfidencePersonalTestimony" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidencePersonalTestimony())%>>
				<INPUT type=radio name="ConfidencePersonalTestimony" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidencePersonalTestimony())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Explaining the gospel without a tool</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarExplainingGospel" value="1"<%= a.getIsFamiliarExplainingGospel()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarExplainingGospel" value="0"<%= a.getIsFamiliarExplainingGospel()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceExplainingGospel" value="1"<%= a.getHasExperienceExplainingGospel()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceExplainingGospel" value="0"<%= a.getHasExperienceExplainingGospel()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceExplainingGospel" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceExplainingGospel())%>>
				<INPUT type=radio name="ConfidenceExplainingGospel" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceExplainingGospel())%>>
				<INPUT type=radio name="ConfidenceExplainingGospel" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceExplainingGospel())%>>
				<INPUT type=radio name="ConfidenceExplainingGospel" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceExplainingGospel())%>>
				<INPUT type=radio name="ConfidenceExplainingGospel" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceExplainingGospel())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Sharing your faith with (non-Christian) friends</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarSharingFaith" value="1"<%= a.getIsFamiliarSharingFaith()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarSharingFaith" value="0"<%= a.getIsFamiliarSharingFaith()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceSharingFaith" value="1"<%= a.getHasExperienceSharingFaith()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceSharingFaith" value="0"<%= a.getHasExperienceSharingFaith()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceSharingFaith" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceSharingFaith())%>>
				<INPUT type=radio name="ConfidenceSharingFaith" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceSharingFaith())%>>
				<INPUT type=radio name="ConfidenceSharingFaith" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceSharingFaith())%>>
				<INPUT type=radio name="ConfidenceSharingFaith" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceSharingFaith())%>>
				<INPUT type=radio name="ConfidenceSharingFaith" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceSharingFaith())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Holy Spirit Booklet</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarHolySpiritBooklet" value="1"<%= a.getIsFamiliarHolySpiritBooklet()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarHolySpiritBooklet" value="0"<%= a.getIsFamiliarHolySpiritBooklet()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceHolySpiritBooklet" value="1"<%= a.getHasExperienceHolySpiritBooklet()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceHolySpiritBooklet" value="0"<%= a.getHasExperienceHolySpiritBooklet()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceHolySpiritBooklet" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceHolySpiritBooklet())%>>
				<INPUT type=radio name="ConfidenceHolySpiritBooklet" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceHolySpiritBooklet())%>>
				<INPUT type=radio name="ConfidenceHolySpiritBooklet" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceHolySpiritBooklet())%>>
				<INPUT type=radio name="ConfidenceHolySpiritBooklet" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceHolySpiritBooklet())%>>
				<INPUT type=radio name="ConfidenceHolySpiritBooklet" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceHolySpiritBooklet())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Follow-Up Materials</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarFollowUp" value="1"<%= a.getIsFamiliarFollowUp()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarFollowUp" value="0"<%= a.getIsFamiliarFollowUp()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceFollowUp" value="1"<%= a.getHasExperienceFollowUp()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceFollowUp" value="0"<%= a.getHasExperienceFollowUp()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceFollowUp" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceFollowUp())%>>
				<INPUT type=radio name="ConfidenceFollowUp" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceFollowUp())%>>
				<INPUT type=radio name="ConfidenceFollowUp" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceFollowUp())%>>
				<INPUT type=radio name="ConfidenceFollowUp" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceFollowUp())%>>
				<INPUT type=radio name="ConfidenceFollowUp" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceFollowUp())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Helping someone grow in their faith</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarHelpGrowInFaith" value="1"<%= a.getIsFamiliarHelpGrowInFaith()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarHelpGrowInFaith" value="0"<%= a.getIsFamiliarHelpGrowInFaith()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceHelpGrowInFaith" value="1"<%= a.getHasExperienceHelpGrowInFaith()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceHelpGrowInFaith" value="0"<%= a.getHasExperienceHelpGrowInFaith()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceHelpGrowInFaith" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceHelpGrowInFaith())%>>
				<INPUT type=radio name="ConfidenceHelpGrowInFaith" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceHelpGrowInFaith())%>>
				<INPUT type=radio name="ConfidenceHelpGrowInFaith" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceHelpGrowInFaith())%>>
				<INPUT type=radio name="ConfidenceHelpGrowInFaith" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceHelpGrowInFaith())%>>
				<INPUT type=radio name="ConfidenceHelpGrowInFaith" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceHelpGrowInFaith())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Training someone how to share their faith</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarTrainShareFaith" value="1"<%= a.getIsFamiliarTrainShareFaith()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarTrainShareFaith" value="0"<%= a.getIsFamiliarTrainShareFaith()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceTrainShareFaith" value="1"<%= a.getHasExperienceTrainShareFaith()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceTrainShareFaith" value="0"<%= a.getHasExperienceTrainShareFaith()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceTrainShareFaith" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceTrainShareFaith())%>>
				<INPUT type=radio name="ConfidenceTrainShareFaith" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceTrainShareFaith())%>>
				<INPUT type=radio name="ConfidenceTrainShareFaith" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceTrainShareFaith())%>>
				<INPUT type=radio name="ConfidenceTrainShareFaith" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceTrainShareFaith())%>>
				<INPUT type=radio name="ConfidenceTrainShareFaith" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceTrainShareFaith())%>>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="left" VALIGN="center">Addressing beliefs of another religion</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarOtherReligions" value="1"<%= a.getIsFamiliarOtherReligions()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="IsFamiliarOtherReligions" value="0"<%= a.getIsFamiliarOtherReligions()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceOtherReligions" value="1"<%= a.getHasExperienceOtherReligions()==1 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><INPUT type=radio name="HasExperienceOtherReligions" value="0"<%= a.getHasExperienceOtherReligions()==0 ? " CHECKED": "" %> <%=InputDisabled(isSubmitted)%>></td>
				
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">
				<INPUT type=radio name="ConfidenceOtherReligions" value="1"<%=ValueRadio(isSubmitted, 1,a.getConfidenceOtherReligions())%>>
				<INPUT type=radio name="ConfidenceOtherReligions" value="2"<%=ValueRadio(isSubmitted, 2,a.getConfidenceOtherReligions())%>>
				<INPUT type=radio name="ConfidenceOtherReligions" value="3"<%=ValueRadio(isSubmitted, 3,a.getConfidenceOtherReligions())%>>
				<INPUT type=radio name="ConfidenceOtherReligions" value="4"<%=ValueRadio(isSubmitted, 4,a.getConfidenceOtherReligions())%>>
				<INPUT type=radio name="ConfidenceOtherReligions" value="5"<%=ValueRadio(isSubmitted, 5,a.getConfidenceOtherReligions())%>>
				</td>
			</tr>
		</table>
		&nbsp;</td>
	</tr>
	<%=sihtmlutils.printInputArea("What leadership positions have you held in ministry or in other extracurricular activities?","7", "textarea", 500, "LeadershipPositions", a.getLeadershipPositions(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Have you been the leader of a discipleship group?","8", "intyesno", 0, "HasLedDiscipleshipGroup", Integer.toString(a.getHasLedDiscipleshipGroup()), false)%>How many other people were involved?<br>
		<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DiscipleshipGroupSize" <%=InputValue(isSubmitted, a.getDiscipleshipGroupSize(),NoEditAfterSubmit)%> size=50 maxlength=50>
		<br>&nbsp;</td></tr>
	<%=sihtmlutils.printInputArea("What did you like/dislike about being in this role?","9", "textarea", 500, "LeadershipEvaluation", a.getLeadershipEvaluation(), false)%></td></tr>
<%@ include file="bnav2way.jspf" %>
