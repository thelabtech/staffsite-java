<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<%
	String pageTitle = "Former Conference Registration System -- PhaseOut in Progress";
	Conference conference = new Conference();
%>
<%@ include file="/crs/e_header.jspf"%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">

	<!-- COMMENT OUT THIS SECTION TO TURN OFF CRS -->
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(1)%>
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="subboxheader"
					VALIGN="BOTTOM">View an Existing Conference by Region</TD>
			</TR>
			<TR>
				<TD
					CLASS="menu"
					VALIGN="BOTTOM"><A
					HREF="/servlet/CRSAdmin?action=listConferences&currentRegion=ALL"
					CLASS="menu">All Conferences</A></TD>
			</TR>
			<%
			for(int i = 0; i < selRegion.regions.length; i++){
%>
			<TR>
				<TD
					CLASS="menu"
					VALIGN="BOTTOM"><A
					HREF="/servlet/CRSAdmin?action=listConferences&currentRegion=<%=selRegion.regions[i]%>"
					CLASS="menu"><%=selRegion.regionNames[i]%></A></TD>
			</TR>
			<%
			}
%>
			</TR>
		</TABLE>
		</TD>
		<TD VALIGN="TOP">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader">Features</TD>
			</TR>
			<TR>
				<TD CLASS="cell_watermark">Using the Conference Registration System,
				you can set up and monitor online registration for events of all
				sizes. Whether you are organizing your local Fall Retreat or your
				regional Christmas Conference, this is the place for you! You may
				also use this tool to see which students from your campus have
				registered, add and designate scholarships for students, and
				register as staff for an event. Other features include:
				<ul>
					<li>Secure Registration.</li>
					<li>Multiple payment options - credit card, check, and scholarship.</li>
					<li>Multipe registrant types.</li>
					<li>Customizable - add as many questions as you want, choose
					payment options, add other expenses such as $10 for a T-shirt.</li>
					<li>Registrant name and password functionality so they can have
					their contact info saved for future events.</li>
					<li>Downloadable MS Access databases or Excel spreadsheets
					containing registrant information.</li>
				</ul>
				</TD>
			</TR>
		</TABLE>
		<!-- END SECTION TO COMMENT OUT WHEN CRS IS OFF -->

		<!-- PLACEHOLDER CODE WHILE CRS IS OFF -->
		<!--		
		<TR>
			<TD CLASS="cell" ALIGN="CENTER"><b>The Conference Registration System is temporarily unavailable.
			Please try again in a few hours.</b></TD>
		</TR>
		-->
		<!-- END PLACEHOLDER CODE -->

		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader">Help</TD>
			</TR>
			<TR>
				<TD CLASS="cell">
				<p>Instructions are available at the bottom of every screen. Any
				time you see a <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('More information would be here...');"
					onmouseout="return nd();"> on the conference pages, hover over it
				for more information on that field or feature. If you need further
				assistance, please contact help@campuscrusadeforchrist.com.
				<p>For an overview of how to use the CRS for your event, from start
				to finish, click <a
					href="https://staff.campuscrusadeforchrist.com/cms/content/2873.htm">
				here</a>.
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
