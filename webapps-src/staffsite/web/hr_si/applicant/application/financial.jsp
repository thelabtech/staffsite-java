<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postFinancialInfo";
-->
</script>


<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Financial Information</STRONG></TD>
	</TR>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("If accepted, are you aware that you must raise a percentage of your financial support and that the Impact Movement is not responsible for your expenses above that which you have raised?","1", "intyesno", 0, "IsAwareMustRaiseSupport", Integer.toString(a.getIsAwareMustRaiseSupport()), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("If accepted, are you aware that you must raise your own financial support and that Campus Crusade for Christ is not responsible for your expenses above that which you have raised?","1", "intyesno", 0, "IsAwareMustRaiseSupport", Integer.toString(a.getIsAwareMustRaiseSupport()), false)%>
<%
		}
%>
	</td></tr>
	<%=sihtmlutils.printInputArea("Are you in debt?","2", "intyesno", 0, "IsInDebt", Integer.toString(a.getIsInDebt()), false)%>
		<br>If so, List your total indebtedness.
		<br>
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%"></td>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="55%">Nature of debt</TD>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="20%">Total debt</TD>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="20%">Monthly payment</TD>
			</tr>
			<tr>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">A.</td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtNature1" <%=InputValue(isSubmitted, a.getDebtNature1(),NoEditAfterSubmit)%> size=50 maxlength=50></td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtTotal1" <%=InputValue(isSubmitted, a.getDebtTotal1(),NoEditAfterSubmit)%> size=10 maxlength=10></td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtMonthlyPayment1" <%=InputValue(isSubmitted, a.getDebtMonthlyPayment1(),NoEditAfterSubmit)%> size=10 maxlength=10></td>
			</TR>
			<tr>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">B.</td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtNature2" <%=InputValue(isSubmitted, a.getDebtNature2(),NoEditAfterSubmit)%> size=50 maxlength=50></td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtTotal2" <%=InputValue(isSubmitted, a.getDebtTotal2(),NoEditAfterSubmit)%> size=10 maxlength=10></td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtMonthlyPayment2" <%=InputValue(isSubmitted, a.getDebtMonthlyPayment2(),NoEditAfterSubmit)%> size=10 maxlength=10></td>
			</TR>
			<tr>
				<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">C.</td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtNature3" <%=InputValue(isSubmitted, a.getDebtNature3(),NoEditAfterSubmit)%> size=50 maxlength=50></td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtTotal3" <%=InputValue(isSubmitted, a.getDebtTotal3(),NoEditAfterSubmit)%> size=10 maxlength=10></td>
				<td><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="DebtMonthlyPayment3" <%=InputValue(isSubmitted, a.getDebtMonthlyPayment3(),NoEditAfterSubmit)%> size=10 maxlength=10></td>
			</TR>
		</table>
		&nbsp;</td>
	</tr>
	<%=sihtmlutils.printInputArea("Do you have any other financial responsibilities or obligations?","3", "intyesno", 0, "HasOtherFinancialResponsibility", Integer.toString(a.getHasOtherFinancialResponsibility()), false)%>
	<%=sihtmlutils.printInputArea("If yes, please explain.","", "textarea", 500, "OtherFinancialResponsibilityExplanation", a.getOtherFinancialResponsibilityExplanation(), false)%></td></tr>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%"></td>
		<TD CLASS="app" ALIGN="left" WIDTH="95%">
<%
		if(appType.equals("impact")){
%>
			<p><i>The Impact Movement policy does not allow for an excessive debt payment level during your assignment.  Raising additional support for a car payment (for US Impact fellows) not to exceed $200/month is allowable.  You may not raise support to pay back school loans.  You may choose to use up to $50/month (for STINT) and up to $75/month (for US Impact Fellows) of your salary to pay toward your school loan or debt.  (You will need to arrange a loan deferment or another form of payment for a school loan during your fellowship year.)</i></p>
<%
		} else {
%>
			<p><i>Campus Crusade for Christ policy does not allow for an excessive debt payment level during your assignment.  Raising additional support for a car payment (for US Interns) not to exceed $200/month is allowable.  You may not raise support to pay back school loans.  You may choose to use up to $50/month (for STINT) and up to $75/month (for US Interns) of your salary to pay toward your school loan or debt.  (You will need to arrange a loan deferment or another form of payment for a school loan during your internship year.)</i></p>
<%
		}
%>
		</td>
	</tr>
	<%=sihtmlutils.printInputArea("How do you plan to pay off your debt?","4", "textarea", 500, "DebtPaymentPlan", a.getDebtPaymentPlan(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("When do you plan to be debt-free?","5", "textarea", 500, "DebtPaymentTimeframe", a.getDebtPaymentTimeframe(), false)%></td></tr>
<%@ include file="bnav2way.jspf" %>
