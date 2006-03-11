<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selAOA" class="org.alt60m.html.SelectAoA"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>

<% //Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>STINT/INTERNSHIPS Search Projects</TITLE>
</HEAD>

<% String pageTitle = "Projects - (Search Tool)"; %>

<%@ include file="/hr_si/evaluator/sitoolheader.jspf" %>

<table width='100%' border='0'>
<TR>
	<td>
		<table>

			<tr><td colspan='2'><%=fontXL%><b>&nbsp;&nbsp;Search Projects</b></FONT></TD></tr>
			<tr><td>
<form method="post" action="/servlet/SIController">
<input type="hidden" name="action" value="adminListProjects">
<input type="hidden" name="view" value="listprojects">
			<%=searchSubmit%></TD></tr>
			<tr><td><%=font%><b>&nbsp;&nbsp;Name</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="Name" SIZE=30 MAXLENGTH=50 VALUE="" ></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;City</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="City" SIZE=30 MAXLENGTH=50 VALUE="" ></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;Country</b></FONT></TD><td><%=font%><% selCountry.setName("Country");%><%=selCountry.print()%></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;Sending Region</b></FONT></TD><td><%=font%><% selRegion.setName("Region");%><%=selRegion.print()%></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;AOA</b></FONT></TD><td><%=font%><% selAOA.setName("AOA");%><%=selAOA.print()%></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;Start Date</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="StartDate" SIZE=10 MAXLENGTH=8 VALUE="" ></FONT></TD></tr>
			<TR><td><%=font%><b>&nbsp;&nbsp;End Date</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="EndDate" SIZE=10 MAXLENGTH=8 VALUE="" ></FONT></TD></tr>
			<tr valign='top'>
				<td><%=font%><b>&nbsp;&nbsp;Year</TD>
				<td><%=font%><select name="Year">
					<option value="<%=SIUtil.CURRENT_SI_YEAR%>">Current Year</option>
					<%
						for( int i = SIUtil.CURRENT_SI_YEAR_INT - 1; i >= 2003; i-- ) {
					%>
							<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
					<option value="">All Years</option>
					</select></FONT>
				</TD>
			</tr>
			<TR>
				<td>
					<%=searchSubmit%>
					</form>
				</TD>
			</tr>
		</table>
	</td>

	<td colspan='2' valign='top'>
		<%=font%><div align=left>
		<b>Notes:</b>
		<ul>
			For the text boxes you only have to enter the first few letters. The more you enter the more refined the search will be.
		</ul>
		</div>
	</td>
<%@ include file="/hr_si/evaluator/sisidemenu.jspf" %>

</tr>
</table>
<p> &nbsp;
<%@ include file="/hr_si/evaluator/sitoolfooter.jspf" %>

</HTML>