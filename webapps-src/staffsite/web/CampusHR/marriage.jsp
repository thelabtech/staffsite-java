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
	String status = "";
	boolean isMale = true;
	if (staffInfo != null) {
		lastName = (String)staffInfo.get("LastName");
		firstName = (String)staffInfo.get("FirstName");
		preferredName = (String)staffInfo.get("PreferredName");
		middleInitial = (String)staffInfo.get("MiddleInitial");
		spouseFirstName = (String)staffInfo.get("SpouseFirstName");
		accountNo = (String)staffInfo.get("AccountNo");
		ministry = (String)staffInfo.get("Ministry");
		ssn = (String)staffInfo.get("Ssn");
		isMale = ((Boolean)staffInfo.get("IsMale")).booleanValue();
		status = (String)staffInfo.get("CountryStatus");
	}
%>
<HTML>
<HEAD>
<TITLE> Marriage </TITLE>
<SCRIPT LANGUAGE="JavaScript">
<!--
function weddingVerify() {
	var isValid = true;

	isValid = verifyInput(document.marriageForm.fianceeLast, document.marriageForm.fianceeFirst, document.marriageForm.wifeLast, document.marriageForm.wifeFirst, document.marriageForm.weddingMonth, document.marriageForm.weddingDay, document.marriageForm.weddingYear);
	if(!isValid) {
		alert("You must provide the fiancé(e)'s first and last name, the wife's new name, and the wedding date.");
	}
	if(document.marriageForm.fianceeIsUs[0].checked)  {
		var str=document.marriageForm.fianceeAccountNo.value
		if(str.length != 9)
		{	alert("You must enter a 9 digit account number.  \nTo turn your 7 digit number into 9 digits, add 2 0s to the front of it.");
			isValid = false;
		}
	} else if (document.marriageForm.fianceeIsUs[1].checked)  {
		isValid = verifyInput(document.marriageForm.fianceeStaffMonth, document.marriageForm.fianceeStaffDay, document.marriageForm.fianceeStaffYear);
		if(isValid == false) {
			alert("You must provide the date that he/she will join staff.");
		}	
	}
	if(document.marriageForm.fianceeIsNat[0].checked == false && document.marriageForm.fianceeIsNat[1].checked == false)
	{	alert("Please select wether or not your fiancee is National Staff.");
		isValid = false;
	}
	if(document.marriageForm.joinNat[0].checked == false && document.marriageForm.joinNat[1].checked == false)
	{	alert("Please select wether or not you are joining National Staff.");
		isValid = false;
	}
	return isValid;
}

