<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<jsp:useBean
	id="selState"
	class="org.alt60m.html.SelectState"
	scope="request" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Database Download";
    Hashtable results = ar.getHashtable("Results");
%>
<%@ include file="/crs/e_header.jspf"%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=conferenceMenu.display(12)%>
		</TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader">Download</TD>
			</TR>
			<TR>
				<TD CLASS="cell"><%
			if("Fail".equals(results.get("Status"))) {
%> <BR>
				We are sorry, but we were unable to process your request. <% 
			} else { 
%> Your database has been uploaded. Here is your response: <%=results.get("Status")%>
				<% 
			} 
%></TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf"%>
		<P>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
