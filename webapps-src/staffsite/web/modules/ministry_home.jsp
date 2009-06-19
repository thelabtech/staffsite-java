<%@ include file="/modules/header.jspf"%>
Welcome to the <%=moduleUrl %> Home page. Everything else works pretty good.<br>
<%@ include file="/modules/_ministry_home_options.jspf"%><% 
String type="";
Vector<Section>subordinate_objects=(Vector<Section>)ar.getCollection("content");
for(Section section:subordinate_objects){
	%><br><b><%= section.getName() %></b><br>
	<%	 type=section.getType();%>
		<%@ include file="/modules/_search_results.jspf" %>
	<%}%>
<%@ include file="/modules/footer.jspf"%>