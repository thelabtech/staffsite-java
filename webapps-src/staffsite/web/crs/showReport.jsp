<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*, javax.xml.transform.*, java.net.*, java.util.*, javax.xml.transform.stream.*"%>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Report report = (Report)ar.getObject("report");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String view = ar.getValue("view");
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");
	String pageTitle = report.getName();
%>
<%@ include file="/crs/e_header.jspf"%>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
	<TR>
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
				<TD CLASS="tab"><A HREF="/servlet/CRSAdmin?action=showConference"
					CLASS="tab">Conference Details</A></TD>
			</TR>
		</TABLE>
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<%
		if(Integer.parseInt(ar.getValue("maxSize")) > 0){
%>
			<TR>
				<TD ALIGN="CENTER" CLASS="pager"
					COLSPAN="<%=report.getSortNames().split("\n").length%>"><%=formatter.displayPager( ar.getValue("order"), ar.getValue("orderCol"), ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "", "/servlet/CRSAdmin?action=showReport&view=" + ar.getValue("view") + "&reportID=" + report.getReportID())%>
				</TD>
			</TR>
			<%
		formatter.setHeaderNames(report.getSortNames().split("\n"));
		formatter.setHeaderReport(true);
//		formatter.setHeaderSorts(new boolean[] {true, true, true});
//		formatter.setHeaderWidths(new String[] {"", "", ""});
//		formatter.setHeaderAligns(new String[] {"LEFT", "RIGHT", "LEFT"});
%>
			<%=formatter.displayHeader( request.getParameter("orderCol"), request.getParameter("order"), "Report Table", "/servlet/CRSAdmin?action=showReport&view=" + ar.getValue("view") + "&reportID=" + report.getReportID())%>
			<%
		String scheme = request.getServerName().contains("campuscrusadeforchrist") ? "https" : "http";
		String url = scheme + "//" + request.getServerName() +
			"/servlet/CRSAdmin?action=reportXML&reportID=" + report.getReportID() +
			"&offset=" + ar.getValue("offset") +
			"&size=" + ar.getValue("size") +
			"&orderCol=" + ar.getValue("orderCol") +
			"&order=" + ar.getValue("order") +
			"&view=" + ar.getValue("view") + 
			"&conferenceID=" + session.getValue("eventLoggedIn");

		URL xmlUrl = new URL(url);
		Source xsl = new StreamSource(this.getServletConfig().getServletContext().getRealPath("/crs/reports/" + report.getXSL() + ".xsl"));
		Source xml = new StreamSource(xmlUrl.toExternalForm());

		System.setProperty("javax.xml.transform.TransformerFactory", "com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl");  //Needed for JDK 1.5.0
		TransformerFactory tFactory = TransformerFactory.newInstance();
		Transformer transformer = tFactory.newTransformer(xsl);
		transformer.transform(xml, new StreamResult(out));
		} else {
%>
			<TR>
				<TD ALIGN="CENTER" CLASS="cell">There is nothing to report</TD>
			</TR>
			<%
		}
%>
		</TABLE>
		</FORM>
		<%
		if((report.getName().equals("Incomplete Registration Report"))&&(Integer.parseInt(ar.getValue("maxSize")) > 0)){
%>
		<P>
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="hl">
				<center><A CLASS="button"
					HREF="/servlet/CRSAdmin?action=composeEmail&returnTo=listReports&emailType=incompleteRegistrants&id=<%=report.getReportID()%>">Email
				Incomplete Registrants</A></center>
			</TR>
			</TD>
		</TABLE>
		<%
		}
%>
		<P>
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">Hover over the blue question marks <img
					src='/crs/images/info.gif' height=15 width=15
					onmouseover="return overlib('Hi!');" onmouseout="return nd();"> for
				additional information</TD>
			</TR>
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
