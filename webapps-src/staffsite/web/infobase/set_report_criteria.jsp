<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar;
ar = ActionResults.getActionResults(session);
%>
<% String pageTitle="Success Criteria Reports"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>


<TABLE width="100%">
	<TR>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Success Criteria Reports</a></font></TD>
	</TR>
	<tr>
		<td>
		<br/>
		<%=fontB%>If you experience any technical problems while either entering your success criteria or running a report, please give us as much information as possible about the problem by using this <A href="/general/feedback.jsp">Help Request form</A>.</font>
		</td>
	</tr>
</TABLE>

<br/>
<form method="post" action="/servlet/InfoBaseController">
<input type="hidden" name="action" value="showReport">
<%
	String ptname, ptvalue;
	String type = request.getParameter("type");
	if(type.equals("targetarea")){
		ptname = "targetareaid";
		ptvalue = request.getParameter("targetareaid");
	} else if(type.equals("locallevel")){
		ptname = "locallevelid";
		ptvalue = request.getParameter("locallevelid");
	} else if(type.equals("regional")) {
		ptname = "region";
		ptvalue = request.getParameter("region");
	}
	else {
		ptname = "";
		ptvalue = "";
	}
%>
	<input type=hidden name=<%=ptname%> value="<%=ptvalue%>">
	<input type=hidden name=type value="<%= request.getParameter("type") %>">
	<CENTER>
	<%
		box.setTitle("Fill out this form to get a listing of the information you desire:");
		box.setWidth("");
		box.setStyle("Classic");
		out.print(box.printTop());
		%>
	<table width="90%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td valign="top"><img src="/infobase/images/1.gif" width="32" height="48"></td>
		  <td>
			<p><%=fontB%><i>Select which CCC ministries you would like included
			  in your report:</font></p>

			<table border="0" cellpadding="5" cellspacing="5" <%=bgcolorL%>>
			  <tr><td><%=fontB%>
					<input type="checkbox" name="SC" value="true" CHECKED>Staffed Campus<br>
					<input type="checkbox" name="CA" value="true" CHECKED>Catalytic<br>
					<input type="checkbox" name="II" value="true" CHECKED>ESM-Impact<br>
					<input type="checkbox" name="IE" value="true" CHECKED>ESM-Epic<br>
					<input type="checkbox" name="ID" value="true" CHECKED>ESM-Destino<br>
					<input type="checkbox" name="IN" value="true" CHECKED>ESM-Nations<br>
					<input type="checkbox" name="BR" value="true" CHECKED>Bridges<br>
					<input type="checkbox" name="WS" value="true" CHECKED>WSN STInt<br>
					<input type="checkbox" name="WI" value="true" CHECKED>WSN ICS<br>
					<input type="checkbox" name="MM" value="true" CHECKED>Military Ministry<br>
					<input type="checkbox" name="AA" value="true" CHECKED>Athletes In Action<br>
					<input type="checkbox" name="GR" value="true" CHECKED>Grad Resources<br>
					<input type="checkbox" name="CL" value="true" CHECKED>Christian Leadership Ministries<br>
					<input type="checkbox" name="KC" value="true" CHECKED>Korean CCC<br>
					<input type="checkbox" name="GK" value="true" CHECKED>Greek<br>
					<input type="checkbox" name="VL" value="true" CHECKED>Valor<br>
					<input type="checkbox" name="OT" value="true" CHECKED>Other<br>
					
	
			  </td></tr>
			</table>
			<p>
		  </td>
		</tr>
		<tr>
		  <td valign="top"><img src="/infobase/images/2.gif" width="35" height="47"></td>
		  <td>
			<p><%=fontB%><i>Select a date range for your report:</i></font></p>
			<table width="200" border="0" cellpadding="5" cellspacing="5">
			  <tr <%=bgcolorB%>>
				<td colspan="2"><b><%=fontW%>From</b></td>
				<td colspan="2"><b><%=fontW%>To</b></td>
			  </tr>
			  <tr <%=bgcolorL%>>
				<td><%=fontB%>Year</td>
				<td><%=fontB%>Month</td>
				<td><%=fontB%>Year</td>
				<td><%=fontB%>Month</td>
			  </tr>
			  <tr <%=bgcolorL%>>
				<td>
				  <select name="fromyear">
					<option value='1998'>1998</option>
					<option value='1999'>1999</option>
					<option value='2000'<% if(((String)ar.getValue("fromYear")).equals("2000")) out.print(" SELECTED"); %>>2000</option>
					<option value='2001'<% if(((String)ar.getValue("fromYear")).equals("2001")) out.print(" SELECTED"); %>>2001</option>
					<option value='2002'<% if(((String)ar.getValue("fromYear")).equals("2002")) out.print(" SELECTED"); %>>2002</option>
					<option value='2003'<% if(((String)ar.getValue("fromYear")).equals("2003")) out.print(" SELECTED"); %>>2003</option>
					<option value='2004'<% if(((String)ar.getValue("fromYear")).equals("2004")) out.print(" SELECTED"); %>>2004</option>
					<option value='2005'<% if(((String)ar.getValue("fromYear")).equals("2005")) out.print(" SELECTED"); %>>2005</option>
					<option value='2006'<% if(((String)ar.getValue("fromYear")).equals("2006")) out.print(" SELECTED"); %>>2006</option>
					<option value='2007'<% if(((String)ar.getValue("fromYear")).equals("2007")) out.print(" SELECTED"); %>>2007</option>
				  </select>
				</td>
				<td>
				  <select name="frommonth">
				  <option value='1'<% if(((String)ar.getValue("fromMonth")).equals("1")) out.print(" SELECTED"); %>>Jan</option>
				  <option value='2'<% if(((String)ar.getValue("fromMonth")).equals("2")) out.print(" SELECTED"); %>>Feb</option>
				  <option value='3'<% if(((String)ar.getValue("fromMonth")).equals("3")) out.print(" SELECTED"); %>>Mar</option>
				  <option value='4'<% if(((String)ar.getValue("fromMonth")).equals("4")) out.print(" SELECTED"); %>>Apr</option>
				  <option value='5'<% if(((String)ar.getValue("fromMonth")).equals("5")) out.print(" SELECTED"); %>>May</option>
				  <option value='6'<% if(((String)ar.getValue("fromMonth")).equals("6")) out.print(" SELECTED"); %>>Jun</option>
				  <option value='7'<% if(((String)ar.getValue("fromMonth")).equals("7")) out.print(" SELECTED"); %>>Jul</option>
				  <option value='8'<% if(((String)ar.getValue("fromMonth")).equals("8")) out.print(" SELECTED"); %>>Aug</option>
				  <option value='9'<% if(((String)ar.getValue("fromMonth")).equals("9")) out.print(" SELECTED"); %>>Sep</option>
				  <option value='10'<% if(((String)ar.getValue("fromMonth")).equals("10")) out.print(" SELECTED"); %>>Oct</option>
				  <option value='11'<% if(((String)ar.getValue("fromMonth")).equals("11")) out.print(" SELECTED"); %>>Nov</option>
				  <option value='12'<% if(((String)ar.getValue("fromMonth")).equals("12")) out.print(" SELECTED"); %>>Dec</option>
				  </select>
				</td>
				<td>
				  <select name="toyear">
					<option value='1998'>1998</option>
					<option value='1999'>1999</option>
					<option value='2000'<% if(((String)ar.getValue("toYear")).equals("2000")) out.print(" SELECTED"); %>>2000</option>
					<option value='2001'<% if(((String)ar.getValue("toYear")).equals("2001")) out.print(" SELECTED"); %>>2001</option>
					<option value='2002'<% if(((String)ar.getValue("toYear")).equals("2002")) out.print(" SELECTED"); %>>2002</option>
					<option value='2003'<% if(((String)ar.getValue("toYear")).equals("2003")) out.print(" SELECTED"); %>>2003</option>
					<option value='2004'<% if(((String)ar.getValue("toYear")).equals("2004")) out.print(" SELECTED"); %>>2004</option>
					<option value='2005'<% if(((String)ar.getValue("toYear")).equals("2005")) out.print(" SELECTED"); %>>2005</option>
					<option value='2006'<% if(((String)ar.getValue("toYear")).equals("2006")) out.print(" SELECTED"); %>>2006</option>
					<option value='2007'<% if(((String)ar.getValue("toYear")).equals("2007")) out.print(" SELECTED"); %>>2007</option>
				  </select>
				</td>
				<td>
				  <select name="tomonth">
				  <option value='1'<% if(((String)ar.getValue("toMonth")).equals("1")) out.print(" SELECTED"); %>>Jan</option>
				  <option value='2'<% if(((String)ar.getValue("toMonth")).equals("2")) out.print(" SELECTED"); %>>Feb</option>
				  <option value='3'<% if(((String)ar.getValue("toMonth")).equals("3")) out.print(" SELECTED"); %>>Mar</option>
				  <option value='4'<% if(((String)ar.getValue("toMonth")).equals("4")) out.print(" SELECTED"); %>>Apr</option>
				  <option value='5'<% if(((String)ar.getValue("toMonth")).equals("5")) out.print(" SELECTED"); %>>May</option>
				  <option value='6'<% if(((String)ar.getValue("toMonth")).equals("6")) out.print(" SELECTED"); %>>Jun</option>
				  <option value='7'<% if(((String)ar.getValue("toMonth")).equals("7")) out.print(" SELECTED"); %>>Jul</option>
				  <option value='8'<% if(((String)ar.getValue("toMonth")).equals("8")) out.print(" SELECTED"); %>>Aug</option>
				  <option value='9'<% if(((String)ar.getValue("toMonth")).equals("9")) out.print(" SELECTED"); %>>Sep</option>
				  <option value='10'<% if(((String)ar.getValue("toMonth")).equals("10")) out.print(" SELECTED"); %>>Oct</option>
				  <option value='11'<% if(((String)ar.getValue("toMonth")).equals("11")) out.print(" SELECTED"); %>>Nov</option>
				  <option value='12'<% if(((String)ar.getValue("toMonth")).equals("12")) out.print(" SELECTED"); %>>Dec</option>
				  </select>
				</td>
			  </tr>
			</table>
			<p>&nbsp;</p>
		  </td>
		</tr>
		<tr>
		  <td valign="top"><img src="/infobase/images/3.gif" width="34" height="45"></td>
		  <td>
			<p><%=fontB%><i>Click here to view your report:</i></font></p>
			<p>
		  <input type="submit" value="Make My Report">
			</p>
		  </td>
		</tr>
	</table>
	<%= box.printBottom() %>
	</center>
</form>
<!-- <%=fontB%><%=ar.toHTML()%> -->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>