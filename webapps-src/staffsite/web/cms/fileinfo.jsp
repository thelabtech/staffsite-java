<%@ page import="java.util.*, org.alt60m.servlet.*, org.alt60m.html.*" %>
<jsp:useBean id="language" class="org.alt60m.html.SelectLanguage" />
<%
	ActionResults ar = ActionResults.getActionResults(session);
	Hashtable f = ar.getHashtable("f");
	Vector cats = (Vector)ar.getCollection("cats");
	String moderator = ar.getValue("Moderator");
%>

<HTML>
<HEAD>
<TITLE>File Information</TITLE>
<SCRIPT>
function openWin(input){ 
	if(input == 'replace'){
		window.open("/servlet/CmsController?action=showReplace&id=<%=f.get("CmsFileID")%>","ReplaceResource","resizable=no,scrollbars=yes,width=600,height=300,top=100,left=100");
	}
}
</SCRIPT>
</HEAD>

<% String pageTitle = "File Information"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>
<br>
<table width="90%" align="center"><tr><td>

	<%=font%><%=ar.getValue("FileDesc")%>: <%=ar.getValue("FileNote")%></font><br>
	<br>
	<table cellpadding=0 cellspacing=0 border=0>
	<tr><td>
		<a href="<%=f.get("Url")%>" target="_blank" onMouseOver="document.downloadbutton.src='/images/open_bon.gif';" onMouseOut="document.downloadbutton.src='/images/open_boff.gif';"><IMG  NAME="downloadbutton" SRC="/images/open_boff.gif" BORDER="0" ALIGN="TOP"></A>
	</td><td>
		<%=fontS%>(Click the Open button to open the resource.)</FONT>
		</td>
	</tr>
	<tr><td>
		<%=font%><a href="<%=f.get("Url")%>" target="_blank">[Download]</a></font> &nbsp;
	</td><td>
		<%=fontS%>(Right click the Download link and choose "Save Target As..." to save the resource to your computer.)</FONT>
		</td>
	</tr>
	</table>
	<br>
	<%
		box.setTitle("Resource Info");
		box.setTitleAlign("LEFT");
		box.setStyle("classic");
		box.setWidth("98%");
	%>
	<%=box.printTop()%>
	<table border=0 cellpadding=0 cellspacing=0>
		<tr><td valign="top"><%=font%>Title:</td><td><%=font%><b><%=f.get("Title")%></b></td></tr>
		<tr><td valign="top"><%=font%>Author:</td><td><%=font%><%=f.get("Author")%></td></tr>
		<tr><td valign="top"><%=font%>Contact:</td><td><%=font%><%=f.get("Contact")%></td></tr>
		<tr><td valign="top"><%=font%>Quality:</td><td><%=font%><%=CmsQuality.getName((String)f.get("Quality"))%></td></tr>
		<tr><td valign="top"><%=font%>Language:</td><td><%=font%><%=f.get("Language")%></td></tr>
		<tr>
			<td valign="top"><%=font%>Categories:&nbsp;</font></td>
			<td>
				<% 
					for (int i=0;i<cats.size();i++) {
						Hashtable cat = (Hashtable)cats.get(i);	
						%>
						<%=font%>
							<a href="/servlet/CmsController?action=browse&catId=<%=cat.get("CmsCategoryID")%>">
								Home:<%=cat.get("Path")%>
							</a> 
						</font><br>
						<%
					}
				%>
			</td>
		</tr>
		<tr><td valign="top"><%=fontB%>Summary:&nbsp;</td><td><%=fontB%><%=f.get("Summary")%></td></tr>
	</table>
	<%=box.printBottom()%>
	
	<br>
	<%
		box.setTitle("Resource Center Information");
		box.setTitleAlign("LEFT");
		box.setStyle("classic");
		box.setWidth("98%");
	%>
	<%=box.printTop()%>
	<table border=0 cellpadding=0 cellspacing=0>
		<tr><td valign="top"><%=font%>Submitted by:</td><td><%=font%><%=f.get("Submitter")%></td></tr>
		<tr><td valign="top"><%=font%>Date Added:</td><td><%=font%><%=f.get("DateAdded")%></td></tr>
		<tr><td valign="top"><%=font%>Times Downloaded:&nbsp;</td><td><%=font%><%=f.get("AccessCount")%></td></tr>
		<tr><td valign="top"><%=font%>CmsFileID:</td><td><%=font%><%=f.get("CmsFileID")%></td></tr>
	</table>
	<%=box.printBottom()%>

	<br>
	<%
	if(moderator.equals("true")) {
		%>
		<A HREF="/servlet/CmsController?action=edit&catReturnTo=<%=ar.getValue("CatReturnTo")%>&id=<%=f.get("CmsFileID")%>" onMouseOver="document.editbutton.src='/images/edit_bon.gif';" onMouseOut="document.editbutton.src='/images/edit_boff.gif';"><IMG  NAME="editbutton" SRC="/images/edit_boff.gif" BORDER="0" ALIGN="TOP"></A>
		<%
	}
	%>
	<a href="/servlet/CmsController?action=browse&catId=<%=ar.getValue("CatReturnTo")%>"onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A><p>
	<br>
	<center>
	<%=font%>To add this resource as a link on <i>your</i> website, copy the text-link below and paste it into your webpage:<p>
	<table border=1 cellpadding=20 align="center">
		<tr><td align="center">
			<%=fontTextS%>
			<% if (((String)f.get("Url")).startsWith("http")) { %>
				&lt;a href="<%=f.get("Url")%>"&gt;
				<%=f.get("Title")%>
				&lt;/a&gt;
			<% } else { %>
				&lt;a href="http://staff.campuscrusadeforchrist.com<%=f.get("Url")%>"&gt;
				<%=f.get("Title")%>
				&lt;/a&gt;
			<% } %>
			
			</font>
		</td></tr>
	</table>

</font>
</td></tr></table>
<br>
<%@ include file="/cms/cmsfooter.jspf" %>
</BODY>
</HTML>