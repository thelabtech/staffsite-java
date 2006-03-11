<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<%
  ActionResults ar = ActionResults.getActionResults(session);
	String queryID = ar.getValue("queryID");
%>
<HTML>
<HEAD>
<TITLE> Field Selection </TITLE>
<%@ include file="hrheader.jspf" %>
<CENTER>
<FORM NAME="fieldForm" ACTION="/servlet/HRQueryController">
<INPUT TYPE="HIDDEN" NAME="action" VALUE="executeQuery">
<INPUT TYPE="HIDDEN" NAME="queryID" VALUE="<%= queryID %>">
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD ALIGN="CENTER">
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Select Fields to Display</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="98%">
		<TR>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="name" CLASS="noborder" CHECKED> <B>Name</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="primaryAddress" CLASS="noborder"> <B>Primary Address</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="jobTitle" CLASS="noborder" CHECKED> <B>Job Title</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="ministry" CLASS="noborder"> <B>Ministry</B>
			</TD>
		</TR>
		<TR>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="gender" CLASS="noborder"> <B>Gender</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="secondaryAddress" CLASS="noborder"> <B>Secondary Address</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="deptName" CLASS="noborder"> <B>Team</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="strategy" CLASS="noborder"> <B>Strategy</B>
			</TD>
		</TR>
		<TR>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="accountNo" CLASS="noborder"> <B>Account Number</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="homePhone" CLASS="noborder" CHECKED> <B>Home Phone</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="isNewStaff" CLASS="noborder"> <B>Is New Staff?</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="birthDate" CLASS="noborder"> <B>Birth Date</B>
			</TD>
		</TR>
		<TR>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="reportingDate" CLASS="noborder"> <B>Reporting Date</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="workPhone" CLASS="noborder"> <B>Work Phone</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="jobStatus" CLASS="noborder"> <B>Status</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="marriageDate" CLASS="noborder"> <B>Marriage Date</B>
			</TD>
		</TR>
		<TR>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="email" CLASS="noborder"> <B>E-mail Address</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="mobilePhone" CLASS="noborder"> <B>Mobile Phone</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="position" CLASS="noborder"> <B>Position</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="region" CLASS="noborder"> <B>Region</B>
			</TD>
		</TR>
		<TR>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="spouseInfo" CLASS="noborder"> <B>Spouse/Fiancee Information</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="otherPhone" CLASS="noborder"> <B>Pager/Fax/Other Phone</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="maritalStatus" CLASS="noborder"> <B>Marital Status</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="countryCode" CLASS="noborder"> <B>Country Code</B>
			</TD>
		</TR>
		<TR>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="isEmailSecure" CLASS="noborder"> <B>Is E-mail Secure?</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="serviceDate" CLASS="noborder"> <B>Date of Hire</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="countryStatus" CLASS="noborder"> <B>Country Status</B>
			</TD>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="loaDates" CLASS="noborder"> <B>Leave of Absence Dates</B>
			</TD>
		</TR>
		<TR>
			<TD>
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="hireDates" CLASS="noborder"> <B>Hire/Rehire Date</B>
			</TD>
			<TD COLSPAN="3">
				<INPUT TYPE="checkbox" NAME="showFields" VALUE="newStaffTrainingDate" CLASS="noborder"> <B>New Staff Training Date</B>
			</TD>
		</TR>
	</TABLE>
	<INPUT TYPE="submit" CLASS="button" VALUE="Search">
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>