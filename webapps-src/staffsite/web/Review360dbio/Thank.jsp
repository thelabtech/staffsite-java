<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>

<HTML> 
<HEAD>
<TITLE>Campus Staff Site - Review 360</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
</HEAD>
<% int curr_tab = 3; %>
<% String pageTitle ="Review360"; %>
<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy"); %>
<%@ include file="/headersmall.jspf" %>
<% 
	ActionResults tub = ActionResults.getActionResults(session);
	out.print("<!-- " + tub.toHTML() + "-->");
	String lightAdmin = tub.getValue("LightAdmin");

	Vector rV = (Vector) tub.getCollection("AssignmentList");
	Vector lV = (Vector) tub.getCollection("AssignmentListLight");
	Iterator rlist = rV.iterator(); //Reviews list
	Iterator llist = lV.iterator();
%>

<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" <%=bgcolorW%>> <!--Whole page table-->
    <TR>
        <TD <%=bgcolorW%> VALIGN="BOTTOM" COLSPAN="3"><IMG SRC="/images/360logo.gif" BORDER="0">&nbsp;<%=fontB5%><B>360 home</B></FONT></TD>
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
			<A HREF="/servlet/Review360Controller?action=showHistory"><%=fontB1%>My Review History</FONT></A><BR>
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
		<TD <%=bgcolorW%>>
		<%=fontB%>
		Thank you for completing your 360 Review!
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
<BR>
<%@ include file="/footer.jspf" %>
</HTML>
