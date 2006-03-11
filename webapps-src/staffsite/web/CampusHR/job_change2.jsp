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
	String title = "";
	String position = "";
	String team = "";
	if (staffInfo != null) {
		lastName = (String)staffInfo.get("LastName");
		firstName = (String)staffInfo.get("FirstName");
		preferredName = (String)staffInfo.get("PreferredName");
		middleInitial = (String)staffInfo.get("MiddleInitial");
		spouseFirstName = (String)staffInfo.get("SpouseFirstName");
		accountNo = (String)staffInfo.get("AccountNo");
		ministry = (String)staffInfo.get("Ministry");
		ssn = (String)staffInfo.get("Ssn");
		title = (String)staffInfo.get("JobTitle");
		position = (String)staffInfo.get("Position");
		team = (String)staffInfo.get("TeamName");
		status = (String)staffInfo.get("CountryStatus");
	}
	if (title == null || title.equals("")) {
		title = "<none>";
	}
	if (position == null || position.equals("")) {
		position =  "<none>";
	}
	if (team == null || team.equals("")) {
		team = "<none>";
	}
	
	ActionResults ar = ActionResults.getActionResults(session);
	List teamList = (List)ar.getCollection("teamList");
	List jobList = (List)ar.getCollection("jobs");
%>
<HTML>
<HEAD>
<SCRIPT LANGUAGE="JavaScript">
<!--
function jobVerify(form) {
	var isValid = true;
	if(document.jobChangeForm2.positionChange.checked && document.jobChangeForm2.newPosition.value == "") {
		isValid = false;
		alert("You must choose a new position.");
	}

	if(document.jobChangeForm2.teamChange.checked && document.jobChangeForm2.newTeam.value == "") {
		isValid = false;
		alert("You must choose a new team.");
	}

	if(isValid && document.jobChangeForm2.jobChange.checked && document.jobChangeForm2.newJob.value == "") {
		isValid = false;
		alert("You must choose a new job.");
	}

	return isValid;
}
-->
</SCRIPT>

<TITLE> Job Change - Step 2 </TITLE>
<%@ include file="hrheader.jspf" %>
<FORM NAME="jobChangeForm2" ACTION="/servlet/HRUpdateController?action=jobChangeRequest" METHOD="POST" onSubmit="return jobVerify(document.jobChangeForm2)">
<% if (request.getParameter("ministryChange") != null) {%>
<INPUT TYPE="hidden" NAME="ministryChange" VALUE='<%=request.getParameter("ministryChange")%>'>
<INPUT TYPE="hidden" NAME="newMinistry" VALUE='<%=request.getParameter("newMinistry")%>'>
<% }
   if (request.getParameter("statusChange") != null) {%>
<INPUT TYPE="hidden" NAME="statusChange" VALUE='<%=request.getParameter("statusChange")%>'>
<INPUT TYPE="hidden" NAME="statusMenu" VALUE='<%=request.getParameter("statusMenu")%>'>
<INPUT TYPE="hidden" NAME="statusOther" VALUE='<%=request.getParameter("statusOther")%>'>
<% }
   if (request.getParameter("regionChange") != null) {%>
<INPUT TYPE="hidden" NAME="regionChange" VALUE='<%=request.getParameter("regionChange")%>'>
<INPUT TYPE="hidden" NAME="currentRegion" VALUE='<%=request.getParameter("currentRegion")%>'>
<INPUT TYPE="hidden" NAME="newRegion" VALUE='<%=request.getParameter("newRegion")%>'>
<% }
   if (request.getParameter("laneChange") != null) {%>
<INPUT TYPE="hidden" NAME="laneChange" VALUE='<%=request.getParameter("laneChange")%>'>
<INPUT TYPE="hidden" NAME="newLane" VALUE='<%=request.getParameter("newLane")%>'>
<% } 
	if (request.getParameter("locationChange") != null) {%>
<input type="hidden" name="locationChange" value='<%=request.getParameter("locationChange")%>'>
<input type="hidden" name="newLocation" value='<%=request.getParameter("newLocation")%>'>
<% } %>
<CENTER>
<TABLE BORDER=0 CLASS="outline" CELLPADDING=0 CELLSPACING=0>
<TR><TD>

