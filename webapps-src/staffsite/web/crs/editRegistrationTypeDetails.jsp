<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion" scope="request"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState" scope="request"/>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean"/>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	String pageTitle = "Edit Registrant Type Details";
	selBool.setLabels("Yes"," No");
%>
<%@ include file="/crs/e_header.jspf" %>
<%formatter.setNoDate("");%>
<%
	if(newEvent){
		creationMenu.setActives(new boolean[]{
			true,
			false, 
			false, 
			false, 
			false, 
			false
		});
	}
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;

		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		}
	<% /* iterate over all RegistrationTypes */
			Iterator regTypes = regTypesV.iterator();
			for(int i = 0; regTypes.hasNext(); i++){
				RegistrationType rt = (RegistrationType)regTypes.next();
				int typeID=rt.getRegistrationTypeID();
	%>

		else if(!validDate(form.DefaultDateArrive_<%=typeID%>.value)){
			alert("The Default <%=rt.getLabel()%> Arrival Date must be entered in the form MM/DD/YYYY");
			form.DefaultDateArrive_<%=typeID%>.focus();
		} else if(!validDate(form.DefaultDateLeave_<%=typeID%>.value)){
			alert("The Default <%=rt.getLabel()%> Departure Date must be entered in the form MM/DD/YYYY");
			form.DefaultDateLeave_<%=typeID%>.focus();
		} else if(!validDateRange(form.DefaultDateArrive_<%=typeID%>.value, form.DefaultDateLeave_<%=typeID%>.value)){
			alert("The start Default <%=rt.getLabel()%> Date must be earlier than the end Default <%=rt.getLabel()%> Date");
		}
<%}%>
		else{
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150">
		<%=toolsMenu.display(0)%>
		<P>
		<%=newEvent ? creationMenu.display(4) : conferenceMenu.display(9)%>
	</TD>
	<TD VALIGN="TOP">
	<FORM NAME='theForm' ACTION="/servlet/CRSAdmin" METHOD="post">
	<INPUT TYPE=hidden NAME="action">
	<INPUT TYPE=hidden NAME="ConferenceID" VALUE="<%=conference.getConferenceID()%>">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Edit Registrant Type Details</TD>
		</TR>
		
	<% /* iterate over all RegistrationTypes */
			regTypes = regTypesV.iterator();
			for(int i = 0; regTypes.hasNext(); i++){
				RegistrationType rt = (RegistrationType)regTypes.next();
				int typeID=rt.getRegistrationTypeID();
	%>
		<TR>
			<TD CLASS="subboxheader" COLSPAN="2"><%=rt.getLabel()%></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP" WIDTH="40%">Default Arrival Date</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"
			NAME="DefaultDateArrive_<%=typeID%>" SIZE=10 MAXLENGTH=10
			value="<%=formatter.formatDate(rt.getDefaultDateArrive() == null ? conference.getMasterDefaultDateArrive() : rt.getDefaultDateArrive())%>">
			<A HREF="javascript: pickdate(document.theForm.DefaultDateArrive_<%=typeID%>)" CLASS="button">Choose</A></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Default Departure Date</TD>
			<TD CLASS="cell"><INPUT CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"
			NAME="DefaultDateLeave_<%=typeID%>" SIZE=10 MAXLENGTH=10 value="<%=formatter.formatDate(rt.getDefaultDateLeave() == null ? conference.getMasterDefaultDateLeave() : rt.getDefaultDateLeave())%>">
			<A HREF="javascript: pickdate(document.theForm.DefaultDateLeave_<%=typeID%>)" CLASS="button">Choose</A></TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Will this registrant type be allowed to register their spouses?</TD>
			<TD CLASS="cell">
<%
			selBool.setCurrentValue(rt.getAskSpouse());
			selBool.setName("AskSpouse_"+typeID);
%>
			<%=selBool.printRadioBoolean()%>			
			</TD>
		</TR>
		<TR>
			<TD CLASS="hl" ALIGN="RIGHT" VALIGN="CENTER">Will this registrant type be allowed to bring children?</TD>
			<TD CLASS="cell">
<%
			selBool.setCurrentValue(rt.getAskChildren());
			selBool.setName("AskChildren_"+typeID);
%>
			<%=selBool.printRadioBoolean()%>			
			</TD>
		</TR>
<%}%>

<% 
		if(newEvent){
%>
			<TR>
				<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=listRegistrationTypes" CLASS="button">&lt;&lt; Back</A></TD>
				<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('saveRegistrationTypeDetails', 'save')" NAME="save" CLASS="button">Next &gt;&gt;</A></TD>
			</TR>
<% 
		} else{
%>
			<TR>
				<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=showConference" CLASS="button">Cancel</A></TD>
				<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('saveRegistrationTypeDetails', 'save')" NAME="save" CLASS="button" NAME="savebutton">Save Changes</A></TD>
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
			<p>The Default Arrival and Departure dates for this Registrant Type are set, by default, to the Master Default Arrival/Departure Dates that were entered on the "Conference Info" page. You may adjust these dates for this Registrant Type by clicking the "Choose" button and selecting a new date.</p>

			<p>If you select "yes" to indicate that this Registrant Type will be allowed to bring children, registrants of this Type will be asked for their children's names, birthdates, and whether they require childcare.</p>
			
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
