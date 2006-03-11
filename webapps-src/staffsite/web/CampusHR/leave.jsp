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
	String region = "";
	String accountNo = "";
	String status = "";
	if (staffInfo != null) {
		lastName = (String)staffInfo.get("LastName");
		firstName = (String)staffInfo.get("FirstName");
		preferredName = (String)staffInfo.get("PreferredName");
		middleInitial = (String)staffInfo.get("MiddleInitial");
		spouseFirstName = (String)staffInfo.get("SpouseFirstName");
		accountNo = (String)staffInfo.get("AccountNo");
		ministry = (String)staffInfo.get("Ministry");
		region = (String)staffInfo.get("Region");
		ssn = (String)staffInfo.get("Ssn");
		status = (String)staffInfo.get("CountryStatus");
	}
	if (region.equals("")) {
%>
		<script language="javascript">
		alert("The change you are submitting requires the approval of a regional HR team member. Since your current record does not indicate which region you are serving in, please update your region using the Job Change Form on the previous page. Once that change has been approved and applied, you will be able to submit a leave of absence using this form, and we will be able to forward it to the appropriate regional team for approval.");
		history.go(-1);
		</script>
<%
	}
%>
<HTML>
<HEAD>
<TITLE> Leave of Absence </TITLE>
<SCRIPT LANGUAGE="JavaScript">
<!--
function leaveVerify(form) {
	var isValid = true;

	isValid = verifyInput(document.leaveForm.leaveBeginDay, document.leaveForm.leaveBeginMonth, document.leaveForm.leaveBeginYear, document.leaveForm.leaveEndDay, document.leaveForm.leaveEndMonth, document.leaveForm.leaveEndYear);
	if(!isValid) {
		alert("You must provide the start date and the approximate end date.");
	}

	return isValid;
}
// -->
</SCRIPT>

<%@ include file="hrheader.jspf" %>
<FORM NAME="leaveForm" ACTION="/servlet/HRUpdateController?action=leaveOfAbsence" METHOD="POST" onSubmit="return leaveVerify(leaveForm)">
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Leave of Absence form</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

	<TABLE ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0 WIDTH="98%">
		<TR>
			<TD>
				<B>Name</B>:&nbsp;&nbsp;
			</TD>
			<TD>
				<NOBR><%=lastName%>,&nbsp;<%=preferredName%>&nbsp;<%=middleInitial%>&nbsp;&nbsp;</NOBR>
			</TD>
			<TD ALIGN=CENTER WIDTH="90%">
				<NOBR><!--<B>SSN:</B>&nbsp;<%//ssn.substring(0,3)%>-<%//ssn.substring(3,5)%>-<%//ssn.substring(5,9)%>--></NOBR>
			</TD>
			<TD>
				<NOBR>&nbsp;<B>Account Number</B>:&nbsp;<%=accountNo%></NOBR>
			</TD>
		</TR>
	</TABLE>
<TABLE ALIGN="CENTER" WIDTH="98%" BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR><TD><NOBR><B>Spouse Name</B>:&nbsp;&nbsp;</NOBR></TD><TD><%=spouseFirstName%>&nbsp;&nbsp;</TD><TD WIDTH="90%" ALIGN="CENTER"><B>Ministry</B>:&nbsp;&nbsp;<%=ministry%>&nbsp;</TD><TD><NOBR><B>Location</B>:&nbsp;<%=status%></NOBR></TD></TR>
</TABLE>
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;Leave Information&nbsp;</TD></TR></TABLE>
<CENTER>
	<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=2 CELLSPACING=7>
		<TR>
			<TD WIDTH="80%" CLASS="outline" ALIGN="CENTER">
				<NOBR>Start date:&nbsp;<INPUT TYPE="text" NAME="leaveBeginMonth" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'leaveForm.leaveBeginDay.focus()')">/<INPUT TYPE="text" NAME="leaveBeginDay" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'leaveForm.leaveBeginYear.focus()')">/<INPUT TYPE="text" NAME="leaveBeginYear" SIZE="1" MAXLENGTH="4" onKeyUp="KeyPress(this,event,4,'leaveForm.leaveEndMonth.focus()')">&nbsp;&nbsp;&nbsp;Approximate Ending Date:&nbsp;<INPUT TYPE="text" NAME="leaveEndMonth" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'leaveForm.leaveEndDay.focus()')">/<INPUT TYPE="text" NAME="leaveEndDay" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'leaveForm.leaveEndYear.focus()')">/<INPUT TYPE="text" NAME="leaveEndYear" SIZE="1" MAXLENGTH="4"></NOBR>
			</TD>
			<TD>&nbsp;</TD>
		</TR>
	</TABLE>
	<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=2>
		<TR>
			<TD VALIGN="BOTTOM">
				<NOBR><INPUT TYPE="radio" CLASS="noborder" NAME="leaveReason" value="Family Care"> Family Care Leave (<SPAN CLASS="question">Letter of Explanation</SPAN>)</NOBR><BR>
				<NOBR><INPUT TYPE="radio" CLASS="noborder" NAME="leaveReason" value="Medical"> Medical Leave (<SPAN CLASS="question">Physician's Recommendation</SPAN>)</NOBR>
			</TD>
			<TD>
				<NOBR><INPUT TYPE="radio" CLASS="noborder" NAME="leaveReason" value="Personal" CHECKED> Personal Leave (<SPAN CLASS="question">Letter of Explanation</SPAN>)</NOBR><BR>
				<NOBR><INPUT TYPE="radio" CLASS="noborder" NAME="leaveReason" value="thirtydays"> 30-day Leave&nbsp;&nbsp;<SELECT NAME="leave1Paid" CLASS="small"><OPTION VALUE="true">Paid</OPTION><OPTION VALUE="false">Unpaid</OPTION></SELECT></NOBR><BR>
				<NOBR><INPUT TYPE="radio" CLASS="noborder" NAME="leaveReason" value="admin"> Administrative Leave&nbsp;&nbsp;<SELECT NAME="leave2Paid" CLASS="small"><OPTION VALUE="true">Paid</OPTION><OPTION VALUE="false">Unpaid</OPTION></SELECT></NOBR><BR>
			</TD>
		</TR>
		<TR>
			<TD>&nbsp;</TD><TD><BR>
				<NOBR><INPUT TYPE=CHECKBOX CLASS="noborder" NAME="includeSpouse"> Check if this includes spouse</NOBR>
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="2" CLASS="label"><BR>
			    Please paste the letter of explanation or Physician's Recommendation below.<P ALIGN="CENTER">
				<TEXTAREA NAME="letter" ROWS="10" COLS="60" WRAP="virtual"></TEXTAREA>
			</TD>
		</TR>
	</TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0"><TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" CLASS="button" VALUE="Next >>"></TD></TR></TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>