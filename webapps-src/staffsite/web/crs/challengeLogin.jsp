<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selRegion"
	class="org.alt60m.html.SelectRegion"
	scope="request" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	Conference conference = (Conference)ar.getObject("conference");
	String pageTitle = conference.getName() + " Details";
%>
<%@ include file="/crs/e_header.jspf"%>
<%selRegion.setCurrentValue(conference.getRegion());%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%></TD>
		<TD VALIGN="TOP">
		<FORM
			NAME="theForm"
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE="authenticate">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					VALIGN="BOTTOM"
					COLSPAN="2"><%=conference.getName()%> Login</TD>
			</TR>
			<TR>
				<TD
					CLASS="cell"
					VALIGN="TOP"
					WIDTH="50%"><%
			if(session.getValue("levelRequired").equals("staff")){
%> This conference can only be managed by Campus Crusade for Christ
				staff or authorized volunteers.
				<P>Campus Ministry Staff, to manage this conference, please log on
				to the Campus Staff Site (<A
					HREF="https://staff.campuscrusadeforchrist.com">staff.campuscrusadeforchrist.com</A>),
				and access the CRS from the "Tools" menu.
				<P>Authorized volunteers, please choose "Local Level" below, and
				enter the Local Level password.
				<P>Administrators, you may choose "Administrator" below and enter
				the administrator password.
				<P>Login as <SELECT NAME="requestedLevel">
					<OPTION VALUE="staff">Local Level
					<OPTION VALUE="admin">Administrator
				</SELECT> <%
			} else {
%> <INPUT
					TYPE="hidden"
					NAME="requestedLevel"
					VALUE="admin"> The feature you are trying to access requires an
				administrator login. <%
			}
%>
				<P>Password <INPUT
					NAME="password"
					TYPE="password">
				<P ALIGN="CENTER"><A
					HREF="javascript: document.theForm.submit()"
					CLASS="button">Login</A><BR>
				<BR>
				<A
					HREF="javascript: history.go(-1)"
					CLASS="button">Cancel</A>
				</TD>
				<TD
					CLASS="cell"
					WIDTH="50%"><I><B>If you have questions you may contact:</B></I><br>
				<BLOCKQUOTE><B><%=conference.getContactName()%></B><br>
				<%=conference.getContactAddress1()%><br>
				<% if ((conference.getContactAddress2()!=null)&&(!(conference.getContactAddress2()).equals(""))){%><%=conference.getContactAddress2()%><br>
				<%}%> <%=conference.getContactCity()%>, <%=conference.getContactState()%>
				<%=conference.getContactZip()%><br>
				<A HREF="mailto:<%=conference.getContactEmail()%>"><%=conference.getContactEmail()%></A><br>
				<%=conference.getContactPhone()%></BLOCKQUOTE>
				</TD>
			</TR>
		</TABLE>
		</FORM>
		<%
			if(!session.getValue("levelRequired").equals("staff")){
%>
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
				<TD CLASS="cell">Please enter the administrator password, which was
				assigned when the conference was created. When your password has
				been authenticated, you will be directed back to the Conference
				Details page. You will not have to enter the admin password again.
				Any questions or problems concerning your password can be directed
				to the contact person listed on the right.</TD>
			</TR>
		</TABLE>
		<%@ include file="/crs/e_footer_help.jspf" %>
		<%
			}
%></TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
