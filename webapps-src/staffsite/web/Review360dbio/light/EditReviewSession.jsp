<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>

<HTML>
<HEAD>
<TITLE>Campus Staff Site - Review 360</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function deleteSession(name, sessionid){
		document.deleteForm.reviewSessionLightId.value = sessionid;
		document.deleteForm.action.value = "deleteReviewSession";
		document.deleteForm.lastAction.value = "showIndex";
		if(confirm("Are you sure you want to PERMANENTLY delete this Review? This will delete each 360 contained in " + name + ".")){
			document.deleteForm.submit();
		}
	}

	function delete360(name, r360id, sessionid){
		document.deleteForm.encRevId.value = r360id;
		document.deleteForm.reviewSessionLightId.value = sessionid;
		document.deleteForm.action.value = "deleteReviewer";
		document.deleteForm.lastAction.value = "editReviewSession";
		if(confirm("Are you sure you want to remove " + name + " from this 360? This will delete all information entered by " + name + "!")){
			document.deleteForm.submit();
		}
	}

	function validate(form,type) {
		var valid = false;
		if (form.to.length==null && form.to.checked==true) valid=true;
		for(var i=0; (i < form.to.length); i++) {
			if(form.to[i].checked)
				valid = true;
		}
		if(valid)
		{
			form.content.value= type;
			form.submit();
		}
		else
			alert("You must select a reviewer to E-mail.");
	}
// -->
</SCRIPT>
</HEAD>
<% int curr_tab = 3; %>
<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy"); %>
<%@ include file="/headersmall.jspf" %>
<%
	ActionResults tub;
	tub = ActionResults.getActionResults(session);
	Hashtable mySession = (Hashtable)tub.getHashtable("ReviewSession");
%>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" <%=bgcolorW%>> <!--Whole page table-->
   <TR>
        <TD <%=bgcolorW%> VALIGN="BOTTOM" COLSPAN="3"><IMG SRC="/images/360logo.gif" BORDER="0">&nbsp;<%=fontB5%><B>Administration - "<%=mySession.get("Title")%>"</B></ONT></TD>
	</TR>
	<TR>
		<TD <%=bgcolorB%> COLSPAN="3"><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="616" BORDER="0"></TD>
	</TR>
	<TR VALIGN="TOP">
		<TD WIDTH="140">
			<% box.setStyle(boxStyle);	//will set it for all the following boxes until we call it again%>
			<% box.setColor(color7);%>
			<% box.setBodyColor(color7);%>
			<BR>
			<% box.setTitle("360 Tools");	%>
			<%=box.printTop()%>

			<A HREF="/servlet/Review360Controller?action=showIndex"><%=fontB1%>360 Home</FONT></A><BR>
			<A HREF="/servlet/Review360Controller?action=listAdminSessions"><%=fontB1%>Administration</FONT></A><BR>
			<A href="JavaScript: popupWindow('/help/help_360_review.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><%=fontB1%>Help</font></A>
			<%=box.printBottom()%>

			<P>
			<% box.setTitle("My 360 Info");	%>
			<%=box.printTop()%>

			<%=fontB1%>Review to fill out: <%=fontR1%><%=session.getValue("rsize")%></FONT></FONT><BR>
			<%=fontB1%>Reviews administering: <%=fontR1%><%=session.getValue("asize")%></FONT></FONT><BR>
			<%=box.printBottom()%>
			<BR>
		</TD>
		<TD WIDTH="10"></TD>
		<TD VALIGN="TOP" WIDTH="616">
		<BR>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="0"> <!-- Big frame inside table-->
	<TR>
		<TD>
		<B><%=fontB%>Administration</FONT></B>
		<OL>
			<%=fontB%><LI>Add reviewers.</FONT>
			<%=fontB%><LI>Send an initial email to invite them. (Check the boxes by the names of desired reviewers and click [Send Email Invitation to the Reviewers you checked].) <a href="javascript: popupWindow('/Review360dbio/previewInvitationEmail.jsp', 'PreviewInvitationEmail', 'height=600,width=750,dependent=yes,scrollbars=yes,resizable')">Preview Invitation Email</a></FONT>
			<%=fontB%><LI>Monitor progress of the reviewers.</FONT>
			<%=fontB%><LI>Send another email to remind them. (Check the boxes by the names of desired reviewers and click [Send Email Reminder to the Reviewers you checked].)<a href="javascript: popupWindow('/Review360dbio/previewReminderEmail.jsp', 'PreviewReminderEmail', 'height=600,width=750,dependent=yes,scrollbars=yes,resizable')">Preview Reminder Email</a></FONT>
			<%=fontB%><LI>View and or print individual reviews or a summary of all the reviews.</FONT>
		</OL>
		</TD>
	</TR>
