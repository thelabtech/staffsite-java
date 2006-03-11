<%@ page import = "java.util.*, org.alt60m.linczone.LinczoneProcessor" %>
<%
	final String VIEW_OK  = "/linczone/linczone_thankyou.jsp";
	final String VIEW_ERR = "/linczone/linczone_error.jsp";
	
	// get full path to properties file
	String propFile = getServletContext().getRealPath("/WEB-INF/linczone.properties");

	try {

		Map hashedRequest = request.getParameterMap();

		//System.out.println(hashedRequest);
		//String[] ministryInfo = request.getParameterValues("ministries");

		// Enter the contact
		LinczoneProcessor lp = new LinczoneProcessor(propFile, getServletContext().getRealPath("/"));
		lp.enterNewContact(hashedRequest);
		
		// redirect to success page
		getServletContext().getRequestDispatcher(VIEW_OK).forward(request, response);

	} catch (Exception e) {
		
		e.printStackTrace();
		System.out.println(e);
		
		// redirect to error page
		getServletContext().getRequestDispatcher(VIEW_ERR).forward(request, response);
	
	}

%>






