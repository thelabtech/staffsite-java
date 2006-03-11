<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	String pageTitle = "Reports";
	String view = ar.getValue("view");
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");
	Conference conference = (Conference)ar.getObject("conference");
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		// First check to see if all the required fields have something in them
		if(requiredFilled(document.reports)){
			// Next check for specific content
			document.reports.action.value = action;
			document.reports.submit();
		}
	}

-->
</SCRIPT>
<%@ include file="/crs/e_header.jspf"%>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
	<TR>
		<TD VALIGN="TOP" WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=conferenceMenu.display(3)%>
		</TD>
		<TD VALIGN="TOP">
		<TABLE BORDER="0" CELLSPACING="0">
			<TR>
				<TD	CLASS="<%="general".equals(ar.getValue("view")) ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listReports&view=general&offset=<%=ar.getValue("offset")%>
					&size=<%=ar.getValue("size")%>"
					CLASS="<%="general".equals(ar.getValue("view")) ? "tabactive" : "tab" %>">General reports</A></TD>
				
				<% /* iterate over all RegistrationTypes */
					Iterator regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
						%>
				<TD CLASS="<%=view.equals(typeID) ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listReports&view=<%=typeID%>&offset=<%=ar.getValue("offset")%>
					&size=<%=ar.getValue("size")%>"
					CLASS="<%=view.equals(typeID) ? "tabactive" : "tab" %>"><%=typeLabel%> reports</A></TD>
						<%
					}	%>
			</TR>
		</TABLE>
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<%
		if(ar.getCollection("reports").size() > 0){		
			Iterator reports = ar.getCollection("reports").iterator();
			for(int i = 0; reports.hasNext(); i++){
				Report r = (Report)reports.next();
%>
			<TR>
				<TD CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"><A
					CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					HREF="/servlet/CRSAdmin?action=showReport&view=<%=ar.getValue("view")%>&reportID=<%=r.getReportID()%>"><%=r.getName()%></A></TD>
				<%
					if("uber".equals(session.getValue("authLevel"))){
%>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" ALIGN="RIGHT"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=editReport&reportID=<%=r.getReportID()%>">Edit</A></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" ALIGN="RIGHT"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=cloneReport&reportID=<%=r.getReportID()%>">Clone</A></TD>
				<%
					}
%>
			</TR>
			<%
			}
		} else {
%>
			<TR>
				<TD CLASS="cell" ALIGN="CENTER">There aren't any common reports to
				display</TD>
			</TR>
			<%
		}
		if("uber".equals(session.getValue("authLevel"))){
%>
			<TR>
				<TD CLASS="button" ALIGN="RIGHT" COLSPAN="3"><A
					HREF="/servlet/CRSAdmin?action=newReport" CLASS="button">New Report</A></TD>
			</TR>
			<%
		}
%>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf"%>
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
