<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<%
	ActionResults ar = null;
	try {
    ar = ActionResults.getActionResults(session);
	} catch (Exception e) {
		//ignore
	}
    if(ar==null){
        response.sendRedirect("/servlet/CRSRegister");
        return;
    }
    String pageTitle = "Conference Registration System Error";
	
    Conference checkConf= (Conference)ar.getObject("conference");
	Conference conference = (checkConf!=null? checkConf:new Conference());
	
	Registration registration = new Registration();
	boolean isSpouse = false;
	
%>
<%@ include file="/crs/e_user_header.jspf" %>
<%
	registrationMenu.setActives(new boolean[]{
		true,
		true,
		true,
		true,
		true,
		true,
		true,
		true,
		true
	});
otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

%>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<!-- REMOVED SEP **********************
	<TD VALIGN="TOP" WIDTH="150">
		<%=registrationMenu.display(0)%>
	</TD>
	************************************-->
	<TD VALIGN="TOP">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Error</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2"><%=ar.getValue("errorMsg")%></TD>
		</TR>
		<TR>
			<TD CLASS="button" ALIGN="LEFT"><A HREF="javascript: history.go(-1)" CLASS="button">Back</A></TD>
			<% Conference cloakConference = new Conference();
				String event = (String)session.getValue("selectedEvent");
		if (event != null) {
			cloakConference.setConferenceID(Integer.parseInt(event));
			cloakConference.select(); 
		}
		if (event != null && cloakConference.getIsCloaked()==false) { //beginning of cloaking if statement %> 
			
			<TD CLASS="button" ALIGN="RIGHT">
<%
			if(ar.getValue("nextAction").matches("^\\S+")){
%>
				<A HREF="/servlet/CRSRegister?action=<%=ar.getValue("nextAction")%>" CLASS="button">Continue</A>
<%
			}
	} //end of cloaking if statement
%>
			</TD>
		</TR>
	</TABLE>
	</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
