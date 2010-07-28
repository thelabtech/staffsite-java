<%@ include file="/modules/layout/header.jspf"%>

				<%if(module.equals("campus")||module.equals("location")){%>
				<%@ include file="/modules/edit/_edit_campus.jspf" %>
				<% }else if(module.equals("team")){%>
				<%@ include file="/modules/edit/_edit_team.jspf" %>
				<%} %>
			<%if(session.getValue("confirm")!=null){ %>
				<%@ include file="/modules/layout/_confirm.jspf" %>
				<% session.putValue("confirm",null); %>
				<%} %>
<br/><br/>
Welcome to the <%=moduleUrl %> Home page. <br>
<%@ include file="/modules/home/_ministry_home_options.jspf"%>
<%@ include file="/modules/layout/footer.jspf"%>