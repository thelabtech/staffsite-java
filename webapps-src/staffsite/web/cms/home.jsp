<%@ page import="java.util.*" %>

<% 
	//ActionResults ar = (ActionResults)session.getValue("tub");
	Hashtable tub = (Hashtable)session.getValue("tub");
%>

<HTML>
<HEAD>
<TITLE>Resource Center</TITLE>
<SCRIPT>
function openWin(input){ 
	if(input == 'upload'){
		window.open("/cms/submitresource.jsp","SubmitAResource","resizable=no,scrollbars=yes,width=400,height=300,top=100,left=100");
	}
}
</SCRIPT>
</head>
<% String pageTitle = "Main Page"; %>
<%@ include file="/cms/cmsheader.jspf"%>
<blockquote><%=font%>
We recommend that you use the Campus Wiki instead of this Resource Center whenever possible.  The Resource Center will not go away anytime soon, but we strongly encourage resources to be put on the Campus Wiki whenever possible.  Our desire is to have one main location to store and share ministry materials and resources which is best fulfilled with the Campus Wiki <A HREF='http://wiki.uscm.org/'>Campus Wiki</a>	
</font></blockquote>
<center>
<TABLE WIDTH="98%" border=0>
	<TR>
		<TD colspan=3 align=center>
			<table border=0 align=center width='90%'><tr>
				<td valign=top>
					<!-- ----------------  SEARCH BOX ----------- -->
					<% box.setTitle("Find a Resource");%>
					<% //box.setWidth("10%");%>
					<% box.setStyle("classic");%>
					<% box.setIntHeight("80");%>
					<%=box.printTop()%>
					<%@ include file="/cms/searchmodule.jspf"%>
					<%=box.printBottom()%>
				</td>
				<td valign=top>
					<!-- ----------------  SUBMIT BOX ----------- -->
					<% box.setTitle("Submit a Resource");%>
					<% //box.setWidth("10%");%>
					<% box.setStyle("classic");%>
					<% box.setIntHeight("80");%>
					<%=box.printTop()%>
						<%=font%>
						You can submit almost any kind of electronic file to the Resource Center by uploading it from your computer. Click <A HREF="JavaScript: openWin('upload');">here</a> to find out how to upload a resource.
						</font>
					<%=box.printBottom()%>
				</td>
			</tr></table>
			<br>
		</TD>
	</TR>
	<TR>
		<TD align="center" valign="top">
			<!-- ----------------  CATEGORIES ----------- -->
			<% box.setTitle("Categories");%>
			<% box.setWidth("100%");%>
			<% box.setTitleAlign("LEFT");%>
			<% box.setStyle("classic");%>
			<%=box.printTop()%>
				<TABLE WIDTH="100%" border="0">
				<TR><TD>
					<%	Vector subCats = (Vector) tub.get("SubCats"); %>
					<TABLE WIDTH="80%" BORDER="0">
						<%	for (int i=0;i<subCats.size()/2;i++) { // for each child category in this category
								Hashtable subCat = (Hashtable)subCats.get(i);
							%>
							<TR>
							<TD nowrap <%=tableRightW%> WIDTH="100%">
								<A HREF="/servlet/CmsController?action=browse&catId=<%=subCat.get("CmsCategoryID")%>">
									<IMG SRC="/cms/images/2folder.gif" ALIGN="BOTTOM" BORDER="0"></A> 
								<A HREF="/servlet/CmsController?action=browse&catId=<%=subCat.get("CmsCategoryID")%>">
									<%=fontB%><%=subCat.get("CatName")%></FONT></A>
								<BR>
							</TD>
							</TR>
						<%}%>
					</TABLE>
				</TD>
				<TD>
					<TABLE WIDTH="80%" BORDER="0">
						<%	for (int i=subCats.size()/2;i<subCats.size();i++) { // for each child category in this category
								Hashtable subCat = (Hashtable)subCats.get(i);
							%>
							<TR>
							<TD nowrap <%=tableRightW%> WIDTH="100%">
								<A HREF="/servlet/CmsController?action=browse&catId=<%=subCat.get("CmsCategoryID")%>">
									<IMG SRC="/cms/images/2folder.gif" ALIGN="BOTTOM" BORDER="0"></A> 
								<A HREF="/servlet/CmsController?action=browse&catId=<%=subCat.get("CmsCategoryID")%>">
									<%=fontB%><%=subCat.get("CatName")%></FONT></A>
								<BR>
							</TD>
							</TR>
						<%}%>
					</TABLE> 
				</TD></TR>
				</TABLE>
			<%=box.printBottom()%>
			<br>
		</td>
		<td width="1%">&nbsp;</td>
		<td align="center" valign="top">
			<p>
			<!-- ----------------  TOP TEN LIST --------------------- -->
<!-- REMOVED DUE TO PDF ISSUE
			<% //box.setTitle("10 Most Accessed Documents");%>
			<% //box.setTitleFontSize("1");%>
			<% //box.setTitleAlign("CENTER");%>
			<% //box.setWidth("98%");%>
			<% //box.setStyle("classic");%>
			<%//=box.printTop()%>
				<OL>
				<%
				/*	Vector top10s = (Vector)tub.get("top10s");
					int cnt = 10;
					if (top10s.size()<10) cnt = top10s.size();
					for(int i=0; i < cnt; i++) {
						Hashtable top10 = (Hashtable)top10s.get(i);
				*/		%>
						<LI><A HREF="/servlet/CmsController?action=fileInfo&catReturnTo=0&id=<%//=top10.get("CmsFileID")%>"><%//=top10.get("Title")%></A>
						<%
				//	}
				%>
				</OL></FONT>
			<%//=box.printBottom()%>
			<p>
-->
			<!-- ----------------  SUBMIT/EDITOR PAGE BUTTONS ----------- -->
			<%
			String moderator = (String)tub.get("Moderator");
			if(moderator.equals("true")) {
				%>
				<A HREF="/servlet/CmsController?action=moderate" onMouseOver="document.editorpagebutton.src='/images/moderate_bon.gif';" onMouseOut="document.editorpagebutton.src='/images/moderate_boff.gif';"><IMG  NAME="editorpagebutton" SRC="/images/moderate_boff.gif" BORDER="0" ALIGN="TOP"></A>
				<%
			}
			%>
			<p>
		</TD>
	</TR>
</TABLE>
</center>
<%@ include file="/cms/cmsfooter.jspf" %>
</html>