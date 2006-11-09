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
		<P><%=conferenceMenu.display(15)%>
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
			if("Error".equals(results.get("Status"))) {
%> <BR>
				We are sorry, but we were unable to process your request. <% 
			} else { 
%> Your database has been created
				<P>To download, please right click on the button below and click <B><I>Save
				Target As...</I></B>
				<P ALIGN="CENTER"><A
					CLASS="button"
					HREF="/crs/database/download/<%=results.get("FileName")%>">Download
				Now</A></P>
				<% 
			} 
%></TD>
			</TR>
		</TABLE>
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader">Export Results</TD>
			</TR>
			<TR>
				<TD CLASS="cell">
			<% 
			List<String> errors = (List<String>) results.get("Output");
			for (String error : errors) {
			%>
				<%= error %><br>
			<%
			}
			if (errors.size() > 0) {
			%>
				Please check for duplicate registrations.  
				Problematic registration records are not included in the download.  <br><br>
			<% 
			}
			%>
			<B>Status: <%=results.get("Status")%></B><br><br>
				
				If you run into any problems downloading the
				database, email us at <a
					href="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</a>.
				</TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf" %>
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
