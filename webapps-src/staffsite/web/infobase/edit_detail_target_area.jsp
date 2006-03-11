<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="mySelectR" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="mySelectS" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="mySelectC" class="org.alt60m.html.SelectCountry"/>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
Hashtable taTable = ar.getHashtable("targetAreaInfo");
mySelectR.setCurrentValue((String)taTable.get("Region"));
mySelectR.setName("Region");
mySelectS.setCurrentValue((String)taTable.get("State"));
mySelectS.setName("State");
mySelectC.setCurrentValue((String)taTable.get("Country"));
mySelectC.setName("Country");
boolean secure = ((Boolean)taTable.get("IsSecure")).booleanValue();
boolean semester = ((Boolean)taTable.get("IsSemester")).booleanValue();
%>
<% String pageTitle = "Update Campus Info"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>
<%
	box.setTitle("Campus Info");
	box.setStyle("Classic");
	box.setWidth("");
	out.print("<P ALIGN=CENTER> " + box.printTop());
%>
<FORM NAME="updateForm" METHOD="POST" ACTION="/servlet/InfoBaseController?action=saveTargetAreaInfo&targetareaid=<%= request.getParameter("targetareaid") %>">
<TABLE BORDER=0 CELLPADDING=5 CELLSPACING=0 ALIGN="CENTER">
<TR><TD> </TD><TD><%= fontS %>(* = required field)</FONT></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>*Region:</FONT></TD>
	<TD><%= font %><%= mySelectR.print() %></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Name:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("Name") %>" NAME="Name" SIZE="27" MAXLENGTH="100" readonly="true"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Alternate Name:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("AltName") %>" NAME="AltName" SIZE="27" MAXLENGTH="100"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Abbreviation:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("Abbrv") %>" NAME="Abbrv" SIZE="27" MAXLENGTH="31"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>City:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("City") %>" NAME="City" SIZE="27" MAXLENGTH="29"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>State:</FONT></TD>
	<TD><%= font %><%= mySelectS.print() %></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Zip:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("Zip") %>" NAME="Zip" SIZE="10" MAXLENGTH="10"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>*Country:</FONT></TD>
	<TD><%= font %><%= mySelectC.print() %></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Local Level Ministry URL:<BR>(include "http://")</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("Url") %>" NAME="Url" SIZE="27" MAXLENGTH="254"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Official School Website URL:<BR>(include "http://")</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("InfoUrl") %>" NAME="InfoUrl" SIZE="27" MAXLENGTH="254"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>FICE:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("Fice") %>" NAME="Fice" SIZE="27" readonly="true" MAXLENGTH="32"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Population/Enrollment/Scope:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("Population") %>" NAME="Population" SIZE="27" MAXLENGTH="9"></TD>
</TR>
<!-- <TR>
	<TD ALIGN="RIGHT"><%= font %>Is this Target Area Secure?</FONT></TD>
	<TD><%= font %><INPUT TYPE="RADIO" NAME="IsSecure" VALUE="true" <% if(secure) { %>CHECKED<% } %>> Yes&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="IsSecure" VALUE="false" <% if(!secure) { %>CHECKED<% } %>> No</TD>
</TR> -->
<TR>
	<TD ALIGN="RIGHT"><%= font %>MPTA:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("Mpta") %>" NAME="Mpta" SIZE="27" MAXLENGTH="29"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Campus Logo URL:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("UrlToLogo") %>" NAME="UrlToLogo" SIZE="27" MAXLENGTH="255">[<a href="JavaScript: popupWindow('/help/help_infobase.jsp#addlogo', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">help</a>]</TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Month and Day School Starts:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("MonthSchoolStarts") %>" NAME="MonthSchoolStarts" SIZE="5" MAXLENGTH="10">&nbsp;(ie: AUG30)</TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Month and Day School Stops:</FONT></TD>
	<TD><%= font %><INPUT TYPE="TEXT" VALUE="<%= taTable.get("MonthSchoolStops") %>" NAME="MonthSchoolStops" SIZE="5" MAXLENGTH="10">&nbsp;(ie: MAY06)</TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Semester System?</FONT></TD>
	<TD><%= font %><INPUT TYPE="RADIO" NAME="IsSemester" VALUE="true" <% if(semester) { %>CHECKED<% } %>> Yes&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="IsSemester" VALUE="false" <% if(!semester) { %>CHECKED<% } %>> No</TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><%= font %>Note:</FONT></TD>
	<TD><textarea name="Note" cols="22" rows="5" wrap="VIRTUAL"><%= taTable.get("Note") %></textarea></TD>
</TR>
<TR>
	<TD ALIGN="CENTER" COLSPAN="2"><A HREF="JavaScript: document.updateForm.submit()" onMouseOver="document.targetAreaButton.src='/images/submit_bon.gif';" onMouseOut="document.targetAreaButton.src='/images/submit_boff.gif';"><IMG NAME="targetAreaButton" SRC="/images/submit_boff.gif" BORDER="0" ALIGN="TOP"></A>
	</TD>
</TR>   
</TABLE>

<%= box.printBottom() %>
<!--<%=fontB%><%=ar.toHTML()%>-->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>