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
	var field = form.name;  
	if (field.value == "") {
		alert("You must enter something.");
		field.focus();
	} else if (field.value.length < 2) {
		alert("You must enter at least 2 characters of someone's name");
		field.focus();
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
<%
	if(!tub.isEmpty()){
		Vector sV = (Vector) tub.getCollection("StaffList");
		Iterator slist = sV.iterator(); // Staff list
%>
	<TR>
		<TD>
<% 
		box.setTitle("Your search returned " + sV.size() + " results (Click their name to continue)");
		box.setWidth("85%");
		box.setTableInside(true);
%>
		<%=box.printTop()%>
<%
		int counter = 1;
		while (slist.hasNext()) {
			counter++;
			Hashtable myStaff = (Hashtable)slist.next();
			boolean tempBool = true;
			if(counter%2 == 0) tempBool = false;
%>
		<TR>
			<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%>
			<A HREF="/servlet/Review360LightController?action=associateReviewer&reviewSessionLightId=<%=request.getParameter("reviewSessionLightId")%>&reviewerId=<%=myStaff.get("AccountNo")%>&returnAction=<%=request.getParameter("returnAction")%>"><%=fontB%><%=myStaff.get("PreferredName")%>&nbsp;<%=myStaff.get("LastName")%></A>&nbsp;(<%=myStaff.get("Address1")%>, <%=myStaff.get("City")%>, <%=myStaff.get("State")%>, <%=myStaff.get("Zip")%>)</FONT>
			</TD>
		</TR>
<%
		}
%>
		<%=box.printBottom()%>
		</TD>
	</TR>
<%
	}
%>
	<TR>
		<TD>		
<% 
		box.setTitle("Search for Staff to Add");
		box.setWidth("85%");
		box.setTableInside(false);
%>
		<%=box.printTop()%>
		<FORM NAME="submitForm" METHOD="POST" ACTION="/servlet/Review360LightController?action=listStaff">
			<INPUT TYPE="hidden" NAME="lastAction" VALUE="addReviewer">
			<INPUT TYPE="hidden" NAME="returnAction" VALUE="<%=request.getParameter("returnAction")%>">
			<INPUT TYPE="hidden" NAME="reviewSessionLightId" VALUE="<%=request.getParameter("reviewSessionLightId")%>">
			<%=fontB%><B>Last</B> name: </FONT>
			<INPUT NAME="name" SIZE="40">
<%
			if(tub.isEmpty()){ // Only put the cursor in the input box if it's the first time
%>
			<SCRIPT LANGUAGE="JavaScript">
			<!--
				document.submitForm.name.focus();
				document.submitForm.name.blur();
				document.submitForm.name.select();
			// -->
			</SCRIPT>
<%
			}
%>
			<A HREF="JavaScript: valid(document.submitForm)" onMouseOver="document.nextbutton.src='/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/images/next_boff.gif';"><IMG NAME="nextbutton" SRC="/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A>
			<BLOCKQUOTE>
			<%=fontB%>To search for and select a staff member,<BR> enter 3 or more characters of their last name,<BR> then click "Next".  You will be given a list to choose from.</FONT>
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