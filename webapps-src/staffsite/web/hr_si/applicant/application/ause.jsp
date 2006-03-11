<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postAlchoholUse";
-->
</script>


<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Alcohol Use</STRONG></TD>
	</TR>
	<tr>
		<TD CLASS="app" Colspan="2" ALIGN="left" WIDTH="100%"><p>
<%
		if(appType.equals("impact")){
%>
			The following is the Impact Movement's view regarding the use of alcohol:</p>
			<p>Fellows with the Impact Movement minister to a broad spectrum of the Christian community. To some believers in church leadership and in the mainstream of the body of Christ, drinking alcohol would be considered a questionable activity.</p>
			<p>The Impact Movement takes this view on the use of alcohol.  Based on 1 Timothy 3, 1 Corinthians 8 and 10, and Romans 14, we are asking Impact fellows to be willing to refrain from the consumption of alcohol for the duration of their fellowship.</p>
			<p>We would like to hear from you regarding our policy on this issue.</p>
<%
		} else {
%>
			The following is Campus Crusade for Christ's view regarding the use of alcohol:</p>
			<p>Interns with Campus Crusade for Christ minister to a broad spectrum of the Christian community. To some believers in church leadership and in the mainstream of the body of Christ, drinking alcohol would be considered a questionable activity.</p>
			<p>Campus Crusade for Christ takes this view on the use of alcohol.  Based on 1 Timothy 3, 1 Corinthians 8 and 10, and Romans 14, we are asking interns to be willing to refrain from the consumption of alcohol for the duration of their internship.</p>
			<p>We would like to hear from you regarding our policy on this issue.</p>
<%
		}
%>
		</td>
	</tr>
	<%=sihtmlutils.printInputArea("In what situations and how often do you drink alcohol?","1", "textarea", 500, "AlcoholUseFrequency", a.getAlcoholUseFrequency(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("When presented with an opportunity to drink, what would cause you to decide it would be appropriate?","2", "textarea", 500, "AlcoholUseDecision", a.getAlcoholUseDecision(), false)%></td></tr>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("As ministry fellow, would you be willing to refrain from drinking alcohol throughout your fellowship?","3", "intyesno", 0, "IsWillingRefrainAlcohol", Integer.toString(a.getIsWillingRefrainAlcohol()), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("As an intern with our ministry, would you be willing to refrain from drinking alcohol?","3", "intyesno", 0, "IsWillingRefrainAlcohol", Integer.toString(a.getIsWillingRefrainAlcohol()), false)%>
<%
		}
%>
	<%=sihtmlutils.printInputArea("If you are not willing, please explain.","", "textarea", 500, "UnwillingRefrainAlcoholExplanation", a.getUnwillingRefrainAlcoholExplanation(), false)%></td></tr>
<%@ include file="bnav2way.jspf" %>
