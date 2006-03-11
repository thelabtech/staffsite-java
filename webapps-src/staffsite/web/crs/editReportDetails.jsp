<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Report r = (Report)ar.getObject("report");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}

	String pageTitle = "Edit Report";
	Conference conference = new Conference();
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else {
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}

//-->
</SCRIPT>
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
		<FORM
			NAME='theForm'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE="saveReport"> <INPUT
			TYPE=hidden
			NAME="ReportID"
			VALUE="<%=r.getReportID()%>"> <INPUT
			TYPE=hidden
			NAME="ConferenceID"
			VALUE="<%=session.getValue("eventLoggedIn")%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="3">Report Details</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">Name</TD>
				<TD
					CLASS="cell"
					COLSPAN="2"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="Name"
					size=30
					maxlength=50
					value="<%=r.getName()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('blah');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">XSL</TD>
				<TD
					CLASS="cell"
					COLSPAN="2"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="XSL"
					size=30
					maxlength=50
					value="<%=r.getXSL()%>"> <IMG
					SRC="/crs/images/info.gif"
					onMouseOver="return overlib('xx');"
					onMouseOut="return nd();"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Report Group</TD>
				<TD
					CLASS="cell"
					COLSPAN="2"><SELECT
					NAME="ReportGroup"
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)">
					<OPTION
						VALUE="0"
						<%=r.getReportGroup() == 0 ? "SELECTED" : ""%>>General
					<OPTION
						VALUE="4"
						<%=r.getReportGroup() == 4 ? "SELECTED" : ""%>>Specific Registration Type
				</SELECT></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Query</TD>
				<TD
					CLASS="cell"
					COLSPAN="2"><TEXTAREA
					COLS="60"
					ROWS="10"
					NAME="Query"
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"><%=r.getQuery()%></TEXTAREA></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					WIDTH="20%">&nbsp;</TD>
				<TD
					CLASS="cell"
					WIDTH="30%">Column Names<BR>
				<TEXTAREA
					COLS="25"
					ROWS="10"
					NAME="SortNames"
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"><%=r.getSortNames()%></TEXTAREA></TD>
				<TD CLASS="cell">Sort Fields<BR>
				<TEXTAREA
					COLS="25"
					ROWS="10"
					NAME="Sorts"
					CLASS="empty"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"><%=r.getSorts()%></TEXTAREA></TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=listReports&view=<%=r.getReportGroup()%>"
					CLASS="button">Cancel</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"
					COLSPAN="2"><A
					HREF="javascript: goNext('saveReport', 'save')"
					NAME="save"
					CLASS="button">Save</A></TD>
			</TR>
		</TABLE>
		</FORM>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">The available online payment methods right now are
				mail check, scholarship, and credit card. You must set up a merchant
				account in order to do online credit card payments. If you have not
				set up an account yet, do <B>not</B> set the <I>Accept Credit Cards</I>
				field to yes.
				<p>If the event has no costs associated with it, leave all the
				fields blank.
				<P><B>Additional Payment Add-Ons</B><BR>
				These are items that will be listed on the "My Registration Info"
				page for students. They are things that will add to the conference
				cost if they choose "yes". For example, you could charge an
				additional $50 for a ski day, or $10 for a T-shirt, or $20 for a
				book. Click the [Add] link below to see how the add-ons will be
				displayed. You won't have to add one if you don't want to.
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
