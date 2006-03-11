<%@ page import="java.util.*, org.alt60m.servlet.*" %>
<%
	ActionResults ar = ActionResults.getActionResults(session);
	Vector subCats = (Vector)ar.getCollection("subCats");
%>

<HTML>
<HEAD>
<TITLE>Search for a Category</TITLE>
</HEAD>

<jsp:useBean id="box" class="org.alt60m.html.Box"/>
<%@ include file="/style.jspf"%>
<% Hashtable profile = (Hashtable)session.getValue("profile"); %>
<BODY BGCOLOR="<%=color4%>" TEXT="#000000" LINK="#2C4F93" VLINK="#84794A"  MARGINWIDTH="0" MARGINHEIGHT="0" TOPMARGIN="0" LEFTMARGIN="0" onUnload="window.opener.focus();" onLoad="self.focus();"">

<%	box.setStyle("rounded");
	box.setTitleFontSize("2");
	box.setTitleAlign("left");
	box.setColor(color3);
	box.setTitle("Select a Category");
	box.setSubPad("5");
	box.setWidth("90%");
%>
<br>

<center>
	<%
	if(!ar.getValue("CmsCategoryID").equals("0")) {
		box.setTitle("Select This Category");
		%>
		<%=box.printTop()%>
		<br>
		<img src="/images/blank.gif" height=1 width=20>
		<%=fontL%><B><%=ar.getValue("CatName")%></B></font><br>
		<center>
		<p><A HREF="/servlet/CmsController?action=addToCategory&catReturnTo=<%=ar.getValue("CatReturnTo")%>&id=<%=ar.getValue("id")%>&catId=<%=ar.getValue("CmsCategoryID")%>">[Select THIS Category]</A></p>
		</center>
		<%=box.printBottom()%>
		<br>
		<%
		box.setTitle("or Select a Subcategory of " + ar.getValue("CatName"));
	} else {
		box.setTitle("Select a Subcategory");	
	}

	if (subCats.size()>0) {
		%>
		<%=box.printTop()%>
		<%
			for (int i=0;i<subCats.size();i++) {
			Hashtable subCat = (Hashtable)subCats.get(i);
			%>
				<img src="/images/blank.gif" height=1 width=20>
				<A HREF="/servlet/CmsController?action=browseCat&catReturnTo=<%=ar.getValue("CatReturnTo")%>&id=<%=ar.getValue("id")%>&catId=<%=subCat.get("CmsCategoryID")%>">
					<%=fontB%><%=subCat.get("CatName")%></FONT></A>
				<BR>
			<%
			}
		%>
		<%=box.printBottom()%>
		<br>
		<%
	}
	%>
		
	<br>
	<%=font%>
		<%
		if(request.getParameter("catId")!=null){
			%>
			<A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/cms/images/back_bon.gif';" onMouseOut="document.backbutton.src='/cms/images/back_boff.gif';">
				<IMG  NAME="backbutton" SRC="/cms/images/back_boff.gif" BORDER="0" ALIGN="TOP">
			</A>
			<%
		}
		%>
	</font>
</center>
</HTML>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</BODY>