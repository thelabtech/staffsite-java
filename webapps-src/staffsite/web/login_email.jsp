<%@ page import="java.util.*, org.alt60m.html.*, org.alt60m.servlet.*" %>


<%
	ActionResults results = ActionResults.getActionResults(session);

	String username = results.getValue("username");
	String password = results.getValue("password");
	
	String refreshURL;

	// Has username
	if (username != null) {
		
		// Has password
		if (password != null)
			refreshURL = "https://" + username + ":" + URLEncoder.encode(password,false) + "@mymail.uscm.org/exchange/logonfrm.asp?isnewwindow=0&mailbox="+username;
		
		// Login name only (no password)
		else 
			refreshURL = "https://mymail.uscm.org/exchange/logonfrm.asp?isnewwindow=0&mailbox="+username;
	
	// No nothing - just go to normal login
	} else {
		refreshURL = "https://mymail.uscm.org";
	}

%>

<HTML>
<HEAD>

<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="Tue, 04 Dec 1993 21:29:02 GMT">

<% 
	out.print("<META http-equiv=\"refresh\" content=\"0; URL=" + refreshURL + "\">");

%>

<table height="100%" width ="100%">
	<tr height="*">
		<td width="100%">&nbsp;</td>
	</tr>
	<tr><td align="center">
		<font color=blue>Logging into the email server...
		</td>
	</tr>
	<tr height="*">
		<td>&nbsp;</td>
	</tr>
</table>
</HEAD>
</HTML>

		
