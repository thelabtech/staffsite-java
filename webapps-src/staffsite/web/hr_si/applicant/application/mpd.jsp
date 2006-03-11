<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postMPDInfo";
-->
</script>

<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Ministry Partner Development</STRONG></TD>
	</TR>
	<tr>
		<TD CLASS="app" Colspan="2" ALIGN="left" WIDTH="100%"><p>
<%
		if(appType.equals("impact")){
%>
		All fellows with the Impact Movement are required to raise their own financial support to cover both personal and ministry expenses.  After acceptance you will be given training in ministry partner development (MPD) and a support coach will be assigned to help you.  However, you will be responsible to initiate (through letters, phone calls, and appointments) and ask people to join your team of financial ministry partners.  You must be at full support to report to your assignment.</p>
		<p>MPD is a time-intensive endeavor that will require diligence and the majority of your time during June, July, and August.  Therefore, we request that you do not make any job commitments that would take you away from the primary location where you will raise your financial support during these months.  It is okay to have a job during this time that will not interfere with your support development.</p>
<%
		} else {
%>
		All interns with Campus Crusade for Christ are required to raise their own financial support to cover both personal and ministry expenses.  After acceptance you will be given training in ministry partner development (MPD) and a support coach will be assigned to help you.  However, you will be responsible to initiate (through letters, phone calls, and appointments) and ask people to join your team of financial ministry partners.  You must be at full support to report to your assignment.</p>
		<p>MPD is a time-intensive endeavor that will require diligence and the majority of your time during June, July, and August.  Therefore, we request that you do not make any job commitments that would take you away from the primary location where you will raise your financial support during these months.  It is okay to have a job during this time that will not interfere with your support development.</p>
<%
		}
%>
		</td>
	</tr>
	<%=sihtmlutils.printInputArea("How do you feel about developing a team of financial partners?","1", "textarea", 500, "DevelopingPartnersExplanation", a.getDevelopingPartnersExplanation(), false)%></td></tr>
	<%=sihtmlutils.printInputArea("Are you willing to initiate (through letters, follow-up phone calls, and setting up appointments) with people and ask them to join your team?","2", "intyesno", 0, "IsWillingDevelopPartners", Integer.toString(a.getIsWillingDevelopPartners()), false)%>
	<%=sihtmlutils.printInputArea("If you are not willing, please explain.","", "textarea", 500, "UnwillingDevelopPartnersExplanation", a.getUnwillingDevelopPartnersExplanation(), false)%></td></tr>
<%
	if(appType.equals("impact")){
%>
	<%=sihtmlutils.printInputArea("Ministry partner development (MPD) is hard work and requires a significant amount of time and energy.  We believe that in order to raise the necessary finances for your fellowship in the time allowed, you will need to spend a minimum of 15 -20 hours a week working on MPD.  Do you have the time available and are you willing to commit yourself to spending this time working on MPD?","3", "intyesno", 0, "IsCommittedDevelopPartners", Integer.toString(a.getIsCommittedDevelopPartners()), false)%>
<%
	} else {
%>
	
<%
	}
%>
	<%=sihtmlutils.printInputArea("Ministry partner development (MPD) is hard work and requires a significant amount of time and energy.  We believe that in order to raise the necessary finances for your internship in the time allowed, you will need to spend a minimum of 15 -20 hours a week working on MPD.  Do you have the time available and are you willing to commit yourself to spending this time working on MPD?","3", "intyesno", 0, "IsCommittedDevelopPartners", Integer.toString(a.getIsCommittedDevelopPartners()), false)%>
	<%=sihtmlutils.printInputArea("If no, please explain.","", "textarea", 500, "UncommittedDevelopPartnersExplanation", a.getUncommittedDevelopPartnersExplanation(), false)%></td></tr>
	<tr>
		<td CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%"></td>
		<td CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="95%">
		<table WIDTH="95%" CELLSPACING="0" class="insidebox">
			<TR>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="45%"><b>Location</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><b>Support Deadline*</b></td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP"><b>STINT Departure*</b></td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="45%">E.Asia, Latin America, Japan, New Zealand, Thailand</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">July 31</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">Team Leaders: August 10<br>Rest of Team: August 11</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="45%">Eastern Europe/Russia</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">August 8</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">August 22</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" width="45%">Western Europe, N. Africa, Middle East, Central Asia</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">August 15</td>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP">Team Leaders: August 30<br>Rest of Team: August 31</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" Colspan="3">
<%
				if(appType.equals("impact")){
%>
				The US Impact fellow support deadline is August 1* and the report date varies according to the ministry location.
<%
				} else {
%>
				The US Intern support deadline is August 1* and the report date varies according to the ministry location.
<%
				}
%>
				</td>
			</tr>
			<TR>
				<TD CLASS="insidebox" ALIGN="center" VALIGN="TOP" Colspan="3">* These dates are approximate; you will receive the exact dates later.</td>
			</tr>
		</table>
		<br>&nbsp;</td>
	</tr>
<%@ include file="bnav2way.jspf" %>
