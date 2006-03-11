<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion" scope="request"/>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	String currentRegion = ar.getValue("currentRegion");
	String view = ar.getValue("view");
	Conference conference = new Conference(); // empty conference for display purposes
	Registration registration = new Registration();
	boolean isSpouse = false;
	int regionIndex = ArrayHelper.indexOf(currentRegion, selRegion.regions);
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Conference Registration System";
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
		false
	});
otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

%>
<!-- Campus Crusade for Christ Conference System -->
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	
	<!-- REMOVED SEP 11/1/04 ********
	<TD VALIGN="TOP" WIDTH="150">
		<%=registrationMenu.display(1)%>
	</TD>
	**********************************-->
	
	<TD VALIGN="TOP">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
	
		<!-- COMMENT OUT THIS SECTION TO TURN OFF CRS -->
		<TR>
			<TD CLASS="boxheader" VALIGN="BOTTOM">Events by Region</TD>
		</TR>
<%
		Iterator conferences = ar.getCollection("Conferences").iterator();
		if(ar.getCollection("Conferences").size() > 0){
			String region = "";
			for(int i = 0; conferences.hasNext(); i++){
				Conference c = (Conference)conferences.next();
				if(!region.equals(c.getRegion())){
					region = c.getRegion();
					 i = 0;
%>
					<TR>
						<TD CLASS="subboxheader" VALIGN="BOTTOM"><%=selRegion.regionNames[ArrayHelper.indexOf(region, selRegion.regions)]%></TD>
					</TR>
<%
				}
%>
				<TR>
					<TD CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>" VALIGN="BOTTOM"><A CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>" HREF="/servlet/CRSRegister?action=selectEvent&ConferenceID=<%=c.getConferenceID()%>"><%=c.getName()%></A></TD>
				</TR>
<%
			}
		} else {
%>
			<TR>
				<TD CLASS="cell" ALIGN="CENTER">There aren't any conferences to display</TD>
			</TR>
<%
		}
%>
		<!-- END SECTION TO COMMENT OUT WHEN CRS IS OFF -->

		<!-- PLACEHOLDER CODE WHILE CRS IS OFF -->
		<!--		
		<TR>
			<TD CLASS="cell" ALIGN="CENTER"><b>The Conference Registration System is temporarily unavailable.
			Please try again in a few hours.</b></TD>
		</TR>
		-->
		<!-- END PLACEHOLDER CODE -->

	</TABLE>
	</TD>
	
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
