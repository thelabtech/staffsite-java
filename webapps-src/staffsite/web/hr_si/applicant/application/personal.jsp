<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postPersonalInfo";
-->
</script>



<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Personal Information</STRONG></TD>
	</TR>
	<%=sihtmlutils.printInputArea("Have you ever been convicted of a crime?","1", "intyesno", 0, "HasCrimeConviction", Integer.toString(a.getHasCrimeConviction()), false)%>
	<%=sihtmlutils.printInputArea("If yes, please explain.","", "textarea", 500, "CrimeConvictionExplanation", a.getCrimeConvictionExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Have you ever used any narcotics, hallucinogens or drugs not prescribed by a physician?","2", "intyesno", 0, "HasDrugUse", Integer.toString(a.getHasDrugUse()), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Do you use tobacco products?","3", "intyesno", 0, "IsTobaccoUser", Integer.toString(a.getIsTobaccoUser()), false)%></td></tr>
	<TR>
		<TD CLASS="app" COLSPAN="2"><i>If you answered, "yes" to questions 2 or 3, please fill out the corresponding elaboration sections below; otherwise, skip the Drug Use and Tobacco Use sections.</i><br>&nbsp;</TD>
	</TR>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("Are you willing to give up any social habits (e.g. alcoholic beverages or tobacco products) that might lessen your effectiveness and influence while associated with the Impact Movement?","4", "intyesno", 0, "IsWillingChangeHabits", Integer.toString(a.getIsWillingChangeHabits()), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("Are you willing to give up any social habits that might lessen your effectiveness and influence while associated with Campus Crusade?","4", "intyesno", 0, "IsWillingChangeHabits", Integer.toString(a.getIsWillingChangeHabits()), false)%>
<%
		}
%>
	</td></tr>
<%@ include file="bnav2way.jspf" %>
