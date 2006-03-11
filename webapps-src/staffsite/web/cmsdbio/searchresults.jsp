<%@ page import="java.util.*,org.alt60m.html.*" %>

<% 
	Hashtable tub = (Hashtable)session.getValue("tub"); 
	Hashtable results = (Hashtable)tub.get("results");

	String query = (String)tub.get("query");
	Integer startI = (Integer)tub.get("start");
	Integer endI = (Integer)tub.get("end");
	int start = startI.intValue();
	int end = endI.intValue();
%>

<HTML>
<HEAD>
<TITLE>Search</TITLE>
</HEAD>

<% String pageTitle = "Search"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>

<HTML>
<HEAD>
<TITLE>Search </TITLE>
</HEAD>

	<%
		if(start>0) { 
			%><A HREF="JavaScript: document.previousResults.submit()" onMouseOver="document.previousresults.src='/cms/images/previousresults_bon.gif';" onMouseOut="document.previousresults.src='/cms/images/previousresults_boff.gif';"><IMG NAME="previousresults" SRC="/cms/images/previousresults_boff.gif" BORDER="0" ALIGN="TOP"></A>&nbsp;<% 
		}
	%>
	&nbsp;&nbsp;&nbsp;
	<%=fontB%>Viewing results <B><%=start+1%></B> to <B><%=end%></B> of <B><%=tub.get("count")%></B></FONT>
	<%
		if(end<results.size()) {
			%>&nbsp;<A HREF="JavaScript: document.nextResults.submit()" onMouseOver="document.nextresults.src='/cms/images/nextresults_bon.gif';" onMouseOut="document.nextresults.src='/cms/images/nextresults_boff.gif';"><IMG NAME="nextresults" SRC="/cms/images/nextresults_boff.gif" BORDER="0" ALIGN="TOP"></A><%
		}
	%>
	<p>

	<center>

	<%
		//box.setTitle("&nbsp;&nbsp;Category Matches (" + (start+1) + "-" + end + " of " + tub.get("count") + ")");
		//box.setTitleAlign("LEFT");
		//box.setStyle("classic");
		//box.setWidth("98%");
	%>
	<%//=box.printTop()%>
	<!--<i>This feature not yet implemented</i>
	<%//=box.printBottom()%>
	
	<br>-->
	<%
		box.setTitle("&nbsp;&nbsp;Resource Matches (" + (start+1) + "-" + end + " of " + tub.get("count") + ")");
		box.setTitleAlign("LEFT");
		box.setStyle("classic");
		box.setWidth("98%");
	%>

	<%=box.printTop()%>
	<table width="100%" cellpadding=0 cellspacing=0>
	<%
	for(int i=start; i<end; i++) {
		// category
		Hashtable result = (Hashtable)results.get(new Integer(i).toString());
		//if result.get
		%>
		<tr>
			<td><%=font%><%=i+1%>. </td>
			<td>
				<%=fontL%><b><a href="/servlet/CmsController?action=getFile&id=<%=result.get("FileId")%>&name=/<%=result.get("Title")%>" target="_blank"><%=result.get("Title")%></a></b></font> 
				<%=font%>
					by <%=result.get("Author")%> 
					(<%=result.get("Mime")%>)
				</font>
			</td>
		<tr>
			<td>&nbsp;</td>
			<td><%=font%><I><%=result.get("Summary")%></I></td>
		</tr>
		<tr>
			<td>&nbsp;</font></td>
			<td>
				<%=font%>Quality: <%=CmsQuality.getName((String)result.get("Quality"))%>&nbsp;&nbsp;
				<a href="/servlet/CmsController?action=fileInfo&catReturnTo=searchResults&id=<%=result.get("FileId")%>">[More Info]</a>
				<br><br>
			</td>
		</tr>
		<%
	}
	%>
	</table>
	<%=box.printBottom()%>	
	</center>

	<br><br>
	<center>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<FORM NAME="searchForm" ACTION="/servlet/CmsController" METHOD="POST" onSubmit="JavaScript: if(document.searchFormMod.query.value==''){return false;}">
		<input type=hidden name="action" value="simpleSearch">
		<TR>
		<td rowspan=2>&nbsp;&nbsp;</td>
		<td align="right"><%=fontB%>Search again:&nbsp;</FONT></td>
		<TD><INPUT TYPE="TEXT" SIZE="25" MAXLENGTH="200" NAME="query" VALUE="<%=tub.get("query")%>"></TD>
		<TD ALIGN="CENTER">&nbsp;
		 <a href="JavaScript: if(document.searchForm.query.value!=''){document.searchForm.submit()}else{alert('You must first enter some terms to search by.')};" onMouseOver="document.searchbutton.src='/images/search_bon.gif';" onMouseOut="document.searchbutton.src='/images/search_boff.gif';"><IMG NAME="searchbutton" SRC="/images/search_boff.gif" BORDER="0" ALIGN="TOP">
		 </TD>
		 <TD ROWSPAN="2">&nbsp;&nbsp;</TD>
		 </TR>
		 <TR>
		 <TD>&nbsp;</TD>
		 <TD>
			<INPUT TYPE="CHECKBOX" NAME="exact" VALUE="true"><%=fontB%>Exact phrase</FONT>
		</TD>
		<TD ALIGN="center">
			<a href="/servlet/CmsController?action=showAdvancedSearch"><%=font%><NOBR>[More Options]</NOBR></a><BR>
			<A HREF="JavaScript: popupWindow('/help/help_resource_center.jsp#searchtips', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">[Search Tips]</A></font>
		</TD>
		</TR>
	</FORM>
	</TABLE>
	</center>
	<br>

	<FORM ACTION="/servlet/CmsController" NAME="nextResults" METHOD="POST">
		<input type=hidden name="action" value="simpleSearch">
		<INPUT TYPE="HIDDEN" NAME="start" VALUE="<%=end%>">
		<INPUT TYPE="HIDDEN" NAME="EXACT" VALUE="<%//= request.getParameter("EXACT") %>">
		<INPUT TYPE="HIDDEN" NAME="query" VALUE="<%=query%>">
	</FORM>
	<FORM ACTION="/servlet/CmsController" NAME="previousResults" METHOD="POST">
		<input type=hidden name="action" value="simpleSearch">
		<INPUT TYPE="HIDDEN" NAME="start" VALUE="<%=start-10%>">
		<INPUT TYPE="HIDDEN" NAME="EXACT" VALUE="<%//= request.getParameter("EXACT") %>">
		<INPUT TYPE="HIDDEN" NAME="query" VALUE="<%=query%>">
	</FORM>

<%@ include file="/cms/cmsfooter.jspf" %>
</BODY>
</HTML>