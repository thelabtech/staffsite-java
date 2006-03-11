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
	Hashtable regionLookup = new Hashtable();
	regionLookup.put("NE", "Northeast");
	regionLookup.put("MA", "Mid-Atlantic");
	regionLookup.put("MS", "MidSouth");
	regionLookup.put("SE", "Southeast");
	regionLookup.put("GL", "Great Lakes");
	regionLookup.put("UM", "Upper Midwest");
	regionLookup.put("GP", "Great Plains");
	regionLookup.put("RR", "Red River");
	regionLookup.put("NW", "Greater Northwest");
	regionLookup.put("SW", "Pacific Southwest");
	regionLookup.put("NC", "National Campus Office");
	regionLookup.put("IN", "Impact National Office");
	
%>



<HTML>
<HEAD>
<TITLE> Resignation </TITLE>
<SCRIPT LANGUAGE="JavaScript">
<!--
function resignVerify(form) {
	var isValid = true;
	
	isValid = verifyInput(document.resignForm.resignDay, document.resignForm.resignMonth, document.resignForm.resignYear);
	if(!isValid) {
		alert("You must provide the date of your resignation.");
	}
	else {
		isValid = (isValid && (document.resignForm.resignReason[0].checked || document.resignForm.resignReason[1].checked || document.resignForm.resignReason[2].checked || document.resignForm.resignReason[3].checked || document.resignForm.resignReason[4].checked || document.resignForm.resignReason[5].checked || document.resignForm.resignReason[6].checked || document.resignForm.resignReason[7].checked));
		if(!isValid) {
			alert("You must choose at least one reason for resignation.");
		}
	}

	isValid = (isValid && verifyInput(document.resignForm.keepSupport));
	if (!isValid) {
		alert("Are you keeping your support team?");
	}
		
<%
if(region==null||region.equals(""))
{		
%>
	isValid = (isValid && verifyInput(document.resignForm.newRegion));
	if (!isValid) {
		alert("You must select your region.");
	}
<%
}
%>
	return isValid;
}
// -->
</SCRIPT>

<%@ include file="hrheader.jspf" %>
<FORM NAME="resignForm" ACTION="/servlet/HRUpdateController?action=resignation" METHOD="POST" onSubmit="return resignVerify(resignForm)">
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>
<input type="hidden" name="contribute" value="No">
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Resignation form</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

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
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;Resignation Information&nbsp;</TD></TR></TABLE>
<CENTER>
	<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<TR>
			<TD>
				<NOBR>&nbsp;Last day of employment:&nbsp;<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="resignMonth" onKeyUp="KeyPress(this,event,2,'resignForm.resignDay.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="resignDay" onKeyUp="KeyPress(this,event,2,'resignForm.resignYear.focus()')">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="4" NAME="resignYear"></NOBR><BR>
				&nbsp;Severance pay requested: <SELECT NAME="severance" CLASS="small">
					<OPTION VALUE="0">none</OPTION>
					<OPTION VALUE="1">1 month</OPTION>
					<OPTION VALUE="2">2 months</OPTION>
					<OPTION VALUE="3">3 months</OPTION>
					</SELECT>
			</TD>
			<TD><NOBR>&nbsp;&nbsp;Reason(s) for leaving staff:</NOBR></TD>
			<TD CLASS="small">
				<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Seminary school"> Attend seminary/school</NOBR><BR>
				<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Job change"> Desired job change</NOBR><BR>
				<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Going Associate"> Going Associate</NOBR>
			</TD>
			<TD CLASS="small" VALIGN="top">
				<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Marriage"> Marriage</NOBR><BR>
				<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Other Ministry"> Other Ministry</NOBR><BR>
				<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Support"> Support</NOBR>
			</TD>
		</TR>
		<TR>
			<TD COLSPAN="2" VALIGN="top">&nbsp;Will staff member be keeping his/her support team?
				<SELECT NAME="keepSupport" CLASS="small">
					<OPTION VALUE=""></OPTION>
					<OPTION VALUE="Y">Yes</OPTION>
					<OPTION VALUE="N">No</OPTION>
					</SELECT>
				
			</TD>
			<TD CLASS="small">
			<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Health Reasons"> Health Reasons<BR>
			<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Dissatisfaction with CCC"> Dissatisfaction with CCC<BR>
			</TD>
			<TD CLASS="small" VALIGN="top">
				<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="Family Reasons"> Family Reasons<BR>
				<!--<NOBR><INPUT TYPE="checkbox" CLASS="noborder" NAME="resignReason" VALUE="OtherReason"> Other:<INPUT TYPE="text" SIZE="20" CLASS="small" NAME="otherReason">-->
			</TD>
		</TR>
	</TABLE>
	<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0>
		<TR>
			<SPAN CLASS="small"><BR><NOBR>&nbsp;To process this request Personnel Records must receive a copy of the <SPAN CLASS="question">letter of explanation</SPAN> the staff member sent to his/her ministry partners.</NOBR></SPAN>
			</TD>
		</TR>
		<TR><TD ALIGN="CENTER">
			<TEXTAREA NAME="letter" ROWS="10" COLS="60" WRAP="virtual"></TEXTAREA>
		</TD></TR>
		<%
			if(region==null||region.equals(""))
			{
		%>
				<TR>
				<TD>&nbsp;Please select your region:
					<SELECT NAME="newRegion" CLASS="small">
					<OPTION VALUE=""></OPTION>
					<OPTION VALUE="NC">National Campus Office</OPTION>
					<OPTION VALUE="NE">Northeast</OPTION>
					<OPTION VALUE="NW">Greater Northwest</OPTION>
					<OPTION VALUE="MA">Mid-Atlantic</OPTION>
					<OPTION VALUE="MS">MidSouth</OPTION>
					<OPTION VALUE="UM">Upper Midwest</OPTION>
					<OPTION VALUE="GL">Great Lakes</OPTION>
					<OPTION VALUE="GP">Great Plains</OPTION>
					<OPTION VALUE="SW">Pacific Southwest</OPTION>
					<OPTION VALUE="SE">Southeast</OPTION>
					<OPTION VALUE="RR">Red River</OPTION>
				</SELECT>
				</TD>
				</TR>
		<%
			}
		%>
		
	</TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0"><TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" CLASS="button" VALUE="Next >>"></TD></TR></TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>