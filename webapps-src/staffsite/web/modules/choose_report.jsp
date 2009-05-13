<%@page import="org.alt60m.ministry.Strategy"%>


<%@ include file="/modules/header.jspf"%>
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
</script>



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
		<TD align=right><a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Success Criteria Reports</a></font></TD>
	</TR>
	<tr>
		<td>
		<br/>
		If you experience any technical problems while either entering your success criteria or running a report, please give us as much information as possible about the problem by using this <A href="/general/feedback.jsp">Help Request form</A>.</font>
		</td>
	</tr>
</TABLE>

<br/>
<form name="reportCriteria" method="post" action="/servlet/Report" onsubmit="return submitReportForm(this)">
<input type="hidden" name="action" value="statReport">
<%
Integer yearvar=1998;	
String teamID="";
	String region="";
	String targetAreaID="";
	String type = ar.getValue("type");
	if(type.equals("locallevel")){
		teamID = ar.getValue("locallevelid");
	} else if(type.equals("regional")) {		
		region = ar.getValue("region");
	}else if(type.equals("targetarea")) {
		
		targetAreaID =ar.getValue("targetareaid");
	}
	
%>
	<input type=hidden name="teamID" value="<%=teamID%>">
	<input type=hidden name="region" value="<%=region%>">
	<input type=hidden name="targetareaid" value="<%=targetAreaID%>">
	
	<input type=hidden name=type value="<%= ar.getValue("type") %>">
	<CENTER>
	
	<table width="90%" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td valign="top"><img src="/infobase/images/1.gif" width="32" height="48"></td>
		  <td>
			<p><i>Select which CCC ministries you would like included
			  in your report:</font></p>
<table><tr><td>
			<table id="boxes" border="0" cellpadding="5" cellspacing="5" >
			  <tr><td>
			  		<button id="checkAllButton" onClick="check();">Check All</button><br>
					<input type="checkbox" name="strategies"   value="FS" >Field Strategies<br>
					<input type="checkbox" name="strategies"   value="II" >ESM-Impact<br>
					<input type="checkbox" name="strategies"   value="IE" >ESM-Epic<br>
					<input type="checkbox" name="strategies"   value="ID" >ESM-Destino<br>
					<input type="checkbox" name="strategies"   value="IN" >ESM-Nations<br>
					<input type="checkbox" name="strategies"   value="BR" >Bridges<br>
					<input type="checkbox" name="strategies"   value="WS" >WSN Local Teams<br>
					
					<input type="checkbox" name="strategies"   value="AA" >Athletes In Action<br>
					<input type="checkbox" name="strategies"   value="CL" >Faculty Commons<br>
					<input type="checkbox" name="strategies"   value="KC" >Korean CCC<br>
					<input type="checkbox" name="strategies"   value="GK" >Greek<br>
					<input type="checkbox" name="strategies"   value="VL" >Valor<br>
					<input type="checkbox" name="strategies"   value="OT" >Other<br>
					
	
			  </td></tr>
			</table>
			<table >
				<tr><td>
					<input type="checkbox" name="strategies"  checked value="CM" >Campus Report (traditional Success Criteria report)<br>
					<input type="checkbox" name="strategies" onClick="checkAll();"  value="C2" >Conference Stats<br>
					<input type="checkbox" name="strategies" onClick="checkAll();"  value="SP" >Summer Project Stats<br>
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
			<p><i>Select a date range for your report:</i></font></p>
			<table width="200" border="0" cellpadding="5" cellspacing="5">
			  <tr >
				<td colspan="2"><b>From</b></td>
				<td colspan="2"><b>To</b></td>
			  </tr>
			  <tr >
				<td>Year</td>
				<td>Month</td>
				<td>Year</td>
				<td>Month</td>
			  </tr>
			  <tr >
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
			  <tr><td colspan="4">Report will cover from the first of the "from" month through the end of the "to" month.</td></tr>
			</table>
			<p>&nbsp;</p>
		  </td>
		</tr>
		<tr>
		  <td valign="top"><img src="/infobase/images/3.gif" width="34" height="45"></td>
		  <td>
			<p><i>Click here to view your report:</i></font></p>
			<p>
		  <input type="submit" value="Make My Report">
			</p>
		  </td>
		</tr>
	</table>
	
	</center>
</form>
<a href="/servlet/Report?action=index&isMuster=true">I wanted the rollcall report!</a>
<%@ include file="/modules/footer.jspf"%>