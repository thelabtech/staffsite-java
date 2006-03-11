<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<%
    ActionResults ar = ActionResults.getActionResults(session);
    if(ar==null){
        response.sendRedirect("/servlet/CRSRegister");
    }
    String pageTitle = "Conference Registration System Error";
	Conference conference = new Conference();
	Registration registration = (Registration)ar.getObject("registration");	
	boolean isSpouse = false;
%>
<%@ include file="/crs/e_user_header.jspf" %>
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
otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

%>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
		<%=registrationMenu.display(0)%>
		<p>
		<%=otherOptionsMenu.display(0)%>
		</TD>
	<TD VALIGN="TOP">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Payment Error</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2"><%=ar.getValue("errorMsg")%></TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">We are sorry that we were not able to process your payment. Please check to ensure that the name and address you have entered match the name and billing address associated with this credit card. If you continue to receive this error message, please copy it into an email to help@campuscrusadeforchrist.com. In your email, please let us know which conference you are trying to register for. Thank you.</TD>
		</TR>
		<TR>
			<TD CLASS="button" ALIGN="CENTER" COLSPAN="2">
				<A HREF="javascript:history.go(-2)" CLASS="button">Back</A>
			</TD>
		</TR>
	</TABLE>
	</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
