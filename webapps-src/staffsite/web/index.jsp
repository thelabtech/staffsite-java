<% 
	//out.println("hello?");
	if (session.getValue("loggedIn")!=null){
		response.sendRedirect("/servlet/StaffController?action=showHome"); 
	}
	else{
		response.sendRedirect("/servlet/StaffController"); 
	}
%>