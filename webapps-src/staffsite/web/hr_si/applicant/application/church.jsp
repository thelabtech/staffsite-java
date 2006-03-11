<%@ include file="header.jspf" %>
<%@ page import="org.alt60m.hr.si.servlet.dbio.*" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postChurchBackground";
-->
</script>


<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Church and Spiritual Background</STRONG></TD>
	</TR>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">1.</td>
		<TD CLASS="app" ALIGN="left" WIDTH="95%">When did you become a Christian?<br>
		(month & year)
		<SELECT NAME="ConversionMonth" onblur=UnHighlight(this) onfocus=Highlight(this) <%=ValueDisabled(isSubmitted, ""+a.getConversionMonth())%>>
			<OPTION></OPTION>
			<OPTION VALUE="1"<%= 1==a.getConversionMonth() ? " SELECTED": "" %>>January</OPTION>
			<OPTION VALUE="2"<%= 2==a.getConversionMonth() ? " SELECTED": "" %>>February</OPTION>
			<OPTION VALUE="3"<%= 3==a.getConversionMonth() ? " SELECTED": "" %>>March</OPTION>
			<OPTION VALUE="4"<%= 4==a.getConversionMonth() ? " SELECTED": "" %>>April</OPTION>
			<OPTION VALUE="5"<%= 5==a.getConversionMonth() ? " SELECTED": "" %>>May</OPTION>
			<OPTION VALUE="6"<%= 6==a.getConversionMonth() ? " SELECTED": "" %>>June</OPTION>
			<OPTION VALUE="7"<%= 7==a.getConversionMonth() ? " SELECTED": "" %>>July</OPTION>
			<OPTION VALUE="8"<%= 8==a.getConversionMonth() ? " SELECTED": "" %>>August</OPTION>
			<OPTION VALUE="9"<%= 9==a.getConversionMonth() ? " SELECTED": "" %>>September</OPTION>
			<OPTION VALUE="10"<%= 10==a.getConversionMonth() ? " SELECTED": "" %>>October</OPTION>
			<OPTION VALUE="11"<%= 11==a.getConversionMonth() ? " SELECTED": "" %>>November</OPTION>
			<OPTION VALUE="12"<%= 12==a.getConversionMonth() ? " SELECTED": "" %>>December</OPTION>
			<OPTION VALUE="12"<%= 12==a.getConversionMonth() ? " SELECTED": "" %>>More than 20 years</OPTION>
		</SELECT>
		<SELECT NAME="ConversionYear" onblur=UnHighlight(this) onfocus=Highlight(this) <%=ValueDisabled(isSubmitted, ""+a.getConversionYear())%>>
			<OPTION></OPTION>
			<%
				for ( int i = SIUtil.CURRENT_SI_YEAR_INT; i >= 1982; i-- ) {
			%>
					<OPTION VALUE="<%=i%>"<%= i==a.getConversionYear() ? " SELECTED": "" %>><%=i%></OPTION>
			<%
				}
			%>
			<OPTION VALUE="1900"<%= 1900==a.getConversionYear() ? " SELECTED": "" %>>before 82</OPTION>
		</SELECT>
		<br>&nbsp;</td>
	</TR>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">2.</td>
		<TD CLASS="app" ALIGN="left" WIDTH="95%">
<%
		if(appType.equals("impact")){
%>
			What is your church affiliation? <br>
<%
		} else {
%>
			Denomination of church where you are a member: <br>
<%
		}
%>
		<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="MemberChurchDenomination" <%=InputValue(isSubmitted, a.getMemberChurchDenomination(),NoEditAfterSubmit)%> size=50 maxlength=70>
		<br>How long?
		<br><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="MemberChurchDuration" <%=InputValue(isSubmitted, a.getMemberChurchDuration(),NoEditAfterSubmit)%> size=20 maxlength=40>
		<br>&nbsp;</td>
	</tr>
	<tr>
		<TD CLASS="app" ALIGN="left" VALIGN="TOP" WIDTH="5%">3.</td>
		<TD CLASS="app" ALIGN="left" WIDTH="95%">Name of denomination of church you currently attend (if different from membership):<br><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="AttendingChurchDenomination" <%=InputValue(isSubmitted, a.getAttendingChurchDenomination(),NoEditAfterSubmit)%> size=50 maxlength=40>
		<br>How long?
		<br><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="AttendingChurchDuration" <%=InputValue(isSubmitted, a.getAttendingChurchDuration(),NoEditAfterSubmit)%> size=20 maxlength=40>
		<%=sihtmlutils.printInputArea("Involvement?","", "textarea", 500, "AttendingChurchInvolvement", a.getAttendingChurchInvolvement(), false)%></td></tr>
		<%=sihtmlutils.printInputArea("Frequency and amount of time spent with the Lord:","4", "textarea", 500, "QuietTimeQuantity", a.getQuietTimeQuantity(), false)%>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("Describe your spiritual growth and what God has been teaching you over the past six to twelve months.","", "textarea", 500, "QuietTimeDescription", a.getQuietTimeDescription(), false)%><%
		} else {
%>
			<%=sihtmlutils.printInputArea("Describe your time with the Lord.","", "textarea", 500, "QuietTimeDescription", a.getQuietTimeDescription(), false)%><%
		}
%>
		</td></tr>
		<%=sihtmlutils.printInputArea("How does a person obtain salvation?","5", "textarea", 500, "ExplanationOfSalvation", a.getExplanationOfSalvation(), false)%></td></tr>
		<%=sihtmlutils.printInputArea("What is your understanding of the Spirit-filled life?","6", "textarea", 500, "ExplanationOfSpiritFilled", a.getExplanationOfSpiritFilled(), false)%></td></tr>
	    <tr>
        <%=sihtmlutils.printInputArea("Have you ever been involved in the practice of speaking in tongues?","7", "intyesno", 0, "HasInvolvementSpeakingTongues", Integer.toString(a.getHasInvolvementSpeakingTongues()), false)%>
	    </TR>
<%
		if(appType.equals("impact")){
%>
			<%=sihtmlutils.printInputArea("Every believer has at least one spiritual gift, given by the Holy Spirit at the time of spiritual birth.  What do you think are your spiritual gift(s)?  What is your understanding of Campus Crusade for Christ's stand or policy on the practice of speaking in tongues?","8", "textarea", 500, "DifferenceIndwellingFilled", a.getDifferenceIndwellingFilled(), false)%>
<%
		} else {
%>
			<%=sihtmlutils.printInputArea("What is the difference between being indwelt with the Holy Spirit and being filled with the Holy Spirit?  When does each occur?","8", "textarea", 500, "DifferenceIndwellingFilled", a.getDifferenceIndwellingFilled(), false)%>
<%
		}
%>
		</td></tr>
<%@ include file="bnav2way.jspf" %>
