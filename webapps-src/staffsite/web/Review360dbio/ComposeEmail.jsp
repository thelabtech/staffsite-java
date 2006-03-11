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
	var field = form.bodytext;
	var name = form.to;
	if (field.value == "") {
		alert("You must enter something.");
		field.focus();
	} else if (name.value == "") {
		alert("You must enter an e-mail address.");
		name.focus();
	} else {
		form.submit();
	}
}
// -->
</SCRIPT>
</HEAD>
<% int curr_tab = 3; %>
<% String pageTitle ="Review360"; %>
<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy"); %>
<%@ include file="/headersmall.jspf" %>
<%
	ActionResults tub;
	tub = ActionResults.getActionResults(session);
	System.out.print(tub.toHTML());

// Make email addy list
	String strTo = "";
	if(tub.getValue("to")!=null)
	{
		strTo= tub.getValue("to");
	}
	else
	{
		if(request.getParameter("to") != null){
		int emailsNotFound = 0;
		String[] strA = request.getParameterValues("to");
		for(int i = 0; i < strA.length; i++){
			if( strA[i].length() != 0 ) {
				if( strTo.length() != 0 ) {
					strTo += ", ";
				}
				strTo += strA[i];
			}
			else {
				emailsNotFound++;
			}
		}
		if (emailsNotFound != 0) {
%>
				<SCRIPT LANGUAGE="JavaScript">
				alert("Could not find an email address for "+<%=emailsNotFound%>+" of the reviewers.");
				</SCRIPT>
<%
			}
		}
	}
	String strSubject = "360 Review for ";
	String strFrom= tub.getValue("RequestedByEmail");
	if(tub.getValue("from")!= null)
		strFrom= tub.getValue("from");
	strSubject = strSubject + tub.getValue("ReviewFor") + " - '" + tub.getValue("Title") + "'";
	if(tub.getValue("subject")!= null)
		strSubject= tub.getValue("subject");
	
	/*	String isMaleStr = tub.getValue("isMale");
	String hisHer = "their";
	if ( !isMaleStr.equals("") ) {
		Boolean isMale = new Boolean(isMaleStr);
		if (isMale.booleanValue()) {
			hisHer = "his";
		}
		else {
			hisHer = "her";
		}
	}
*/
	Boolean isMale = new Boolean(tub.getValue("isMale"));
	String hisHer = isMale.booleanValue() ? "his" : "her";
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
	<% box.setTitle("Send an email"); %>
	<% box.setTableInside(true); %>
	<%=box.printTop()%>
	<FORM ACTION="/servlet/Review360Controller?action=sendEmail" METHOD="POST" NAME="submitForm">
	<TR>
		<TD <%=bgcolorG%> WIDTH="20%" ALIGN="RIGHT"><%=fontB%>To</FONT></TD>
		<TD <%=bgcolorG%> WIDTH="80%"><INPUT TYPE="text" NAME="to" SIZE="50"  VALUE="<%=strTo%>" ></TD>
	</TR>
	<TR>
		<TD <%=bgcolorG%> WIDTH="20%" ALIGN="RIGHT"><%=fontB%>Subject</FONT></TD>
		<TD <%=bgcolorG%> WIDTH="80%"><INPUT TYPE="text" NAME="subject" SIZE="50"  VALUE="<%=strSubject%>" ></TD>
	</TR>
	<TR>
		<TD <%=bgcolorG%> WIDTH="20%" ALIGN="RIGHT"><%=fontB%>From</FONT></TD>
		<TD <%=bgcolorG%> WIDTH="80%"><%=fontB%><%=strFrom%></FONT></TD>
		<INPUT TYPE="hidden" NAME="from" VALUE="<%=strFrom%>">
		<INPUT TYPE="hidden" NAME="reviewSessionId" VALUE="<%=request.getParameter("reviewSessionId")%>">
		
		<INPUT TYPE="hidden" NAME="lastAction" VALUE="<%=tub.getValue("lastAction")%>">
	</TR>
	<TR>
		<TD <%=bgcolorG%> WIDTH="100%" COLSPAN="2" ALIGN="CENTER">
		<TEXTAREA NAME="bodytext" COLS="70" ROWS="24" WRAP="virtual">
<%
if(tub.getValue("bodytext")!=null)
{
%>
<%=tub.getValue("bodytext")%>
<%
} 
else
{
%>		
Greetings!
<%="\n"%>
I want to thank you for your leadership and contribution to the mission God has given us. It is an exciting time to be involved in the Campus Ministry. Students' lives are being changed around the world. One of the greatest encouragements is His work in our lives, which is why I'm writing you and seeking your help. 
<%="\n"%>
It is our desire in the Campus Ministry to foster a "feedback rich" environment where all of us are getting regular input and feedback. In light of this I would greatly appreciate your filling out the review for <%=tub.getValue("ReviewFor")%>. This will be an important piece in <%= hisHer %> ongoing development and growth. Your review will be kept confidential, and I would really appreciate your honest input.
<%="\n"%>
All you need to do is go to the staff site, click on the tools section, click 360 Review, and fill out the online form (a shortcut is provided below). If you could do this before <%=tub.getValue("DueDate")%>, I would appreciate it.
<%="\n"%>
In His grace,
<%=tub.getValue("RequestedByName") + "\n"%>
<%="\n"%>
https://staff.campuscrusadeforchrist.com
<%
}
%>

</TEXTAREA>
		</TD>
	</TR>
	<TR>
		<TD ALIGN="LEFT" VALIGN="CENTER" <%=bgcolorG%>><A HREF="/servlet/Review360Controller?action=listAdminSessions" onMouseOver="document.cancelbutton.src='/images/cancel_bon.gif';" onMouseOut="document.cancelbutton.src='/images/cancel_boff.gif';"><IMG NAME="cancelbutton" SRC="/images/cancel_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
		<TD ALIGN="RIGHT" VALIGN="CENTER" <%=bgcolorG%>><A HREF="JavaScript: valid(document.submitForm)" onMouseOver="document.nextbutton.src='/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/images/next_boff.gif';"><IMG NAME="nextbutton" SRC="/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A></TD>
	</TR>
	<%=box.printBottom()%>

</FORM>
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