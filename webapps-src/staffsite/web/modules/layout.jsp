
<%@ include file="/modules/header.jspf"%>

		<div id="left_pane">
				<div id="search_box" >
						<%String searchUrl="/servlet/"+module.substring(0,1).toUpperCase()+module.substring(1).toLowerCase(); %>
						<form action="<%=searchUrl%>" method="post">
						<%@ include file="/modules/_search.jspf" %>
						
						
						<input type="submit" id="search_submit" name="search_submit" value="Search"/>
						</form>
						
				</div>
				<div id="info_box" >
					<%@ include file="/modules/_info_box.jspf" %>	
				</div>
				
		</div>
				<%if(module.equals("campus")||module.equals("location")){%>
				<%@ include file="/modules/_edit_campus.jspf" %>
				<% }else if(module.equals("team")){%>
				<%@ include file="/modules/_edit_team.jspf" %>
				<%} %>
			<%if(session.getValue("confirm")!=null){ %>
				<%@ include file="/modules/_confirm.jspf" %>
				<% session.putValue("confirm",null); %>
				<%} %>
		<div id="main_pane">
				<div id="content_box" >
				
					<%@ include file="/modules/_content.jspf" %>
				</div>
		</div>


<%@ include file="/modules/footer.jspf"%>