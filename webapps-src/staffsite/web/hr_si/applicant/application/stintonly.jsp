<%@ include file="header.jspf" %>

<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postStintInfo";
-->
</script>



<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
<%
		if(appType.equals("impact")){
%>
			<STRONG>This Section is for INTERNATIONAL Only</STRONG>
<%
		} else {
%>
			<STRONG>This Section is for STINT Only</STRONG>
<%
		}
%>
		</TD>
	</TR>
	<%=sihtmlutils.printInputArea("Does your campus have a partnership with the location of your preference?","1", "intyesno", 0, "HasCampusPartnership", Integer.toString(a.getHasCampusPartnership()), false)%></td></tr>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("The Impact Movement does not place dating couples on the same team. Are you currently dating or engaged to another fellowship applicant or someone who will be overseas?","2", "intyesno", 0, "IsDatingStint", Integer.toString(a.getIsDatingStint()), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("The WSN Lane does not place dating couples on the same team. Are you currently dating or engaged to another STINT Intern applicant or someone who will be overseas?","2", "intyesno", 0, "IsDatingStint", Integer.toString(a.getIsDatingStint()), false)%>
<%
		}
%>
	<%=sihtmlutils.printInputArea("If so, who?","", "textarea", 200, "DatingStintName", a.getDatingStintName(), false)%></td></tr>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">3.</td>
		<TD CLASS="app" ALIGN="left" WIDTH="90%">Language Experience.
		<TABLE WIDTH="100%" CELLSPACING="0" class="insidebox">
			<TR>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP"><b>Language</b></td>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP"><b>Years of Study</b></td>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP"><b>Fluency (5 = completely fluent)</b></td>
			</tr>
			<tr>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Language1" <%=InputValue(isSubmitted, a.getLanguage1(),NoEditAfterSubmit)%> size=40 maxlength=50></td>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Language1YearsStudied" <%=InputValue(isSubmitted, a.getLanguage1YearsStudied(),NoEditAfterSubmit)%> size=10 maxlength=20></td>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP">
				<INPUT type=radio name="Language1Fluency" value="1"<%=ValueRadio(isSubmitted, 1,a.getLanguage1Fluency())%>><b>1&nbsp;&nbsp;</b>
				<INPUT type=radio name="Language1Fluency" value="2"<%=ValueRadio(isSubmitted, 2,a.getLanguage1Fluency())%>><b>2&nbsp;&nbsp;</b>
				<INPUT type=radio name="Language1Fluency" value="3"<%=ValueRadio(isSubmitted, 3,a.getLanguage1Fluency())%>><b>3&nbsp;&nbsp;</b>
				<INPUT type=radio name="Language1Fluency" value="4"<%=ValueRadio(isSubmitted, 4,a.getLanguage1Fluency())%>><b>4&nbsp;&nbsp;</b>
				<INPUT type=radio name="Language1Fluency" value="5"<%=ValueRadio(isSubmitted, 5,a.getLanguage1Fluency())%>><b>5</b>
			</td>
			</TR>
			<tr>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Language2" <%=InputValue(isSubmitted, a.getLanguage2(),NoEditAfterSubmit)%> size=40 maxlength=50></td>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Language2YearsStudied" <%=InputValue(isSubmitted, a.getLanguage2YearsStudied(),NoEditAfterSubmit)%> size=10 maxlength=20></td>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP">
				<INPUT type=radio name="Language2Fluency" value="1"<%=ValueRadio(isSubmitted, 1,a.getLanguage2Fluency())%>><b>1&nbsp;&nbsp;</b>
				<INPUT type=radio name="Language2Fluency" value="2"<%=ValueRadio(isSubmitted, 2,a.getLanguage2Fluency())%>><b>2&nbsp;&nbsp;</b>
				<INPUT type=radio name="Language2Fluency" value="3"<%=ValueRadio(isSubmitted, 3,a.getLanguage2Fluency())%>><b>3&nbsp;&nbsp;</b>
				<INPUT type=radio name="Language2Fluency" value="4"<%=ValueRadio(isSubmitted, 4,a.getLanguage2Fluency())%>><b>4&nbsp;&nbsp;</b>
				<INPUT type=radio name="Language2Fluency" value="5"<%=ValueRadio(isSubmitted, 5,a.getLanguage2Fluency())%>><b>5</b>
			</td>
			</TR>
		</table>
		&nbsp;</td>
	</tr>
	<%=sihtmlutils.printInputArea("Please describe any previous cross-cultural training and/or travel experience you have had.","4", "textarea", 200, "PreviousMinistryExperience", a.getPreviousMinistryExperience(), false)%></td></tr>
<%@ include file="bnav2way.jspf" %>
