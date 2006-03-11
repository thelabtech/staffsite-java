<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	Conference conference = (Conference)ar.getObject("conference");
	RegistrationType rt = (RegistrationType)ar.getObject("RegistrationType");
	String typeLabel = rt.getLabel();	
	
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean newRegType = session.getValue("newRegType") != null && ((String)session.getValue("newRegType")).equals("true");
	boolean onlyOneRegType = session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true");
	
	String pageTitle = "Profile Questions" + (onlyOneRegType?"":(" for "+typeLabel));

%>
<SCRIPT LANGUAGE="JavaScript">
<!--

	function goNextWithRedirect(action,nextAction, buttonname){
		var form = document.questions;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else {
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
-->
</SCRIPT>
<%@ include file="/crs/e_header.jspf"%>
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
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(3) : conferenceMenu.display(8)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='questions'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE=""><INPUT TYPE=hidden NAME="nextAction"> <INPUT
			TYPE=hidden
			NAME="ConferenceID"
			VALUE="<%=conference.getConferenceID()%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="5">Profile Questions<%=onlyOneRegType?"":" for "+rt.getLabel()%></TD>
			</TR>
			<TR>
				<TD CLASS="nosort">&nbsp;</TD>
				<TD
					COLSPAN="3"
					CLASS="nosort"
					ALIGN="CENTER"><B>(Don't Ask Question) / (Ask Question) / (Require
				Question)</B></TD>
			</TR>
			<% 
			formatter.setHeaderNames(new String[] {"Question","Choices"	});
			formatter.setHeaderSorts(new boolean[] {false, false});
			formatter.setHeaderWidths(new String[] {"*", "20%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "CENTER"});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Profile Questions Table", "")%>
			<%
			for(int j = 0; j < Conference.profileNames.length; j++){%>
			<TR>
				<TD
					CLASS="<%=(j%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><%=j%> <%=Conference.profileNames[j]%></TD>
		<% 		int typeID = rt.getRegistrationTypeID();
				int thisprofile = rt.decodeProfile(j);
				%>
					<TD	CLASS="<%=(j%2 == 0) ? "cell" : "cell2" %>"
								VALIGN="BOTTOM"	ALIGN="CENTER">
					<INPUT TYPE="RADIO"	NAME="q_<%=j%>"
						VALUE="0" <%=thisprofile == 0 ? "CHECKED" : ""%>>/
					<INPUT TYPE="RADIO"	NAME="q_<%=j%>"
						VALUE="1" <%=thisprofile == 1 ? "CHECKED" : ""%>>/
					<INPUT TYPE="RADIO"	NAME="q_<%=j%>"
						VALUE="2" <%=thisprofile == 2 ? "CHECKED" : ""%>>
					</TD>

			<%
			}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="5">
				<TABLE
					CELLSPACING="0"
					CELLPADDING="0"
					BORDER="0"
					WIDTH="100%">
					<% 
			//	if(newEvent && newRegType){ //why new reg type AND new event?  why not just new reg type?
			if(newRegType){				// replaced 5/9/05 S.Paulis

%>
					<TR>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=listRegTypeMerchandise"
							CLASS="button">&lt;&lt; Back</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"><A
							HREF="javascript: goNext('saveProfileQuestions', 'save')"
							NAME="save"
							CLASS="button">Next &gt;&gt;</A></TD>
					</TR>
					<% 
			} else{
%>
			<TR><TD COLSPAN="3" CLASS="button" >
				<TABLE WIDTH="100%"><TR>
				<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=listRegistrationTypes" CLASS="button">Cancel</A></TD>
				<TD CLASS="button" ALIGN="CENTER">
				<A HREF="javascript: goNextWithRedirect('saveProfileQuestions','editRegistrationType', 'rt')" CLASS="button" NAME="rt">Edit Registrant Type</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveProfileQuestions','editFinancialDetails', 'financial')" CLASS="button" NAME="financial">Edit Financial Details</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveProfileQuestions','listRegTypeMerchandise', 'merchandise')" CLASS="button" NAME="merchandise">Edit Additional Expenses</A><br><br>
			<A HREF="javascript: emptyfunction('saveProfileQuestions','editProfileQuestions', 'profile')" CLASS="inactivebutton" NAME="profile">Edit Profile Questions</A><br><br>
				<A HREF="javascript: goNextWithRedirect('saveProfileQuestions','listRegTypeQuestions', 'questions')" CLASS="button" NAME="questions">Edit Custom Questions</A></TD>
				<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('saveProfileQuestions', 'save')" NAME="save" CLASS="button" NAME="save">Save Changes</A></TD>
				</TR></TABLE>
				</TD>
			</TR>
					<% 
			}
%>
				</TABLE>
				</TD>
			</TR>
		</TABLE>
		</FORM>
		<P>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">By default, all registrants will be asked for their
				name, email address and gender. On this page, you may select the
				other items of personal information that you wish to include on the
				registration form for your conference. Use the radio buttons for each question to NOT
				include it (left radio button), INCLUDE it (middle radio button) or
				REQUIRE it (right radio button). If you select "include," the
				question will be included, but the registrant will be able to
				proceed to the next page without answering it. If you select
				"require," the registrant will not be able to proceed to the next
				page without answering the question.</TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf"%>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
