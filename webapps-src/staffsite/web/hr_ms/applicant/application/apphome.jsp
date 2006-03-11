<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<%
	String appStatus = "New";
	if (isSubmitted)
		appStatus = "Submitted";
%>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<input type="hidden" name="AppType" value="<%=appType%>">
<!-- the following CurrentEmail field is necessary in order that the person's SSM Email Address (added by infoBean.getWsnApplicationHash()) is persisted back to the database when the WsnApplicationID is "new"-->
<INPUT TYPE="hidden" NAME="CurrentEmail" <%=(String)personHash.get("CurrentEmail") == null? "" : " value= \""+(String)personHash.get("CurrentEmail")+"\""%>>

<%
	String firstName = personHash.get("LegalFirstName") == null ? "" : (String)personHash.get("LegalFirstName");
	String welcomeText = "";
	if (firstName == null || (firstName.trim().equals("")))
		welcomeText = "Welcome!";
	else
		welcomeText = "Welcome, " + firstName + "!";
%>
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<STRONG><%=welcomeText%></STRONG>
			<P>
			This is your home page for applying for a summer project.
			<P>
			Your application status is:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>"<%=appStatus%>"</B><br /><br />
			<% if (isSubmitted) { %>
				Date Submitted: <%=util.formatDate((Date)personHash.get("SubmittedDate"))%>
				<P>
				Since your application has already been submitted, you will only be able to change information on the Personal Information, References, and Payment pages.  You may also enter any fields you left blank when you submitted your application.<BR>
			<% } %>
			<!-- 2003-01-15 Removed Withdraw logic -->
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button">
				<% if (pageNum == 1) { %>
				&nbsp;
				<% } else { %>
				<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A>
				<% } %>
				</TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button">
				<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A>
				</TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button">
				<% if (pageNum != pages.length) { %>
				<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum]%>')">Next&gt;&gt;</A>
				<% } %>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>