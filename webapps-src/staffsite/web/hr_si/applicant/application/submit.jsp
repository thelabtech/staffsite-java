<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postSubmitApp";
-->
</script>

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Submit Application</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2">
		<table border="0" cellpadding="5" cellspacing="0" width="100%">
		<tr bgcolor="#ffffff"><td colspan="2" class="app">
			<p>Campus Crusade for Christ requires that you certify your application by submitting an electronic signature. To certify your application, read the text below and provide an electronic signature (type your name) and click Submit Application.</p>
			<ol>
<%
		if(appType.equals("impact")){
%>
				<li>I have read, understood, and agree wholeheartedly with the enclosed Statement of Faith.</li>
<%
		} else {
%>
				<li>I have read, understood, and agree with the enclosed Statement of Faith.</li>
<%
		}
%>
<%
		if(appType.equals("impact")){
%>
				<li>If accepted to the Impact Fellowship Program, I am aware that I am responsible to raise whatever financial support to cover a percentage of my salary and my ministry expenses.</li>
<%
		} else {
%>
				<li>If accepted for an internship, I am aware that I am responsible to raise whatever financial support is necessary to fund my involvement with Campus Crusade for Christ.</li>
<%
		}
%>
<%
		if(appType.equals("impact")){
%>
			<LI>I understand and accept that, if accepted as a fellow, I will be expected to have an attitude of complete availability with regard to my ministry placement.</LI>
<%
		}
%>
<%
		if(appType.equals("impact")){
%>
				<li>I understand participation in the fellowship does not imply ongoing employment with the Impact Movement beyond the fellowship period.</li>
<%
		} else {
%>
				<li>I understand participation in the internship does not imply ongoing employment with Campus Crusade for Christ beyond the internship period.  I also understand that my employment with Campus Crusade for Christ can be terminated any time with or without cause.</li>
<%
		}
%>
				<li>To the best of my knowledge, all of the information in this application is true and complete.  I also authorize you to make such inquiries into my personal employment, finances, medical history or other related matters as may be necessary in arriving at an acceptance decision.  I hereby release employers, schools, or persons from all liability to inquiries in connection with my application.</li>
			</ol>
			</td>
		</tr>
		<tr bgcolor="#ffffff">
			<td class="app">Enter Electronic Signature</td>
			<td class="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="ElectronicSignature" <%=InputValue(isSubmitted, a.getElectronicSignature(),NoEditAfterSubmit)%> size=50 maxlength=90></td>
		</tr>
		<tr bgcolor="#ffffff">
			<td class="app">Enter Social Security Number</td>
			<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Ssn" <%=InputValue(isSubmitted, a.getSsn(),NoEditAfterSubmit)%> size=12 maxlength=20></TD>
		</tr>
		<% if (isSubmitted) {%>
		<tr bgcolor="#ffffff">
			<td colspan='2' class="app" align="center">
				<P>&nbsp;
				<P>
				<B>Your application was submitted on <%=util.formatDate(a.getDateSubmitted())%>.</B>
				<P>
				NOTE: Since your application has already been submitted, you may only make changes to the Personal Information, References, and Payment pages. You may also answer any questions which were left blank.
			</td>
		</tr>
		<% } %>
		</table>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><% if(!isSubmitted){ %><A CLASS="button" HREF="JavaScript: doPostForm('submitapp')" CLASS="button">Submit Application</A><% } %></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<%@ include file="/hr_si/siMainFooter.jspf" %>
<TABLE BORDER="0" WIDTH="100%">
