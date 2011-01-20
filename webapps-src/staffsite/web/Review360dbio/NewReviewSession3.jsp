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
			if (form.name.value == "") {
				alert("You must enter a Name for this 360");
				form.name.focus();
			}
			else {
				form.submit();
			}
		}

		function validate(what) {
			if (what.value.length > 255) {
				alert("You've reached the max size for this field!");
				what.value = what.value.substring(0,255);
				what.select();
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
<%@ include file="/headersmall.jspf" %>
<%
	ActionResults tub;
	tub = ActionResults.getActionResults(session);
%>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" <%=bgcolorW%>> <!--Whole page table-->
    <TR>
        <TD <%=bgcolorW%> VALIGN="BOTTOM" COLSPAN="3"><IMG SRC="/images/360logo.gif" BORDER="0">&nbsp;<%=fontB5%><B>This tool is changing. Go to <a href="http://pr.uscm.org">http://pr.uscm.org</a> to start a new Review</B></FONT></TD>
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
		<B><%=fontB%>Start a New 360 Process</FONT></B>
		<OL>
			<%=fontG%><LI>Select the person to be reviewed.</FONT>
			<%=fontG%><LI>Select the person who requested the review process for the above person.</FONT>
			<%=fontR%><LI>Enter review info like Purpose, Due Date, etc.</FONT>
			<%=fontG%><LI>Administrate the Review Process (in 4 areas).</FONT>
		</OL>
		</TD>
	</TR>
	<TR>
		<TD>		
<% 
		box.setTitle("Review Info: " + tub.getValue("ReviewFor"));
		box.setWidth("100%");
		box.setTableInside(true);
%>
		<%=box.printTop()%>
		<FORM NAME="submitForm" METHOD="POST" ACTION="/servlet/Review360Controller?action=saveReviewSession">
			<TR>
				<TD <%=bgcolorG%> ALIGN="RIGHT"><%=fontB%>Name for this 360</FONT></TD>
				<TD <%=bgcolorG%> ALIGN="LEFT"><INPUT NAME="name" MAXLENGTH="64" SIZE="50" VALUE="(i.e. Fall 2000)"></TD>
				<SCRIPT LANGUAGE="JavaScript">
				<!--
					document.submitForm.name.focus();
					document.submitForm.name.select();
				// -->
				</SCRIPT>

			</TR>
			<TR>
				<TD <%=bgcolorG%> ALIGN="RIGHT"><%=fontB%>360 Requested By</FONT></TD>
				<TD <%=bgcolorG%> ALIGN="LEFT"><%=fontB%><%=tub.getValue("RequestedByName")%>[<A HREF='/servlet/Review360Controller?action=newReviewSession&section=2&revieweeId=<%=request.getParameter("revieweeId")%>'>change</A>]</FONT></TD>
			</TR>
			<TR>
				<TD <%=bgcolorG%> ALIGN="RIGHT"><%=fontB%>360 Due Date</FONT></TD>
				<TD <%=bgcolorG%> ALIGN="LEFT">
					<INPUT TYPE="text" NAME="dateDue" SIZE="10" MAXLENGTH="10" onFocus="this.blur()" VALUE="<%=((today.get(Calendar.MONTH)+1)+"/"+today.get(Calendar.DATE)+"/"+today.get(Calendar.YEAR))%>">
					&nbsp;<%=fontB%>
					[<A HREF="javascript:pickdate(document.submitForm.dateDue)"><%=fontB%>select date</FONT></A>]</FONT>
				</TD>
			</TR>
			<TR>
				<TD <%=bgcolorG%> ALIGN="RIGHT" VALIGN="TOP"><%=fontB%>360 Purpose</FONT></TD>
				<TD <%=bgcolorG%> ALIGN="LEFT"><TEXTAREA NAME="purpose" ROWS="10" COLS="50" WRAP="VIRTUAL" onKeyUp="validate(this)"><% if(request.getParameter("summary") != null) out.print(request.getParameter("summary"));%></TEXTAREA></TD>
			</TR>
			<!-- Hidden form values -->
			<INPUT TYPE="hidden" NAME="revieweeId" VALUE="<%=request.getParameter("revieweeId")%>">
			<INPUT TYPE="hidden" NAME="requestedById" VALUE="<%=request.getParameter("requestedById")%>">
		</FORM>
			<TR>
				<TD <%=bgcolorG%> ALIGN="LEFT"><A HREF="/servlet/Review360Controller?action=listAdminSessions" onMouseOver="document.cancelbutton.src='/images/cancel_bon.gif';" onMouseOut="document.cancelbutton.src='/images/cancel_boff.gif';"><IMG NAME="cancelbutton" SRC="/images/cancel_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>        
				<TD <%=bgcolorG%> ALIGN="RIGHT"><A HREF="JavaScript: valid(document.submitForm)" onMouseOver="document.nextbutton.src='/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/images/next_boff.gif';"><IMG NAME="nextbutton" SRC="/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
			</TR>        
		<%=box.printBottom()%>
		</TD>
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