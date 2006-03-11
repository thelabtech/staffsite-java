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
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean newRegType = session.getValue("newRegType") != null && ((String)session.getValue("newRegType")).equals("true");
	boolean firstRegType = session.getValue("firstRegType") != null && ((String)session.getValue("firstRegType")).equals("true");
	boolean onlyOneRegType = session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true");
	
	String pageTitle = "Registrant Types";
	selBool.setLabels("Yes"," No");
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
	function goNext(action, buttonname){
		var form = document.theForm;

		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		}
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
		<P><%=newEvent ? creationMenu.display(3) : conferenceMenu.display(8)%>
	</TD>
	<TD VALIGN="TOP">
	<FORM NAME='theForm' ACTION="/servlet/CRSAdmin" METHOD="post">
	<INPUT TYPE=hidden NAME="action">
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Registrant Types</TD>
		</TR>
		<TR>
			<TD
			CLASS="cell"
			COLSPAN="2">
			<p>Now that you've entered the basic information about your event as a whole, the next step is to create your registrant types for this event.</p>

			<p>Most events have two or more registrant types, such as students and staff; students, staff and guests; or perhaps participants, workers, speakers, and vendors. </p>

			<p>It's also possible that your event only has one registrant type. This might be true for a staff retreat or smaller event, where everyone who registers is simply a participant and there's no need to distinguish between registrant types.</p>

			<p><b>NOTE:</b> If you have some prior experience of using the CRS to create a conference, you will notice that this is different from the way we managed registrant types in the past. Previously, you were allowed three registrant types (no more, no less), and you could name and describe them however you wanted. Now, the number of registrant types is completely up to you. You can create as many (or as few) as you want.</p>
			
			<br /><br />
			</TD>
			 
		</TR>
		
		<TR>
		<TD CLASS="subboxheader" WIDTH="100%" COLSPAN="2">
		Before we go on, please select one:
		</TD>
		</TR>
		
		<TR>
			<TD CLASS="cell"  ALIGN="RIGHT" VALIGN="CENTER" WIDTH="10%">
			<INPUT TYPE="radio" NAME="onlyOneRegType" Value="true">
			</TD>
			<TD CLASS="cell" VALIGN="CENTER">My event only has one registrant type
			</TD>
		</TR>
		<TR>
			<TD CLASS="cell"  ALIGN="RIGHT" VALIGN="CENTER" WIDTH="10%">
			<INPUT TYPE="radio" NAME="onlyOneRegType" Value="false" checked>
			</TD>
			<TD CLASS="cell" VALIGN="CENTER">My event has more than one registrant type
			</TD>
		</TR>
		
		<TR>
			<TD
			CLASS="cell"
			COLSPAN="2"><br />NOTE: If you select that your event only has one registrant type, but change your mind in the future and need to create additional registrant types, you'll be able to use the "Manage Registrant Types" button on the menu bar at the left.
			</TD>
			 
		</TR>
		
		<TR>
			<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=listCustomItems" CLASS="button">&lt;&lt; Back</A></TD>
			<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('chooseNumRegTypes','save')" NAME="save" CLASS="button">Next &gt;&gt;</A></TD>
		</TR>

	</TABLE>
	</FORM>
	<P>
	<!--
	<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
		</TR>
		<TR>
			<TD CLASS="cell">
				<p>The Default Arrival and Departure dates for each Registrant Type are set, by default, to the Master Default Arrival/Departure Dates that were entered on the "Conference Info" page. You may adjust these dates for each Registrant Type by clicking the "Choose" button and selecting a new date.</p>

				<!--<p>If you select "yes" to indicate that a Registrant Type will be allowed to register their spouse, registrants of this Type will be asked for their marital status. Those who select "married" will be asked whether their spouse is coming to the conference, and they they will have an opportunity to register on their spouse's behalf.</p>--><!--

				<p>If you select "yes" to indicate that a Registrant Type will be allowed to bring children, registrants of this Type will be asked for their children's names, birthdates, and whether they require childcare.</p>
                <P>	
				Hover over the blue question marks <img src='/crs/images/info.gif' height=15 width=15 onmouseover="return overlib('Hi!');" onmouseout="return nd();"> for additional information </P>
			</TD>
		</TR>
	</TABLE>
	-->
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
