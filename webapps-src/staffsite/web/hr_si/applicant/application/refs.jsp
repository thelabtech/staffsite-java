<%	// 3-3-03 kl: new jsp built using MS reference.jsp as template, added for stafflist popup processing %>
<jsp:useBean id="infoBean" class="org.alt60m.hr.si.bean.dbio.SIInfoBean"/>
<%@ include file="header.jspf" %>
<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postReferenceInfo";
-->
</script>
<%
	// kl: overall try/catch wrapper
	try
	{
%>

<%
	String AppID = a.getApplicationID();
	String theMessage = ar.getValue("message");
	if (theMessage == null)
		theMessage = "";
%>
<INPUT TYPE="hidden" NAME="SIApplicationID" VALUE="<%=AppID%>">
<%@ page import="java.text.SimpleDateFormat" %>

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
<% if (!theMessage.equals("")) { %>
	<TR><TD CLASS="app" COLSPAN="3">
		<SPAN CLASS="warning"><%=theMessage%></SPAN>
	</TD></TR>
<% } %>
	<TR><TD CLASS="app" COLSPAN="3">

<%
	// Get the action results
	//ActionResults ar = new ActionResults();
	//ar = ActionResults.getActionResults(session);

	// Need person info filled out to request a reference
	boolean needPersonalInfo = infoBean.checkPersonalInfoRequiredFields(p);

	int endLoop = 4;	// just show 4 references

	Date ChangedDate = new Date();
	String ChangedBy = "unittest";	// todo!!!! get login id!

	Hashtable refpHash = new Hashtable();
	String refpRefID = "";
	String refpTitle1 = "";
	String refpTitle2 = "";
	String refpType = "";
	String prefix = "";
	// start big reference loop
    for(int currentRef=0; currentRef<endLoop; currentRef++) {
        switch (currentRef) {
        	
           	case 0:
				refpType = "S";
                prefix = "Refs9";
                refpTitle1 = "Staff Member Reference";
				refpTitle2 = "A reference who is a staff member of Campus Crusade for Christ.";
                break;
                
            case 1:
				refpType = "D";
                prefix = "Refd9";
                refpTitle1 = "Discipler Reference";
				refpTitle2 = "Please select your current discipler or Bible study leader. If this is the same person as your Staff Member Reference, choose another staff member, summer project leader, or someone who knows you well in ministry.";
                break;
			
			case 2:
				refpType = "R";
            	prefix = "Refr9";
            	refpTitle1 = "Roommate Reference";
				refpTitle2 = "If you have a roommate, please enter their information below - not a spouse or a relative.  If you don't have a roommate, please enter a friend who knows you well.  You need <I>four</I> references.";
            	break;

			case 3:
				refpType = "F";
           		prefix = "Reff9";
            	refpTitle1 = "Friend Reference";
				refpTitle2 = "Select a friend who knows you well. If you already chose a friend in place of the roommate reference, choose another friend who knows you well.";
            	break;                
        	
        }

		// Get the REFERENCE
		refpHash = infoBean.getSIReferenceHashByType(AppID, refpType);
		refpRefID = "new";
		if (refpHash == null)
			refpHash = new Hashtable();
		else {
			refpRefID = (String)refpHash.get("ReferenceID");
		}

		Date pCreateDate = (Date)refpHash.get("CreateDate");
		Date pLastChangedDate = (Date)refpHash.get("LastChangedDate");
		Date pSubmittedDate = (Date)refpHash.get("FormSubmittedDate");
		String pDisabled = "";
		String pWorkflowStatus = (String)refpHash.get("FormWorkflowStatus") == null ? "" : (String)refpHash.get("FormWorkflowStatus");
		String pStatus = "";
		if (pWorkflowStatus.equals("N"))
			pStatus = "New: Created on " + (new SimpleDateFormat("MM/dd/yyyy")).format(pCreateDate);
		else if (pWorkflowStatus.equals("E"))
			pStatus = "Request Emailed: Created on " + (new SimpleDateFormat("MM/dd/yyyy")).format(pCreateDate);
		else if (pWorkflowStatus.equals("P"))
			pStatus = "Reference Form Printed: Created on " + (new SimpleDateFormat("MM/dd/yyyy")).format(pCreateDate);
		else if (pWorkflowStatus.equals("I"))
			pStatus = "In progress: Last updated on " + (new SimpleDateFormat("MM/dd/yyyy")).format(pLastChangedDate);
		else if (pWorkflowStatus.equals("D")) {
			pStatus = "Done: Form was submitted on " + (new SimpleDateFormat("MM/dd/yyyy")).format(pSubmittedDate);
			pDisabled = "DISABLED";	// force these input fields to be view-only
		}

		if (needPersonalInfo) {
			pDisabled = "DISABLED";	// force these input fields to be view-only when personal info not ready
		}

		/*new*/
		Boolean pIsStaff = new Boolean(false);
		if (refpHash.get("IsStaff") != null)
			pIsStaff = (Boolean)refpHash.get("IsStaff");
		String pDisabledByStaff = "";
		if (pIsStaff.booleanValue())
			pDisabledByStaff = "DISABLED";	// force ALL input fields to be view-only because it is a staff member
		String refpTitle = refpHash.get("Title") == null ? "" : (String)refpHash.get("Title");
%>


	<!-- Edit Peer Reference Table (uses refpHash) -->
	<INPUT TYPE="HIDDEN" NAME="<%=prefix%>ReferenceID" value="<%=refpRefID%>">
	<INPUT TYPE="HIDDEN" NAME="<%=prefix%>ReferenceType" value="<%=refpType%>">
	<INPUT TYPE="HIDDEN" NAME="<%=prefix%>Fk_SIApplicationID" value="<%=AppID%>">
	<INPUT TYPE="HIDDEN" NAME="<%=prefix%>LastChangedDate" value="<%=ChangedDate%>">
	<INPUT TYPE="HIDDEN" NAME="<%=prefix%>LastChangedBy" value="<%=ChangedBy%>">
	<INPUT TYPE="hidden" name="<%=prefix%>AppType" VALUE="<%=appType%>">			
	<TABLE WIDTH="100%" CELLSPACING="0" CLASS="box">
		<TR>
			<TD CLASS="cell3" COLSPAN="2">
				<B><%=refpTitle1%></B><BR>
				<%=refpTitle2%>
			</TD>
		</TR>
		<TR>
			<TD CLASS="app" ALIGN="LEFT" WIDTH="20%" COLSPAN="2">
<%
				if (needPersonalInfo) {
%>
					<BR><B>Please note: You must enter your Full Name and a current Home or Cell Phone on the Contact Information page before being able to send an email reference invitation</B>
<% 
				} 
%>
			</TD>
		</TR>
		<TR>
			<TD CLASS="app" ALIGN="LEFT" WIDTH="20%" COLSPAN="2">
				<% if (pWorkflowStatus.equals("I")) { %>
					<SPAN CLASS="WARNING">
						<B>Warning!</B> Your reference has already started to fill out the reference form.  Do not make any changes unless absolutely necessary.
					</SPAN>
				<% } else { %>
					&nbsp;
				<% } %>
			</TD>
		</TR>
	<% if (needPersonalInfo) { %>
		&nbsp;
	<% } else { %>
		<TR>
			<TD CLASS="app" COLSPAN="2">
			<!--have to use radio buttons, not checkboxes since checkbox has only 1 value, and is only returned if it is checked -->
				<TABLE WIDTH="100%" CELLSPACING="0" CLASS="box">
					<TR>
						<TD CLASS="app" VALIGN="TOP" ALIGN="center">
							Is this person a Campus Crusade staff member? 
							<INPUT <%=pDisabled%> TYPE=radio NAME="<%=prefix%>IsStaff" value="true"<%= pIsStaff.booleanValue() == true ? " checked=\"checked\"" : ""%> onClick="doPostFormNextAction('appFormRefDelCreateBlnk', '<%=refpRefID + "&" + refpType%>')"> Yes
							<INPUT <%=pDisabled%> TYPE=radio NAME="<%=prefix%>IsStaff" value="false"<%= pIsStaff.booleanValue() == false ? " checked=\"checked\"" : ""%> onClick="doPostFormNextAction('appFormRefDelete', '<%=refpRefID%>')"> No
						</TD>
					</TR>
					<% if (pDisabled == ""  && pIsStaff.booleanValue()) { %>
					<TR>
						<TD CLASS="app" VALIGN="TOP" align="center">
							<B>Since this reference is a staff member, you cannot type in their information.  You must load the information from our database by searching for him or her: 
						</TD>
					</TR>
					<TR>
						<TD CLASS="button" ALIGN="CENTER"><A CLASS="button" href="javascript:popupWindow('/hr_si/applicant/application/stafflist.jsp?refType=<%=refpType%>&WsnApplicationID=<%=refpRefID%>','Help','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,left=100,top=50,width=710,height=400'%20)">Click here to search for staff</A></B><BR>
						</TD>
					</TR>
					<% } %>
				</TABLE>
			</TD>
		</TR>
	<% } %>

		<% if (pIsStaff.booleanValue()) { %>
		<TR>
			<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%">Staff Number</TD>
			<TD CLASS="app">
				<INPUT DISABLED TYPE="TEXT" name="<%=prefix%>StaffNumber" size=20<%=(String)refpHash.get("StaffNumber") == null ? "" : " value= \""+(String)refpHash.get("StaffNumber")+"\""%>>
				<INPUT TYPE="hidden" name="<%=prefix%>NewStaffNumber" size=20>			
			</TD>
		</TR>
		<% } %>

		<TR>
			<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%">Name</TD>
			<TD CLASS="app">
			<SELECT <%=pDisabled%> <%=pDisabledByStaff%> onBlur=UnHighlight(this) onFocus=Highlight(this) NAME="<%=prefix%>Title">
					<OPTION></OPTION>
					<OPTION VALUE="Mr."<% if (refpTitle.equalsIgnoreCase("Mr.")) out.println(" selected=\"selected\""); %>>Mr.</OPTION>
					<OPTION VALUE="Mrs."<% if (refpTitle.equalsIgnoreCase("Mrs.")) out.println(" selected=\"selected\""); %>>Mrs.</OPTION>
					<OPTION VALUE="Ms."<% if (refpTitle.equalsIgnoreCase("Ms.")) out.println(" selected=\"selected\""); %>>Ms.</OPTION>
					<OPTION VALUE="Dr."<% if (refpTitle.equalsIgnoreCase("Dr.")) out.println(" selected=\"selected\""); %>>Dr.</OPTION>
					<OPTION VALUE="Rev."<% if (refpTitle.equalsIgnoreCase("Rev.")) out.println(" selected=\"selected\""); %>>Rev.</OPTION>
				</SELECT>

			First <INPUT <%=pDisabled%> <%=pDisabledByStaff%> CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>FirstName" maxlength=30 size=20<%=(String)refpHash.get("FirstName") == null ? "" : " value= \""+(String)refpHash.get("FirstName")+"\""%>>

			Last <INPUT <%=pDisabled%> <%=pDisabledByStaff%> CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>LastName" maxlength=30 size=20<%=(String)refpHash.get("LastName") == null ? "" : " value= \""+(String)refpHash.get("LastName")+"\""%>>
			</TD>
		</TR>
		<TR>
			<TD CLASS="app" ALIGN="RIGHT">Address 1</TD>
			<TD CLASS="app"><INPUT <%=pDisabled%> <%=pDisabledByStaff%> CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>CurrentAddress1" maxlength=50 size=30<%=(String)refpHash.get("CurrentAddress1") == null ? "" : " value= \""+(String)refpHash.get("CurrentAddress1")+"\""%>></TD>
		</TR>
		<TR>
			<TD CLASS="app" ALIGN="RIGHT">Address 2</TD>
			<TD CLASS="app"><INPUT <%=pDisabled%> <%=pDisabledByStaff%> onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>CurrentAddress2" maxlength=50 size=30<%=(String)refpHash.get("CurrentAddress2") == null ? "" : " value= \""+(String)refpHash.get("CurrentAddress2")+"\""%>></TD>
		</TR>
		<TR>
			<TD CLASS="app" ALIGN="RIGHT">City/State/Zip</TD>
			<TD CLASS="app">
				<INPUT <%=pDisabled%> <%=pDisabledByStaff%> CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>CurrentCity" maxlength=35 size=20<%=(String)refpHash.get("CurrentCity") == null ? "" : " value= \""+(String)refpHash.get("CurrentCity")+"\""%>>
				<%
					selState.setCurrentValue( (String)refpHash.get("CurrentState") == null ? "" : (String)refpHash.get("CurrentState"));
					selState.setName(prefix+"CurrentState");
					selState.setRequired("required");
					selState.setDisabled("");
					if (!pDisabledByStaff.equals(""))
						selState.setDisabled(pDisabledByStaff);
					if (!pDisabled.equals(""))
						selState.setDisabled(pDisabled);
				%><%=selState.print()%>
				<INPUT <%=pDisabled%> <%=pDisabledByStaff%> CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>CurrentZip" size=10<%=(String)refpHash.get("CurrentZip") == null ? "" : " value= \""+(String)refpHash.get("CurrentZip")+"\""%>>
			</TD>
		</TR>
		<TR>
			<TD CLASS="app" ALIGN="RIGHT">Telephones</TD>
			<TD CLASS="app">
			Home <INPUT <%=pDisabled%> <%=pDisabledByStaff%> onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>HomePhone" maxlength=24 size=12<%=(String)refpHash.get("HomePhone") == null ? "" : " value= \""+(String)refpHash.get("HomePhone")+"\""%>>
			Work <INPUT <%=pDisabled%> <%=pDisabledByStaff%> onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>WorkPhone" maxlength=24 size=12<%=(String)refpHash.get("WorkPhone") == null ? "" : " value= \""+(String)refpHash.get("WorkPhone")+"\""%>>
			Cell <INPUT <%=pDisabled%> <%=pDisabledByStaff%> onFocus="Highlight(this)" onBlur="UnHighlight(this)" TYPE="TEXT" name="<%=prefix%>CellPhone" maxlength=24 size=12<%=(String)refpHash.get("CellPhone") == null ? "" : " value= \""+(String)refpHash.get("CellPhone")+"\""%>>
            <BR>(You must specify at least one phone number.)
			</TD>
		</TR>
		<TR>
			<TD CLASS="app" VALIGN="TOP" ALIGN="RIGHT">Email</TD>
			<TD CLASS="app">
				<INPUT TYPE="HIDDEN" name="<%=prefix%>OldCurrentEmail" <%=(String)refpHash.get("CurrentEmail") == null ? "" : " value= \""+(String)refpHash.get("CurrentEmail")+"\""%>>
				<INPUT <%=pDisabled%> <%=pDisabledByStaff%> onFocus="Highlight(this)" onBlur="checkEmail(this)" TYPE="TEXT" name="<%=prefix%>CurrentEmail" maxlength=50 size=30<%=(String)refpHash.get("CurrentEmail") == null ? "" : " value= \""+(String)refpHash.get("CurrentEmail")+"\""%>>
<%
				if (pDisabled == "") { 
%>
					<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormRefResendEmailInvite', '<%=refpType%>')">Send Email Invitation</A>
					<BR>
					(Note: For your safety, if you change the email field, any information your reference may have already entered will be lost.)
					<BR>
					<BR>
					If you do not specify an email address for this reference, you must give them a paper Reference Form to be filled out and mailed in.  <A TARGET="_blank"  HREF="/wsnsp/pdfforms/Intern Reference Form.pdf">Click here to print a blank reference form</A>. (Adobe Acrobat required.)
<% 
				} 
%>
			</TD>
		</TR>
		<TR>
			<TD CLASS="cell3" ALIGN="CENTER" VALIGN="MIDDLE">
                <% if (pDisabled == "") { %>
					<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormRefDelete', '<%=refpRefID%>')">Delete</A>
				<% } else { %>
					&nbsp;
				<% } %>
			</TD>
			<TD CLASS="cell3">
				<STRONG>STATUS</STRONG> (ref#=<%=refpRefID%>)<BR>
                <%=pStatus%><BR>
			</TD>
		</TR>
	</TABLE>

	<P>&nbsp;

<%
	// end big reference loop
    }
%>
<%
}
catch(Exception e)
{
	System.err.println(e);
	e.printStackTrace();
}
%>
<%@ include file="bnav2way.jspf" %>