<%
		int counter = 1;
		String rName = (String)mySession.get("ReviewFor");

		box.setTitle(rName +  " - \"" + mySession.get("Title") + "\"");
		box.setWidth("100%");
		box.setSubPad("0");
		box.setSubSpace("1");
		%>
	<TR>
		<TD>
		<%=box.printTop()%>
		<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="1">
		<TR>
			<TD <%=bgcolorG%>><%=fontB%><B>Title</B></FONT></TD>
			<TD <%=bgcolorG%>><%=fontB%><B>Review For</B></FONT></TD>
			<TD <%=bgcolorG%>><%=fontB%><B>Date Started</B></FONT></TD>
			<TD <%=bgcolorG%>><%=fontB%><B>Date Due</B></FONT></TD>
			<TD <%=bgcolorG%>>&nbsp;</TD>
			<TD <%=bgcolorG%>>&nbsp;</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%>><%=fontB%><%=mySession.get("Title")%></FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=rName%></FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=dateFormatter.format((Date)mySession.get("StartDate"))%></FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=dateFormatter.format((Date)mySession.get("DueDate"))%></FONT></TD>
			<TD <%=bgcolorW%> ALIGN="RIGHT">
				<!--<%=fontR%>[<A HREF="javascript: deleteSession('<%=mySession.get("Title")%>','<%=mySession.get("reviewSessionLightId")%>');"><%=fontR%>Delete</FONT></A>]</FONT>--></TD>
			<TD <%=bgcolorW%> ALIGN="RIGHT"><%=fontB%>[<A HREF="/servlet/Review360LightController?action=editReviewSessionDetails&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=editReviewSession"><%=fontB%>Edit</FONT></A>]</FONT></TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="6"><%=fontB%>
			<B>Purpose:</B>
			<%if(mySession.get("Purpose") != null) out.print(mySession.get("Purpose"));%>
			</FONT>
		</TR>
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">&nbsp;</TD>
			<TD <%=bgcolorG%> COLSPAN="2" ALIGN="RIGHT"><%=fontB%>[<A HREF="/servlet/Review360LightController?action=showReviewSummary&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>"><%=fontB%>Printable Summary</FONT></A>]</FONT></TD>
		</TR>
		</TABLE>
