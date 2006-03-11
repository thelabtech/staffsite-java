<script language="JavaScript"><!--
    var timeOutClockDisabled = 1;
	
	function showIntern() {
		ImpactLink.style.display= "block"		
		Impact.style.display= "none";
		
		InternLink.style.display= "none"
		Intern.style.display= "block";
	}
	
	function showImpact() {
		InternLink.style.display= "block"
		Intern.style.display= "none";
		
		ImpactLink.style.display= "none"	
		Impact.style.display= "block";
	}

// --></script>
<% 	String thePage = "faq"; %>
<%@ include file="/hr_si/homePageHeader.jspf" %>
<!-- CONTENT GOES HERE!!! -->

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td align="left">

<div id="InternLink"  style="display: none;">
<a href="JavaScript:showIntern()"><font color="#ff6666"><b>Display Intern/STINT FAQ</b></font>
</div>

<div id="ImpactLink"  style="display: block;">
<a href="JavaScript:showImpact()"><font color="#ff6666"><b>Display Impact STINT FAQ</b></font>
</div>

</td>
</tr>
</table>

<br>

	<div id="Intern" style="display: block;">
	<%@ include file="/hr_si/faqbody.jspf" %>
	</div>	

	<div id="Impact" style="display: none;">
	<%@ include file="/hr_si/faqbody_impact.jspf" %>
	</div>

<!-- OKAY, NO MORE OF THIS CONTENT NONSENSE!!! -->
<%@ include file="/hr_si/homePageFooter.jspf" %>