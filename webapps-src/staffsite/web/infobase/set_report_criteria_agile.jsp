<!-- added these ministries for reporting purposes as they now will have success 
     criteria as well as the full range of statuses.  Further info on this change can 
     be found in the detail_target_area.jsp page.
     
	Military Ministry,Athletes In Action,Christian Leadership Ministries (now Faculty Commons)
	Korea CCC,Greek,Valor and Other
     
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
<script type="text/javascript" language="javascript">
var checked=false;
function check(){
table=document.getElementById('boxes');
inputs = table.getElementsByTagName('input');
	for (i=0;i<inputs.length;i++){
	inputs[i].checked=!checked;
	}
	checked=!checked;
	document.getElementById('checkAllButton').innerHTML=(checked?'Uncheck All':'Check All');
}
function checkAll(){
	table=document.getElementById('boxes');
	inputs = table.getElementsByTagName('input');
		for (i=0;i<inputs.length;i++){
		inputs[i].checked=true;
		}
		checked=true;
		document.getElementById('checkAllButton').innerHTML='Uncheck All';
	}
function checkEvents(){
	document.getElementById("C2").checked=true;
	document.getElementById("SP").checked=true;
}
</script>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>

<script>
function submitReportForm(thisForm) {
	var choices = 0;
	for (i = 0; i < thisForm.strategies.length; i++) {
		if (thisForm.strategies[i].checked) {
			choices++;
		}
	}		
	if ( choices > 0 ) {
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
<table<%=bgcolorL%>><tr><td>
			<table id="boxes" border="0" cellpadding="5" cellspacing="5" <%=bgcolorL%>>
			  <tr><td><%=fontB%>
			  		<img src="/modules/images/checkAll.gif" id="checkAllButton" onClick="check();"/><br>
					<input type="checkbox" name="strategies"   value="FS" >Campus Field Ministry<br>
					<input type="checkbox" name="strategies"   value="II" >EFM-Impact<br>
					<input type="checkbox" name="strategies"   value="IE" >EFM-Epic<br>
					<input type="checkbox" name="strategies"   value="ID" >EFM-Destino<br>
					<input type="checkbox" name="strategies"   value="IN" >EFM-Nations<br>
					<input type="checkbox" name="strategies"   value="BR" >Bridges<br>
					<input type="checkbox" name="strategies"   value="WS" >WSN Local Teams<br>
					
					<input type="checkbox" name="strategies"   value="AA" >Athletes In Action<br>
					<input type="checkbox" name="strategies"   value="FC" >Faculty Commons<br>
					<input type="checkbox" name="strategies"   value="KC" >Korea CCC<br>
					<input type="checkbox" name="strategies"   value="GK" >Greek<br>
					<input type="checkbox" name="strategies"   value="VL" >Valor<br>
					<input type="checkbox" name="strategies"   value="SV" >Student Venture<br>
					<input type="checkbox" name="strategies"   value="OT" >Other<br>
					
					<input type="checkbox" name="strategies"  onclick="checkEvents();" value="EV" >Projects and Conferences without a specified Strategy<br>
			  </td></tr>
			</table>
			<table <%=bgcolorL%>>
				<tr><td><%=fontB%>
					<input type="checkbox" name="strategies"  checked value="CM" >Campus Report (traditional Success Criteria report)<br>
					<input type="checkbox" name="strategies" id="C2" onClick="checkAll();"  value="C2" >Conference Stats<br>
					<input type="checkbox" name="strategies" id="SP" onClick="checkAll();"  value="SP" >Summer Project Stats<br>
				</td></tr>
			</table>
</td></tr></table>
			<p>
		  </td>
		</tr>
		<tr>
		  <td valign="top"><img src="/infobase/images/2.gif" width="35" height="47"></td>
<%
Calendar thisDate=Calendar.getInstance();
Date now=new Date();
thisDate.setTimeInMillis(now.getTime());
String[] months={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
String toMonth=months[thisDate.get(Calendar.MONTH)];

int toYear=thisDate.get(Calendar.YEAR);
int fromYear=toYear;
if(thisDate.get(Calendar.MONTH)<=7){
	fromYear=toYear-1;
}

%>
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
				  while (yearvar<(toYear+1))
					  {
					  %>
					<option value="<%=yearvar %>"<% if(fromYear==yearvar) out.print(" SELECTED"); %>><%=yearvar%></option>
					
						<%
					yearvar++;
					}%>
				  </select>
				</td>
				<td>
				  <select name="frommonth">
				  <option value='1'>Jan</option>
				  <option value='2'>Feb</option>
				  <option value='3'>Mar</option>
				  <option value='4'>Apr</option>
				  <option value='5'>May</option>
				  <option value='6'>Jun</option>
				  <option value='7'>Jul</option>
				  <option value='8' selected>Aug</option>
				  <option value='9'>Sep</option>
				  <option value='10'>Oct</option>
				  <option value='11'>Nov</option>
				  <option value='12'>Dec</option>
				  </select>
				</td>
				<td>
				  <select name="toyear">
						  <%
						  yearvar=1998;
				  while (yearvar<(toYear+1))
					  {
					  %>
					<option value="<%=yearvar %>"<% if(toYear==yearvar) out.print(" SELECTED"); %>><%=yearvar%></option>
					
						<%
					yearvar++;
					}%>
					  </select>
				</td>
				<td>
				  <select name="tomonth">

				<option value='1'<% if((toMonth).equals("Jan")) out.print(" SELECTED"); %>>Jan</option>
				  <option value='2'<% if((toMonth).equals("Feb")) out.print(" SELECTED"); %>>Feb</option>
				  <option value='3'<% if((toMonth).equals("Mar")) out.print(" SELECTED"); %>>Mar</option>
				  <option value='4'<% if((toMonth).equals("Apr")) out.print(" SELECTED"); %>>Apr</option>
				  <option value='5'<% if((toMonth).equals("May")) out.print(" SELECTED"); %>>May</option>
				  <option value='6'<% if((toMonth).equals("Jun")) out.print(" SELECTED"); %>>Jun</option>
				  <option value='7'<% if((toMonth).equals("Jul")) out.print(" SELECTED"); %>>Jul</option>
				  <option value='8'<% if((toMonth).equals("Aug")) out.print(" SELECTED"); %>>Aug</option>
				  <option value='9'<% if((toMonth).equals("Sep")) out.print(" SELECTED"); %>>Sep</option>
				  <option value='10'<% if((toMonth).equals("Oct")) out.print(" SELECTED"); %>>Oct</option>
				  <option value='11'<% if((toMonth).equals("Nov")) out.print(" SELECTED"); %>>Nov</option>
				  <option value='12'<% if((toMonth).equals("Dec")) out.print(" SELECTED"); %>>Dec</option>
				 
				
				  </select>
				</td>
			  </tr>
			  <tr><td colspan="4"><%=fontB%>Report will cover from the first of the "from" month through the end of the "to" month.</td></tr>
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