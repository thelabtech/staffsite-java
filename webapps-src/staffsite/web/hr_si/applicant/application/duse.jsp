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
		if(appType.equals("impact")){
%>
			On your application, you indicated that you have used drugs (e.g. narcotics, hallucinogens, or drugs not prescribed by a physician).  Although past drug use does not necessarily disqualify someone from being an Impact fellow, we must receive more information from you before we can continue to process your application.</p>
<%
		} else {
%>
			
<%
		}
%>
		On your application, you indicated that you have used drugs (e.g. narcotics, hallucinogens, or drugs not prescribed by a physician).  Although past drug use does not necessarily disqualify someone from being an intern, we must receive more information from you before we can continue to process your application.</p>
		</td>
	</tr>
	<%=sihtmlutils.printInputArea("Please write a short paragraph explaining the types of drugs you've used, the approximate dates it occurred, and any details you feel would help us in understanding your situation","1", "textarea", 500, "DrugUseExplanation", a.getDrugUseExplanation(), false)%></td></tr>
<%@ include file="bnav2way.jspf" %>
