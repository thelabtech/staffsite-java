<%@ page import="java.util.*, org.alt60m.servlet.*" %>
<jsp:useBean id="language" class="org.alt60m.html.SelectLanguage" />
<jsp:useBean id="quality" class="org.alt60m.html.CmsQuality" />

<%
	ActionResults ar = ActionResults.getActionResults(session);
	Hashtable f = ar.getHashtable("f");
	Vector cats = (Vector)ar.getCollection("cats");
%>
<HTML>
<HEAD>
<TITLE>Review a Resource</TITLE>
<SCRIPT>
function openWin(input){ 
	if(input == 'addToCat'){
		window.open("/servlet/CmsController?action=browseCat&catReturnTo=moderate&id=<%=f.get("CmsFileID")%>","Add","resizable=no,scrollbars=yes,width=400,height=500,top=100,left=100");
	} else if(input == 'replace'){
		window.open("/servlet/CmsController?action=showReplace&catReturnTo=moderate&id=<%=f.get("CmsFileID")%>","ReplaceResource","resizable=no,scrollbars=yes,width=600,height=300,top=100,left=100");
	}
}
</SCRIPT>
</HEAD>
<% String pageTitle = "Review a resource"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>
<br><br>

<table width="90%" align="center"><tr><td>
<%=font%>
<FORM NAME="myForm" ACTION="/servlet/CmsController" METHOD="POST">
	<input type=hidden name="action" value="saveReview">
	<input type=hidden name="id" value="<%=f.get("CmsFileID")%>">
	<input type=hidden name="ModeratedYet" value="true">
	Submitter: <%=f.get("Submitter")%><br>
	Mime-type: <%=f.get("Mime")%><br>
	CmsFileID: <%=f.get("CmsFileID")%><br>
	Url: <a href="<%=f.get("Url")%>" target="_blank"><%=f.get("Url")%></a><br>
	Date Added: <%=f.get("DateAdded")%><br>
	Moderator Message: <%=f.get("ModMsg")%><br>
	<br>
	<table>
		<tr>
			<td><%=font%>Author</font></td>
			<td><input type=text name="Author" size="50" value="<%=f.get("Author")%>"></td>
		</tr><tr>
			<td><%=font%>Contact</font></td>
			<td><input type=text name="Contact" size="50" value="<%=f.get("Contact")%>"></td>
		</tr><tr>
			<td><%=font%>Title</font></td>
			<td><input type=text  name="Title" size="50" value="<%=f.get("Title")%>"></td>
		</tr><tr>
			<td><%=font%>Keywords</font></td>
			<td><textarea NAME="Keywords" rows="2" cols="50" wrap="VIRTUAL"><%=f.get("Keywords")%></textarea></td>
		</tr><tr>
			<td><%=font%>Summary</font></td>
			<td><textarea NAME="Summary" rows="10" cols="50" wrap="VIRTUAL"><%=f.get("Summary")%></textarea></td>
		</tr><tr>
			<td><%=font%>Quality</font></td>
			<td>
				<%
				quality.setName("Quality");
				quality.setCurrentValue((String)f.get("Quality"));
				%>
				<%=quality.printSelect()%>
			</td>
		</tr><tr>
			<td><%=font%>Version</font></td>
			<td><input name="Version" type=text value="<%=f.get("Version")%>"></td>
		</tr><tr>
			<TD><%=fontB%>Language</FONT></TD>
			<TD>
				<%
				language.setName("Language");
				%>
				<%=language.print()%>
			</TD>
		</tr><tr>
			<td valign="top"><%=font%>Categories:&nbsp;</font></td>
			<td>
				<% 
					for (int i=0;i<cats.size();i++) {
						Hashtable cat = (Hashtable)cats.get(i);	
						%>
						<%=font%>Home:<%=cat.get("Path")%> 
						<a href="/servlet/CmsController?action=removeFromCategory&catReturnTo=moderate&id=<%=f.get("CmsFileID")%>&catId=<%=cat.get("CmsCategoryID")%>">[remove]</a>
						</font><br>
						<%
					}
				%>
				<%=font%><A HREF="JavaScript: openWin('addToCat');">[Add to another Category]</a></font>
			</td>
		</tr>
	</table>
	<br>
	<A HREF="JavaScript: openWin('replace');"><%=font%>[Attach a new file to this resource]</font></A><br><br>
	<center>
	<a href="JavaScript: document.myForm.submit();">[Accept With Changes]</a> |
	<a href="/servlet/CmsController?action=deleteResource&catReturnTo=moderate&id=<%=f.get("CmsFileID")%>">[Delete]</a> | 
	<A HREF="/servlet/CmsController?action=moderate">[Back]</A>

	</center>
	<p>
</font>
</td></tr></table>

<%@ include file="/cms/cmsfooter.jspf" %>
</BODY>
</HTML>