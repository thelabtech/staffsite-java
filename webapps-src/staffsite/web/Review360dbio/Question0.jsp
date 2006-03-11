<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>

<%@ page import="org.alt60m.html.*" %>
<HTML>
<HEAD>
<TITLE>Campus Staff Site - Review 360</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function validate(what) {
		if (what.value.length > 2048) {
			alert("You've reached the max size for this field!");
			what.value = what.value.substring(0,2048);
			return false;
		}
		else{
			return true;
		}
	}
// -->
</SCRIPT>
</HEAD>
<% int curr_tab = 3; %>
<% String pageTitle ="Review360"; %>
<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy"); %>
<%@ include file="rev_header_no_auth.jspf" %>
<%
	ActionResults tub;
	tub = ActionResults.getActionResults(session);
	Hashtable my360 = (Hashtable) tub.getHashtable("Review360");
	Hashtable mySession = (Hashtable) tub.getHashtable("ReviewSession");
%>
<%@ include file="questionsInclude.jspf" %>
<%@ include file="questionsComplete.jspf" %>
<%  QuestionHelper qh = new QuestionHelper(rName); %>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" <%=bgcolorW%>> <!--Whole page table-->
    <TR>
        <TD <%=bgcolorW%> VALIGN="BOTTOM" COLSPAN="5"><IMG SRC="/images/360logo.gif" BORDER="0">&nbsp;<%=fontB5%><B>Your Review of <%=rName%></B></FONT></TD>
	</TR>
	<TR>
		<TD <%=bgcolorB%> COLSPAN="5"><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="616" BORDER="0"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="140" BORDER="0"></TD>
		<TD><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="10" BORDER="0"></TD>
		<TD></TD>
		<TD><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="10" BORDER="0"></TD>
		<TD><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="140" BORDER="0"></TD>
	</TR>
	<TR>
		<TD WIDTH="140" VALIGN="TOP">
			<% box.setStyle(boxStyle);	//will set it for all the following boxes until we call it again%>
			<% box.setColor(color7);%>
			<% box.setBodyColor(color7);%>
			<BR>
			<% box.setTitle("My 360 Info");	%>
			<%=box.printTop()%>
			
			<%=fontB1%>Sections remaining: <%=fontR1%><%=notComplete%></FONT></FONT><BR>
			<%=fontB1%>Sections complete: <%=fontR1%><%=21 - notComplete%></FONT></FONT><BR>
			<A href="JavaScript: popupWindow('/help/help_360_review.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><%=fontB1%>Help</font></A>
			<%=box.printBottom()%>
			<BR>

		</TD>			
		<TD WIDTH="10"></TD>
		<TD VALIGN="TOP" WIDTH="616">
		<BR>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0"> <!-- Big frame inside table-->
	<TR>
		<TD ALIGN="CENTER">
		<% box.setTableInside(true); %>
		<% box.setTitle("Personal Information");%>
		<%=box.printTop()%>
		<SCRIPT LANGUAGE="JavaScript">
		<!--
			function goTo(section) {
				if (section == 99) {
					submitForm.action.value = "saveReview360";
				} else if (section == 22) {
					submitForm.action.value = "commitReview360";
				}
				submitForm.FillOutSection.value = section;
				document.submitForm.submit();
			}
		-->
		</SCRIPT>
		<FORM METHOD="POST" ACTION="/servlet/Review360Controller?review360Id=<%=my360.get("Review360Id")%>" NAME="submitForm">
			<INPUT TYPE="HIDDEN" NAME="FillOutSection" VALUE="0">
			<INPUT TYPE="HIDDEN" NAME="action" VALUE="editReview360Question">
			<TR>
				<TD <%=bgcolorG%>><%=fontB%>Current Position</FONT></TD>
				<TD <%=bgcolorG%> COLSPAN="3"><INPUT NAME="CurrentPosition" SIZE="50" MAXLENGTH="120" VALUE="<%=(String)my360.get("CurrentPosition")%>"></TD>
			</TR>
			<TR>
				<TD <%=bgcolorG%>><%=fontB%>Leadership Level</FONT></TD>
				<TD <%=bgcolorG%> COLSPAN="3">
				<SELECT NAME="LeadershipLevel" VALUE="<%=(String)my360.get("LeadershipLevel")%>">
					<OPTION VALUE="<%=my360.get("LeadershipLevel")%>"><%=(String)my360.get("LeadershipLevel")%></OPTION>
					<OPTION>--------------------</OPTION>
					<OPTION VALUE="National">National</OPTION>
					<OPTION VALUE="Regional Director">Regional Director</OPTION>
					<OPTION VALUE="Regional Team Associate">Regional Team Associate</OPTION>
					<OPTION VALUE="Local Leader">Local Leader</OPTION>
					<OPTION VALUE="Senior Staff">Senior Staff</OPTION>
					<OPTION VALUE="New Staff">New Staff</OPTION>
				</SELECT>
				</TD>
			</TR>
			<TR>
				<TD <%=bgcolorG%>><%=fontB%>Relationship to <%=rName%></FONT></TD>
				<TD <%=bgcolorG%> COLSPAN="3"><INPUT NAME="Relationship" SIZE="50" MAXLENGTH="120" VALUE="<%=(String)my360.get("Relationship")%>"></TD>
			</TR>
			<TR>
				<TD <%=bgcolorG%> COLSPAN="4">
					<%=fontB%>
					<B>When filling out the questions for this 360 remember the following:</B>
					<UL>
					<LI>You will be asked to either comment or rate the applicant in four areas (relationships, responsibilities, roles, and professionalism).
					<LI>When rating, please keep in mind that an average mark would be the average for a person in a comparable position of leadership.
					</FONT>
				</TD>
			</TR>
			<TR>
				<TD <%=bgcolorG%> ALIGN="LEFT" VALIGN="TOP">&nbsp;</TD>
				<TD <%=bgcolorG%> ALIGN="CENTER" VALIGN="TOP"><A HREF="JavaScript: goTo(99)" onMouseOver="document.finishlaterbutton.src='/images/finishlater_bon.gif';" onMouseOut="document.finishlaterbutton.src='/images/finishlater_boff.gif';"><IMG NAME="finishlaterbutton" SRC="/images/finishlater_boff.gif" BORDER="0" ALIGN="TOP"></A><%
				if(notComplete == 0){
%>		
				<A HREF="JavaScript: goTo(22)" onMouseOver="document.donebutton.src='/images/done_bon.gif';" onMouseOut="document.donebutton.src='/images/done_boff.gif';"><IMG NAME="donebutton" SRC="/images/done_boff.gif" BORDER="0" ALIGN="TOP"></A><% } %><BR><%=fontB1%>(Saves and exits 360 Review Tool)</font></TD>
				<TD <%=bgcolorG%> ALIGN="RIGHT" VALIGN="TOP"><A HREF="JavaScript: goTo(1)" onMouseOver="document.nextbutton.src='/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/images/next_boff.gif';"><IMG NAME="nextbutton" SRC="/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A><BR><%=fontB1%>(Saves and goes to<BR> next question)</font></TD>
			</TR>
		</FORM>
		<%=box.printBottom()%>
		<P>
		<% box.setTableInside(false);%>
		<% box.setTitle("Your Review of " + (String)tub.getValue("Reviewee"));%>
		<%=box.printTop()%>
			<TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="1">
			<TR>
				<TD ALIGN="RIGHT" <%=bgcolorG%> WIDTH="25%"><%=fontB%>Review Name</FONT></TD>
				<TD <%=bgcolorW%> WIDTH="25%"><%=fontB%><%=(String)mySession.get("Name")%></FONT></TD>
				<TD ALIGN="RIGHT" <%=bgcolorG%> WIDTH="25%"><%=fontB%>Date Review Started</FONT></TD>
				<TD <%=bgcolorW%> WIDTH="25%"><%=fontB%><%=dateFormatter.format((Date)mySession.get("DateStarted"))%></TD>
			</TR>
			<TR>
				<TD ALIGN="RIGHT" <%=bgcolorG%> WIDTH="20%"><%=fontB%>Review Requested By</FONT></TD>
				<TD <%=bgcolorW%>><%=fontB%><%=(String)tub.getValue("RequestedBy")%></FONT></TD>
				<TD ALIGN="RIGHT" <%=bgcolorG%> WIDTH="20%"><%=fontB%>Date Review Due</FONT></TD>
				<TD <%=bgcolorW%>><%=fontB%><%=dateFormatter.format((Date)mySession.get("DateDue"))%></TD>
			</TR>
			<TR>
				<TD ALIGN="RIGHT" <%=bgcolorG%> WIDTH="20%"><%=fontB%>Purpose</FONT></TD>
				<TD <%=bgcolorW%> COLSPAN="3"><%=fontB%><%=(String)mySession.get("Purpose")%></TD>
			</TR>
			</TABLE>
		<%=box.printBottom()%>

	</TABLE><!-- Big inside table close-->
		<BR>
		</TD>
		<TD WIDTH="10"></TD>
		<TD WIDTH="140" VALIGN="TOP">
			<% box.setStyle(boxStyle);	//will set it for all the following boxes until we call it again%>
			<% box.setColor(color7);%>
			<% box.setWidth("100%");%>
			<% box.setBodyColor(color7);%>
			<BR>
			<%@ include file="questionBox.jspf" %>
		</TD>
	</TR>
	<TR>
		<TD <%=bgcolorB%> COLSPAN="5"><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="616" BORDER="0"></TD>
	</TR>
</TABLE><!--whole page table close-->
<BR>
<%@ include file="/footer.jspf" %>
</HTML>