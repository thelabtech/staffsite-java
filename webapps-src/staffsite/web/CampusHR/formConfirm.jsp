<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<%
	Hashtable staff = (Hashtable)session.getValue("staffInfo");
	String lastName = "";
	String firstName = "";
	String preferredName = "";
	String middleInitial = "";
	String ssn = "";
	String spouseFirstName = "";
	String ministry = "";
	String accountNo = "";
	String status = "";
	String workLocation = "";
	boolean isMale = true;
	Hashtable primaryAddr = null;

	String region = "";
	ministry = "";
	String jobStatus = "";
	String strategy = "";
	String position = "";
	String team = "";
	String title = "";
	
	if (staff != null) {
		lastName = (String)staff.get("LastName");
		firstName = (String)staff.get("FirstName");
		preferredName = (String)staff.get("PreferredName");
		middleInitial = (String)staff.get("MiddleInitial");
		spouseFirstName = (String)staff.get("SpouseFirstName");
		accountNo = (String)staff.get("AccountNo");
		isMale = ((Boolean)staff.get("IsMale")).booleanValue();
		title = (String)staff.get("JobTitle");
		team = (String)staff.get("TeamName");
		position = (String)staff.get("Position");
		primaryAddr = (Hashtable)staff.get("primaryAddress");
		region = (String)staff.get("Region");
		status = (String)staff.get("CountryStatus");
		jobStatus = (String)staff.get("JobStatus");
		ministry = (String)staff.get("Ministry");
		strategy = (String)staff.get("Strategy");
		workLocation = (String)staff.get("PrimaryEmpLocDesc");
	}

	String ADDRESS_CHANGE = "Address Change";
	
	String MARITAL_STATUS_CHANGE = "Marital Status Change";
	
	String DEPENDENT_CHANGE = "Dependent Change";
	
	String JOB_CHANGE = "Job Change Request";
	
	String LEAVE_OF_ABSENCE = "Leave of Absence";
	
	String RESIGNATION = "Resignation";

	Hashtable formData = (Hashtable)session.getValue("formData");
	boolean authRequired = false;
	String chType = (String)formData.get("changeType");
	if (chType.equals(JOB_CHANGE) || 
		chType.equals(LEAVE_OF_ABSENCE) ||
		chType.equals(RESIGNATION)) {
			authRequired = true;
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
<TITLE> Confirmation </TITLE>

<%@ include file="hrheader.jspf" %>
<FORM NAME="confirmForm" ACTION='/servlet/HRUpdateController?action=<%=(String)formData.get("action")%>' METHOD="POST">
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
<TABLE WIDTH="100%" BORDER=0 CELLPADDING=0 CELLSPACING=0><TR><TD CLASS="div">&nbsp;Request Detail</TD></TR></TABLE>
<TABLE WIDTH="98%" ALIGN="CENTER" BORDER=0 CELLPADDING=0 CELLSPACING=5>
<TR>
	<TD>
	<%
	// check to make sure something changed
		if(chType.equals(JOB_CHANGE) && (formData.get("ministry") == null) && (formData.get("jobStatus") == null) && (formData.get("region") == null) && (formData.get("strategy") == null) && (formData.get("position") == null) && (formData.get("teamID") == null) && (formData.get("title") == null)) {
  %>
		<P ALIGN="CENTER"><B>You did not make any changes to your job information.  </B><P><NOBR>To change your information, mark the appropriate checkboxes and select your new information.</NOBR><BR>Click <A HREF="/CampusHR/<%= "true".equals(request.getParameter("spouse")) ? "spouse_job_change1.jsp" : "job_change1.jsp" %>">here</A> to try again, or use one of the links below.
	<% } else { %>
		<NOBR><B>You have requested to update the following information:</B></NOBR><P ALIGN="CENTER">
		<TABLE WIDTH="80%" BORDER=0><TR><TD><B><%=chType%>:</B></TD></TR><TR><TD><P ALIGN="CENTER">
		<TABLE BORDER="0" CELLSPACING="2" CLASS="outline" WIDTH="80%">
		<TR>
		<% if (chType.equals(ADDRESS_CHANGE)) { %>
		<TD ALIGN="RIGHT" VALIGN="TOP"><B>From:&nbsp;&nbsp;</B></TD>
		<TD>
		<%	if (formData.get("primaryAddress1") != null) {%>
				Street Address 1: <%=(primaryAddr == null) ? "" : primaryAddr.get("Address1")%><BR>
		<%	}
			if (formData.get("primaryAddress2") != null) {%>
				Street Address 2: <%=(primaryAddr == null) ? "" : primaryAddr.get("Address2")%><BR>
		<%	}
			if (formData.get("primaryAddress3") != null) {%>
				Street Address 3: <%=(primaryAddr == null) ? "" : primaryAddr.get("Address3")%><BR>
		<%	}
			if (formData.get("primaryAddress4") != null) {%>
				Street Address 4: <%=(primaryAddr == null) ? "" : primaryAddr.get("Address4")%><BR>
		<%	}
			if (formData.get("primaryCity") != null) {%>
				City: <%=(primaryAddr == null) ? "" : primaryAddr.get("City")%><BR>
		<%	}
			if (formData.get("primaryState") != null) {%>
				State: <%=(primaryAddr == null) ? "" : primaryAddr.get("State")%><BR>
		<%	}
			if (formData.get("primaryZip") != null) {%>
				Zip: <%=(primaryAddr == null) ? "" : primaryAddr.get("Zip")%><BR>
		<%	}
			if (formData.get("schoolDistrict") != null) {%>
				School District<BR>
		<%	}
			if (formData.get("homePhone") != null) {%>
				Home Phone: <%=staff.get("HomePhone")%><BR>
		<%	}
			if (formData.get("workPhone") != null) {%>
				Work Phone: <%=staff.get("WorkPhone")%><BR>
		<%	}
			if (formData.get("email") != null) {%>
				Email: <%=staff.get("Email")%><BR>
		<%	}
			if (formData.get("spouseEmail") != null) {%>
				Spouse Email: <%=staff.get("SpouseEmail")%><BR>
		<%	}
			if (formData.get("primaryEmpLocCity") != null) {%>
				Primary Employment City: <%=staff.get("PrimaryEmpLocCity")%><BR>
		<%	}
			if (formData.get("primaryEmpLocState") != null) {%>
				Primary Employment State: <%=staff.get("PrimaryEmpLocState")%><BR>
		<%	}
			if (formData.get("primaryEmpLocCountry") != null) {%>
				Primary Employment Country: <%=staff.get("PrimaryEmpLocCountry")%><BR>
		<%	} %>
		<% } else if (chType.equals(MARITAL_STATUS_CHANGE)) { %>
		<TD>
		<%	if (formData.get("fianceeFirstName") != null) {%>
				Fiancee: <%=formData.get("fianceeFirstName") + " " + formData.get("fianceeMiddleName") + " " + formData.get("fianceeLastName") %><BR>
		<%	} 
			if (isMale) { %>
				Wife&#39;s married name: <%=formData.get("spouseFirstName") + " " + formData.get("spouseMiddleName") + " " + formData.get("spouseLastName")%><BR>
		<%  } else { %> 
				Wife&#39;s married name: <%=formData.get("firstName") + " " + formData.get("middleName") + " " + formData.get("lastName")%><BR>
		<%  } 
			if (formData.get("marriageDate") != null) { %>
				Wedding Date: <%=formData.get("marriageDate")%><BR>
		<%	}
			if (formData.get("fianceeAccountNo") != null) { %>
				<%=formData.get("fianceeFirstName")%> is staff, account number: <%=formData.get("fianceeAccountNo")%><BR>
		<%  } else if (formData.get("fianceeJoinStaffDate") != null) { %>
				<%=formData.get("fianceeFirstName")%> will be joining Campus Crusade Staff on <%=formData.get("fianceeJoinStaffDate")%>.<BR>
		<%	}
			if (formData.get("joiningNS") != null && ((String)formData.get("joiningNS")).equals("true")) { %>
				You will be joining National Staff.<BR>
		<%	}
			if (formData.get("joiningNS") != null && ((String)formData.get("isFianceeJoiningNS")).equals("true")) { %>
				<%=formData.get("fianceeFirstName")%> will be joining National Staff.<BR>
		<%	}  %>
		<% } else if (chType.equals(DEPENDENT_CHANGE)) { %>
		<TD>
		<%	if (formData.get("firstName") != null) { %>
				New child: <%=formData.get("firstName") + " " + ((formData.get("middleName") != null) ? formData.get("middleName") : "") + " " + formData.get("lastName")%><BR>
		<% 	}
			if (formData.get("gender") != null) { %>
				Gender: <%=formData.get("gender")%><BR>
		<%  }
			if (formData.get("birthDate") != null) {%>
				Birthdate: <%=formData.get("birthDate")%><BR>
		<%	} 
			if (formData.get("adoptDate") != null) { %>
				Adoption Date: <%=formData.get("adoptDate")%><BR>
		<%  }
			if (formData.get("ineligibleDependentName") != null) {%>
				<%=formData.get("ineligibleDependentName")%> is no longer eligible for medical/dental coverage as of <%=formData.get("ineligibleDate")%><BR>
		<%	} %>
		<% } else if (chType.equals(JOB_CHANGE)) { %>
		<TD ALIGN="RIGHT" VALIGN="TOP"><B>From:&nbsp;&nbsp;</B></TD>
		<TD>
		<%	if (formData.get("ministry") != null) { %>
				Ministry: <%=ministry%><BR>
		<%	}
			if (formData.get("jobStatus") != null) { %>
				Job Status: <%=jobStatus%><BR>
		<%	}
			if (formData.get("region") != null) { %>
				Region:  <%=regionLookup.get(region)%><BR>
		<%	}
			if (formData.get("strategy") != null) { %>
				Strategy: <%=strategy%><BR>
		<%	}
			if (formData.get("title") != null) { %>
				Job: <%=title%><BR>
		<%	} 
			if (formData.get("teamName") != null) { %>
				Team: <%=team%><BR>
		<%	}
			if (formData.get("position") != null) { %>
				Position: <%=position%><BR>
		<%	}
			if (formData.get("location") != null) { %>
				Work Location: <%=workLocation%><BR>
		<%	} %>
		<% } else if (chType.equals(LEAVE_OF_ABSENCE)) { %>
		<TD>
		<%	if (formData.get("beginDate") != null) { %>
				Leave beginning: <%=formData.get("beginDate")%><BR>
		<%  }
			if (formData.get("endDate") != null) { %>
				Leave ending: <%=formData.get("endDate")%><BR>
		<%  }
			if (formData.get("leaveReason") != null) { %>
				Reason: <%=formData.get("leaveReason")%><BR>
		<%  }
			if (formData.get("includeSpouse")!=null) {%>
				This leave applies to spouse as well.<BR>
		<%  } %>
		<% } else if (chType.equals(RESIGNATION)) { %>
		<TD>
		<%	if (formData.get("resignReason") != null) { %>
				Reason: <%=formData.get("resignReason")%><BR>
		<%  }
			if (formData.get("resignationDate") != null) { %>
				Last day: <%=formData.get("resignationDate")%><BR>
		<%	} 
			if (formData.get("severanceRequest") != null) { %>
				Severance request of <%=formData.get("severanceRequest")%> months.<BR>
		<%	}
			if (formData.get("keepSupport") != null && formData.get("keepSupport").equals("Y")) { %>
				Staff is keeping his/her support team. <BR>
		<%	} else { %>
				Staff is not keeping his/her support team.<BR>
		<%  } 
			if (formData.get("anotherAcctNo") != null) { %>
				Contributions going to Account: <%=formData.get("anotherAcctNo")%><BR>
				Name: <%=formData.get("anotherAcctName")%><BR>
		<%  } 
			if (formData.get("newRegion") != null) { %>
				Region:  <%=regionLookup.get(formData.get("newRegion"))%><BR>
	    <%	}
		 } %>
		</TD></TR>
		
		<% if (chType.equals(ADDRESS_CHANGE)) { %>
		<TR><TD ALIGN="RIGHT" VALIGN="TOP"><B>To:&nbsp;&nbsp;</B></TD>
		<TD>
		<%	if (formData.get("primaryAddress1") != null) {%>
				Street Address 1: <%=formData.get("primaryAddress1")%><BR>
		<%	}
			if (formData.get("primaryAddress2") != null) {%>
				Street Address 2: <%=formData.get("primaryAddress2")%><BR>
		<%	}
			if (formData.get("primaryAddress3") != null) {%>
				Street Address 3: <%=formData.get("primaryAddress3")%><BR>
		<%	}
			if (formData.get("primaryAddress4") != null) {%>
				Street Address 4: <%=formData.get("primaryAddress4")%><BR>
		<%	}
			if (formData.get("primaryCity") != null) {%>
				City: <%=formData.get("primaryCity")%><BR>
		<%	}
			if (formData.get("primaryState") != null) {%>
				State: <%=formData.get("primaryState")%><BR>
		<%	}
			if (formData.get("primaryZip") != null) {%>
				Zip: <%=formData.get("primaryZip")%><BR>
		<%	}
			if (formData.get("schoolDistrict") != null) {%>
				School District: <%=formData.get("schoolDistrict")%><BR>
		<%	}
			if (formData.get("homePhone") != null) {%>
				Home Phone: <%=formData.get("homePhone")%><BR>
		<%	}
			if (formData.get("workPhone") != null) {%>
				Work Phone: <%=formData.get("workPhone")%><BR>
		<%	}
			if (formData.get("email") != null) {%>
				Email: <%=formData.get("email")%><BR>
		<%	}
			if (formData.get("spouseEmail") != null) {%>
				Spouse Email: <%=formData.get("spouseEmail")%><BR>
		<%	}
			if (formData.get("primaryEmpLocCity") != null) {%>
				Primary Employment City: <%=formData.get("primaryEmpLocCity")%><BR>
		<%	}
			if (formData.get("primaryEmpLocState") != null) {%>
				Primary Employment State: <%=formData.get("primaryEmpLocState")%><BR>
		<%	}
			if (formData.get("primaryEmpLocCountry") != null) {%>
				Primary Employment Country: <%=formData.get("primaryEmpLocCountry")%><BR>
		<%	} 
			if (formData.get("startDate") != null) { %>
				<B>Beginning:</B> <%=formData.get("startDate")%><BR>
		<%	}
			if (formData.get("endDate") !=  null) { %>
				<B>Ending:</B> <%=formData.get("endDate")%><BR>
		<%	} %>
		</TD></TR>
		<% } else if (chType.equals(JOB_CHANGE)) { %>
		<TR><TD ALIGN="RIGHT" VALIGN="TOP"><B>To:&nbsp;&nbsp;</B></TD>
		<TD>
		<%	if (formData.get("ministry") != null) { %>
				Ministry: <%=formData.get("ministry")%><BR>
		<%	}
			if (formData.get("jobStatus") != null) { %>
				Job Status: <%=formData.get("jobStatus")%><BR>
		<%	}
			if (formData.get("region") != null) { %>
				Region:  <%=regionLookup.get(formData.get("region"))%><BR>
		<%	}
			if (formData.get("strategy") != null) { %>
				Strategy: <%=formData.get("strategy")%><BR>
		<%	}
			if (formData.get("position") != null) { %>
				Position: <%=formData.get("position")%><BR>
		<%	}
			if (formData.get("teamID") != null) { %>
				Team: <%=formData.get("teamName")%><BR>
		<%	}
			if (formData.get("title") != null) { %>
				Job: <%=formData.get("title")%><BR>
		<%	}
			if (formData.get("location") != null) { %>
				Work Location: <%=formData.get("location")%><BR>
		<%	} %>
		</TD></TR>
		<TR><TD ALIGN="RIGHT" VALIGN="TOP"><B>Effective:&nbsp;&nbsp;</B></TD>
		<TD>
		<%	if (formData.get("effectiveDate") != null && !formData.get("effectiveDate").equals("//")) { %>
				<%=formData.get("effectiveDate")%><BR>
		<%  } else { %>
				<b><font color="#ff0000">Please enter effective date</font></b><BR>
		<%	} 
			if ( ((Boolean)formData.get("includeSpouse")).booleanValue() ) {%>
				<br><I>This change will be applied to your spouse as well.</I><BR>
		<%  } %>
		</TD></TR>
		<% } %>
		</TABLE></TD></TR></TABLE>
	<% if (authRequired) {%>
		<NOBR><B>This information requires the approval of your HR team. If approved, it should be updated by the next pay cycle.</NOBR><BR><B>If your request is not approved, you will be contacted by a Human Resources team member.</B><P ALIGN="CENTER">
		By clicking confirm, you are submitting a request to change the information detailed above.
	<% } else { %>
		<NOBR><B>Please verify the information above. Once submitted, this information will be updated</NOBR><BR><B> in the Campus Crusade database.</B><P ALIGN="CENTER">
		By clicking confirm, you are submitting a request to change the information detailed above.
	<% } %>
		<BR><INPUT TYPE=SUBMIT VALUE="Confirm" CLASS="button"><% } %><P>
		<A HREF="javascript: history.go(-1)"><I>back to previous screen</I></A><BR>
		<A HREF="/servlet/HRUpdateController?action=showFormList"><I>back to form list</I></A><BR>
		<A HREF="/servlet/StaffController?action=showTools"><I>back to tools page</I></A>
	</TD>
</TR>
</TABLE>
</TD></TR></TABLE>
</FORM>
<%@ include file="hrfooter.jspf" %>
</HTML>