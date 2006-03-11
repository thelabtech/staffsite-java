DEPRECATED - 12-19-02 BY DC Folded into payment.jsp
<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<%
	personHash = infoBean.getWsnApplicationHash(userID,userEmail);
	WsnApplicationID = (String)personHash.get("WsnApplicationID");
%>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">

<%
	String firstName = personHash.get("LegalFirstName") == null ? "" : (String)personHash.get("LegalFirstName");
	String welcomeText = "";
	if (firstName == "")
		welcomeText = "Thank you!";
	else
		welcomeText = "Thank you, " + firstName + "!";
%>
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<STRONG><%=welcomeText%></STRONG>
			<P>
			Your payment is complete.
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button">&nbsp;</TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'appsubmit')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>