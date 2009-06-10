
<%@ include file="/modules/header.jspf"%>
	

		
				
				<div id="info_box" >
					<%@ include file="/modules/_info_box.jspf" %>	
				</div><!-- info_box -->
				
		
				<%if(module.equals("campus")||module.equals("location")){%>
				<%@ include file="/modules/_edit_campus.jspf" %>
				<% }else if(module.equals("team")){%>
				<%@ include file="/modules/_edit_team.jspf" %>
				<%} %>
			<%if(session.getValue("confirm")!=null){ %>
				<%@ include file="/modules/_confirm.jspf" %>
				<% session.putValue("confirm",null); %>
				<%} %>
		
				<div id="content_box" >
				
					<%@ include file="/modules/_content.jspf" %>
				</div><!-- content_box -->
		


<%@ include file="/modules/footer.jspf"%>