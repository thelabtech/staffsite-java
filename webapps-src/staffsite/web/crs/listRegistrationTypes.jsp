<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<jsp:useBean
	id="selState"
	class="org.alt60m.html.SelectState"
	scope="request" />
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	String pageTitle = "Manage Registrant Types";
%>
<%@ include file="/crs/e_header.jspf"%>
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
	function goNext(action, buttonname){
		var form = document.myForm;

		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else{
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}
//-->
</SCRIPT>
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

		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD	CLASS="boxheader" COLSPAN="4">Manage Registrant Types, Questions & Financial Details</TD>
			</TR>
			<TR>
			<TD  COLSPAN="4" CLASS="subboxheader">Existing Registrant Types (Includes Questions & Financial Details)</TD>
			</TR>
			<TR>
				<TD CLASS="subboxheader">Label</TD>
				<TD CLASS="subboxheader">Description</TD>
				<TD COLSPAN="2" CLASS="subboxheader">Actions</TD>
			</TR>
			<% /* iterate over all RegistrationTypes */
					Iterator regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
						String typeDescription = (String)v.get(2);
						/* to be modified in the future for N types */
						if ("".equals(typeLabel) && i==0)	typeLabel="Student / Attendee";
						if ("".equals(typeDescription) && i==0)	typeDescription="Coming to participate in the conference as a regular attendee";
			%>

			<TR>
				<TD CLASS="cell"><%=typeLabel%></TD>
				<TD CLASS="cell"><%=typeDescription%></TD>
				<TD	CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=editRegistrationType&regTypeID=<%=typeID%>"
					CLASS="button">Edit</A></TD>
				<% if (i>0){ /* must have at least 1 reg type */%>
					<TD	CLASS="button"
						ALIGN="LEFT"><A
						HREF="/servlet/CRSAdmin?action=confirmDeleteRegistrationType&registrationTypeID=<%=typeID%>"
						CLASS="button">Delete</A></TD>
				<%}else{%>
					<TD CLASS="button">&nbsp;</TD>
				<%}%>
			</TR>
			<%}%>

			</TABLE>
<P>
			<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="subboxheader">Add a new Registrant Type</TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A HREF="/servlet/CRSAdmin?action=newRegistrationType"
					CLASS="button">New</A></TD>
			</TR>
		</TABLE>
<P>
			<FORM
			NAME="myForm"
			ACTION="/servlet/CRSAdmin"><INPUT
			TYPE="HIDDEN"
			NAME="action"
			VALUE="createCloneRegistrationType">
			<INPUT TYPE="HIDDEN" NAME="regTypeID" VALUE="0">

			<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="subboxheader"   COLSPAN="2">Clone an Existing Registrant Type</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">New Registrant Type Label</TD>
				<TD CLASS="cell"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="cloneLabel"
					SIZE="30"
					MAXLENGTH="50"></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Clone Registrant Type:</TD>
				<TD CLASS="cell"><SELECT
					NAME="cloneID"
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)">
					<OPTION VALUE="">Select a Registrant Type</OPTION>
			<% /* iterate over all RegistrationTypes */
					regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
			%>
			<OPTION VALUE="<%=typeID%>"><%=typeLabel%></OPTION>
			<%}%>
			</SELECT>
			</TD>
			</TR>
			<TR>
				<TD
					ALIGN="right"   COLSPAN="2" CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('createCloneRegistrationType','clone')"
					CLASS="button" NAME='clone'>Clone Registrant Type</A></TD>
			</TR>
		</TABLE>
		</FORM>
		
		
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<% 
		if(newEvent){
		%>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=listCustomItems"
					CLASS="button">&lt;&lt; Back</A></TD>
				<TD COLSPAN="2" CLASS="button">&nbsp;</TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="/servlet/CRSAdmin?action=editDisplayOptions"
					CLASS="button">Next &gt;&gt;</A></TD>
			</TR>
			<% 
		} else{
%>
			<TR>
				<TD COLSPAN="3" CLASS="button">&nbsp;</TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="/servlet/CRSAdmin?action=showConference"
					CLASS="button">Done</A></TD>
			</TR>
			<% 
		}
%>
		</TABLE>
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
				<TD CLASS="cell">
				<p>This is your master screen for managing the registrant types for your conference.</p>
				<p>The first box, "Existing Registrant Types," lists the registrant types that you have already created. Clicking the "Edit" button will take you to a page that will allow you to edit the information that you have already entered about that type, including the financial details, additional expenses, profile questions and custom questions.</p>

				<p>To add a new registrant type, click the "New" button in the second box entitled "Add a new Registrant Type." You will be prompted to enter all of the information needed for your new registrant type, including the financial details, additional expenses, profile questions and custom questions.</p>

				<p>If you want to create a new registrant type that has most or all of the same financial details, additional expenses, profile questions and custom questions as one of your existing registrant types, you can do this easily by "cloning" an existing registrant type (third box). Just type the label for your new registrant type in the "New Registrant Type Label" box, and then select the registrant type that you would like to clone from the drop-down box of existing registrant types. Click "Clone Registrant Type." This will take you to a page that will allow you to edit the details of your newly-cloned registrant type, so that if it's not EXACTLY the same as the type that you just cloned, you can make the necessary changes.</p>

				<p><b>PLEASE NOTE:</b> If you wish to use the "Christmas Conference Access Template" to download and manage your conference data, you need to include "staff" as one of your registrant types.</p>
				
				<P>Hover over the blue question marks <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('Hi!');"
					onmouseout="return nd();"> for additional information</P>
				</TD>
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
