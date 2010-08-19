<jsp:useBean id="email" class="org.alt60m.util.SendMessage" />
<jsp:useBean id="box" class="org.alt60m.html.Box"/>
<%@ page import="org.alt60m.staffSite.bean.PasswordValidator, java.util.*" %>

<%@ include file="/style.jspf"%>

	<%
	boolean ok = true;
	String msg = new String();
	if (request.getParameter("firstName") == null) {
		ok = false;
		msg = "You need to give us your first name so we know what to name your accounts.";
	}
	if (request.getParameter("lastName") == null) {
		ok = false;
		msg = "You need to give us your last name so we know what to name your accounts.";
	}
	if (request.getParameter("password")==null||request.getParameter("passwordConf")==null) {
		ok = false;
		msg = "You need to enter a password to keep unauthorized people from accessing your accounts.";	
	}

	String password = request.getParameter("password");
	List<String> pwError = PasswordValidator.validate(request.getParameter("password"), request.getParameter("passwordConf"));
	if(!pwError.isEmpty()) {
		ok = false;
		msg = pwError.toString();
	}

	if (request.getParameter("reason") == null) {
		ok = false;
		msg = "You need to give us the reason you need to access the site.";
	}
	if (request.getParameter("working_with").equals(" ")) {
		ok = false;
		msg = "You need to specify the staff member's name and email so we can verify your reason for needing to access the site.";
	}
	if ((request.getParameter("email") == null)&(request.getParameter("phone") == null)) {
		ok = false;
		msg = "You need to give us either your phone number or an e-mail address so we can contact you when we have your accounts set up.";
	}
	
	if (!ok) {
		box.setTitle("Oops");
		box.setWidth("400");
		box.setColor(colorL);
		box.setBodyColor(colorL);
		%>
		<br><br>
		<center>
		<%=box.printTop()%>
			<center>
			<%=fontB3%>
			<p><br><%=msg%><BR><br>
			Please <a href="javascript:history.go(-1)">go back</a> and fill in the info.</font></p>
			<br>
			</center>
		<%=box.printBottom()%>
		</center><p>
		<%
	} else {
		//String tech=new String();
		//tech = "help@campuscrusadeforchrist.com";
		email.setTo("help@campuscrusadeforchrist.com");
		//email.addTo(tech);
		email.setFrom(request.getParameter("email"));
//		email.setFrom("help@campuscrusadeforchrist.com");
		email.setSubject("Non CM Staff Website Account Request");
		StringBuffer s = new StringBuffer();
		s.append("user: "+request.getParameter("firstName")+"."+request.getParameter("lastName")+"\n");
		s.append("password: "+request.getParameter("password")+"\n");
		s.append("Reason for access: "+request.getParameter("reason")+"\n");
		s.append("staff Verifier: "+request.getParameter("working_with")+"\n");
		s.append("Notify email: "+request.getParameter("email")+"\n");
		s.append("Notify phone: "+request.getParameter("phone")+"\n");
		email.setBody(s.toString());
		email.send();
		box.setTitle("That's all!");
		box.setWidth("400");
		box.setColor(colorL);
		box.setBodyColor(colorL);
		%>
		<center><br><br>
		<%=box.printTop()%>
			<%=fontB3%>
			<center>
			<br>
			<%=fontB3%>Your request was sent <B>successfully</B> and will be considered promptly.
			Click <a href="javascript:window.close()">here</a> to close this window.<p>
			<br>
			</font></center>
		<%=box.printBottom()%>
		</center>
		<p>
		<%
	}
	%>