<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postBiographicalInfo";
-->
</script>


<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Biographical Information</STRONG></TD>
	</TR>
	<%=sihtmlutils.printInputArea("Write a paragraph or two on how you came to know Jesus Christ personally, and describe your personal growth in Christ.","1", "textarea", 750, "PersonalTestimonyGrowth", a.getPersonalTestimonyGrowth(), false)%></td></tr>
<%
	if(appType.equals("impact")){
%>
	<%=sihtmlutils.printInputArea("In two or three paragraphs explain how and why you believe God is leading you to participate in the Impact Fellowship program.","2", "textarea", 500, "InternshipParticipationExplanation", a.getInternshipParticipationExplanation(), false)%>
<%
	} else {
%>
	<%=sihtmlutils.printInputArea("In two or three paragraphs explain how and why you believe God is leading you to participate in an internship with the Campus Ministry of Campus Crusade for Christ.  Give reasons why you believe He has called you to a specific aspect of the Campus Ministry intern program.  (i.e., Staffed Campus, WSN, Catalytic, ESM, National/Regional office.)","2", "textarea", 500, "InternshipParticipationExplanation", a.getInternshipParticipationExplanation(), false)%>
<%
	}
%>
	</td></tr>
<%
	if(appType.equals("impact")){
%>
	<%=sihtmlutils.printInputArea("List your specific personal and ministry objectives for your fellowship year.","3", "textarea", 500, "InternshipObjectives", a.getInternshipObjectives(), false)%>
<%
	} else {
%>
	<%=sihtmlutils.printInputArea("List your specific and ministry objectives for your intern year.","3", "textarea", 500, "InternshipObjectives", a.getInternshipObjectives(), false)%>
<%
	}
%>
	</td></tr>
	<%=sihtmlutils.printInputArea("Please describe your current ministry. (Include your experience in evangelism and discipleship.)","4", "textarea", 500, "CurrentMinistryDescription", a.getCurrentMinistryDescription(), false)%></td></tr>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">5.</td>
		<TD CLASS="app" ALIGN="left" WIDTH="95%">How would you describe yourself?<br>&nbsp;</td>
	</tr>
	<tr>
		<TD class="app" ALIGN="left" VALIGN="TOP" WIDTH="5%"></td>
		<TD class="app" ALIGN="left" WIDTH="95%">
		<table WIDTH="95%" CELLSPACING="0">
			<TR>
				<TD>
					<table WIDTH="100%" CELLSPACING="0" class="insidebox">
						<tr>
							<TD CLASS="app" ALIGN="center" VALIGN="TOP" width="15%" rowspan="3"><b>Strengths</b></td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">A.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalStrengthA" rows="2" cols="70" onkeyup="TrackCount(this,'StrengthAtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalStrengthA())%>><%= a.getPersonalStrengthA() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="StrengthAtextcount" size="3" value="<%= 100 - a.getPersonalStrengthA().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
						<tr>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">B.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalStrengthB" rows="2" cols="70" onkeyup="TrackCount(this,'StrengthBtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalStrengthB())%>><%= a.getPersonalStrengthB() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="StrengthBtextcount" size="3" value="<%= 100 - a.getPersonalStrengthB().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
						<tr>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">C.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalStrengthC" rows="2" cols="70" onkeyup="TrackCount(this,'StrengthCtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalStrengthC())%>><%= a.getPersonalStrengthC() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="StrengthCtextcount" size="3" value="<%= 100 - a.getPersonalStrengthC().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<TR>
				<TD>
					<table WIDTH="100%" CELLSPACING="0" class="insidebox">
						<tr>
							<TD CLASS="app" ALIGN="center" VALIGN="TOP" width="15%" rowspan="3"><b>Areas to be Developed</b></td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">A.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalDevelopmentA" rows="2" cols="70" onkeyup="TrackCount(this,'DevelopmentAtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalDevelopmentA())%>><%= a.getPersonalDevelopmentA() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="DevelopmentAtextcount" size="3" value="<%= 100 - a.getPersonalDevelopmentA().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
						<tr>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">B.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalDevelopmentB" rows="2" cols="70" onkeyup="TrackCount(this,'DevelopmentBtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalDevelopmentB())%>><%= a.getPersonalDevelopmentB() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="DevelopmentBtextcount" size="3" value="<%= 100 - a.getPersonalDevelopmentB().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
						<tr>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">C.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalDevelopmentC" rows="2" cols="70" onkeyup="TrackCount(this,'DevelopmentCtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalDevelopmentC())%>><%= a.getPersonalDevelopmentC() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="DevelopmentCtextcount" size="3" value="<%= 100 - a.getPersonalDevelopmentC().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<TR>
				<TD>
					<table WIDTH="100%" CELLSPACING="0" class="insidebox">
						<tr>
							<TD CLASS="app" ALIGN="center" VALIGN="TOP" width="15%" rowspan="3"><b>Adjectives Friends Use to Describe You</b></td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">A.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalDescriptionA" rows="2" cols="70" onkeyup="TrackCount(this,'DescriptionAtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalDescriptionA())%>><%= a.getPersonalDescriptionA() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="DescriptionAtextcount" size="3" value="<%= 100 - a.getPersonalDescriptionA().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
						<tr>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">B.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalDescriptionB" rows="2" cols="70" onkeyup="TrackCount(this,'DescriptionBtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalDescriptionB())%>><%= a.getPersonalDescriptionB() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="DescriptionBtextcount" size="3" value="<%= 100 - a.getPersonalDescriptionB().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
						<tr>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">C.</td>
							<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="80%">
							<table WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
								<tr><td><TEXTAREA name="PersonalDescriptionC" rows="2" cols="70" onkeyup="TrackCount(this,'DescriptionCtextcount',100)" onkeypress="LimitText(this,100)" <%=ValueReadOnly(isSubmitted, a.getPersonalDescriptionC())%>><%= a.getPersonalDescriptionC() %></TEXTAREA></td><td><font class="small">chars.<br><input type="text" name="DescriptionCtextcount" size="3" value="<%= 100 - a.getPersonalDescriptionC().length() %>" DISABLED>
							</td></tr></table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br>&nbsp;</td>
	</tr>
	<%=sihtmlutils.printInputArea("Describe your relationships with your immediate family members.","6", "textarea", 500, "FamilyRelationshipDescription", a.getFamilyRelationshipDescription(), false)%></td></tr>
<%@ include file="bnav2way.jspf" %>
