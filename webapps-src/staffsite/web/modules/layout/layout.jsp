
<%@ include file="/modules/layout/header.jspf"%>
	

		
				
				
				<%@ include file="/modules/layout/_info_box.jspf" %>	
				<%if(module.equals("campus")||module.equals("location")){%>
				<%@ include file="/modules/edit/_edit_campus.jspf" %>
				<%@ include file="/modules/edit/_edit_movement.jspf" %>
				<%@ include file="/modules/add/_add_contact.jspf" %>
				
				<% }else if(module.equals("team")){%>
				<%@ include file="/modules/edit/_edit_team.jspf" %>
				<%@ include file="/modules/add/_add_member.jspf" %>
				<%} %>
				<%@ include file="/modules/add/_add_person.jspf" %>
				<%if(session.getValue("confirm")!=null){ %>
				<%@ include file="/modules/layout/_confirm.jspf" %>
				<% session.putValue("confirm",null); %>
				<%} %>
				<%@ include file="/modules/layout/_content.jspf" %>
				
		


<%@ include file="/modules/layout/footer.jspf"%>