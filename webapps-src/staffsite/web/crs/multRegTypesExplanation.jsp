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
			COLSPAN="2">Next, you will have an opportunity to create your registrant types. For each type, you will be asked to fill in some basic information, such as its label (such as “student,” “participant,” or whatever you want to call it), its description (such as “coming to participate in the conference as a regular attendee”), and whether or not this type will be allowed to register spouses and children. After that, you will have screens to enter the costs and discounts, additional expenses, and questions that you want to ask this type. Once you have finished creating the first type, you’ll have the opportunity to add as many additional types as you want.
			<br /><br />
			</TD>
			 
		</TR>		
		<TR>
			<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=chooseNumRegTypes" CLASS="button">&lt;&lt; Back</A></TD>
			<TD CLASS="button" ALIGN="RIGHT"><A HREF="/servlet/CRSAdmin?action=editRegistrationType" CLASS="button">Next &gt;&gt;</A></TD>
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
