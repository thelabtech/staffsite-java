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
<%
	if(((String)profile.get("AccountNo")).equals("")){
%>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="0"> <!-- Big frame inside table-->
	<TR>
		<TD <%=bgcolorW%>>
		<%=fontR3%><B>Warning</B></FONT>
		<P>
		<%=fontB%>
		Our records show that you do not have your account number associated with your login.<BR>
		The 360 Review tool needs an account number to function correctly.<BR>
		Please send an email containing your login name and your account number to <A HREF="mailto: help@campuscrusadeforchrist.com?subject=360%20Review%20Account%20Number%20not%20associated"><%=fontR%>help@campuscrusadeforchrist.com</FONT></A>
		</FONT>
		</TD>
	</TR>
<%
	} else {
%>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0"> <!--Big frame inside table-->
	<TR>
		<TD>
			<TR>
				<TD COLSPAN="4">
					<%=fontB%>

	<!--/Review360/servlet/Review360Controller?action=editReview360&review360Id="<-->
<%
	if ((!rlist.hasNext()) && (!llist.hasNext())) {
%>
		Welcome, <%=profile.get("FirstName")%>. You currently have no 360s to fill out.
		<P>
		If someone requested that you fill out a 360 on staff.uscm.org, there is a problem. Please click on the Help link in the 360 Tools section located in the upper left of this page and follow the instructions for your specific situation.
<%
	} else {
%>
		You have been requested to fill out a 360 review for the following people.
		<P>
		Click on the corresponding name below to fill out a review for that person.
		<P>
		<CENTER>
		<% 
			box.setSubSpace("0");
			box.setWidth("95%");
			box.setTitle("360 Reviews you need to fill out on other people");
			box.setSubPad("0");
			box.setSubSpace("1");

		%>

		<%=box.printTop()%>
		<TABLE WIDTH="100%" BORDER="0" CELLPADDING="3" CELLSPACING="1">
			<TR>
				<TD <%=bgcolorG%>><%=fontB%><B>Review For</B></FONT></TD>
				<TD <%=bgcolorG%>><%=fontB%><B>Review Title</B></FONT></TD>
				<TD <%=bgcolorG%>><%=fontB%><B>Date Started</B></FONT></TD>
				<TD <%=bgcolorG%>><%=fontB%><B>Date Due</B></FONT></TD>
				<TD <%=bgcolorG%>><%=fontB%><B>Type</B></FONT></TD>
			</TR>
<%
			int counter = 0;
			while(rlist.hasNext()){
				Hashtable my360 = (Hashtable)rlist.next();
				boolean tempBool = false;
				if(counter % 2 == 0) tempBool = true;
%>
				<TR>
					<!-- old URL without encoding
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A HREF="/servlet/Review360Controller?action=editReview360&review360Id=<%=my360.get("review360ID")%>"><%=my360.get("ReviewFor")%></A></TD>
					-->
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A TARGET='_blank' HREF="/servlet/Review360Controller?action=revFormEncEdit&encRevID=<%=my360.get("review360Id")%>"><%=my360.get("ReviewFor")%></A></TD>
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=my360.get("Title")%></TD>
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=dateFormatter.format((Date)my360.get("StartDate"))%></TD>
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><% if(my360.get("DueDate") != null) { %><%= dateFormatter.format((Date)my360.get("DueDate")) %><% } %></TD>
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%>Full</TD>
				</TR>
<%
				counter++;
			}

			while(llist.hasNext()){
				Hashtable my360 = (Hashtable)llist.next();
				boolean tempBool = false;
				if(counter % 2 == 0) tempBool = true;
%>
				<TR>
					<!--
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A HREF="/servlet/Review360LightController?action=editReview360&review360LightId=<%=my360.get("review360LightId")%>"><%=my360.get("ReviewFor")%></A></TD>
					-->
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><A TARGET='_blank' HREF="/servlet/Review360LightController?action=revFormEncEdit&encRevID=<%=my360.get("review360LightId")%>"><%=my360.get("ReviewFor")%></A></TD>
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=my360.get("Title")%></TD>
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><%=dateFormatter.format((Date)my360.get("StartDate"))%></TD>
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%><% if(my360.get("DueDate") != null) { %><%= dateFormatter.format((Date)my360.get("DueDate")) %><% } %></TD>
					<TD <%=tempBool ? bgcolorW : bgcolorG%>><%=fontB%>Light</TD>
				</TR>
<%
				counter++;
			}

%>
		</TABLE>
		<%=box.printBottom()%>

<%
	} // rlist check closing if Brace
%>

<%
	} // accountNo check closing if Brace
%>
		<P>
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
