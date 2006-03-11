<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<%
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Clone a Conference";
	Conference conference = new Conference();
%>
<%@ include file="/crs/e_header.jspf"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		// First check to see if all the required fields have something in them
		if(requiredFilled(document.theForm)){
			document.theForm.action.value = action;
			document.theForm.submit();
		}
	}
//-->
</SCRIPT>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(4)%>
		<P>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME="theForm"
			ACTION="/servlet/CRSAdmin"><INPUT
			TYPE="HIDDEN"
			NAME="action"
			VALUE="createCloneConference">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">New Conference Name</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="cloneName"
					SIZE="30"
					MAXLENGTH="50"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Conference to Clone</TD>
				<TD CLASS="cell"><SELECT
					NAME="cloneID"
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)">
					<OPTION VALUE="">Select a conference</OPTION>
					<%
		try{
			Iterator conferences = ar.getCollection("Conferences").iterator();
			if(ar.getCollection("Conferences").size() > 0){
				for(int i = 0; conferences.hasNext(); i++){
					Conference c = (Conference)conferences.next();
%>
					<OPTION
						VALUE="<%=c.getConferenceID()%>"
						<%=ar.getValue("conferenceID").equals(String.valueOf(c.getConferenceID())) ? "SELECTED" : ""%>><%=c.getName()%></OPTION>
					<%
				}
			} else {
%>
					<OPTION>There aren't any conferences to display</OPTION>
					<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
				</SELECT></TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=listConferences"
					CLASS="button">Cancel</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('createCloneConference')"
					CLASS="button">Clone Conference</A></TD>
			</TR>
		</TABLE>
		</FORM>
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
				<TD CLASS="cell">Enter the name of the conference you wish to
				create. Select a conference with similar components to the new
				conference from the pull down menu. Click "Clone Conference."</TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf" %>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
