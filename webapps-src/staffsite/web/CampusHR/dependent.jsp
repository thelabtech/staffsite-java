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
	String status ="";
	Collection dependents = null;
	if (staffInfo != null) {
		lastName = (String)staffInfo.get("LastName");
		firstName = (String)staffInfo.get("FirstName");
		preferredName = (String)staffInfo.get("PreferredName");
		middleInitial = (String)staffInfo.get("MiddleInitial");
		spouseFirstName = (String)staffInfo.get("SpouseFirstName");
		accountNo = (String)staffInfo.get("AccountNo");
		ministry = (String)staffInfo.get("Ministry");
		ssn = (String)staffInfo.get("Ssn");
		status = (String)staffInfo.get("CountryStatus");
		dependents = (Collection)staffInfo.get("dependents");
	}
%>
<HTML>
<HEAD>
<TITLE> Births and Dependent Changes </TITLE>
<SCRIPT LANGUAGE="JavaScript">
<!--
function childVerify(form) {
	var isValid = (document.childForm.ineligibleDep.checked || document.childForm.newChild.checked);

	if(!isValid) {
		alert("You must choose one or more actions.");
	}

	if(isValid && document.childForm.newChild.checked) {
		isValid = verifyInput(document.childForm.childLast, document.childForm.childFirst, document.childForm.childBirthMonth, document.childForm.childBirthDay, document.childForm.childBirthYear);
		isValid = (isValid && (document.childForm.childGender[0].checked || document.childForm.childGender[1].checked));	if(!isValid) {
		  alert("You must provide the child's first name, last name, gender, and birth date.");
		}
	}

	if(isValid && document.childForm.ineligibleDep.checked) {

		isValid = verifyInput(document.childForm.dependentName);
		if(!isValid) {
			alert("You must provide the dependent's name.");
		}

		if(isValid) {
			isValid = (isValid && (document.childForm.ineligibleReason[0].checked || document.childForm.ineligibleReason[1].checked));
			if(!isValid) {
				alert("You must select a reason why this child is no longer eligible.");
			}
		}

		if(isValid) {
			if(document.childForm.ineligibleReason[0].checked) {
				isValid = (isValid && verifyInput(document.childForm.notStudentMonth, document.childForm.notStudentDay, document.childForm.notStudentYear));
			}
			if(document.childForm.ineligibleReason[1].checked) {
				isValid = (isValid && verifyInput(document.childForm.tooOldMonth, document.childForm.tooOldDay, document.childForm.tooOldYear));
			}
			if(!isValid) {
				alert("Please enter the date this child becomes / became ineligible.");
			}
		}
	}
	return isValid;
}
// -->
</SCRIPT>

<%@ include file="hrheader.jspf" %>
<FORM NAME="childForm" ACTION="/servlet/HRUpdateController?action=dependentChangeRequest" METHOD="POST" onSubmit="return childVerify(childForm)">
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Births and Dependents form</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

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
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;New Dependent Information</TD></TR></TABLE>
	<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<TR>
			<TD>
				<NOBR>&nbsp;&nbsp;<INPUT TYPE="checkbox" class="noborder" NAME="newChild" VALUE="true"> New child:</NOBR>
			</TD>
			<TD>
				<INPUT TYPE="text" SIZE="20" NAME="childLast">&nbsp;
			</TD>
			<TD>
				<INPUT TYPE="text" SIZE="10" NAME="childFirst">&nbsp;
			</TD>
			<TD WIDTH="90%">
				<INPUT TYPE="text" SIZE="10" NAME="childMiddle">&nbsp;
			</TD>
			<TD>
				<NOBR><INPUT TYPE="radio" CLASS="noborder" NAME="childGender" value="M"> Male&nbsp;&nbsp;<INPUT TYPE="radio" CLASS="noborder" NAME="childGender" value="F">Female&nbsp;&nbsp;&nbsp;Birthdate:&nbsp;
			</TD>
			<TD>
				<NOBR><INPUT TYPE="text" NAME="childBirthMonth" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'childForm.childBirthDay.focus()')">/<INPUT TYPE="text" NAME="childBirthDay" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'childForm.childBirthYear.focus()')">/<INPUT TYPE="text" NAME="childBirthYear" SIZE="1" MAXLENGTH="4"></NOBR>
			</TD>
		</TR>
		<TR>
			<TD></TD>
			<TD CLASS="label">&nbsp;Last</TD>
			<TD CLASS="label">&nbsp;First</TD>
			<TD CLASS="label">&nbsp;Middle</TD>
			<TD></TD>
			<TD CLASS="label" ALIGN="CENTER">MM/DD/YYYY</TD>
		</TR>
	</TABLE>
	<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0" CELLPADDING=0 CELLSPACING=0>
		<TR>
			<TD COLSPAN="2">
				<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;New number of children:&nbsp;<INPUT TYPE="text" NAME="numChildren" SIZE="1" MAXLENGTH="2" VALUE="<% // = dependents.size() + 1 %>">&nbsp;&nbsp;</NOBR>
			</TD>
		</TR>
		<TR>
			<TD>
				<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If the child is adopted, please indicate the date the child was placed in the home:&nbsp;</NOBR>
			</TD>
			<TD ALIGN="LEFT" WIDTH="90%">
				<NOBR><INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="childHomeMonth" onKeyUp="KeyPress(this,event,2,'childForm.childHomeDay.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="childHomeDay" onKeyUp="KeyPress(this,event,2,'childForm.childHomeYear.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="4" NAME="childHomeYear"></NOBR>
			</TD>
		</TR>
		<TR>
			<TD></TD>
			<TD CLASS="label">&nbsp;</TD>
		</TR>
	</TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0" CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD>
			<INPUT TYPE="checkbox" NAME="ineligibleDep" VALUE="TRUE" CLASS="noborder">&nbsp;My Dependent, <SELECT NAME="dependentName">
			<% Iterator depI = dependents.iterator();
					while(depI.hasNext()) {
						Hashtable thisDependent = (Hashtable)depI.next();
						out.print("<OPTION VALUE=\"" + thisDependent.get("FirstName") + "\">" + thisDependent.get("FirstName") + "</OPTION>\n");
					}
			%></SELECT>, is no longer eligible for medical/dental coverage because he/she is:<BR><CENTER>
			<TABLE WIDTH="80%" BORDER="0" ALIGN="CENTER"><TR><TD>
				<INPUT TYPE="radio" CLASS="noborder" NAME="ineligibleReason" VALUE="No longer student"> 19 or older and no longer enrolled as a full time student as of <INPUT TYPE="text" NAME="notStudentMonth" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'childForm.notStudentDay.focus()')">/<INPUT TYPE="text" NAME="notStudentDay" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'childForm.notStudentYear.focus()')">/<INPUT TYPE="text" NAME="notStudentYear" SIZE="1" MAXLENGTH="4"><BR>
				<INPUT TYPE="radio" CLASS="noborder" NAME="ineligibleReason" VALUE="Older than 26"> a full time college student who turns 26 as of <INPUT TYPE="text" NAME="tooOldMonth" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'childForm.tooOldDay.focus()')">/<INPUT TYPE="text" NAME="tooOldDay" SIZE="1" MAXLENGTH="2" onKeyUp="KeyPress(this,event,2,'childForm.tooOldYear.focus()')">/<INPUT TYPE="text" NAME="tooOldYear" SIZE="1" MAXLENGTH="4">
				</TD></TR>
			</TABLE>
			</CENTER>
		</TD>
	</TR>
</TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0"><TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" CLASS="button" VALUE="Next >>">&nbsp;</TD></TR></TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>