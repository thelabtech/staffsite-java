<%@page import="org.alt60m.ministry.Strategy"%>


<%@ include file="/modules/header.jspf"%>
<%


%>

<%@page import="org.alt60m.ministry.Strategy"%>

<script type="text/javascript" language="javascript" src="/modules/ib.js">

</script>



<div id="stat_report"> 
<form name="reportCriteria" method="post" action="/servlet/Report" onsubmit="return submitReportForm(this)">
<input type="hidden" name="action" value="showMuster">
<center>
<table><tr>
<!-- Left panel -->
<td><table><tr>
	<td style="width:200px;">
		<div style="display:block;width:200px;text-align:right;padding-right:50px;">
		<table>
		<tr><td colspan=2>What do you want to count?</td></tr>
		<tr><td>Movements </td><td><input type="radio" name="type" value="movement" checked onClick="setSortOrder('movement');"></input></td></tr>
		<tr><td>Ministry Locations </td><td><input type="radio" name="type" value="location" onClick="setSortOrder('location');"></input></td></tr>
		<tr><td>Missional Teams Coached By Selected Region</td><td><input type="radio" name="type" value="teamorg" onClick="setSortOrder('team');"></input></td></tr>
		<tr><td>Missional Teams Active In Selected Region</td><td><input type="radio" name="type" value="teamgeo" onClick="setSortOrder('team');"></input></td></tr>
		</table>
		</div>
		
		<br><br>
		Select A Region:<br>
			<select id="region" name="region"  >
		<OPTION VALUE="National">All (will take a minute or two)</OPTION>
		<OPTION VALUE="NE">Northeast</OPTION>
		<OPTION VALUE="NW">Greater Northwest</OPTION>
		<OPTION VALUE="MA">Mid-Atlantic</OPTION>
		<OPTION VALUE="MS">MidSouth</OPTION>
		<OPTION VALUE="UM">Upper Midwest</OPTION>
		<OPTION VALUE="GL">Great Lakes</OPTION>
		<OPTION VALUE="GP">Great Plains</OPTION>
		<OPTION VALUE="SW">Pacific Southwest</OPTION>
		<OPTION VALUE="SE">Southeast</OPTION>
		<OPTION VALUE="RR">Red River</OPTION>
		  </select>
							
			
		</font>		 
	</td>
<!--  Right panel  -->
	<td id="boxes" style="width:200px;text-align:right;margin-right:none;">
	
			<img src="/modules/images/checkAll.gif" id="checkAllButton" onClick="check();"/><br>
			Field Strategies<input type="checkbox" name="strategies"   value="FS" ><br>
			ESM-Impact<input type="checkbox" name="strategies"   value="II" ><br>
			ESM-Epic<input type="checkbox" name="strategies"   value="IE" ><br>
			ESM-Destino<input type="checkbox" name="strategies"   value="ID" ><br>
			ESM-Nations<input type="checkbox" name="strategies"   value="IN" ><br>
			Bridges<input type="checkbox" name="strategies"   value="BR" ><br>
			WSN Local Teams<input type="checkbox" name="strategies"   value="WS" ><br>
			Athletes In Action<input type="checkbox" name="strategies"   value="AA" ><br>
			Faculty Commons<input type="checkbox" name="strategies"   value="CL" ><br>
			Korean CCC<input type="checkbox" name="strategies"   value="KC" ><br>
			Greek<input type="checkbox" name="strategies"   value="GK" ><br>
			Valor<input type="checkbox" name="strategies"   value="VL" ><br>
			Other<input type="checkbox" name="strategies"   value="OT" ><br>
	</td>
	<td width="3px" style="margin:none;border-left:none;border-top:solid 1 black;border-right:solid 1 black;border-bottom:solid 1 black;">
	&nbsp;
	</td>
	<td style="width:200px;">
	<p style="padding-left:10px;text-align:left;">Select which CCC strategies you would like included
			  in your report.</font></p>
	</td></tr></table></td>
