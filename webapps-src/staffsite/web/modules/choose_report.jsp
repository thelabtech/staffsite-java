<%@page import="org.alt60m.ministry.Strategy"%>


<%@ include file="/modules/layout/header.jspf"%>
<script type="text/javascript" language="javascript" src="/modules/ib.js">

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
<div id="stat_report">


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
	
	
		
		  
<div class="choose_report_across">
		<ul class="choose_report_across">
			<li class="choose_report_across_extra_wide"><i>Select which CCC ministries you would like included
			  in your report:</i></li>
		</ul>
			<ul id="boxes" class="choose_report" >
			 		<li class="choose_report"><img src="/modules/images/checkAll.gif" id="checkAllButton" onClick="check();"/></li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="FS" ></li><li class="choose_report_check_label">Field Strategies</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="II" ></li><li class="choose_report_check_label">ESM-Impact</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="IE" ></li><li class="choose_report_check_label">ESM-Epic</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="ID" ></li><li class="choose_report_check_label">ESM-Destino</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="IN" ></li><li class="choose_report_check_label">ESM-Nations</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="BR" ></li><li class="choose_report_check_label">Bridges</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="WS" ></li><li class="choose_report_check_label">WSN Local Teams</li>
					
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="AA" ></li><li class="choose_report_check_label">Athletes In Action</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="CL" ></li><li class="choose_report_check_label">Faculty Commons</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="KC" ></li><li class="choose_report_check_label">Korean CCC</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="GK" ></li><li class="choose_report_check_label">Greek</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="VL" ></li><li class="choose_report_check_label">Valor</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"   value="OT" ></li><li class="choose_report_check_label">Other</li>
					<li class="choose_report_check"><input type="checkbox" name="strategies"  onclick="checkEvents();" value="EV" ></li><li class="choose_report_check_label">Projects and Conferences without a specified Strategy</li>
		</ul>
</div>
<div class="choose_report_across">
		<ul class="choose_report">
			<li class="choose_report_across_extra_wide"><i>Which type of stats do you want included?</i></li>
		</ul>
		<ul class="choose_report">
			<li class="choose_report_check"><input type="checkbox" name="strategies"  checked value="CM" ></li><li class="choose_report_check_label">Campus Report (traditional Success Criteria report)</li>
			<li class="choose_report_check"><input type="checkbox" name="strategies" id="C2" onClick="checkAll();"  value="C2" ></li><li class="choose_report_check_label">Conference Stats</li>
			<li class="choose_report_check"><input type="checkbox" name="strategies" id="SP" onClick="checkAll();"  value="SP" ></li><li class="choose_report_check_label">Summer Project Stats</li>
		</ul>

<br><br>		
		  
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

		<ul class="choose_report_across">
			<li class="choose_report_across_extra_wide"><i>Select a date range for your report:</i></li>
		</ul>
		<ul class="choose_report_across">
			  
			<li class="choose_report_across_wide"><b>From</b></li>
			<li class="choose_report_across_wide"><b>To</b></li>
		</ul>
		<ul class="choose_report_across">
			
			<li class="choose_report_across">Year</li>
			<li class="choose_report_across">Month</li>
			<li class="choose_report_across">Year</li>
			<li class="choose_report_across">Month</li>
			  
		</ul>
		<ul class="choose_report_across">
			<li class="choose_report_across">
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
			</li>
			<li class="choose_report_across">
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
			</li>
			<li class="choose_report_across">
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
			</li>
			<li class="choose_report_across">
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
			</li>
		</ul>
		<ul class="choose_report_across">
			  <li class="choose_report_across_extra_wide">Report will cover from the first of the "from" month through the end of the "to" month.</li>
		</ul>
		
</div>
		
		
		  
	<div class="choose_report_submit">	
			<i>Click here to view your report:</i>
		
		  <input type="submit" value="Make My Report">
		
	</div>	 
		
	
	
	
</form>
</div>

<%@ include file="/modules/layout/footer.jspf"%>