<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postTobaccoUse";
-->
</script>


<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Tobacco Use</STRONG></TD>
	</TR>
	<tr>
		<TD CLASS="app" Colspan="2" ALIGN="left" WIDTH="100%"><p>

		<p>The following is Campus Crusade for Christ's view regarding smoking and the use of tobacco products:</p>
		<p>Interns with Campus Crusade for Christ minister to a broad spectrum of the Christian community. To some believers in church leadership and in the mainstream of the body of Christ, using tobacco would be considered a questionable activity.</p>
		<p>An applicant who has habitually used tobacco (e.g., smoking, dipping, chewing) should have refrained from use of tobacco for six months prior to acceptance as an intern.</p>

<%
		if(a.getIsTobaccoUser() == 1){
%>
			<p>On your application, you indicated that you have used tobacco. To facilitate the processing of your application, please answer the following questions:</p>
			<%=sihtmlutils.printInputArea("Please write a short paragraph explaining your tobacco use.  (Please include the types of tobacco products you've used, frequency, the last time, and any details you feel would help us in understanding your situation.)","1", "textarea", 500, "TobaccoUseExplanation", a.getTobaccoUseExplanation(), false)%></td></tr>
			<%=sihtmlutils.printInputArea("As a Campus Crusade for Christ intern, would you be willing to abstain from the use of tobacco products?","2", "intyesno", 0, "IsWillingAbstainTobacco", Integer.toString(a.getIsWillingAbstainTobacco()), false)%>
			
			</td>
		</tr>

<%
		} else if(a.getIsTobaccoUser() == 0){
%>
			<p>Because you indicated you have not used tobacco you may move on to the next section.</p>
<%
		} else {
%>
			<p>You must answer all questions in the Personal Information section before completing this section.</p>
<%
		}
%>

	</td></tr>
<%@ include file="bnav2way.jspf" %>