<!--Begin listing individual reviews-->
<%
	Vector reviews = (Vector)mySession.get("Reviews");
	Iterator r360list = reviews.iterator();
	if(r360list.hasNext()){
%>
		<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="1">
		<TR>
			<TD <%=bgcolorW%> COLSPAN="5"><%=fontB%><B>The following <%=reviews.size()%> <%= (reviews.size() == 1) ? "person is" : "people are" %> reviewing <%=rName%>:</B></FONT></TD>
			<TD <%=bgcolorW%> COLSPAN="4" ALIGN="CENTER"><%=fontB%>[<A HREF="/servlet/Review360LightController?action=addReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=editReviewSession"><%=fontB%>Add Staff Reviewer</FONT></A>]<br />[<A HREF="/servlet/Review360LightController?action=addNonStaffReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=editReviewSession"><%=fontB%>Add Non-Staff Reviewer</FONT></A>]</FONT></TD>
		</TR>
		<TR>
			<TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB1%>(Email<BR>them)</FONT></TD>
			<TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB%><B>Name</B></FONT></TD>
			<TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB%><B>Email</B></FONT></TD>
			<TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB%><B>Date<BR>Completed</B></FONT></TD>
			<TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB%><B>Current<BR>Position</B></FONT></TD>
			<TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB%><B>Leadership<BR>Level</B></FONT></TD>
			<TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB%><B>Relationship</B></FONT></TD>
			<TD <%=bgcolorG%> VALIGN="BOTTOM">&nbsp;</TD>
			<TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB1%>(To "Edit"<BR>click name)</FONT></TD>
		</TR>
		<FORM ACTION="/servlet/Review360LightController?action=sendEmails&lastAction=editReviewSession" NAME="email<%=counter%>" METHOD="post">
		<INPUT TYPE="hidden" NAME="content" VALUE="">
<%
		int counter2 = 1;
		while (r360list.hasNext()) {
			Hashtable myR360 = (Hashtable)r360list.next();
			boolean tempBool = true;
			if(counter2%2 == 0) tempBool = false;
			String reviewedByName = (String)myR360.get("ReviewedByName");
%>
			<TR>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><INPUT TYPE="checkbox" NAME="to" VALUE="<%=Integer.toString(counter2-1) + "_" + myR360.get("PsEmail")%>"></TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A TARGET="_blank" HREF="/servlet/Review360LightController?action=revFormEncEdit&encRevID=<%=myR360.get("Review360Id")%>"><%=reviewedByName%></A>&nbsp;</FONT></TD>
				<INPUT TYPE="hidden" Name="name" VALUE="<%=reviewedByName%>">
				<INPUT TYPE="hidden" Name="encRevId" VALUE="<%=myR360.get("Review360Id")%>">
				</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB1%><%=myR360.get("PsEmail")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("DateCompleted")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("CurrentPosition")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("LeadershipLevel")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("Relationship")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>>
					<%=fontR%>[<A HREF="JavaScript: delete360('<%=reviewedByName%>','<%=myR360.get("Review360Id")%>','<%=mySession.get("reviewSessionLightId")%>');"><%=fontR1%>Remove Reviewer</FONT></A>]</FONT></TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><A HREF="/servlet/Review360LightController?action=showReviewSummary&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&encRevID=<%=myR360.get("Review360Id")%>"><%=fontB1%>Individual<BR>Summary</FONT></A></TD>
			</TR>
<%
			counter2++;
		} // r360list while end
%>
			<INPUT TYPE="hidden" VALUE="<%=mySession.get("reviewSessionLightId")%>" NAME="reviewSessionLightId">
		</FORM>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="9">
			<INPUT TYPE="submit" VALUE="Send Email Invitation to the Reviewers you checked" OnClick="JavaScript: validate(document.email<%=counter%>,'invite')">
			<INPUT TYPE="submit" VALUE="Send Reminder Email to the Reviewers you checked" OnClick="JavaScript: validate(document.email<%=counter%>,'remind')">
			</TD>
		</TR>
<%
	} else { // r360list if else
%>
		<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="1">
		<TR>
			<TD <%=bgcolorW%> COLSPAN="6"><%=fontB%><B>There are no people doing reviews for <%=rName%>:</B></FONT></TD>
			<TD <%=bgcolorW%> COLSPAN="2" ALIGN="CENTER"><%=fontB%>
			[<A HREF="/servlet/Review360LightController?action=addReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=editReviewSession"><%=fontB%>Add Staff Reviewer</FONT></A>]<br />
			[<A HREF="/servlet/Review360LightController?action=addNonStaffReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=editReviewSession"><%=fontB%>Add Non-Staff Reviewer</FONT></A>]</FONT></TD>
		</TR>

		<TR>
			<TD <%=bgcolorW%> COLSPAN="8" ALIGN="CENTER"><%=fontB%>
				-No Reviews on Record-
			</FONT>
			</TD>
		</TR>
<%
	} // r360 if end
%>
		</TABLE>
		</TD>
	</TR>
<!------  End  listing individual reviews	 ------>

		<%=box.printBottom()%>
		<P>
		</TD>
	</TR>
	<TR>
		<TD>
			<A NAME=note>
			<%=fontR%><B>*Note</B></FONT>
			<%=fontB%>
			<BLOCKQUOTE>
			When PRINTING reports: The report will look 100% better if you turn on the "print background" option in your browser settings. Otherwise it will not print the bars or shading.<P>
			(How to change setting?: In Internet Explorer, click Tools, then Internet Options, then the Advanced tab, then scroll down to Printing and check the box for "Print background colors and images.")
			</BLOCKQUOTE>
			</FONT>
		</TD>
	</TR>
	</TABLE><!-- Big inside table close-->

		</TD>
	</TR>
	<TR>
		<TD <%=bgcolorB%> COLSPAN="3"><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="616" BORDER="0"></TD>
	</TR>
</TABLE><!--whole page table close-->
<FORM ACTION="/servlet/Review360LightController" METHOD="get" NAME="deleteForm">
	<INPUT TYPE="hidden" NAME="action">
	<INPUT TYPE="hidden" NAME="reviewSessionLightId">
	<INPUT TYPE="hidden" NAME="encRevId">
	<INPUT TYPE="hidden" NAME="lastAction" VALUE="editReviewSession">
</FORM>

<%@ include file="/footer.jspf" %>
</HTML>