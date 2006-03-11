<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<%
	Hashtable staffInfo = (Hashtable)session.getValue("staffInfo");
	String lastName = "";
	String firstName = "";
	String preferredName = "";
	String middleInitial = "";
	String ssn = "";
	String spouseFirstName = "";
	String ministry = "";
	String accountNo = "";
	String spouseAccountNo = null;
	String status = "";
	if (staffInfo != null) {
		lastName = (String)staffInfo.get("LastName");
		firstName = (String)staffInfo.get("FirstName");
		preferredName = (String)staffInfo.get("PreferredName");
		middleInitial = (String)staffInfo.get("MiddleInitial");
		spouseFirstName = (String)staffInfo.get("SpouseFirstName");
		accountNo = (String)staffInfo.get("AccountNo");
		spouseAccountNo = (String)staffInfo.get("SpouseAccountNo");
		ministry = (String)staffInfo.get("Ministry");
		ssn = (String)staffInfo.get("Ssn");
		status = (String)staffInfo.get("CountryStatus");
	}
%>
<HTML>
<HEAD>
<TITLE> Forms </TITLE>
<%@ include file="hrheader.jspf" %>
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Personal Information</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="98%">
		<TR>
			<TD>
				<B>Name</B>:&nbsp;&nbsp;
			</TD>
			<TD>
				<NOBR><%=lastName%>,&nbsp;<%=preferredName%>&nbsp;<%=middleInitial%>&nbsp;&nbsp;</NOBR>
			</TD>
			<TD ALIGN=CENTER WIDTH="90%">&nbsp;
				
			</TD>
			<TD>
				<NOBR>&nbsp;<B>Account Number</B>:&nbsp;<%=accountNo%></NOBR>
			</TD>
		</TR>
	</TABLE>
<TABLE ALIGN="CENTER" WIDTH="98%" BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR><TD><NOBR><B>Spouse Name</B>:&nbsp;&nbsp;</NOBR></TD><TD><%=spouseFirstName%>&nbsp;&nbsp;</TD><TD WIDTH="90%" ALIGN="CENTER"><B>Ministry</B>:&nbsp;&nbsp;<%=ministry%>&nbsp;</TD><TD><NOBR><B>Location</B>:&nbsp;<%=status%></NOBR></TD></TR>
</TABLE>
<TABLE WIDTH="100%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;Form Selection</TD></TR><!-- <FORM NAME="addressForm" ACTION="formConfirm.html" METHOD="POST"></FORM> --> </TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=5>
<TR>
	<TD>
		<BLOCKQUOTE>
		<NOBR><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=/ss/pages/EForms/PIU.htm" target="_blank">Address Change Form</A> - Redirects to Staff Services form.</NOBR><BR>
		<NOBR><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=/ss/pages/EForms/PIU.htm" target="_blank">Marriage Form</A> - Redirects to Staff Services form..</NOBR><BR>
		<NOBR><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=/ss/pages/EForms/PIU.htm" target="_blank">Births and Dependent Change Form</A> - Redirects to Staff Services form..</NOBR></BLOCKQUOTE>
		<NOBR><B>Information that requires approval of your HR team</B></NOBR>
		<BLOCKQUOTE>
		<NOBR><A HREF="/CampusHR/job_change1.jsp">Job Change Form</A> - Change your job position within CCCI.</NOBR><BR>
	<% if ((spouseAccountNo != null) && (spouseAccountNo.trim().length() > 0)) { %>
		<NOBR><A HREF="/CampusHR/spouse_job_change1.jsp">Spouse Job Change Form</A> - Change your spouse&#39;s job position within CCCI.</NOBR><BR>
	<% } %>
		<NOBR><A HREF="/CampusHR/leave.jsp">Leave of Absence Form</A> - Medical, Personal, Administrative, and other leaves of absence.</NOBR><BR>
		<NOBR><A HREF="/CampusHR/resignation.jsp">Resignation Form</A> - Submit a resignation.</NOBR></BLOCKQUOTE>
		<NOBR><A HREF="/servlet/StaffController?action=showTools"><I>back to tools page</I></A></NOBR>
	</TD>
</TR>
</TABLE>
</TD></TR></TABLE>

<%@ include file="hrfooter.jspf" %>
</HTML>