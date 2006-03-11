<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Iterator emailTo = ar.getCollection("emailTo").iterator();
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	String pageTitle = "Email";
	String returnTo = ar.getValue("returnTo");
	String emailType = ar.getValue("emailType");
	String id = ar.getValue("id");
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.email;
		if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
		}
	}
-->
</SCRIPT>
<%@ include file="/crs/e_header.jspf"%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=conferenceMenu.display(3)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='email'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE="sendEmail"> <INPUT
			TYPE=hidden
			NAME="emailType"
			VALUE=<%=emailType%>> <INPUT
			TYPE=hidden
			NAME="returnTo"
			VALUE=<%=returnTo%>> <INPUT
			TYPE=hidden
			NAME="id"
			VALUE=<%=id%>>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Compose Email</TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					VALIGN="TOP"
					CLASS="hl"
					WIDTH="20%">To</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><% while (emailTo.hasNext()) {
				Person person = (Person)emailTo.next();
			%> <%=person.getFirstName()%> <%=person.getLastName()%>, <A
					HREF="mailto:<%=person.getEmail()%>"><%=person.getEmail()%></A><BR>
				<%
			}
			%></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					VALIGN="TOP"
					CLASS="hl"
					WIDTH="20%">Subject</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><INPUT
					SIZE="60"
					NAME="subject"
					VALUE="<%
				if (emailType.equals("incompleteRegistrants")) {
					%>Incomplete registration notice<%
				}
			%>"></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					VALIGN="TOP"
					CLASS="hl"
					WIDTH="20%">From</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell"><%=conference.getContactEmail()%></TD>
			</TR>
			<TR>
				<TD
					ALIGN="RIGHT"
					VALIGN="TOP"
					CLASS="hl"
					WIDTH="20%">Email</TD>
				<TD
					ALIGN="LEFT"
					CLASS="cell">Dear &lt;&lt;first name&gt;&gt;,
				<P><TEXTAREA
					COLS="60"
					ROWS="15"
					NAME="emailContent"
					CLASS="empty">According to our records, we have not yet received your pre-registration payment for <%=conference.getName()%>. If you plan to pay by credit card,  please log in to the online conference registration using the link at the end of this email. Make sure you have entered all your information and answered all questions before going on to the Make Payment page.  On that page, you may select "credit card" for your payment method, and then advance to the next page to enter your credit card information.&#13;&#13;If you plan to pay by check, please send us your check along with the printed payment information from your registration. If you need to re-print the payment information page, log in using the link below. Make sure you have entered all your information and answered all questions before going on to the Make Payment page.  On that page, select "mail a check" as your payment method, and then advance to the next page which you can print out and mail with your check.&#13;&#13;Even if you do not pre-register, you may still come to the conference. You will be required to pay the full conference cost upon arrival.&#13;&#13;Hope to see you soon!&#13;<%=conference.getContactName()%>&#13;<%=conference.getName()%> team</TEXTAREA><BR>
				A hyperlink to your conference's registration site will be included
				at the bottom of the email.
				</TD>
			</TR>
			<TR>
				<TD
					ALIGN="CENTER"
					CLASS="hl"
					WIDTH="20%"
					COLSPAN="2"><A
					HREF="javascript: goNext('sendEmail', 'send')"
					NAME="send"
					CLASS="button">Send</A></TD>
			</TR>
		</TABLE>
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">The text shown will be included in the message body
				of the email you send to each person who has not completed
				registration. You may edit this text to customize it as you desire.
				When you are satisfied with the email text, then click the button to
				send the email all those people who didn't complete the registration
				process.</TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf" %>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
