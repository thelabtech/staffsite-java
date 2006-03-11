<%@ page import="java.util.*, org.alt60m.html.*, org.alt60m.servlet.*" %>


<%
	ActionResults results = ActionResults.getActionResults(session);
	
	String section = results.getValue("section");
	String username = results.getValue("username");
	String password = results.getValue("password");

	String psAccount = results.getValue("psaccountno");
	String psPassword = results.getValue("pspassword");

	String refreshURL;

	// Has StaffWeb username & password
	if (username != null && password != null) {

		if (section != null) {
			if (!section.equals("PFormFrame")) {
				refreshURL = "https://" + username + ":" + password + "@staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../" + section;
			
				if (psAccount != null && psPassword != null)

					refreshURL += "&" + URLEncoder.encode("Username", true) + "=" +URLEncoder.encode(psAccount, true) + "&" + URLEncoder.encode("Password", true)+"="+URLEncoder.encode(psPassword, true);
			} else {
				refreshURL = "https://" + username + ":" + password + "@staff2.ccci.org/ss/pages/PFormFrame.html";
			
				if (psAccount != null && psPassword != null)

					refreshURL += "?" + URLEncoder.encode("Username", true) + "=" +URLEncoder.encode(psAccount, true) + "&" + URLEncoder.encode("Password", true)+"="+URLEncoder.encode(psPassword, true);
			}
		} else {
		
			refreshURL = "https://" + username + ":" + password + "@staff.ccci.org/ps/index.html";
		}
	// No nothing - just go to normal login
	} else {
		refreshURL = "https://staffweb.ccci.org";
	}

%>

<HTML>
<HEAD>

<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="Tue, 04 Dec 1993 21:29:02 GMT">

<% 
	out.print("<META http-equiv=\"refresh\" content=\"0; URL=" + refreshURL + "\">");
%>

</HEAD>
</HTML>

		