<!-- added these ministries for reporting purposes as they now will have success 
     criteria as well as the full range of statuses.  Further info on this change can 
     be found in the detail_target_area.jsp page.
     
	Military Ministry,Athletes In Action,Christian Leadership Ministries (now Faculty Commons)
	Korean CCC,Greek,Valor and Other
     
 -->

<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar;
ar = ActionResults.getActionResults(session);
String[] strategies = Strategy.strategiesArray();
Integer yearvar=1998;
%>
<% String pageTitle="Success Criteria Reports"; %>
<%@page import="org.alt60m.ministry.Strategy"%>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>

<script>
	function submitReportForm(thisForm) {
		if (
			<% for (int i=0; i<strategies.length-1; i++) {
				out.print("thisForm."+strategies[i]+".checked || ");
			} %>
			<% out.print("thisForm."+strategies[strategies.length-1]+".checked)"); %> {
			return true;
		}
		else {
			alert("You must check at least one strategy");
			return false;
		}
	}
</script>

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
<form name="reportCriteria" method="post" action="/servlet/InfoBaseController" onsubmit="return submitReportForm(this)">
<input type="hidden" name="action" value="showReportAgile">
<%
	String teamID="";
	String region="";
	String targetAreaID="";
	String type = request.getParameter("type");
	if(type.equals("locallevel")){
		teamID = request.getParameter("locallevelid");
	} else if(type.equals("regional")) {		
		region = request.getParameter("region");
	}else if(type.equals("targetarea")) {
		
		targetAreaID = request.getParameter("targetareaid");
	}
	
%>
	<input type=hidden name="teamID" value="<%=teamID%>">
	<input type=hidden name="region" value="<%=region%>">
	<input type=hidden name="targetareaid" value="<%=targetAreaID%>">
	
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
					<input type="checkbox" name="strategies[FS]"  checked value="FS" >Field Strategies<br>
					<input type="checkbox" name="strategies[SC]" checked value="SC" >Staffed Campus<br>
					<input type="checkbox" name="strategies[CA]"  checked value="CA" >Catalytic<br>
					<input type="checkbox" name="strategies[II]"  checked value="II" >ESM-Impact<br>
					<input type="checkbox" name="strategies[IE]"  checked value="IE" >ESM-Epic<br>
					<input type="checkbox" name="strategies[ID]"  checked value="ID" >ESM-Destino<br>
					<input type="checkbox" name="strategies[IN]"  checked value="IN" >ESM-Nations<br>
					<input type="checkbox" name="strategies[BR]"  checked value="BR" >Bridges<br>
					<input type="checkbox" name="strategies[WS]"   value="WS" >WSN<br>
					<input type="checkbox" name="strategies[AA]"  checked value="AA" >Athletes In Action<br>
					<input type="checkbox" name="strategies[CL]"  checked value="CL" >Faculty Commons<br>
					<input type="checkbox" name="strategies[KC]"  checked value="KC" >Korean CCC<br>
					<input type="checkbox" name="strategies[GK]"  checked value="GK" >Greek<br>
					<input type="checkbox" name="strategies[VL]"  checked value="VL" >Valor<br>
					<input type="checkbox" name="strategies[OT]"  checked value="OT" >Other<br>
					
	
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
				  <%
				  while (yearvar<(Integer.parseInt(ar.getValue("toYear"))+1))
					  {
					  %>
					<option value="<%=yearvar %>"<% if((Integer.parseInt(ar.getValue("fromYear")))==yearvar) out.print(" SELECTED"); %>><%=yearvar%></option>
					
						<%
					yearvar++;
					}%>
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
						  <%
						  yearvar=1998;
				  while (yearvar<(Integer.parseInt(ar.getValue("toYear"))+1))
					  {
					  %>
					<option value="<%=yearvar %>"<% if((Integer.parseInt(ar.getValue("toYear")))==yearvar) out.print(" SELECTED"); %>><%=yearvar%></option>
					
						<%
					yearvar++;
					}%>
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