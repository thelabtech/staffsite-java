<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<%
ActionResults ar = ActionResults.getActionResults(session);	
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
		<NOBR><B>Personal Information</B></NOBR>
		<BLOCKQUOTE>
		<NOBR><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=/ss/pages/EForms/PIU.htm" target="_blank">Address Change Form</A> - Redirects to Staff Services form.</NOBR><BR>
		<NOBR><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=/ss/pages/EForms/PIU.htm" target="_blank">Marriage Form</A> - Redirects to Staff Services form..</NOBR><BR>
		<NOBR><A HREF="https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=/ss/pages/EForms/PIU.htm" target="_blank">Births and Dependent Change Form</A> - Redirects to Staff Services form..</NOBR></BLOCKQUOTE>
		<NOBR><B>Information that requires approval of your HR team</B></NOBR>
		<BLOCKQUOTE>
		
		For job-related changes such as relocation, regional transfer, strategy, status or job description change, please contact your region's HR approver.<br><br> 
		The exception is Missional Team assignment.<br><br>
		To add yourself to a Missional Team, navigate to the Missional Team's display page 
		in the <A HREF="/servlet/InfoBaseController">InfoBase</A>. Click the link that says
		"Join this Missional Team"  and you will become a member of that team, along with your current teams.<br><br>
		
		To remove yourself from a Missional Team, click the red "X" beside its name <br>
		on your <A HREF="/servlet/StaffController?action=showHome">staff homepage</A>, 
		the <A HREF="/servlet/InfoBaseController">InfoBase</A> home page or your 
		<A HREF="/servlet/InfoBaseController?action=showPersonInfo&accountNo=<%=accountNo%>&personID=<%=ar.getValue("personID") %>">personal info</A> page.<br><br>
		
		<NOBR><A HREF="/servlet/StaffController?action=showTools"><I>Jump to Tools page</I></A></NOBR><br>
	</TD>
</TR>
</TABLE>
</TD></TR></TABLE>

<%@ include file="hrfooter.jspf" %>
</HTML>