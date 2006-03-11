<%@ page import="java.util.*" %>

<%
	Hashtable tub = (Hashtable)session.getValue("tub"); 
	if(tub==null){ 
		response.sendRedirect("/servlet/CmsController");
	}
	String moderator = (String)tub.get("Moderator");
	Vector subCats = (Vector) tub.get("SubCats");
	Vector fs = (Vector) tub.get("CatFiles");
%>


<HTML>
<HEAD>
<TITLE>Category Browser : <%=" "+tub.get("CatName")%></TITLE>
<SCRIPT>
function openWin(input){ 
	if(input == 'addCat'){
		window.open("/servlet/CmsController?action=showAddCategory&catId=<%=tub.get("CategoryId")%>","Add","resizable=no,scrollbars=yes,width=400,height=100,top=100,left=100");
	}
	else if(input == 'removeCat'){
		window.open("/servlet/CmsController?action=showDeleteCategory&id=<%=tub.get("CategoryId")%>","Remove","resizable=no,scrollbars=yes,width=400,height=100,top=100,left=100");
	}
	else if(input == 'renameCat'){
		window.open("/servlet/CmsController?action=showRenameCategory&id=<%=tub.get("CategoryId")%>","Rename","resizable=no,scrollbars=yes,width=400,height=100,top=100,left=100");
	}
	else if(input == 'upload'){
		window.open("/servlet/CmsController?action=popupUploadForm&catId=<%=tub.get("CategoryId")%>","AddFile","resizable=no,scrollbars=yes,width=600,height=550,top=100,left=100");
	}
}
</SCRIPT>
</HEAD>
<% String pageTitle=(String)tub.get("CatName");%>
<%@ include file="/cms/cmsheadersmall.jspf"%>

<%=font%>&nbsp;&nbsp;<B>You are here  </B>-&gt;</FONT><%=font2%> <%=tub.get("cmsPath")%><p>

<center>
<%
	box.setTitle("SubCategories");
	box.setTitleAlign("LEFT");
	box.setStyle("classic");
	box.setWidth("98%");
%>
<%=box.printTop()%>
<table WIDTH="100%" ALIGN="CENTER">
    <TR>
		<TD width="100%">
			<TABLE WIDTH="100%" BORDER="0">
				<TR>
					<TD>
						<%
						if (subCats.size()==0) {
							out.println(font+"<i>There are no subcategories in this category</i></font>");
						}
						for (int i=0;i<subCats.size()/2;i++) {
							Hashtable subCat = (Hashtable)subCats.get(i);
							%>
							<A HREF="/servlet/CmsController?action=browse&catId=<%=subCat.get("CategoryId")%>">
								<IMG SRC="/cms/images/2folder.gif" ALIGN="BOTTOM" BORDER="0"></A> 
							<A HREF="/servlet/CmsController?action=browse&catId=<%=subCat.get("CategoryId")%>">
								<%=fontB%><%=subCat.get("CatName")%></FONT></A>
							<br>
							<%
						}
						%>
					</TD>
					<TD>
						<%
						for (int i=subCats.size()/2;i<subCats.size();i++) {
							Hashtable subCat = (Hashtable)subCats.get(i);
							%>
							<A HREF="/servlet/CmsController?action=browse&catId=<%=subCat.get("CategoryId")%>">
								<IMG SRC="/cms/images/2folder.gif" ALIGN="BOTTOM" BORDER="0"></A> 
							<A HREF="/servlet/CmsController?action=browse&catId=<%=subCat.get("CategoryId")%>">
								<%=fontB%><%=subCat.get("CatName")%></FONT></A>
							<BR>
							<%
						}
						%>
					</TD>
				</TR>
			</TABLE>
		</TD>
		<%
		if(moderator.equals("true")) {
			%>
				<TD>
					<A HREF="JavaScript: openWin('addCat');" onMouseOver="document.addcategorybutton.src='/images/add_bon.gif';" onMouseOut="document.addcategorybutton.src='/images/add_boff.gif';"><IMG  NAME="addcategorybutton" SRC="/images/add_boff.gif" BORDER="0" ALIGN="TOP"></A><BR>
					<IMG SRC="/images/blank.gif" HEIGHT="2"><BR>
					<A HREF="JavaScript: openWin('renameCat');" onMouseOver="document.renamecategorybutton.src='/images/rename_bon.gif';" onMouseOut="document.renamecategorybutton.src='/images/rename_boff.gif';"><IMG  NAME="renamecategorybutton" SRC="/images/rename_boff.gif" BORDER="0" ALIGN="TOP"></A><BR>
					<IMG SRC="/images/blank.gif" HEIGHT="2"><BR>
					<%
						if (subCats.size()==0 && fs.size()==0) {
							%>
							<A HREF="JavaScript: openWin('removeCat');" onMouseOver="document.removecategorybutton.src='/images/remove_bon.gif';" onMouseOut="document.removecategorybutton.src='/images/remove_boff.gif';"><IMG  NAME="removecategorybutton" SRC="/images/remove_boff.gif" BORDER="0" ALIGN="TOP"></A>
							</TD>
							<%
						}
					%>
			<%
		}
		%>
	</TR>
