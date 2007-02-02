<%@ include file="header.jspf" %>

<%@page import="org.alt60m.util.DateUtils"%>
<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postContactInfo";
//-->
</script>
<%@ page import="java.text.SimpleDateFormat" %>
<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Contact Information</STRONG></TD>
	</TR>
	<tr>
	<TD CLASS="app" COLSPAN="2">
		<table class="app" width="100%" cellpadding="0" cellspacing="0">
			<TR>
				<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%">Title</TD>
				<TD CLASS="app" width="40%">
					<SELECT NAME="Title" onblur=UnHighlight(this) onfocus=Highlight(this)>
							<OPTION></OPTION>
							<OPTION VALUE="Mr." <%if("Mr.".equals(p.getTitle()))out.println(" selected=\"selected\""); %>>Mr.</OPTION>
							<OPTION VALUE="Mrs." <%if("Mrs.".equals(p.getTitle()))out.println(" selected=\"selected\""); %>>Mrs.</OPTION>
							<OPTION VALUE="Ms." <%if("Ms.".equals(p.getTitle()))out.println(" selected=\"selected\""); %>>Ms.</OPTION>
						</SELECT>
				</TD>
				<TD CLASS="app" rowspan="3" colspan="2" width="40%">
					<table class="insidebox" align="left" width="220" cellpadding="0" cellspacing="0">
					<TR>
						<TD class="app" ALIGN="RIGHT" WIDTH="125">Date Started</TD>
						<TD class="app" WIDTH="105">
							<table class="insidebox" width="95" cellpadding="1" cellspacing="0">
								<tr><td align='center'><%=a.getDateAppStarted() == null ? "&nbsp;" : (new SimpleDateFormat("MM/dd/yyyy")).format((Date) a.getDateAppStarted())%></td></tr>
							</table>
						</TD>
					</TR>

					<TR>
						<TD class="app" ALIGN="RIGHT" WIDTH="125">Date Last Changed</TD>
						<TD class="app" WIDTH="105">
							<table class="insidebox" width="95" cellpadding="1" cellspacing="0">
								<tr><td align='center'><%=a.getDateAppLastChanged() == null ? "&nbsp;" : (new SimpleDateFormat("MM/dd/yyyy")).format((Date) a.getDateAppLastChanged())%>
								</td></tr>
							</table>
						</TD>
					</TR>
					<TR>
						<TD class="app" ALIGN="RIGHT" WIDTH="125">Date Submitted</TD>
						<TD class="app" WIDTH="105">
							<table class="insidebox" width="95" cellpadding="1" cellspacing="0">
								<tr><td align='center'><%=a.getDateSubmitted() == null ? "&nbsp;" : (new SimpleDateFormat("MM/dd/yyyy")).format((Date) a.getDateSubmitted())%></td></tr>
							</table>
						</TD>
					</TR>
					</table>
				</td>
			</TR>
			<TR>
				<TD ALIGN="RIGHT" CLASS="app">First Name</TD>
				<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="FirstName" size=20 maxlength=50 value="<%=p.getFirstName()%>"></TD>
			</TR>
			<TR>
				<TD ALIGN="RIGHT" CLASS="app">Middle Name</TD>
				<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="MiddleName" size=20 maxlength=50 value="<%=p.getMiddleName()%>"></TD>
			</TR>
			<TR>
				<TD CLASS="app" ALIGN="RIGHT">Last Name</TD>
				<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="LastName" size=20 maxlength=50 value="<%=p.getLastName()%>"></TD>
				<TD ALIGN="RIGHT" CLASS="app">Are you:</TD>

				<TD CLASS="app">
					<SELECT NAME="MaritalStatus" onblur=UnHighlight(this) onfocus=Highlight(this)>
						<OPTION></OPTION>
						<OPTION VALUE="S" <% if ("S".equals(p.getMaritalStatus())) out.println(" selected=\"selected\""); %>>Single</OPTION>
						<OPTION VALUE="M" <% if ("M".equals(p.getMaritalStatus())) out.println(" selected=\"selected\""); %>>Married</OPTION>
						<OPTION VALUE="D" <% if ("D".equals(p.getMaritalStatus())) out.println(" selected=\"selected\""); %>>Divorced</OPTION>
						<OPTION VALUE="P" <% if ("P".equals(p.getMaritalStatus())) out.println(" selected=\"selected\""); %>>Separated</OPTION>
						<OPTION VALUE="W" <% if ("W".equals(p.getMaritalStatus())) out.println(" selected=\"selected\""); %>>Widowed</OPTION>
					</SELECT>
				</TD>
			</TR>
			<TR>
				<TD ALIGN="RIGHT" CLASS="app">Preferred Name</TD>
				<TD CLASS="app" width="140"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="PreferredName" size=20 maxlength=50 value="<%=p.getPreferredName()%>"></TD>
				<TD ALIGN="RIGHT" CLASS="app"># of Children</TD>
				<TD CLASS="app" width="140"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="NumberChildren" size=4 maxlength=2 value="<%=p.getNumberChildren()%>"></TD>
			</TR>
		</table>
	</tr>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Current Mailing Address & Phone</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%">Address 1</TD>
		<TD CLASS="app" colspan="3"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentAddress1" size=30 maxlength=50 value="<%=p.getCurrentAddress1()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
		<TD CLASS="app" colspan="3"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentAddress2" size=30 maxlength=50 value="<%=p.getCurrentAddress2()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">City</TD>
		<TD CLASS="app" colspan="3"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentCity" size=20 maxlength=50 value="<%=p.getCurrentCity()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">State</TD>
		<TD CLASS="app"><%selState.setName("CurrentState");selState.setCurrentValue(p.getCurrentState());%><%=selState.print()%> Zip <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentZip" size=10 maxlength=11 value="<%=p.getCurrentZip()%>"></TD>
	</TR>
	<TR>
		<td class="app" align="right" width="20%">Last Date at this Address </td>
		<td class="app">
			<INPUT onFocus="Highlight(this)" TYPE="TEXT" name="LastDateAtAddress" size=12 maxlength=12 value="<%=p.getLastDateAtAddress() == null ? "" : DateUtils.formatDate(p.getLastDateAtAddress())%>"> (MM/DD/YYYY)&nbsp;[<a href="javascript:pickdate(document.appForm.LastDateAtAddress)">choose date</a>]
		</td>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Home Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="CheckPhones(this)" TYPE="TEXT" name="CurrentHomePhone" size=12 maxlength=20 value="<%=p.getCurrentHomePhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Work Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="CurrentWorkPhone" size=12 maxlength=20 value="<%=p.getCurrentWorkPhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Cell Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="CheckPhones(this)" TYPE="TEXT" name="CurrentCellPhone" size=12 maxlength=20 value="<%=p.getCurrentCellPhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Email</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="checkEmail(this)" TYPE="TEXT" name="CurrentEmail" size=70 maxlength=70 value="<%=p.getCurrentEmail()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Permanent Mailing Address & Phone</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%">Address 1</TD>
		<TD CLASS="app" colspan="3"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="PermAddress1" size=30 maxlength=50 value="<%=p.getPermAddress1()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
		<TD CLASS="app" colspan="3"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="PermAddress2" size=30 maxlength=50 value="<%=p.getPermAddress2()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">City</TD>
		<TD CLASS="app" colspan="3"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="PermCity" size=20 maxlength=50 value="<%=p.getPermCity()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">State</TD>
		<TD CLASS="app"><%selState.setName("PermState");selState.setCurrentValue(p.getPermState());%><%=selState.print()%> Zip <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="PermZip" size=10 maxlength=11 value="<%=p.getPermZip()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Home Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="PermHomePhone" size=12 maxlength=20 value="<%=p.getPermHomePhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Work Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="PermWorkPhone" size=12 maxlength=20 value="<%=p.getPermWorkPhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Cell Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="PermCellPhone" size=12 maxlength=20 value="<%=p.getPermCellPhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Email</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="checkEmail(this)" TYPE="TEXT" name="PermEmail" size="70" maxlength=70 value="<%=p.getPermEmail()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Employment & School</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Do you have a legal right to work in the United States?</TD>
		<TD CLASS="app"><INPUT type=radio name="WorkInUS" value="True" <%if(p.getWorkInUS()) out.println("CHECKED");%>> Yes <INPUT type=radio name="WorkInUS" value="False" <%if(!p.getWorkInUS()) out.println("CHECKED");%>> No</TD>
	</TR>
	<TR>
		<TD CLASS="app">&nbsp;</TD>
		<TD CLASS="app">

			<TABLE BORDER=1 rules=none border=1>
				<TR>
					<td class="button">
						<A class="button" href="javascript:popupWindow('/hr_si/applicant/application/campuslist.jsp?state='+document.appForm.UniversityState.value,'Help','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=400,width=510,height=400'%20)">Click here</A> to edit the two following questions.<br />
					</td>
				</tr>
				<TR>
					<TD CLASS="app">
						Most recent school attended:<BR>
						<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="RecentSchools" size="70" maxlength="100" value="<%=p.getRecentSchools()%>" readonly="readonly">
					</TD>
				</TR>
				<TR>
					<TD CLASS="app">
						State that school is in:<BR>
						<INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="UniversityState" size="2" value="<%=p.getUniversityState()%>" readonly="readonly">
					</TD>
				</TR>
			</TABLE>

		</TD>
	</TR>


	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%">Graduation Date</TD>
		<TD CLASS="app">
			<INPUT onFocus="Highlight(this)" TYPE="TEXT" name="GraduationDate" size=12 maxlength=12 value="<%=p.getGraduationDate() == null ? "" : DateUtils.formatDate(p.getGraduationDate()) %>"> (MM/DD/YYYY)&nbsp;[<a href="javascript:pickdate(document.appForm.GraduationDate)">choose date</a>]
		</TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Major(s)</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Majors" size="70" maxlength=70 value="<%=p.getMajors()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>Emergency Contact Information</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>&nbsp;&nbsp;Primary Contact</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">First and Last Name</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerContactName" size=30 maxlength=50 value="<%=p.getEmerContactName()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Relationship</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerContactRelationship" size=30 maxlength=50 value="<%=p.getEmerContactRelationship()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 1</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerAddress1" size=30 maxlength=50 value="<%=p.getEmerAddress1()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerAddress2" size=30 maxlength=50 value="<%=p.getEmerAddress2()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">City</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerCity" size=20 maxlength=50 value="<%=p.getEmerCity()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">State</TD>
		<TD CLASS="app"><%selState.setName("EmerState");selState.setCurrentValue(p.getEmerState());%><%=selState.print()%> Zip <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerZip" size=10 maxlength=11 value="<%=p.getEmerZip()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Home Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerHomePhone" size=12 maxlength=20 value="<%=p.getEmerHomePhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Work Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerWorkPhone" size=12 maxlength=20 value="<%=p.getEmerWorkPhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Cell Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="EmerCellPhone" size=12 maxlength=20 value="<%=p.getEmerCellPhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Email</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="checkEmail(this)" TYPE="TEXT" name="EmerEmail" size="70" maxlength=70 value="<%=p.getEmerEmail()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" COLSPAN="2"><STRONG>&nbsp;&nbsp;Secondary Contact</STRONG></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">First and Last Name</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2ContactName" size=30 maxlength=50 value="<%=p.getEmer2ContactName()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Relationship</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2ContactRelationship" size=30 maxlength=50 value="<%=p.getEmer2ContactRelationship()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 1</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2Address1" size=30 maxlength=50 value="<%=p.getEmer2Address1()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2Address2" size=30 maxlength=50 value="<%=p.getEmer2Address2()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">City</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2City" size=20 maxlength=50 value="<%=p.getEmer2City()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">State</TD>
		<TD CLASS="app"><%selState.setName("Emer2State");selState.setCurrentValue(p.getEmer2State());%><%=selState.print()%> Zip <INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2Zip" size=10 maxlength=11 value="<%=p.getEmer2Zip()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Home Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2HomePhone" size=12 maxlength=20 value="<%=p.getEmer2HomePhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Work Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2WorkPhone" size=12 maxlength=20 value="<%=p.getEmer2WorkPhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Cell Phone</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="Emer2CellPhone" size=12 maxlength=20 value="<%=p.getEmer2CellPhone()%>"></TD>
	</TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT">Email</TD>
		<TD CLASS="app"><INPUT onFocus="Highlight(this)" onBlur="checkEmail(this)" TYPE="TEXT" name="Emer2Email" size="70" maxlength=70 value="<%=p.getEmer2Email()%>"></TD>
	</TR>

<%@ include file="bnav2way.jspf" %>
