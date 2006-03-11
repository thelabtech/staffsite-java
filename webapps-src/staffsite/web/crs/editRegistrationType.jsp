<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion" scope="request"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState" scope="request"/>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean"/>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	Conference conference = (Conference)ar.getObject("conference");
	RegistrationType rt = (RegistrationType)ar.getObject("RegistrationType");
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean newRegType = session.getValue("newRegType") != null && ((String)session.getValue("newRegType")).equals("true");
	boolean firstRegType = session.getValue("firstRegType") != null && ((String)session.getValue("firstRegType")).equals("true");
	boolean onlyOneRegType = session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true");
		
	String pageTitle = "Edit Registrant Type Details";
	selBool.setLabels("Yes"," No");
	String typeLabel = rt.getLabel();
	String typeDescription = rt.getDescription();
	if ("".equals(typeLabel))	typeLabel= "(ex. Student, Staff, Guest)";
	if ("".equals(typeDescription))	typeDescription="Coming to participate in the conference as a regular attendee";
%>
<%@ include file="/crs/e_header.jspf" %>
<%formatter.setNoDate("");%>
<%
	if(newEvent){
		creationMenu.setActives(new boolean[]{
			true,
			true, 
			true, 
			false
		});
	}
%>
<SCRIPT LANGUAGE="JavaScript">
<!--

	function goNextWithRedirect(action, nextAction, buttonname){
		var form = document.theForm;

		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		}

		else if(!validDate(form.DefaultDateArrive.value)){
			alert("The Default Arrival Date must be entered in the form MM/DD/YYYY");
			form.DefaultDateArrive.focus();
		} else if(!validDate(form.DefaultDateLeave.value)){
			alert("The Default Departure Date must be entered in the form MM/DD/YYYY");
			form.DefaultDateLeave.focus();
		} else if(!validDateRange(form.DefaultDateArrive.value, form.DefaultDateLeave.value)){
			alert("The start Default Date must be earlier than the end Default Date");
		}
		else{
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.nextAction.value = nextAction;
				form.submit();
			}
		}
	}

	function goNext(action,buttonname){
		goNextWithRedirect(action,null,buttonname);
	}
	function emptyfunction(){
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
		<%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(3) : conferenceMenu.display(8)%>
	</TD>
	<TD VALIGN="TOP">
	<FORM NAME='theForm' ACTION="/servlet/CRSAdmin" METHOD="post">
	<INPUT TYPE=hidden NAME="action">
	<INPUT TYPE=hidden NAME="nextAction">
	<INPUT TYPE=hidden NAME="ConferenceID" VALUE="<%=conference.getConferenceID()%>">
	<INPUT TYPE=hidden NAME="RegistrationTypeID" VALUE="<%=rt.getRegistrationTypeID()%>">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Edit Registrant Type Details</TD>
		</TR>
		
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2"><%=newRegType?"New Registrant Type":typeLabel%></TD>
		</TR>
		<%if(onlyOneRegType){%>
			<INPUT TYPE=hidden NAME="Label" VALUE="Attendee">
			<INPUT TYPE=hidden NAME="Description" VALUE="<%=typeDescription%>">
			<INPUT TYPE=hidden NAME="DefaultDateArrive" VALUE="<%=formatter.formatDate(conference.getMasterDefaultDateArrive())%>">
			<INPUT TYPE=hidden NAME="DefaultDateLeave" VALUE="<%=formatter.formatDate(conference.getMasterDefaultDateLeave())%>">
		<%} else {%>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP" WIDTH="40%">Label</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"
			NAME="Label" SIZE=25 MAXLENGTH=32
			value="<%=firstRegType?"Student / Attendee":typeLabel%>">
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP" WIDTH="40%">Description</TD>
			<TD CLASS="cell">
			<TEXTAREA COLS="60"	ROWS="4" CLASS="empty" NAME="Description"
					onFocus="Highlight(this)" onBlur="UnHighlight(this)"
					onKeyDown="textCounter(this.form.Description,this.form.remLenText,256);"
					onKeyUp="textCounter(this.form.Description,this.form.remLenText,256);"
					><%=typeDescription%></TEXTAREA>
					<% int tmpLength = 256 - typeDescription.length(); %>
					<div class="small" align="right">Characters remaining: <input type="text" name="remLenText" size="4" disabled="disabled" maxlength="4" value="<%=tmpLength%>"></div></TD>
					</TD>
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP" WIDTH="40%">Default Arrival Date</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"
			NAME="DefaultDateArrive" SIZE=10 MAXLENGTH=10
			value="<%=formatter.formatDate(rt.getDefaultDateArrive() == null ? conference.getMasterDefaultDateArrive() : rt.getDefaultDateArrive())%>">
			<A HREF="javascript: pickdate(document.theForm.DefaultDateArrive)" CLASS="button">Choose</A></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Default Departure Date</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"
			NAME="DefaultDateLeave" SIZE=10 MAXLENGTH=10 value="<%=formatter.formatDate(rt.getDefaultDateLeave() == null ? conference.getMasterDefaultDateLeave() : rt.getDefaultDateLeave())%>">
			<A HREF="javascript: pickdate(document.theForm.DefaultDateLeave)" CLASS="button">Choose</A></TD>
		</TR>
	
	<%}%>
		
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Will<%=onlyOneRegType?" registrants ":" this registrant type "%> be allowed to register their spouses?</TD>
			<TD CLASS="cell">
<%
			selBool.setCurrentValue(rt.getAskSpouse());
			selBool.setName("AskSpouse");
%>
			<%=selBool.printRadioBoolean()%>			
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Will <%=onlyOneRegType?" registrants ":" this registrant type "%>be allowed to bring children?</TD>
			<TD CLASS="cell">
<%
			selBool.setCurrentValue(rt.getAskChildren());
			selBool.setName("AskChildren");
%>
			<%=selBool.printRadioBoolean()%>			
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">If <%=onlyOneRegType?" registrants ":" this registrant type "%>has children, will childcare be provided?</TD>
			<TD CLASS="cell">
<%
			selBool.setCurrentValue(rt.getAskChildCare());
			selBool.setName("AskChildCare");
%>
			<%=selBool.printRadioBoolean()%>			
			</TD>
		</TR><TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Will <%=onlyOneRegType?" registrants ":" this registrant type "%>be allowed to register additional rooms for children?</TD>
			<TD CLASS="cell">
<%
			selBool.setCurrentValue(rt.getAskAdditionalRooms());
			selBool.setName("AskAdditionalRooms");
%>
			<%=selBool.printRadioBoolean()%>			
			</TD>
		</TR>
<% 
	//	if(newEvent && newRegType){ //why new reg type AND new event?  why not just new reg type?
		if(newRegType){				// replaced 5/9/05 S.Paulis
%>
			<TR>
				<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=<%=onlyOneRegType?"chooseNumRegTypes":(firstRegType?"listCustomItems":"listRegistrationTypes")%>" CLASS="button">&lt;&lt; Back</A></TD>
				<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('saveRegistrationType', 'save')" NAME="save" CLASS="button" NAME="save">Next &gt;&gt;</A></TD>
			</TR>
<% 
		} else{
%>
			<TR><TD COLSPAN="3" CLASS="button" >
				<TABLE WIDTH="100%"><TR>
				<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=listRegistrationTypes" CLASS="button">Cancel</A></TD>
				<TD CLASS="button" ALIGN="CENTER">
				<A HREF="javascript: emptyfunction('saveRegistrationType','editRegistrationType', 'rt')" CLASS="inactivebutton" NAME="rt">Edit Registrant Type</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveRegistrationType','editFinancialDetails', 'financial')" CLASS="button" NAME="financial">Edit Financial Details</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveRegistrationType','listRegTypeMerchandise', 'merchandise')" CLASS="button" NAME="merchandise">Edit Additional Expenses</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveRegistrationType','editProfileQuestions', 'profile')" CLASS="button" NAME="profile">Edit Profile Questions</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveRegistrationType','listRegTypeQuestions', 'questions')" CLASS="button" NAME="questions">Edit Custom Questions</A></TD>
				<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('saveRegistrationType', 'save')" NAME="save" CLASS="button" NAME="save">Save Changes</A></TD>
				</TR></TABLE>
				</TD>
			</TR>		
<% 
		}
%>
	</TABLE>
	</FORM>
	<P>
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
		</TR>
		<TR>
			<TD CLASS="cell">
			<p><b>NEW!</b> The CRS now allows you to customize childcare at your conference. You can now choose whether or not to provide childcare and to allow additional rooms to regsitered for children. 
			If you select "No" for either of these options, the corresponding question will be removed from the "Child Registration" page</p>
			
			the question will be removed from 
			<p>The Default Arrival and Departure dates for this Registrant Type are set, by default, to the Master Default Arrival/Departure Dates that were entered on the "Conference Info" page. 
			You may adjust these dates for this Registrant Type by clicking the "Choose" button and selecting a new date.</p>

			<p>If you select "yes" to indicate that this Registrant Type will be allowed to bring children, 
			registrants of this Type will be asked for their children's names, birthdates, and whether they require childcare.</p>
			
			<P>Hover over the blue question marks <img src='/crs/images/info.gif' height=15 width=15 onmouseover="return overlib('Hi!');" onmouseout="return nd();"> for additional information </P>
			</TD>
		</TR>
	</TABLE>
	<%@ include file="/crs/e_footer_help.jspf"%>
	</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf" %>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
