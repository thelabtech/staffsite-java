<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*"%>
<%
try{
    ActionResults ar = ActionResults.getActionResults(session);
    if(ar==null){
        response.sendRedirect("/servlet/CRSAdmin");
    }
    String pageTitle = "Conference Registration System Error";
	Conference conference = new Conference();
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
			WIDTH="150"><%=toolsMenu.display(0)%></TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Error</TD>
			</TR>
			<TR>
				<TD
					CLASS="cell"
					COLSPAN="2"><%=ar.getValue("errorMsg")%></TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="javascript: history.go(-1)"
					CLASS="button">Back</A></TD>
				<%
			if(ar.getValue("nextAction").matches("^\\S+")){
%>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: history.go(-1)"
					CLASS="button"><A
					HREF="/servlet/CRSAdmin?action=<%=ar.getValue("nextAction")%>"
					CLASS="button">Continue</A></TD>
				<%
			}
%>
			</TR>
		</TABLE>
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
