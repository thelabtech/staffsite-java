<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
<%@ include file="/validate.js" %>

<SCRIPT LANGUAGE="JavaScript"><!--
	function validate() {

		failed = false;
		errorMessage = "You cannot continue for the following reasons:\n";

		emptyCheck(document.emailForm.to,"You must enter the email address(es) this email is to be sent to.");
		emptyCheck(document.emailForm.subject,"You must enter the subject of the email.");
		emptyCheck(document.emailForm.bodytext,"There must be something in the body of the email.");
		
		if (isEmail(document.emailForm.from.value)) {}
		else {
			errorMessage = errorMessage + "\n" + "You must enter a valid email address of the sender.";
			failed = true;
		}

		if (failed) {
			alert(errorMessage);
			return false;
		} else {
			return true;
		}
	}
	
	// isEmail (STRING s [, BOOLEAN emptyOK])
	// 
	// Email address must be of form a@b.c -- in other words:
	// * there must be at least one character before the @
	// * there must be at least one character before and after the .
	// * the characters @ and . are both required
	//
	// For explanation of optional argument emptyOK,
	// see comments of function isInteger.

	function isEmail (s){  
		if (isWhitespace(s)) return false;
	    
		var i = 1;
		var sLength = s.length;

		while ((i < sLength) && (s.charAt(i) != "@"))   {
			i++;
		}

		if ((i >= sLength) || (s.charAt(i) != "@")) return false;
		else i += 2;

		while ((i < sLength) && (s.charAt(i) != ".")) {
			i++;
		}

		if ((i >= sLength - 1) || (s.charAt(i) != ".")) return false;
		else return true;
	}

	
	var whitespace = " \t\n\r";
	
	function isWhitespace (s)
	{   var i;

	    // Is s empty?
	    if (isEmpty(s)) return true;

	    // Search through string's characters one by one
	    // until we find a non-whitespace character.
	    // When we do, return false; if we don't, return true.

	    for (i = 0; i < s.length; i++)
	    {   
		// Check that current character isn't whitespace.
		var c = s.charAt(i);

		if (whitespace.indexOf(c) == -1) return false;
	   }

	    // All characters are whitespace.
	    return true;
	}

	//-->
</SCRIPT>

</HEAD>

<% String pageTitle = "Compose Email"; %>

<%@ include file="wsnspheader.jspf" %>

<p>
<table width='100%' border='0'>
<TR VALIGN=TOP>
	<td> &nbsp; </td>
	<td> <%=fontTextXL%>Compose Email</font> </TD>
	<td> &nbsp; </td>

</tr>
<TR VALIGN=TOP>
	<td>
		&nbsp;
	</TD>
	<td>
	<FORM ACTION="/servlet/WsnSpController?action=sendEmail" METHOD="POST" NAME="emailForm"  onSubmit="return validate()">
	<INPUT TYPE=hidden NAME="frompage" VALUE="<%=request.getParameter("fromPage")%>" >
	<INPUT TYPE=hidden NAME="view" VALUE="<%=request.getParameter("view")%>" >
	<%if (request.getParameter("fromPage").equals("showTeam")) {
		%><INPUT TYPE=hidden NAME="id" VALUE="<%=request.getParameter("id")%>" ><%
	}%>
		<table>
		<TR>
			<TD WIDTH="20%" ALIGN="RIGHT"><%=font%>To</FONT></TD>
			<TD WIDTH="80%"><TEXTAREA NAME="to" TYPE="text" COLS="70" ROWS="3" WRAP="virtual"><% if (h.get("emailList") != null) {%><%=h.get("emailList")%><%} else if (request.getParameter("EmailList") != null) {%><%=request.getParameter("EmailList")%><%}%> </TEXTAREA></TD>
		</TR>
		<TR>
			<TD WIDTH="20%" ALIGN="RIGHT"><%=font%>Subject</FONT></TD>
			<TD WIDTH="80%"><INPUT TYPE="text" NAME="subject" SIZE="50"  VALUE="" ></TD>
		</TR>
		<TR>
			<TD WIDTH="20%" ALIGN="RIGHT"><%=font%>From</FONT></TD>
			<TD WIDTH="80%"><INPUT TYPE="text" NAME="from" SIZE="50"  VALUE="" ><br>
					<%=fontS%>Note: a copy of the email will be sent to this address</FONT></TD>
		</TR>
		<TR>
			<TD WIDTH="100%" COLSPAN="2" ALIGN="CENTER">
			<TEXTAREA NAME="bodytext" COLS="70" ROWS="24" WRAP="virtual"></TEXTAREA>
			</TD>
		</TR>
		<TR>
			<TD ALIGN="LEFT" VALIGN="CENTER"><!--<A HREF="/servlet/Review360Controller?action=listAdminSessions" onMouseOver="document.cancelbutton.src='/images/cancel_bon.gif';" onMouseOut="document.cancelbutton.src='/images/cancel_boff.gif';"><IMG NAME="cancelbutton" SRC="/images/cancel_boff.gif" BORDER="0" ALIGN="TOP"></A>--></TD>   <% //this was copied from the review 360 email page.  we may want to add in a cancel button later %>
			<TD ALIGN="RIGHT" VALIGN="CENTER"><input type='submit' value='Send Email'></TD>
		</TR>
		</table>
	</FORM>
	</td>
	<td>
		&nbsp;
	</td>
</tr>


</table>
<p> &nbsp;

<%@ include file="wsnspfooter.jspf" %>

</HTML>