</tr>
<!-- Bottom Panel -->
<tr><td colspan="4">
		
			<table style="border-collapse:collapse;"  >
			  
			  <tr >
				<td style="padding:5px;width:200px;">Sort By</td>
				<td style="padding:5px;">Then By</td>
				<td id="optionLabel[0]" style="padding:5px;">Then By</td>
				<td id="optionLabel[1]" style="padding:5px;">Then By</td>
				<td id="blankLabelCell[0]"  style="display:none;padding:5px;width:200px;">&nbsp;</td>
				<td id="blankLabelCell[1]"  style="display:none;padding:5px;width:200px;">&nbsp;</td>
			  </tr>
			  <tr >
				<td id="option[-2]" style="padding:5px;width:200px;">
				  <select name="order[a]" id="order[a]">
				  <option value="campus" selected>Campus Name</option>
				 <option value="city">City/State</option>
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
				 <option value="status">Status</option>
				 <option value="strategy">Strategy</option>
				 
				  </select>
				</td>
				<td id="option[-1]" style="padding:5px;width:200px;">
				  <select name="order[b]" id="order[b]">
				  <option value="" ></option>
				  <option value="campus">Campus Name</option>
				  <option value="city">City/State</option>
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
				 <option value="status">Status</option>
				 <option value="strategy" selected>Strategy</option>
				</select>
				</td>
				<td id="option[0]" style="padding:5px;width:200px;">
				  <select name="order[c]" id="order[c]">
				<option value="" selected></option>
				  <option value="campus">Campus Name</option>
				<option value="city">City/State</option>
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
				 <option value="status">Status</option>
				 <option value="strategy">Strategy</option>
					  </select>
				</td>
					<td id="option[1]" style="padding:5px;width:200px;">
				  <select name="order[d]" id="order[d]">
				<option value="" selected></option>
				  <option value="campus">Campus Name</option>
				  <option value="city">City/State</option>
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
				 <option value="status">Status</option>
				 <option value="strategy">Strategy</option>
					  </select>
				</td>
					<td id="option[2]" style="padding:5px;width:200px;display:none;">
				  <select name="order[e]" id="order[e]">
				<option value=""></option>
				  <option value="campus" >Campus Name</option>
				 <option value="city">City/State</option>
				 <option value="region">Region</option>
				 </select>
				</td>
					<td id="option[3]" style="padding:5px;width:200px;display:none;">
				  <select name="order[f]" id="order[f]">
				<option value="" ></option>
				  <option value="campus">Campus Name</option>
				 <option value="city">City/State</option>
				 <option value="region">Region</option>
					  </select>
				</td>
				<td id="option[4]" style="padding:5px;width:200px;display:none;">
				  <select name="order[g]" id="order[g]">
				<option value=""></option>
				 
				 <option value="city">City/State</option>
				
				 <option value="team" >Missional Team Name</option>
				 <option value="region">Region</option>
					  </select>
				</td>
					<td id="option[5]" style="padding:5px;width:200px;display:none;">
				  <select name="order[h]" id="order[h]">
				<option value="" ></option>
				 <option value="city">City/State</option>
				
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
					  </select>
				</td>
				  
		
		<td id="blankCell[0]"  style="display:none;padding:5px;width:200px;">&nbsp;</td>
				<td id="blankCell[1]"  style="display:none;padding:5px;width:200px;">&nbsp;</td>
	  </tr>
	</table>
	<table style="border-collapse:collapse;"  >
			  
			  <tr >
				<td style="padding:5px;">At End of Month</td>
				<td style="padding:5px;">Year</td>
				
			  </tr>
			  <tr >
				
				<td>
					  <select name="periodEndMonth">
					  <%Date now=new Date();
					  int month=now.getMonth();
					  int year=now.getYear()+1900;
					  String[] months={"January","February","March","April","May","June","July","August","September","October","November","December","Plovember"};
					  %>
					  <%for(int i=0; i<12; i++){ %>
					  <option value="<%=i+1+"" %>" <%=month==i?"selected":"" %>><%=months[i] %></option>
					 <%} %>
					  </select>
				</td>
				<td>
				  	<select name="periodEndYear">
					<%for(int i=0; i<(year+2); i++){ %>
					  <option value="<%=i+"" %>" <%=year==i?"selected":"" %>><%=i+"" %></option>
					 <%} %>
					
					</select>
				</td>
			
	  </tr>
	</table>
	</td></tr>
			
		 
		
	</table>
	
	<p><i>Click here to view your report (Make sure you <u>click</u> your region first):</i></font></p>
			<p>
	<input id="conditionalSubmit" type="submit" value="Make My Report">
		 
	
	</center>
</form>
</div>
<%@ include file="/modules/footer.jspf"%>