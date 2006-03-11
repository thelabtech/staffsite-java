<%@ page import="java.util.*, org.alt60m.servlet.*" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	Vector fs = (Vector)ar.getCollection("Files");
%>

<HTML>
<HEAD>
<TITLE>Moderate</TITLE>
</HEAD>

<% String pageTitle = "Moderate"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>
<br><br>

<table width="90%" align="center"><tr><td>
<p><%=font%><B>Categories with Unmoderated Files:</B></font></p>

<%
	String curCat = "";
	for (int i=0;i<fs.size();i++) {
		Hashtable f = (Hashtable)fs.get(i);
		if (!f.get("Path").equals(curCat)) {
			if (!curCat.equals("")) out.println("</ol>");
			%>
				<%=fontL%><b><%=f.get("Path")%></b></font>
				<ol>
			<%
			curCat = (String)f.get("Path");
		}
		%>
		<%=font%>
		<li>
		&quot;<%=f.get("Title")%>&quot;, submitted by <%=f.get("Submitter")%> on <%=f.get("DateAdded")%><br> 
		<A HREF="/servlet/CmsController?action=saveReview&id=<%=f.get("CmsFileID")%>&ModeratedYet=true">[Accept]</A>
		<A HREF="/servlet/CmsController?action=deleteResource&id=<%=f.get("CmsFileID")%>">[Delete]</A>
		<A HREF="/servlet/CmsController?action=moderateReview&id=<%=f.get("CmsFileID")%>">[Review]</A>
		</font>
		<br>
		<%
	}
%>
</ol>
</td></tr></table>
<br>
&nbsp;&nbsp;&nbsp;<%=font%>[<a href="/servlet/CmsController?action=home">Home</a>]</font>
<br>
<%@ include file="/cms/cmsfooter.jspf" %>
</BODY>
</HTML>