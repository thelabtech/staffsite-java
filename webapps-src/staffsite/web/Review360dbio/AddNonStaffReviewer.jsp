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
function valid(form) {
	if (form.firstName.value == "") {
			alert("You must enter a first name for the reviewer.");
			form.firstName.focus();
	} else if (form.lastName.value == "") {
			alert("You must enter a last name for the reviewer.");
			form.lastName.focus();
	//} else if (form.gender.value == "") {
	//	alert("You must indicate the reviewer's gender.");
	//	form.gender.focus();
	} else if (!validEmail(form.email.value)) {
		alert("You must enter a valid email address for the reviewer.");
		form.email.focus();
	} else {
		form.submit();
	}
}
// -->
</SCRIPT>
</HEAD>
<% int curr_tab = 3; %>
<% String pageTitle ="Review360"; %>
<%@ include file="/headersmall.jspf" %>
<%
	ActionResults tub;
	tub = ActionResults.getActionResults(session);
%>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" <%=bgcolorW%>> <!--Whole page table-->
    <TR>
        <TD <%=bgcolorW%> VALIGN="BOTTOM" COLSPAN="3"><IMG SRC="/images/360logo.gif" BORDER="0">&nbsp;<%=fontB5%><B>Add a Reviewer</B></FONT></TD>
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
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0"> <!-- Big frame inside table-->
	<TR>
		<TD>		
<% 
		box.setTitle("Add Non Staff Reviewer");
		box.setWidth("85%");
		box.setTableInside(false);
%>
		<%=box.printTop()%>
		<FORM NAME="submitForm" METHOD="POST" ACTION="/servlet/Review360Controller?action=createNonStaffReviewer">
			<INPUT TYPE="hidden" NAME="lastAction" VALUE="addNonStaffReviewer">
			<INPUT TYPE="hidden" NAME="returnAction" VALUE="<%=request.getParameter("returnAction")%>">
			<INPUT TYPE="hidden" NAME="reviewSessionId" VALUE="<%=request.getParameter("reviewSessionId")%>">
			
			<%=fontB%><B>Name</B> </FONT>
			<SELECT NAME="title">
					<OPTION></OPTION>
					<OPTION VALUE="Mr.">Mr.</OPTION>
					<OPTION VALUE="Mrs.">Mrs.</OPTION>
					<OPTION VALUE="Ms.">Ms.</OPTION>
					<OPTION VALUE="Dr.">Dr.</OPTION>
					<OPTION VALUE="Rev.">Rev.</OPTION>
			</SELECT>
			<%=fontB%><B>First</B> </FONT>
			
			<INPUT NAME="firstName" SIZE="20">
			
			<%=fontB%><B>Last</B> </FONT>
			
			<INPUT NAME="lastName" SIZE="20">

			<SCRIPT LANGUAGE="JavaScript">
			<!--
				document.submitForm.FirstName.focus();
				document.submitForm.FirstName.blur();
				document.submitForm.FirstName.select();
			// -->
			</SCRIPT>
			
			<!--
			<br /><br />
			<%=fontB%><B>Gender</B> </FONT>
			<SELECT NAME="gender">
					<OPTION></OPTION>
					<OPTION VALUE="M">M</OPTION>
					<OPTION VALUE="F">F</OPTION>
			</SELECT>(so we can send appropriate emails to him/her)
			-->
			
			<br /><br />
			<%=fontB%><B>Email</B> </FONT>
			<INPUT NAME="email" SIZE="30">
			
			<TABLE WIDTH="100%" colspan="2">
			<tr>
			<td width="75%">
			<BLOCKQUOTE>
			<br />
			<%=fontB%>To add a non-staff reviewer, enter his/her name and email address and click "next."  Be careful to enter the correct email address or the reviewer may not receive the email invitation.</FONT>
			</td>
			<td>
			<A HREF="JavaScript: valid(document.submitForm)" onMouseOver="document.nextbutton.src='/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/images/next_boff.gif';"><IMG NAME="nextbutton" SRC="/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A>
			</td>
			</tr>
			</TABLE>
			
			<%=box.printBottom()%>
		</TD>
		</FORM>
    </TR>
	</TABLE><!-- Big inside table close-->

		</TD>
	</TR>
	<TR>
		<TD <%=bgcolorB%> COLSPAN="3"><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="616" BORDER="0"></TD>
	</TR>
</TABLE><!--whole page table close-->
<BR>
<%@ include file="/footer.jspf" %>
</HTML>