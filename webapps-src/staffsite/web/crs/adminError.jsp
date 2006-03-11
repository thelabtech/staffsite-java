<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.crs.model.*"%>
<%
    ActionResults ar = ActionResults.getActionResults(session);
    if(ar==null){
        response.sendRedirect("/servlet/CRSAdmin");
    }
    String pageTitle = "Conference Registration System Error";
	Conference conference = new Conference();
%>
<%@ include file="/crs/e_header.jspf"%>
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
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Error</TD>
			</TR>
			<TR>
				<TD
					CLASS="cell"
					COLSPAN="2">An error has occurred processing your request:&nbsp;
				<P>Please report this error to <a
					href="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</a>
				and please include:
				<p>1. Any error messages on this page. <br>
				2. Where you are on the site and what you are trying to do. <br>
				3. If you are filling out a form, what is the specific information
				you were entering into the blanks ?
				<p>Thank you for your help.<BR>
				This information will help us to serve you more quickly and
				efficiently.
				<p>
				<p>--- Errors Begin ---<br>
				<%=new Date()%><br>
				<%=ar.getValue("exceptionText")%> <BR>
				--- Errors End ---<br>
				</TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="javascript: history.go(-1)"
					CLASS="button">Back</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<table
	cellpadding=5
	cellspacing=0
	border=1
	bordercolor=black>
	<tr>
		<td bgcolor=black>
		<center><font
			size=+2
			color=white><b>Error
		</td>
	</tr>
	<td><BR>
	<BR>
	<BR>
	<center>An error has occurred processing your request:&nbsp;
	<P>Please report this error to <a
		href="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</a>
	and please include:
	<p>1. Any error messages on this page. <br>
	2. Where you are on the site and what you are trying to do. <br>
	3. If you are filling out a form, what is the specific information you
	were entering into the blanks ?
	<p>Thank you for your help.<BR>
	This information will help us to serve you more quickly and
	efficiently.
	<p>
	<p>--- Errors Begin ---<br>
	<%=new Date()%><br>
	<%=ar.getValue("exceptionText")%> <BR>
	--- Errors End ---<br>
	<BR>
	<BR>
	<BR>
	</center>
	</td>
	</tr>
</table>
</center>
<%@ include file="/crs/e_footer.jspf"%>
