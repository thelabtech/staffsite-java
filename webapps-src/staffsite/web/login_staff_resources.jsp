<%@ page import="java.util.*, java.net.*, org.alt60m.servlet.*" %>


<%
	ActionResults results = ActionResults.getActionResults(session);

	String mode = results.getValue("mode");
	String staffwebpath = results.getValue("staffwebpath");
	
%>

<HTML>
<HEAD>

<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="Tue, 04 Dec 1993 21:29:02 GMT">
 
<% 
	if (mode.equals("staff")) {  // redirect staff to staff site
		//String refreshURL = "http://"+username + ":" + password + "@staff.campuscrusade.org";

		String username = results.getValue("username");
		String password = results.getValue("password");
		String refreshURL = username + ":" + password + "@staff.campuscrusade.org";

		if (staffwebpath.equals("")){
			out.print("<META http-equiv=\"refresh\" content=\"0; URL=http://" + refreshURL + "\">");
		}
		else if (staffwebpath.equals("mpdonline")){
			out.print("<META http-equiv=\"refresh\" content=\"0; URL=http://"+username + ":" + password + "@www.mpdonline.org\">");
		}
		else {
			out.print("<META http-equiv=\"refresh\" content=\"0; URL=https://" + refreshURL + "/" + staffwebpath +"\">");
		}
	}
	else {
		// non-staff
		out.print("The Staff Web is only available to Campus Crusade for Christ staff members. If you are on staff with Campus Crusade, please contact our <A HREF=\"mailto: help@campuscrusadeforchrist.com\">Customer Service Team</A> to update your profile.");
	}
%>

</HEAD>
</HTML>

		