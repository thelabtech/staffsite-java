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
	String spouseMinistry = "";
	String accountNo = "";
	String jobStatus = "";
	String status = "";
	String region = "";
	String strategy = "";
	if (staffInfo != null) {
		lastName = (String)staffInfo.get("LastName");
		firstName = (String)staffInfo.get("FirstName");
		preferredName = (String)staffInfo.get("PreferredName");
		middleInitial = (String)staffInfo.get("MiddleInitial");
		spouseFirstName = (String)staffInfo.get("SpouseFirstName");
		accountNo = (String)staffInfo.get("AccountNo");
		ministry = (String)staffInfo.get("Ministry");
		spouseMinistry = (String)staffInfo.get("SpouseMinistry");
		ssn = (String)staffInfo.get("Ssn");
		region = (String)staffInfo.get("SpouseRegion");
		strategy = (String)staffInfo.get("SpouseStrategy");
		jobStatus = (String)staffInfo.get("SpouseJobStatus");
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
<SCRIPT LANGUAGE="JavaScript">
<!--
function jobVerify(form) {
	var isValid = true;
	if(document.jobChangeForm1.ministryChange.checked && document.jobChangeForm1.newMinistry.value == "") {
		isValid = false;
		alert("You must choose a new ministry.");
	}

	if(isValid && document.jobChangeForm1.statusChange.checked) {
		if(document.jobChangeForm1.newStatus[0].checked && document.jobChangeForm1.statusMenu.value == "") {
			isValid = false;
			alert("You must choose a new status.");
		}
		if(document.jobChangeForm1.newStatus[1].checked && document.jobChangeForm1.statusOther.value == "") {
			isValid = false;
			alert("You must provide a new status.");
		}
	}

	if(isValid && document.jobChangeForm1.regionChange.checked && document.jobChangeForm1.newRegion.value == "") {
		isValid = false;
		alert("You must choose a new region.");
	}

	if(isValid && document.jobChangeForm1.laneChange.checked && document.jobChangeForm1.newLane.value == ""){
		isValid = false;
		alert("You must choose a new strategy.");
	}
	return isValid;
}
-->
</SCRIPT>
<TITLE>Spouse Job Change - Step 1 </TITLE>
<%@ include file="hrheader.jspf" %>
<FORM NAME="jobChangeForm1" ACTION="/servlet/HRUpdateController?action=getTeamList&spouse=true" METHOD="POST" onSubmit="return jobVerify(document.jobChangeForm1)">
<INPUT TYPE="hidden" NAME="region" VALUE="<%=region%>">
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Spouse Job Change form</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

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
<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;Position Change Information&nbsp;</TD><TD CLASS="div" ALIGN="RIGHT">&nbsp;<I>Please check the box for the appropriate category(ies) you desire to update or correct.</TD></TR></TABLE>
	<CENTER>
	<TABLE ALIGN="CENTER" WIDTH="98%" BORDER=0>
	<TR>
		<TD>
			<NOBR>Change effective: <INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="jobChangeMonth" onKeyUp="KeyPress(this,event,2,'jobChangeForm1.jobChangeDay.focus()')" VALUE="<%= Calendar.getInstance().get(Calendar.MONTH) + 1%>">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="jobChangeDay" onKeyUp="KeyPress(this,event,2,'jobChangeForm1.jobChangeYear.focus()')" VALUE="<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH) + 1%>">/<INPUT TYPE="text" SIZE="1" MAXLENGTH="4" NAME="jobChangeYear" VALUE="<%= Calendar.getInstance().get(Calendar.YEAR)%>"></NOBR>
		</TD>
		<TD WIDTH="40%" ALIGN="CENTER" CLASS="header">
			FROM
		</TD>
		<TD WIDTH="40%" ALIGN="CENTER" CLASS="header">
			TO
		</TD>
	</TR>
	<TR>
		<TD CLASS="outline"><INPUT TYPE="checkbox" CLASS="noborder" NAME="ministryChange" VALUE="true"><B>Ministry</B></TD>
		<TD CLASS="outline" ALIGN="CENTER"><%=spouseMinistry%>&nbsp;</TD>
		<TD CLASS="outline" ALIGN="CENTER"><SELECT NAME="newMinistry" CLASS="small">
			<OPTION VALUE=""></OPTION>
<OPTION VALUE="Agape International Training">Agape International Training</OPTION>
<OPTION VALUE="André Kole Ministry">André Kole Ministry</OPTION>
<OPTION VALUE="Arrowhead Conference and Events">Arrowhead Conference and Events</OPTION>
<OPTION VALUE="Arrowhead Productions International">Arrowhead Productions International</OPTION>
<OPTION VALUE="Athletes in Action">Athletes in Action</OPTION>
<OPTION VALUE="Campus">Campus Ministry</OPTION>
<OPTION VALUE="Christian Embassy, D.C.">Christian Embassy, D.C.</OPTION>
<OPTION VALUE="Christian Embassy, N.Y.">Christian Embassy, N.Y.</OPTION>
<OPTION VALUE="ChurchLIFE">ChurchLIFE</OPTION>
<OPTION VALUE="Computer Services">Computer Services</OPTION>
<OPTION VALUE="Disciplemakers International">Disciplemakers International</OPTION>
<OPTION VALUE="Dr. Henry Cloud Answers for Life">Dr. Henry Cloud Answers for Life</OPTION>
<OPTION VALUE="ESC Media">ESC Media</OPTION>
<OPTION VALUE="EveryStudent.com">EveryStudent.com</OPTION>
<OPTION VALUE="Executive Ministries">Executive Ministries</OPTION>
<OPTION VALUE="Faculty Commons">Faculty Commons</OPTION>
<OPTION VALUE="FamilyLife">FamilyLife</OPTION>
<OPTION VALUE="Global Resources">Global Resources</OPTION>
<OPTION VALUE="GoCCC">GoCCC</OPTION>
<OPTION VALUE="Here's Life Inner City">Here's Life Inner City</OPTION>
<OPTION VALUE="Intercultural Resources">Intercultural Resources</OPTION>
<OPTION VALUE="Integrated Resources">Integrated Resources</OPTION>
<OPTION VALUE="International">International Ministry</OPTION>
<OPTION VALUE="International School of Theology">International School of Theology</OPTION>
<OPTION VALUE="Jacksonville Florida Ministries">Jacksonville Florida Ministries</OPTION>
<OPTION VALUE="The JESUS Film Project">The JESUS Film Project</OPTION>
<OPTION VALUE="The JESUS Video Project">The JESUS Video Project</OPTION>
<OPTION VALUE="Josh McDowell Ministry">Josh McDowell Ministry</OPTION>
<OPTION VALUE="Keynote Communications">Keynote Communications</OPTION>
<OPTION VALUE="The King's College">The King's College</OPTION>
<OPTION VALUE="Lake Hart Campus">Lake Hart Campus</OPTION>
<OPTION VALUE="Leadership University">Leadership University</OPTION>
<OPTION VALUE="Life Builders">Life Builders</OPTION>
<OPTION VALUE="The Lighthouse Report">The Lighthouse Report</OPTION>
<OPTION VALUE="LINC-Net">LINC-Net</OPTION>
<OPTION VALUE="The Macedonian Project">The Macedonian Project</OPTION>
<OPTION VALUE="Medical Strategic Network">Medical Strategic Network</OPTION>
<OPTION VALUE="Military Ministry">Military Ministry</OPTION>
<OPTION VALUE="New Life Publications">New Life Publications</OPTION>
<OPTION VALUE="New Life Resources">New Life Resources</OPTION>
<OPTION VALUE="The Orlando Institute">The Orlando Institute</OPTION>
<OPTION VALUE="Prayerworks">Prayerworks</OPTION>
<OPTION VALUE="Priority Associates">Priority Associates</OPTION>
<OPTION VALUE="Promises">Promises</OPTION>
<OPTION VALUE="See You After the Pole">See You After the Pole</OPTION>
<OPTION VALUE="Silk Road">Silk Road</OPTION>
<OPTION VALUE="Single Life Resources">Single Life Resources</OPTION>
<OPTION VALUE="SOLO - Singles Offering Life to Others">SOLO - Singles Offering Life to Others</OPTION>
<OPTION VALUE="Student LINC">Student LINC</OPTION>
<OPTION VALUE="Student Venture">Student Venture</OPTION>
<OPTION VALUE="VITAL LINC">VITAL LINC</OPTION>
<OPTION VALUE="Women Today International">Women Today International</OPTION>
<OPTION VALUE="World Headquarters Opportunities">World Headquarters Opportunities</OPTION>
<OPTION VALUE="WorldLINC">WorldLINC</OPTION>
<OPTION VALUE="Worldwide Challenge Magazine">Worldwide Challenge Magazine</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD CLASS="outline"><INPUT TYPE="checkbox" CLASS="noborder" NAME="statusChange" VALUE="true"><B>Status</B></TD>
		<TD CLASS="outline" ALIGN="CENTER"><%=jobStatus%>&nbsp;</TD>
		<TD CLASS="outline" ALIGN="CENTER">
			<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0>

			<TR>
				<TD CLASS="small">
					<INPUT CLASS="noborder" TYPE="radio" NAME="newStatus" VALUE="statusMenu" CHECKED>
					<SELECT NAME="statusMenu" CLASS="small">
					<OPTION VALUE=""></OPTION>
					<OPTION VALUE="Full-time Staff">Full-time Staff</OPTION>
					<OPTION VALUE="Associate Staff">Associate Staff</OPTION>
					<OPTION VALUE="Seminary Staff">Seminary Staff</OPTION>
					<OPTION VALUE="Hourly/Salaried">Hourly/Salaried</OPTION>
					<OPTION VALUE="Volunteer">Volunteer</OPTION>
					<OPTION VALUE="Affiliate">Affiliate</OPTION>
					<OPTION VALUE="STINT/Intern">STINT/Intern</OPTION>
					<OPTION VALUE="New Staff - MPD">New Staff - MPD</OPTION>
					</SELECT>
				</TD>
			</TR>
			<TR>
				<TD COLSPAN="2" CLASS="small">
					<INPUT CLASS="noborder" TYPE="radio" NAME="newStatus" VALUE="statusOther">Other: <INPUT CLASS="small" TYPE="text" NAME="statusOther" SIZE="15">
				</TD>
			</TR>
			</TABLE>

		</TD>
	</TR>
	<TR>
		<TD CLASS="outline"><INPUT TYPE="checkbox" CLASS="noborder" NAME="regionChange" VALUE="true"><B>Region</B></TD>
		<TD CLASS="outline" ALIGN="CENTER"><%=(String)regionLookup.get(region)%>&nbsp;</TD>
		<TD CLASS="outline" ALIGN="CENTER"><SELECT NAME="newRegion" CLASS="small">
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
	<TR>
		<TD CLASS="outline"><INPUT TYPE="checkbox" CLASS="noborder" NAME="laneChange" VALUE="true"><B>Strategy</B></TD>
		<TD CLASS="outline" ALIGN="CENTER"><%=strategy%>&nbsp;</TD>
		<TD CLASS="outline" ALIGN="CENTER"><SELECT NAME="newLane" CLASS="small">
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Grad Resources">Grad Resources</OPTION>
			<OPTION VALUE="Bridges International">Bridges International</OPTION>
			<OPTION VALUE="Catalytic">Catalytic</OPTION>
			<OPTION VALUE="Staffed">Staffed Campus</OPTION>
			<OPTION VALUE="ESM">Ethnic Student Ministry</OPTION>
			<OPTION VALUE="Operations">Operations</OPTION>
			<OPTION VALUE="WSN">Worldwide Student Network</OPTION>
			<OPTION VALUE="HR">Human Resources<!-- /Leadership Development --></OPTION>
			<OPTION VALUE="Fund Dev">Fund Development</OPTION>
			<OPTION VALUE="National Director's Office">National Director's Office</OPTION>
			</SELECT>
		</TD>
	</TR>
	</TABLE>

<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0"><TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" CLASS="button" VALUE="Next >>">&nbsp;</TD></TR></TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>