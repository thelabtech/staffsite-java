<%@ include file="/modules/header.jspf"%>

				<%if(module.equals("campus")||module.equals("location")){%>
				<%@ include file="/modules/_edit_campus.jspf" %>
				<% }else if(module.equals("team")){%>
				<%@ include file="/modules/_edit_team.jspf" %>
				<%} %>
			<%if(session.getValue("confirm")!=null){ %>
				<%@ include file="/modules/_confirm.jspf" %>
				<% session.putValue("confirm",null); %>
				<%} %>
Welcome to the <%=moduleUrl %> Home page. Everything else works pretty good.<br>
<%@ include file="/modules/_ministry_home_options.jspf"%>
<%@ include file="/modules/footer.jspf"%>