</table>
<%=box.printBottom()%>

<br>
<%
	box.setTitle("Resources");
	box.setTitleAlign("LEFT");
	box.setStyle("classic");
	box.setWidth("98%");
%>
<%=box.printTop()%>
<table width='100%'>
<tr>
	<td><%=fontS%>Left click resource title to open, right click and choose "Save Target As..." to save to your computer.<br>
	Click the magnifying glass to view resource details (author, summary, etc...).</font></td>
	<td align=right nowrap>
			<%
		boolean rcUpload = true;
		if(rcUpload) {
			%>
				<TD>
					<A HREF="JavaScript: openWin('upload');" onMouseOver="document.submit_resource.src='/images/submit_resource_bon.gif';" onMouseOut="document.submit_resource.src='/images/submit_resource_boff.gif';"><IMG  NAME="submit_resource" SRC="/images/submit_resource_boff.gif" BORDER="0" ALIGN="TOP"></A><BR>
				</TD>
			<%
		}
		%>
	</td>
</tr>
</table>

<TABLE WIDTH="100%">
	<TR>
		<TD width="100%">
			<TABLE WIDTH="100%" BORDER="0">
				<TR>
					<TD width='40%' valign=top>
						<%
						if (fs.size()==0) {
							out.println(font+"<i>There are no resources in this category</i></font>");
						}
						for (int i=0;i<fs.size()/2;i++) { // The first half of files to list
							Hashtable f = (Hashtable)fs.get(i);
							%>
							<A HREF="/servlet/CmsController?action=fileInfo&id=<%=f.get("FileId")%>&catReturnTo=<%=tub.get("CategoryId")%>"><img src="/images/small_magglass.gif" alt='view resource details' border=0></A>
							<A HREF="<%=f.get("Url")%>" target="_blank"><IMG SRC="/cms/images/filetypes/<%=f.get("Img")%>" ALIGN="BOTTOM" BORDER="0"></A> 
							<A HREF="<%=f.get("Url")%>" target="_blank"><%=fontB%><%=f.get("Title")%></FONT></A>
							<%
								if(moderator.equals("true")) {
									Boolean moderated = (Boolean)f.get("ModeratedYet");
									if (!moderated.booleanValue()) {
										%>
										<A HREF="/servlet/CmsController?action=edit&id=<%=f.get("FileId")%>&catReturnTo=<%=tub.get("CategoryId")%>">
											<img src="/cms/images/new.gif" border=0></A> 
										<%
									}
								}
							%>
							<BR>
							<%
						}
						%>
					</TD>
					<TD width='40%' valign=top>
						<%
						for (int i=(fs.size()/2);i<fs.size();i++) { // The second half of files to list
							Hashtable f = (Hashtable)fs.get(i);
							%>
							<A HREF="/servlet/CmsController?action=fileInfo&id=<%=f.get("FileId")%>&catReturnTo=<%=tub.get("CategoryId")%>"><img src="/images/small_magglass.gif" alt='view resource details' border=0></A>
							<A HREF="<%=f.get("Url")%>" target="_blank"><IMG SRC="/cms/images/filetypes/<%=f.get("Img")%>" ALIGN="BOTTOM" BORDER="0"></A> 
							<A HREF="<%=f.get("Url")%>" target="_blank"><%=fontB%><%=f.get("Title")%></FONT></A>
							
							<%
								if(moderator.equals("true")) {
									Boolean moderated = (Boolean)f.get("ModeratedYet");
									if (!moderated.booleanValue()) {
										%>
										<A HREF="/servlet/CmsController?action=edit&id=<%=f.get("FileId")%>&catReturnTo=<%=tub.get("CategoryId")%>">
											<img src="/cms/images/new.gif" border=0></A> 
										<%
									}
								}
							%>
							<BR>
							<%
						}
						%>
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
</center>
<%=box.printBottom()%>
<center><%=font%><img src="/images/small_magglass.gif" border=0> = view resource information</font></center>
<br><br>
<%@ include file="/cms/cmsfooter.jspf" %>
</html>