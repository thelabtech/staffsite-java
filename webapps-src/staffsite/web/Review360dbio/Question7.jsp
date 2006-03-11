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
		<% box.setTitle("II) Leadership Roles - Coach");%>
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
		// -->
		</SCRIPT>
		<FORM METHOD="POST" ACTION="/servlet/Review360Controller?review360Id=<%=my360.get("Review360Id")%>" NAME="submitForm">
			<INPUT TYPE="HIDDEN" NAME="FillOutSection" VALUE="0">
			<INPUT TYPE="HIDDEN" NAME="action" VALUE="editReview360Question">
			<%=qh.print360Q(q13, (String)my360.get("Q13"), "Q13")%>
			<%=qh.print360R(q14l ,q14r ,q14b ,"Q14", ((Integer)my360.get("Q14")).intValue())%>
			<TR>
				<TD <%=bgcolorG%> ALIGN="LEFT" VALIGN="TOP"><A HREF="JavaScript: goTo(6)" onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';"><IMG NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A><BR><%=fontB1%>(Saves and goes to<BR> prior question)</font></TD>
				<TD <%=bgcolorG%> ALIGN="CENTER" VALIGN="TOP"><A HREF="JavaScript: goTo(99)" onMouseOver="document.finishlaterbutton.src='/images/finishlater_bon.gif';" onMouseOut="document.finishlaterbutton.src='/images/finishlater_boff.gif';"><IMG NAME="finishlaterbutton" SRC="/images/finishlater_boff.gif" BORDER="0" ALIGN="TOP"></A><%
				if(notComplete == 0){
%>		
				<A HREF="JavaScript: goTo(22)" onMouseOver="document.donebutton.src='/images/done_bon.gif';" onMouseOut="document.donebutton.src='/images/done_boff.gif';"><IMG NAME="donebutton" SRC="/images/done_boff.gif" BORDER="0" ALIGN="TOP"></A><% } %><BR><%=fontB1%>(Saves and exits 360 Review Tool)</font></TD>
				<TD <%=bgcolorG%> ALIGN="RIGHT" VALIGN="TOP"><A HREF="JavaScript: goTo(8)" onMouseOver="document.nextbutton.src='/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/images/next_boff.gif';"><IMG NAME="nextbutton" SRC="/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A><BR><%=fontB1%>(Saves and goes to<BR> next question)</font></TD>
			</TR>
		</FORM>
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
