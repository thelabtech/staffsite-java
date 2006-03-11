<%@ page import="java.util.*" %>
<%
    if(!session.isNew()){
	    session.invalidate();
    }
	response.sendRedirect("/index.jsp");
%>