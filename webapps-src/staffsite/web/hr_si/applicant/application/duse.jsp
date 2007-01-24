<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postDrugUse";
-->
</script>


<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Drug Use</STRONG></TD>
	</TR>
	<tr>
		<TD CLASS="app" Colspan="2" ALIGN="left" WIDTH="100%"><p>

<%
		if(a.getHasDrugUse() == 1){
%>
			<p>On your application, you indicated that you have used drugs (e.g. narcotics, hallucinogens, or drugs not prescribed by a physician).  Although past drug use does not necessarily disqualify someone from being an intern, we must receive more information from you before we can continue to process your application.</p>
			<%=sihtmlutils.printInputArea("Please write a short paragraph explaining the types of drugs you've used, the approximate dates it occurred, and any details you feel would help us in understanding your situation","1", "textarea", 500, "DrugUseExplanation", a.getDrugUseExplanation(), false)%></td></tr>
<%
		} else if(a.getHasDrugUse() == 0){
%>
			<p>Because you indicated you have not used drugs you may skip this section.</p>
			

<%
		} else {
%>
			<p>You must answer all questions in the Personal Information section before completing this section.</p>

<%
		}
%>
		<%@ include file="bnav2way.jspf" %>
		</td>
	</tr>

