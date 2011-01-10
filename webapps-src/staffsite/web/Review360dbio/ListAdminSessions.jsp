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
		document.deleteForm.reviewSessionId.value = sessionid;
		document.deleteForm.action.value = "deleteReviewSession";
		document.deleteForm.lastAction.value = "listAdminSessions";
		if(confirm("Are you sure you want to PERMANENTLY delete this Review? This will delete each 360 contained in " + name + ".")){
			document.deleteForm.submit();
		}
	}

	function deleteSessionLight(name, sessionid){
		document.deleteLightForm.reviewSessionLightId.value = sessionid;
		document.deleteLightForm.action.value = "deleteReviewSession";
		document.deleteLightForm.lastAction.value = "listAdminSessions";
		if(confirm("Are you sure you want to PERMANENTLY delete this Review? This will delete each 360 contained in " + name + ".")){
			document.deleteLightForm.submit();
		}
	}

	function delete360(name, r360id, sessionid){
		document.deleteForm.encRevId.value = r360id;
		document.deleteForm.reviewSessionId.value = sessionid;
		document.deleteForm.action.value = "deleteReviewer";
		document.deleteForm.lastAction.value = "listAdminSessions";
		if(confirm("Are you sure you want to remove " + name + " from this 360? This will delete all information entered by " + name + "!")){
			document.deleteForm.submit();
		}
	}

	function delete360light(name, r360id, sessionid) {
		document.deleteLightForm.encRevId.value = r360id;
		document.deleteLightForm.reviewSessionLightId.value = sessionid;
		document.deleteLightForm.action.value = "deleteReviewer";
		document.deleteLightForm.lastAction.value = "listAdminSessions";
		if(confirm("Are you sure you want to remove " + name + " from this 360? This will delete all information entered by " + name + "!")){
			document.deleteLightForm.submit();
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
	// out.print("<!--" + tub.toHTML() + "-->");
%>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" <%=bgcolorW%>> <!--Whole page table-->
	<TR>
		<TD <%=bgcolorW%> VALIGN="BOTTOM" COLSPAN="3"><IMG SRC="/images/360logo.gif" BORDER="0">&nbsp;<%=fontB5%><B>Administration</B></FONT></TD>
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

			<A HREF="/servlet/Review360Controller?action=showIndex"><%=fontB1%>360 Home</FONT></A><BR><!--
			<A HREF="/servlet/Review360Controller?action=newReviewSession"><%=fontB1%>Start a new 360</FONT></A><BR>
			<% if("true".equals(tub.getValue("LightAdmin"))) { %>
			<A HREF="/servlet/Review360LightController?action=newReviewSession"><%=fontB1%>Start a new 360 Light</FONT></A><BR>
			<% } %>
			--><A HREF="/servlet/Review360Controller?action=listAdminSessions"><%=fontB1%>Administration</FONT></A><BR>
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
<%
	Vector aV = (Vector) tub.getCollection("AdminList");
	Vector lV = (Vector) tub.getCollection("AdminListLight");

	Iterator alist = aV.iterator(); // Admin list
	Iterator llist = lV.iterator();
	int counter = 0;
	if(alist.hasNext()){
%>
	<TR>
        <TD>
			<%=fontB%>
			<B><%=fontB%>Administration Help</FONT></B>
			<UL>
			<LI>Click [<U>Edit</U>] to change information about the Review (i.e. Due Date, Title, Purpose).
			<LI>Click on the reviewer's name to edit their review or check on their progress.
			<LI>Before printing a report, read this <A HREF="#note"><%=fontR%>note</FONT></A>.
			<LI>To start a new review process, choose <U>Start a new 360</U> in the <B>360 Tools</B> section at the left.
			<LI>To send invitation emails, check the boxes by the names of desired reviewers and click [Send Email Invitation to the Reviewers you checked]. <a href="javascript: popupWindow('/Review360dbio/previewInvitationEmail.jsp', 'PreviewInvitationEmail', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Preview Invitation Email</a>
			<LI>To send reminder emails, check the boxes by the names of desired reviewers and click [Send Email Reminder to the Reviewers you checked]. <a href="javascript: popupWindow('/Review360dbio/previewReminderEmail.jsp', 'PreviewReminderEmail', 'height=600,width=750,dependent=yes,scrollbars=yes,resizable')">Preview Reminder Email</a>
			<LI>You can email multiple reviewers at once, but only for one review at a time.</FONT>
			</UL>
		</TD>
    </TR>
	<TR>
		<TD>
			<%=fontB3%><B>360 Reviews you are administering:<P></B></FONT>
		</TD>
	</TR>
<%
	while (alist.hasNext()) {
		Hashtable mySession = (Hashtable)alist.next();
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
			<TD <%=bgcolorW%>><A HREF="/servlet/Review360Controller?action=editReviewSession&reviewSessionId=<%=mySession.get("reviewSessionId")%>"><%=fontB%><%=mySession.get("Title")%></FONT></A></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=rName%></FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=dateFormatter.format((Date)mySession.get("StartDate"))%></FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=dateFormatter.format((Date)mySession.get("DueDate"))%></FONT></TD>
			<TD <%=bgcolorW%> ALIGN="RIGHT"><%=fontR%>
					<!--[<A HREF="javascript:
					    deleteSession('<%=mySession.get("Title")%>','<%=mySession.get("reviewSessionId")%>');"><%=fontR%>Delete</FONT></A>]-->
</FONT></TD>
			<TD <%=bgcolorW%> ALIGN="RIGHT"><%=fontB%>[<A HREF="/servlet/Review360Controller?action=editReviewSessionDetails&reviewSessionId=<%=mySession.get("reviewSessionId")%>&returnAction=listAdminSessions"><%=fontB%>Edit</FONT></A>]</FONT></TD>
		</TR>
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">&nbsp;</TD>
			<TD <%=bgcolorG%> COLSPAN="2" ALIGN="RIGHT"><%=fontB%>[<A HREF="/servlet/Review360Controller?action=showReviewSummary&reviewSessionId=<%=mySession.get("reviewSessionId")%>"><%=fontB%>Printable Summary</FONT></A>]</FONT></TD>
		</TR>
		</TABLE>
<!--Begin listing individual reviews-->
<%
	Vector reviews = (Vector)mySession.get("Reviews");
	Iterator r360list = reviews.iterator();
	if(r360list.hasNext()){
		int counter2 = 1;
%>
		<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="1">
		<TR>
			<TD <%=bgcolorW%> COLSPAN="5"><%=fontB%><B>The following <%=reviews.size()%> people are doing reviews for <%=rName%>:</B></FONT></TD>
			<TD <%=bgcolorW%> COLSPAN="4" ALIGN="CENTER"><%=fontB%>[<A HREF="/servlet/Review360Controller?action=addReviewer&reviewSessionId=<%=mySession.get("reviewSessionId")%>&returnAction=listAdminSessions"><%=fontB%>Add Staff Reviewer</FONT></A>]<br />[<A HREF="/servlet/Review360Controller?action=addNonStaffReviewer&reviewSessionId=<%=mySession.get("reviewSessionId")%>&returnAction=listAdminSessions"><%=fontB%>Add Non-Staff Reviewer</FONT></A>]</FONT></TD>
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
		<FORM ACTION="/servlet/Review360Controller?action=sendEmails&lastAction=listAdminSessions" NAME="email<%=counter%>" METHOD="post">
		<INPUT TYPE="hidden" NAME="content" VALUE="">
		<%
		int counterIn= 0;
		while (r360list.hasNext()) {
			Hashtable myR360 = (Hashtable)r360list.next();

			boolean tempBool = true;
			if(counter2%2 == 0) tempBool = false;
			String reviewedByName = (String)myR360.get("ReviewedByName");
%>
			<TR>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><INPUT TYPE="checkbox" NAME="to" VALUE='<%=Integer.toString(counterIn) + "_" + myR360.get("PsEmail")%>'></TD>
				<!-- Old unencoded URL
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A HREF="/servlet/Review360Controller?action=editReview360&review360Id=<%=myR360.get("Review360Id")%>"><%=reviewedByName%></A>&nbsp;</FONT></TD>
				-->
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A TARGET="_blank" HREF="/servlet/Review360Controller?action=revFormEncEdit&encRevID=<%=myR360.get("Review360Id")%>"><%=reviewedByName%></A>&nbsp;</FONT>
				<INPUT TYPE="hidden" Name="name" VALUE="<%=reviewedByName%>">
				<INPUT TYPE="hidden" Name="encRevId" VALUE="<%=myR360.get("Review360Id")%>">
				</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB1%><%=myR360.get("PsEmail")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("DateCompleted")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("CurrentPosition")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("LeadershipLevel")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("Relationship")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>>
					<%=fontR%>[<A HREF="JavaScript:	delete360('<%=reviewedByName%>','<%=myR360.get("Review360Id")%>','<%=mySession.get("reviewSessionId")%>');"><%=fontR1%>Remove Reviewer</FONT></A>]</FONT></TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><A HREF="/servlet/Review360Controller?action=showReviewSummary&reviewSessionId=<%=mySession.get("reviewSessionId")%>&encRevID=<%=myR360.get("Review360Id")%>"><%=fontB1%>Individual<BR>Summary</FONT></A></TD>
			</TR>
<%
			counterIn++;
			counter2 ++;
		} // r360list while end
%>
			<INPUT TYPE="hidden" VALUE="<%=mySession.get("reviewSessionId")%>" NAME="reviewSessionId">
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
			<TD <%=bgcolorW%> COLSPAN="2" ALIGN="CENTER"><%=fontB%>[<A HREF="/servlet/Review360Controller?action=addReviewer&reviewSessionId=<%=mySession.get("reviewSessionId")%>&returnAction=listAdminSessions"><%=fontB%>Add Staff Reviewer</FONT></A>]<br />[<A HREF="/servlet/Review360Controller?action=addNonStaffReviewer&reviewSessionId=<%=mySession.get("reviewSessionId")%>&returnAction=listAdminSessions"><%=fontB%>Add Non-Staff Reviewer</FONT></A>]</FONT></TD>
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

<%
	counter++;
	} // alist.hasNext while end
}
	if("true".equals(tub.getValue("LightAdmin"))) {
		if(llist.hasNext()) {
%>
	<TR>
		<TD>
			<%=fontB3%><B>360 Review Lights you are administering:<P></B></FONT>
		</TD>
	</TR>
<%
	while (llist.hasNext()) {
		Hashtable mySession = (Hashtable)llist.next();
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
			<TD <%=bgcolorW%>><A HREF="/servlet/Review360LightController?action=editReviewSession&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>"><%=fontB%><%=mySession.get("Title")%></FONT></A></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=rName%></FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=dateFormatter.format((Date)mySession.get("StartDate"))%></FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=dateFormatter.format((Date)mySession.get("DueDate"))%></FONT></TD>
			<TD <%=bgcolorW%> ALIGN="RIGHT">
				<!--<%=fontR%>[<A HREF="javascript: deleteSessionLight('<%=mySession.get("Title")%>','<%=mySession.get("reviewSessionLightId")%>');"><%=fontR%>Delete</FONT></A>]</FONT>--></TD>
			<TD <%=bgcolorW%> ALIGN="RIGHT"><%=fontB%>[<A HREF="/servlet/Review360LightController?action=editReviewSessionDetails&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=listAdminSessions"><%=fontB%>Edit</FONT></A>]</FONT></TD>
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
		int counter2 = 1;
%>
		<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="1">
		<TR>
			<TD <%=bgcolorW%> COLSPAN="6"><%=fontB%><B>The following <%=reviews.size()%> people are doing reviews for <%=rName%>:</B></FONT></TD>
			<!--TD <%=bgcolorW%> COLSPAN="2" ALIGN="CENTER"><%=fontB%>[<A HREF="/servlet/Review360LightController?action=addReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=listAdminSessions"><%=fontB%>Add Reviewer</FONT></A>]</FONT></TD>-->
			<TD <%=bgcolorW%> COLSPAN="4" ALIGN="CENTER"><%=fontB%>[<A HREF="/servlet/Review360LightController?action=addReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=listAdminSessions"><%=fontB%>Add Staff Reviewer</FONT></A>]<br />[<A HREF="/servlet/Review360LightController?action=addNonStaffReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=listAdminSessions"><%=fontB%>Add Non-Staff Reviewer</FONT></A>]</FONT></TD>
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
		<FORM ACTION="/servlet/Review360LightController?action=sendEmails&lastAction=listAdminSessions" NAME="email<%=counter%>" METHOD="post">
		<INPUT TYPE="hidden" NAME="content" VALUE="">
		<%
		int counterIn= 0;
		while (r360list.hasNext()) {
			Hashtable myR360 = (Hashtable)r360list.next();
			boolean tempBool = true;
			if(counter2%2 == 0) tempBool = false;
			String reviewedByName = (String)myR360.get("ReviewedByName");
%>
			<TR>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><INPUT TYPE="checkbox" NAME="to" VALUE='<%=Integer.toString(counterIn) + "_" + myR360.get("PsEmail")%>'></TD>
				<!-- Old unencoded URL
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A HREF="/servlet/Review360LightController?action=editReview360&review360LightId=<%=myR360.get("Review360Id")%>"><%=reviewedByName%></A>&nbsp;</FONT></TD>
				-->
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A TARGET="_blank" HREF="/servlet/Review360LightController?action=revFormEncEdit&encRevID=<%=myR360.get("Review360Id")%>"><%=reviewedByName%></A>&nbsp;</FONT>
				<INPUT TYPE="hidden" Name="name" VALUE="<%=reviewedByName%>">
				<INPUT TYPE="hidden" Name="encRevId" VALUE="<%=myR360.get("Review360Id")%>">
				</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB1%><%=myR360.get("PsEmail")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("DateCompleted")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("CurrentPosition")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("LeadershipLevel")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=myR360.get("Relationship")%></FONT>&nbsp;</TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>>
					<%=fontR%>[<A HREF="JavaScript: delete360light('<%=reviewedByName%>','<%=myR360.get("Review360Id")%>','<%=mySession.get("reviewSessionLightId")%>');"><%=fontR1%>Remove Reviewer</FONT></A>]</FONT></TD>
				<TD <%=tempBool ? bgcolorW : bgcolorG%>><A HREF="/servlet/Review360LightController?action=showReviewSummary&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&encRevID=<%=myR360.get("Review360Id")%>"><%=fontB1%>Individual<BR>Summary</FONT></A></TD>
			</TR>

<%
		counterIn ++;
		counter2 ++;
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
			<TD <%=bgcolorW%> COLSPAN="2" ALIGN="CENTER"><%=fontB%>[<A HREF="/servlet/Review360LightController?action=addReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=listAdminSessions"><%=fontB%>Add Staff Reviewer</FONT></A>]<br />[<A HREF="/servlet/Review360LightController?action=addNonStaffReviewer&reviewSessionLightId=<%=mySession.get("reviewSessionLightId")%>&returnAction=listAdminSessions"><%=fontB%>Add Non-Staff Reviewer</FONT></A>]</FONT></TD>
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

<%
			counter++;
	} // alist.hasNext while end


	} else { // alist.hasNext if else
%>
	<TR>
		<TD>
			<%=fontB3%><B>There are no Review Lights for you to administrate.<P></B></FONT>
		</TD>
	</TR>
	<TR>
        <TD>
			<%=fontB%>
			<B><%=fontB%>Administration Help</FONT></B>
			<UL>
			<LI>To start a new review process, choose <U>Start a new 360 Light</U> in the <B>360 Tools</B> section at the left.</FONT>
			</UL>
		</TD>
    </TR>
<%
	}} // llist.hasNext if end
%>
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
<FORM ACTION="/servlet/Review360Controller" METHOD="get" NAME="deleteForm">
	<INPUT TYPE="hidden" NAME="action">
	<INPUT TYPE="hidden" NAME="reviewSessionId">
	<INPUT TYPE="hidden" NAME="encRevId">
	<INPUT TYPE="hidden" NAME="lastAction">
</FORM>

<FORM ACTION="/servlet/Review360LightController" METHOD="get" NAME="deleteLightForm">
	<INPUT TYPE="hidden" NAME="action">
	<INPUT TYPE="hidden" NAME="reviewSessionLightId">
	<INPUT TYPE="hidden" NAME="encRevId">
	<INPUT TYPE="hidden" NAME="lastAction">
</FORM>

<%@ include file="/footer.jspf" %>
</HTML>