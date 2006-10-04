<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*"%>
<%
    ActionResults ar = ActionResults.getActionResults(session);
    if(ar==null){
        response.sendRedirect("/servlet/CRSAdmin");
    }
    String pageTitle = "Conference Registration System Login Redirect";
	Conference conference = new Conference();
	Registration registration = new Registration();
	boolean isSpouse = false;
%>
<%@ include file="/crs/e_user_header.jspf"%>
<%
	registrationMenu.setActives(new boolean[]{
		true,
		false, 
		false, 
		false, 
		false, 
		false, 
		false, 
		false, 
		false, 
		false, 
		false
	});
%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=registrationMenu.display(0)%></TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Login</TD>
			</TR>
			<TR>
				<TD
					CLASS="cell"
					COLSPAN="2"><%=ar.getValue("errorMessage")%></TD>
			</TR>
			<%
		if(ar.getValue("errorMessage").equals("Your email address has been verified. You may now log in below or close this window.")) {
%>
			<TR>
				<TD
					CLASS="button"
					COLSPAN="2"
					ALIGN="CENTER"><A
					<%
					String parameters = "";
					if (request.getParameter("ConferenceID") != null) {
						parameters += "&ConferenceID=" + request.getParameter("ConferenceID");
					}
					if (request.getParameter("type") != null) {
						parameters += "&type=" + request.getParameter("type");
					}
					%>
					HREF="/servlet/CRSRegister?action=userLogin<%= parameters %>"
					CLASS="button">Continue to login</A><A
					HREF="JavaScript:window.close()"
					CLASS="button">Close this window</A></TD>
			</TR>
			<%
		}
%>
			<%
		if(ar.getValue("errorMessage").startsWith("Thank you for creating a ")) {
%>
			<TR>
				<TD
					CLASS="button"
					COLSPAN="2"
					ALIGN="CENTER"><A
					HREF="/servlet/CRSRegister?action=userLogin&ConferenceID=<%=request.getParameter("ConferenceID")%>&type=<%=request.getParameter("type")%>"
					CLASS="button">Continue to login</A></TD>
			</TR>
			<%
		}
%>
			<%
		if(ar.getValue("errorMessage").startsWith("Your identity has been verified, and a new password has been emailed to you at")) {
%>
			<TR>
				<TD
					CLASS="button"
					COLSPAN="2"
					ALIGN="CENTER"><A
					HREF="/servlet/CRSRegister"
					CLASS="button">Continue</A></TD>
			</TR>
			<%
		}
%>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf"%>
