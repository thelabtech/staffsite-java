<% String pageTitle = "Campus Crusade for Christ - User Account Password Management"; %>
<%@ include file="/general/header.jspf" %>
<% String loginPage = ar.getValue("loginPage"); %>
<%if(((String)(session.getAttribute("from_secure_site"))+"").equals("true")){ %>
Your work here is done. Please close this window.
<%}else{ %>
Click <a href="<%=loginPage %>">here</a> to continue.
<%} %>

<%@ include file="/general/footer.jspf" %>