<TABLE WIDTH="100%" CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div" ALIGN="LEFT">&nbsp;Job Change form</TD><TD ALIGN="RIGHT" CLASS="div">Date: <%= Calendar.getInstance().get(Calendar.MONTH) + 1%>/<%= Calendar.getInstance().get(Calendar.DAY_OF_MONTH)%>/<%= Calendar.getInstance().get(Calendar.YEAR)%></TD></TR></TABLE>

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
	<!--<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=0>
		<TR>
			<TD WIDTH="100%" ALIGN="RIGHT">
				<NOBR><INPUT TYPE="checkbox" class="noborder" NAME="includeSpouse" VALUE="true" <% if (request.getParameter("includeSpouse")!= null) {%>CHECKED<%}%>> Check if this form covers spouse</NOBR>
			</TD>
		</TR>
	</TABLE>-->
	<CENTER>
	<TABLE ALIGN="CENTER" WIDTH="98%" BORDER=0>
	<TR>
		<TD>
			<NOBR>Change effective: <INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="jobChangeMonth" VALUE='<%=request.getParameter("jobChangeMonth")%>'>/<INPUT TYPE="text" SIZE="1" MAXLENGTH="2" NAME="jobChangeDay" VALUE='<%=request.getParameter("jobChangeDay")%>'>/<INPUT TYPE="text" SIZE="1" MAXLENGTH="4" NAME="jobChangeYear" VALUE='<%=request.getParameter("jobChangeYear")%>'></NOBR>
		</TD>
		<TD WIDTH="40%" ALIGN="CENTER" CLASS="header">
			FROM
		</TD>
		<TD WIDTH="40%" ALIGN="CENTER" CLASS="header">
			TO
		</TD>
	</TR>
	<TR>
		<TD CLASS="outline"><INPUT TYPE="checkbox" CLASS="noborder" NAME="positionChange" VALUE="true"><B>Position</B></TD>
		<TD CLASS="outline" ALIGN="CENTER"><%=position%>&nbsp;</TD>
		<TD CLASS="outline" ALIGN="CENTER">
			<SELECT CLASS="small" NAME="newPosition" onChange="document.jobChangeForm2.positionChange.checked=true">
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="New Staff">New Staff</OPTION>
			<OPTION VALUE="Executive">Executive Team</OPTION>
			<OPTION VALUE="Local Leader">Local Leader</OPTION>
			<OPTION VALUE="Senior Staff">Senior Staff</OPTION>
			<OPTION VALUE="Team Leader">Team Leader</OPTION>
			<OPTION VALUE="Impact Fellow">Impact Fellow</OPTION>
			<OPTION VALUE="Associate Regional Director">Associate Regional Director</OPTION>
			<OPTION VALUE="Regional Director">Regional Director</OPTION>
			<OPTION VALUE="Associate National Director">Associate National Director</OPTION>
			<OPTION VALUE="National Director">National Director</OPTION>
			</SELECT>
		</TD>
	</TR>
	<TR>
		<TD CLASS="outline"><INPUT TYPE="checkbox" CLASS="noborder" NAME="teamChange" VALUE="true" <% if (teamList.size() == 0) {%>DISABLED<%}%>><B>Team</B></TD>
		<TD CLASS="outline" ALIGN="CENTER"><%=team%>&nbsp;</TD>
		<TD CLASS="outline" ALIGN="CENTER">
		<%	if (teamList.size() == 0) {%>
			<I>No teams available for this region.</I>
		<% } else { %>
			<SELECT NAME="newTeam" CLASS="small" onChange="document.jobChangeForm2.teamChange.checked=true">
			<OPTION VALUE=""></OPTION>
			<%
				ListIterator lit = teamList.listIterator();
				while (lit.hasNext()) {
					Hashtable t = (Hashtable)lit.next(); %>
				<OPTION VALUE='<%=t.get("ID")%>'><%=t.get("name")%></OPTION>
			<%  }  %>
		<%  }  %>
				
<!--			<OPTION VALUE="staffed">Staffed Campus</OPTION>
			<OPTION VALUE="catalytic">Catalytic</OPTION>
			<OPTION VALUE="cmt">Campus Media</OPTION>
			<OPTION VALUE="ist">Information Solutions</OPTION>
			<OPTION VALUE="wsn">Worldwide Student Network</OPTION>
			<OPTION VALUE="rd">Research & Development</OPTION>
			<OPTION VALUE="esm">Ethnic Student Ministry</OPTION>
			<OPTION VALUE="finance">Finance/Conference Team</OPTION>
			<OPTION VALUE="tech">Technology</OPTION>
			<OPTION VALUE="comm">Communications</OPTION>
			<OPTION VALUE="fund">Fund Development</OPTION>
			<OPTION VALUE="office">Office Services</OPTION>
			<OPTION VALUE="sending">HR Sending Services</OPTION>
			<OPTION VALUE="mpd">HR Ministry Partner Development</OPTION>
			<OPTION VALUE="recruiting">HR Recruiting</OPTION>
			<OPTION VALUE="leadership">HR Leadership Development</OPTION>
			<OPTION VALUE="staffcare">HR Staff Care</OPTION>-->
		</SELECT>
	</TR>
	<TR>
		<TD CLASS="outline"><INPUT TYPE="checkbox" CLASS="noborder" NAME="jobChange" VALUE="true"><B>Job</B></TD>
		<TD CLASS="outline" ALIGN="CENTER"><%=title%>&nbsp;</TD>
		<TD CLASS="outline" ALIGN="CENTER"><SELECT NAME="newJob" CLASS="small" onChange="document.jobChangeForm2.jobChange.checked=true">
			<OPTION VALUE=""></OPTION>
			<%
				ListIterator jit = jobList.listIterator();
				while (jit.hasNext()) {
					String j = (String)jit.next(); %>
				<OPTION VALUE='<%=j%>'><%=j%></OPTION>
			<%  }  %>
			</SELECT>
		<BR>
		Other: <INPUT NAME="otherJob" CLASS="small" onKeyPress="document.jobChangeForm2.jobChange.checked=true">
		</TD>
	</TR>
	</TABLE>

<TABLE WIDTH="98%" ALIGN="CENTER" BORDER="0"><TR><TD ALIGN="RIGHT"><INPUT TYPE="submit" CLASS="button" VALUE="Next >>">&nbsp;</TD></TR></TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>