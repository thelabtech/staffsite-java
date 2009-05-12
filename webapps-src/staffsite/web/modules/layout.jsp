<%@ include file="/headers/auth.jspf"%>
<%@ page import="org.alt60m.servlet.*,java.util.*,org.alt60m.ministry.*,org.alt60m.ministry.model.dbio.*"%>
<%@ page import="org.alt60m.ministry.servlet.modules.model.*"%>
<%
	ActionResults ar;
	ar = ActionResults.getActionResults(session);
	String infoBox="";
	String subModule="";
	String module=ar.getValue("module");
	String[] splitModule=module.split("_");
	if (splitModule.length>1) {
		subModule=splitModule[1];
		subModule=(subModule!=null&&!subModule.equals(""))?subModule+"/":"";
		module=splitModule[0];
	}
	String moduleRoot="/modules/"+ module +"/";
	
	String mode=ar.getValue("mode")!=null?ar.getValue("mode"):"index";
	List normalModules=Arrays.asList("home","person","campus","location","movement","team");
	List contentModes=Arrays.asList("content","list","edit","addMember","addContact");
	List infoModes=Arrays.asList("content","addMember","addContact");
	String layout=(normalModules.contains(module))?"normal":"special";
%>
<%@ include file="/modules/header.jspf"%>
<%if(mode.equals("content")){ %><center><b><%=ar.getHashtable("info").get("name") %></b></center><%} %>
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
		<div id="main_pane">
				<div id="content_box" >
					<%@ include file="/modules/_content.jspf" %>
				</div>
		</div>


<%@ include file="/modules/footer.jspf"%>