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
	String pageTitle = "Database Download";// / Upload";
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
				<TD CLASS="cell">Please select the database template you wish to
				download.
				<br>
				<br>
				<table border="1">
<tr>
<td width="45%"><A CLASS="button" HREF="/servlet/CRSAdmin?action=downloadDB&Template=BlueMango">BlueMango </A></td>
<td>Sleek, svelte and ready to roll. An upgrade of the "Christmas Conference Access Template" option listed below. A Microsoft Access template. See the <u><a href="http://conf_admin.mygcx.org">GCX Conference Administrator’s Community</a><u> for help on how to use BlueMango at your conference.</td>
</tr>
<tr>
<td width="45%"><A CLASS="button" HREF="/servlet/CRSAdmin?action=downloadDB&Template=Christmas Conference">Christmas Conference Access Template</A></td>
<td>Also a Microsoft Access template. Some helpful guides are available in the <u><a href="/servlet/CmsController?action=browse&catId=1000078" target="_blank">Resource Center</a></u>. See the <u><a href="http://conf_admin.mygcx.org">GCX Conference Administrator’s Community</a><u> for information about the planned “phase out” of this version in early spring 2007.</td>
</tr>
<tr>
<td width="45%"><A CLASS="button" HREF="/servlet/CRSAdmin?action=downloadDB&Template=Blank">Blank Access Template</A></td>
<td>No frills, just your conference data in a Microsoft Access database file.</td>
</tr>
<tr>
<td width="45%"><A CLASS="button" HREF="/servlet/CRSAdmin?action=downloadDB&Format=CSV">Excel-Compatible CSV</A></td>
<td>Don't need Access? Here's your conference data in Excel-friendly CSV (comma separated values) format.</td>
</tr>
</table> 
				</TD>
			</TR>
			<TR>
				<TD
					colspan=3
					align="center"><BR>
				<B><Font color='#AA0000'>Please be patient after you make your
				selection.</B></Font> <BR>
				It may take several minutes to generate your database file.
				<P>
				</TD>
			</TR>
		</TABLE>
		<P>
<!--		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader">MS Access Database Upload</TD>
			</TR>
			<TR>
				<TD CLASS="cell">
				<FORM
					NAME="fileForm"
					ACTION="/servlet/CRSAdmin?action=uploadDB"
					METHOD="POST"
					ENCTYPE="multipart/form-data">Please select the database that you
				wish to import into the online registration system.<br>
				<INPUT
					TYPE="FILE"
					NAME=fileName
					SIZE="30">&nbsp;&nbsp;<BR>
				<input
					type="submit"
					value="Upload"
					name="B1"></FORM>
				</TD>
			</TR>
			<TR>
				<TD valign="top">Before uploading the database, you should compact
				it. Open up the database and click:<BR>
				<B>Tools -> Database Utilities -> <BR>
				Compact and Repair Database</B></TD>
			</TR>
			<TR>
				<TD
					colspan=3
					align="center"><BR>
				<B><Font color='#AA0000'>Please be patient after you make your
				selection.</B></Font> <BR>
				It may take several minutes to generate your database file.
				<P>
				</TD>
			</TR>
		</TABLE>
-->
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">
				<p>You can download the data for your conference in two forms: a
				Microsoft Access database or a Microsoft Excel Spreadsheet. While
				the Excel Spreadsheet provides a quick overview of the information,
				the Access Database allows you to design all the queries, forms and
				reports you need to manage different aspects of the conference.</p>
				<p>There are currently two Access templates available for download.
				The “Blank Access Template” will download the data for your
				conference in the form of several tables. You can use these tables
				to create all the custom queries, forms and reports that you will
				need for your on-site registration. The “Christmas Conference Access
				Template” will do the same thing, but in addition to that it has a
				lot of pre-made queries, forms and reports that are designed for
				running an on-site Christmas/Winter Conference registration.</p>
				<P>Hover over the blue question marks <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('Hi!');"
					onmouseout="return nd();"> for additional information
				</TD>
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