function monthKeyUp()
{	if(document.marriageForm.fianceeStaffMonth.value.length > 0)
	{  document.marriageForm.fianceeIsUs[1].click();  }
	if(document.marriageForm.fianceeStaffMonth.value.length == 2)  
	{  document.marriageForm.fianceeStaffDay.focus();  }
}
// -->
</SCRIPT>
<%@ include file="hrheader.jspf" %>
<FORM NAME="marriageForm" ACTION="/servlet/HRUpdateController?action=maritalStatusChangeRequest" METHOD="post" onSubmit="return weddingVerify()">
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Marriage form</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

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
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;Marriage Information</TD></TR></TABLE>
	<TABLE WIDTH="98%" CELLPADDING=0 CELLSPACING=0>
		<TR>
			<TD>
				<NOBR>&nbsp;Fiancé(e):&nbsp;</NOBR>
			</TD>
			<TD>
				<INPUT TYPE="text" SIZE="20" NAME="fianceeLast">&nbsp;
			</TD>
			<TD>
				<INPUT TYPE="text" SIZE="10" NAME="fianceeFirst">&nbsp;
			</TD>
			<TD WIDTH="90%">
				<INPUT TYPE="text" SIZE="1" MAXLENGTH="1" NAME="fianceeMiddle">&nbsp;
			</TD>
			<TD>
				<NOBR>Wedding Date:&nbsp;</NOBR>
			</TD>
			<TD>
				<NOBR><INPUT TYPE="text" NAME="weddingMonth" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'marriageForm.weddingDay.focus()')">/<INPUT TYPE="text" NAME="weddingDay" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'marriageForm.weddingYear.focus()')">/<INPUT TYPE="text" NAME="weddingYear" SIZE="1" MAXLENGTH="4" onKeyUp="KeyPress(this,event,4,'marriageForm.wifeLast.focus()')"></NOBR>
			</TD>
		</TR>
		<TR>
			<TD></TD>
			<TD CLASS="label">Last</TD>
			<TD CLASS="label">First</TD>
			<TD CLASS="label">M.I.</TD>
			<TD></TD>
			<TD ALIGN="CENTER" CLASS="label">MM/DD/YYYY</TD>
		</TR>
		<TR>
			<TD></TD>
			<TD COLSPAN="5" ALIGN="RIGHT"><B>The wedding date requires approval of your regional HR director and local director.</B></TD>
		</TR>
		<TR>
			<TD>
				<NOBR>&nbsp;Wife's Married Name:&nbsp;</NOBR>
			</TD>
			<TD>
				<INPUT TYPE="text" SIZE="20" NAME="wifeLast">&nbsp;
			</TD>
			<TD>
				<% if (isMale) {%>
				<INPUT TYPE="text" SIZE="10" NAME="wifeFirst">&nbsp;
				<% } 
				else { %>
				<INPUT TYPE="text" SIZE="10" NAME="wifeFirst" VALUE="<%=firstName%>">&nbsp;
				<% } %>
			</TD>
			<TD>
				<% if (isMale) {%>
				<INPUT TYPE="text" SIZE="1" MAXLENGTH="1" NAME="wifeMiddle">&nbsp;
				<% } else { %>
				<INPUT TYPE="text" SIZE="1" MAXLENGTH="1" NAME="wifeMiddle" VALUE="<%=middleInitial%>">&nbsp;
				<% } %>
			</TD>
			<TD COLSPAN="2"></TD>
		</TR>
		<TR>
			<TD></TD>
			<TD CLASS="label">Last</TD>
			<TD CLASS="label">First</TD>
			<TD CLASS="label">M.I.</TD>
			<TD COLSPAN="2"></TD>
		</TR>
	</TABLE>
	<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD>
			&nbsp;Is your fiancé(e) U.S. Campus Crusade Staff?<BR>
		</TD>
		<TD></TD>
	</TR>
	<TR>
		<TD>
			<INPUT TYPE="radio" CLASS="noborder" NAME="fianceeIsUs" VALUE="true">&nbsp;Yes - 9 digit Account Number:&nbsp;<INPUT TYPE="text" NAME="fianceeAccountNo" SIZE="10" MAXLENGTH="10" onKeyUp="fianceeIsUs[0].click()"><BR>
			<INPUT TYPE="radio" CLASS="noborder" NAME="fianceeIsUs" VALUE="false">&nbsp;No - Indicate date he/she will join staff:&nbsp;
			<NOBR><INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="fianceeStaffMonth" onKeyUp="monthKeyUp()">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="fianceeStaffDay" onKeyUp="KeyPress(this,event,2,'marriageForm.fianceeStaffYear.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="4" NAME="fianceeStaffYear"></NOBR>
		</TD>
		<TD>
			&nbsp;&nbsp;Is your fiancé(e) National Staff?&nbsp;&nbsp;<INPUT TYPE="radio" CLASS="noborder" NAME="fianceeIsNat" VALUE="true"> Yes&nbsp&nbsp;<INPUT TYPE="radio" CLASS="noborder" NAME="fianceeIsNat" VALUE="false"> No<BR>
			&nbsp;&nbsp;Are you joining National Staff?&nbsp;&nbsp;<INPUT TYPE="radio" CLASS="noborder" NAME="joinNat" VALUE="true"> Yes&nbsp&nbsp;<INPUT TYPE="radio" CLASS="noborder" NAME="joinNat" VALUE="false"> No
		</TD>
	</TR>
</TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0"><TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" CLASS="button" VALUE="Next >>">&nbsp;</TD></TR></TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>