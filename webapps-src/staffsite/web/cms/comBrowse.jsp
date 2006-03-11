<%@ page import="java.util.*,org.alt60m.servlet.*" %>

<%
	ActionResults ar = ActionResults.getActionResults(session);
	Vector catFiles = (Vector)ar.getCollection("CatFiles");
	if(ar==null){ 
		response.sendRedirect("/servlet/CmsController");
	}
%>


<HTML>
<HEAD>
<TITLE>Com Browser</TITLE>
</HEAD>
<% String pageTitle="Communications Article Browser Test";%>
<%@ include file="/cms/cmsheadersmall.jspf"%>

<P>
<%=fontText%>
This page will display the last N articles (right now Files) in the system, with N being either 3 or 5 depending on how you <A HREF="/servlet/StaffController?action=showCustomize">customized</A> your account.</font><p>
<center>
<%
	box.setTitleAlign("LEFT");
	box.setStyle("classic");
	box.setWidth("98%");
%>
<%
	if (catFiles.size()==0) {
		out.println(font+"<i>There are no articles in the system to display</i></font>");
	}
	for (int i=0;i<catFiles.size();i++) {
		Hashtable catFile = (Hashtable)catFiles.get(i);
		box.setTitle((String)catFile.get("Title"));
%>
		<%=box.printTop()%>
			<table width='100%' border=0 cellspacing=0 cellpadding=0>
			<tr valign='top'>	<td>&nbsp;&nbsp;<%=fontB%>by <%=catFile.get("Author")%>
			</font></td>		<td align=right nowrap><i><%=fontText1%><%=catFile.get("DateAdded")%>
			</font></i></td></tr></table>
			<br><%=fontText%><%=catFile.get("Summary")%><br>
			</font>
			<br>&nbsp;&nbsp;&nbsp;&nbsp;<%=fontB1%>
			<A HREF="/servlet/CmsController?action=getFile&id=<%=catFile.get("CmsFileID")%>">
				<%=fontB%>Full Story...</A></font>
		<%=box.printBottom()%>
<%
	}
%>
</center>
<p align=left>
<%
//for (Enumeration e = catFiles.keys(); e.hasMoreElements();) {
//	String k = (String) e.nextElement();
//	out.println("key: " + k + " value: " + catFiles.get(k) + " <br>");
//}
%>
<br><br>
<%@ include file="/cms/cmsfooter.jspf" %>
</html>