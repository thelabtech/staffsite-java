<%@ page import="java.util.*" %>
<jsp:useBean id="language" class="org.alt60m.html.SelectLanguage" />
<jsp:useBean id="quality" class="org.alt60m.html.CmsQuality" />

<HTML>
<HEAD>
<TITLE>Advanced Search</TITLE>
</HEAD>
<% String pageTitle = "Advanced Search"; %>
<%@ include file="/cms/cmsheadersmall.jspf"%>
<br><br>

<table width="90%" align="center"><tr><td>
<%=font%>
<FORM NAME="myForm" ACTION="/servlet/CmsController" METHOD="POST">
	<input type=hidden name="action" value="advancedSearch">
	<center>
         <TABLE WIDTH="70%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
			<TR>
				<TD>&nbsp;</TD>
				<td><%=font%><i>includes / </i></font></td>
				<td><%=font%><i>excludes</i></font></td>
				<td>&nbsp;</td>
			</TR>
            <TR>
              <TD ALIGN="RIGHT"><%=font%>Author: </TD>
			  <TD align="center"><input type="radio" name="authorLogic" value="true" checked></TD>
			  <TD align="center"><input type="radio" name="authorLogic" value="false"></TD>
              <TD><INPUT TYPE="TEXT" NAME="author"></TD>
            </TR>
            <TR>
              <TD ALIGN="RIGHT"><%=font%>Title: </TD>
  			  <TD align="center"><input type="radio" name="titleLogic" value="true" checked></TD>
			  <TD align="center"><input type="radio" name="titleLogic" value="false"></TD>
              <TD><INPUT TYPE="TEXT" NAME="title"></TD>
            </TR>
            <TR>
              <TD ALIGN="RIGHT"><%=font%>Keywords: </TD>
  			  <TD align="center"><input type="radio" name="keywordsLogic" value="true" checked></TD>
			  <TD align="center"><input type="radio" name="keywordsLogic" value="false"></TD>
              <TD><INPUT TYPE="TEXT" NAME="keywords"></TD>
            </TR>
            <TR>
              <TD ALIGN="RIGHT"><%=font%>Summary: </TD>
  			  <TD align="center"><input type="radio" name="summaryLogic" value="true" checked></TD>
			  <TD align="center"><input type="radio" name="summaryLogic" value="false"></TD>
              <TD><INPUT TYPE="TEXT" NAME="summary"></TD>
            </TR>
			<TR>
			  <TD ALIGN="RIGHT"><%=font%>Quality:</TD>
   			  <TD align="center"><input type="radio" name="qualityLogic" value="true" checked></TD>
			  <TD align="center"><input type="radio" name="qualityLogic" value="false"></TD>
             <TD>
				<%
					quality.setName("quality");
					quality.setBlank(true);
					%>
					<%=quality.printSelect()%>
              </TD>
			</TR>
			<TR>
              <TD ALIGN="RIGHT"><%=font%>Resource Type:</TD>
  			  <TD align="center"><input type="radio" name="typeLogic" value="true" checked></TD>
			  <TD align="center"><input type="radio" name="typeLogic" value="false"></TD>
              <TD>
				<SELECT NAME="type">
					<OPTION VALUE=""></OPTION>
					<OPTION VALUE="document">Documents</OPTION>
					<OPTION VALUE="image">Images</OPTION>
					<OPTION VALUE="audio">Audio</OPTION>
					<OPTION VALUE="multimedia">Multimedia</OPTION>
					<OPTION VALUE="program">Programs</OPTION>
				</SELECT>
              </TD>
			</TR>
			<TR>
              <TD ALIGN="RIGHT"><%=font%>Language</TD>
  			  <TD align="center"><input type="radio" name="languageLogic" value="true" checked></TD>
			  <TD align="center"><input type="radio" name="languageLogic" value="false"></TD>
              <TD>
				<%
				language.setName("language");
				%>
				<%=language.print()%>
			  </TD>
			 </TR>
          </TABLE><BR>
	</center>
	<a href="JavaScript: document.myForm.submit();" onMouseOver="document.searchbutton.src='/images/search_bon.gif';" onMouseOut="document.searchbutton.src='/images/search_boff.gif';"><IMG  NAME="searchbutton" SRC="/images/search_boff.gif" BORDER="0" ALIGN="TOP" alt='Search'></A>
</form>
</font>
</td></tr></table>

<%@ include file="/cms/cmsfooter.jspf" %>
</BODY>
</HTML>