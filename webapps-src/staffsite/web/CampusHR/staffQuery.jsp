<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<jsp:useBean id="mySelectC" class="org.alt60m.html.SelectCountry"/>
<%
  ActionResults ar = ActionResults.getActionResults(session);
	out.print("<!--"+ar.toHTML()+"-->");
	Map thisMap;
	String thisKey;
	String thisValue;
	Iterator keys;
	mySelectC.setName("country");
	mySelectC.setCurrentValue("USA");
%>

<HTML>
<HEAD>
<TITLE> Select Criteria </TITLE>
<%@ include file="hrheader.jspf" %>
<CENTER>
<FORM NAME="queryForm" ACTION="HRQueryController" METHOD="post">
<INPUT TYPE="hidden" NAME="action" VALUE="showFieldsSelect">
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Select Search Criteria</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="98%">
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="lastName" CLASS="noborder"> <B>Last name</B>:</NOBR>
			</TD>
			<TD>&nbsp;<INPUT TYPE="text" NAME="lastName">
			</TD>
		</TR>
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="newStaffTrainingDate" CLASS="noborder"> <B>New Staff Training Date</B>:</NOBR>
			</TD>
			<TD>&nbsp;<INPUT TYPE="text" NAME="newStaffTrainingDate"><%=fontB%>[<A HREF="javascript:pickdate(document.queryForm.newStaffTrainingDate)"><%=fontB%>select date</A>]</FONT>
			</TD>
		</TR>

		<!--
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="position" CLASS="noborder"> <B>Position</B>:</NOBR>
			</TD>
			<TD>&nbsp;<INPUT TYPE="text" NAME="position">
			</TD>
		</TR>
		-->
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="jobStatus" CLASS="noborder"> <B>Status</B>:</NOBR>
			</TD>
			<% thisMap = ar.getMap("jobStatus"); %>
			<TD>&nbsp;<SELECT NAME="jobStatus">
			<% 
			    keys = thisMap.keySet().iterator();
			    while(keys.hasNext()) {
						thisKey = (String)keys.next();
						thisValue = (String)thisMap.get(thisKey);
						%>
						<OPTION VALUE="<%= thisKey %>"><%= thisValue %></OPTION>
						<%
					}
			%></SELECT>
			</TD>
		</TR>
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="countryStatus" CLASS="noborder"> <B>Location</B>:</NOBR>
			</TD>
			<% thisMap = ar.getMap("countryStatus"); %>
			<TD>&nbsp;<SELECT NAME="countryStatus">
			<% 
			    keys = thisMap.keySet().iterator();
			    while(keys.hasNext()) {
						thisKey = (String)keys.next();
						thisValue = (String)thisMap.get(thisKey);
						%>
						<OPTION VALUE="<%= thisKey %>"><%= thisValue %></OPTION>
						<%
					}
			%></SELECT>
			</TD>

			</TD>
		</TR>
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="strategy" CLASS="noborder"> <B>Strategy</B>:</NOBR>
			</TD>
			<% thisMap = ar.getMap("strategy"); %>
			<TD>&nbsp;<SELECT NAME="strategy">
			<% 
			    keys = thisMap.keySet().iterator();
			    while(keys.hasNext()) {
						thisKey = (String)keys.next();
						thisValue = (String)thisMap.get(thisKey);
						%>
						<OPTION VALUE="<%= thisKey %>"><%= thisValue %></OPTION>
						<%
					}
			%></SELECT>
			</TD>

			</TD>
		</TR>
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="role" CLASS="noborder"> <B>Position</B>:</NOBR>
			</TD>	
				<% thisMap = ar.getMap("position"); %>
			<TD>&nbsp;<SELECT NAME="role">
			<% 
			    keys = thisMap.keySet().iterator();
			    while(keys.hasNext()) {
						thisKey = (String)keys.next();
						thisValue = (String)thisMap.get(thisKey);
						%>
						<OPTION VALUE="<%= thisKey %>"><%= thisValue %></OPTION>
						<%
					}
			%></SELECT>
			</TD>

			</TD>
		</TR>
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="region" CLASS="noborder"> <B>Region</B>:</NOBR>
			</TD>
			<% thisMap = ar.getMap("region"); %>
			<TD>&nbsp;<SELECT NAME="region">
			<% 
			    keys = thisMap.keySet().iterator();
			    while(keys.hasNext()) {
						thisKey = (String)keys.next();
						thisValue = (String)thisMap.get(thisKey);
						%>
						<OPTION VALUE="<%= thisKey %>"><%= thisValue %></OPTION>
						<%
					}
			%></SELECT>
			</TD>

			</TD>
		</TR>
<!--		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="country" CLASS="noborder"> <B>Country</B>:</NOBR>
			</TD>
			<TD>&nbsp;<%= mySelectC.print() %></TD>
		</TR>
-->
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="maritalStatus" CLASS="noborder"> <B>Marital Status</B>:</NOBR>
			</TD>	
			<% thisMap = ar.getMap("maritalStatus"); %>
			<TD>&nbsp;<SELECT NAME="maritalStatus">
			<% 
			    keys = thisMap.keySet().iterator();
			    while(keys.hasNext()) {
						thisKey = (String)keys.next();
						thisValue = (String)thisMap.get(thisKey);
						%>
						<OPTION VALUE="<%= thisKey %>"><%= thisValue %></OPTION>
						<%
					}
			%></SELECT>
			</TD>
		</TR>
		<TR>
			<TD><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="jobTitle" CLASS="noborder"> <B>Job Title</B>:</NOBR>
			</TD>
			<% thisMap = ar.getMap("jobTitle"); %>
			<TD>&nbsp;<SELECT NAME="jobTitle">
			<% 
			    keys = thisMap.keySet().iterator();
			    while(keys.hasNext()) {
						thisKey = (String)keys.next();
						thisValue = (String)thisMap.get(thisKey);
						%>
						<OPTION VALUE="<%= thisKey %>"><%= thisValue %></OPTION>
						<%
					}
			%></SELECT>
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="2"><NOBR>
				<INPUT TYPE="checkbox" NAME="queryFields" VALUE="isNewStaff" CLASS="noborder"> <B><SELECT NAME="isNewStaff"><OPTION VALUE="T">Is</OPTION><OPTION VALUE="F">Is not</OPTION></SELECT> new Staff</B></NOBR>
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="2" ALIGN="CENTER">
			  <INPUT CLASS="button" TYPE="submit" VALUE="Next >>">
			</TD>
		</TR>



	</TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>