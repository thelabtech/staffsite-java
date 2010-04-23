<%@page import="org.alt60m.ministry.Strategy"%>


<%@ include file="/modules/layout/header.jspf"%>
<%


%>

<%@page import="org.alt60m.ministry.Strategy"%>

<script type="text/javascript" language="javascript" src="/modules/ib.js">

</script>


<form name="reportCriteria" method="post" action="/servlet/Report" onsubmit="return submitReportForm(this)">
<input type="hidden" name="action" value="showMuster">
<div class="strategy">
<div class="details">  
<div class="thecolumn">
	<div class="field">
		<label>What do you want to count?</label>

		<div class="box">
		<ul style="list-style:none;background:none;height:auto;">
			<li >Movements </td><td><input type="radio" name="type" value="movement" checked onClick="setSortOrder('movement');"></input></td></tr>
		</li><li>Ministry Locations </td><td><input type="radio" name="type" value="location" onClick="setSortOrder('location');"></input></td></tr>
		</li><li>Missional Teams Coached By Selected Region</td><td><input type="radio" name="type" value="teamorg" onClick="setSortOrder('team');"></input></td></tr>
		</li><li>Missional Teams Active In Selected Region</td><td><input type="radio" name="type" value="teamgeo" onClick="setSortOrder('team');"></input></td></tr>
		</li></ul>
		</div>
	</div>
	<div class="field">
		<label>Region:</label>
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
	</div>				

	<div class="field">
		<label>Strategy:</label>
		<div id="boxes" class="box">
	
		<ul style="list-style:none;background:none;height:auto;">
			<li ><img src="/modules/images/checkAll.gif" id="checkAllButton" onClick="check();"/>
			</li><li>Field Strategies<input type="checkbox" name="strategies"   value="FS" >
			</li><li>ESM-Impact<input type="checkbox" name="strategies"   value="II" >
			</li><li>ESM-Epic<input type="checkbox" name="strategies"   value="IE" >
			</li><li>ESM-Destino<input type="checkbox" name="strategies"   value="ID" >
			</li><li>ESM-Nations<input type="checkbox" name="strategies"   value="IN" >
			</li><li>Bridges<input type="checkbox" name="strategies"   value="BR" >
			</li><li>WSN Local Teams<input type="checkbox" name="strategies"   value="WS" >
			</li><li>Athletes In Action<input type="checkbox" name="strategies"   value="AA" >
            </li><li>Faculty Commons<input type="checkbox" name="strategies"   value="FC" >
            </li><li>Student Venture<input type="checkbox" name="strategies"   value="SV" >
			</li><li>Korean CCC<input type="checkbox" name="strategies"   value="KC" >
			</li><li>Greek<input type="checkbox" name="strategies"   value="GK" >
			</li><li>Valor<input type="checkbox" name="strategies"   value="VL" >
			</li><li>Other<input type="checkbox" name="strategies"   value="OT" >
		</li></ul>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div class="thecolumn">
<div class="field" >
	<label>Sort By:</label>

		<div class="box" style="display:block;width:150px;">
				<div id="option[-2]">
				  <select name="order[a]" id="order[a]">
				  <option value="campus" selected>Campus Name</option>
				 <option value="city">City/State</option>
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
				 <option value="status">Status</option>
				 <option value="strategy">Strategy</option>
				 
				  </select> 
				</div>
				<div id="option[-1]">
				  <select name="order[b]" id="order[b]">
				  <option value="" ></option>
				  <option value="campus">Campus Name</option>
				  <option value="city">City/State</option>
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
				 <option value="status">Status</option>
				 <option value="strategy" selected>Strategy</option>
				</select> 
				</div>
				<div id="option[0]">
				  <select name="order[c]" id="order[c]">
				<option value="" selected></option>
				  <option value="campus">Campus Name</option>
				<option value="city">City/State</option>
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
				 <option value="status">Status</option>
				 <option value="strategy">Strategy</option>
					  </select> 
				</div>
				<div id="option[1]">
				  <select name="order[d]" id="order[d]">
				<option value="" selected></option>
				  <option value="campus">Campus Name</option>
				  <option value="city">City/State</option>
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
				 <option value="status">Status</option>
				 <option value="strategy">Strategy</option>
					  </select> 
				</div>
				<div id="option[2]" style="display:none;">
				  <select name="order[e]" id="order[e]">
				<option value=""></option>
				  <option value="campus" >Campus Name</option>
				 <option value="city">City/State</option>
				 <option value="region">Region</option>
				 </select> 
				</div>
				<div id="option[3]" style="display:none;">
				  <select name="order[f]" id="order[f]">
				<option value="" ></option>
				  <option value="campus">Campus Name</option>
				 <option value="city">City/State</option>
				 <option value="region">Region</option>
					  </select> 
				</div>
				<div id="option[4]" style="display:none;">
				  <select name="order[g]" id="order[g]">
				<option value=""></option>
				 
				 <option value="city">City/State</option>
				
				 <option value="team" >Missional Team Name</option>
				 <option value="region">Region</option>
					  </select> 
				</div>
				<div id="option[5]" style="display:none;">
				  <select name="order[h]" id="order[h]">
				<option value="" ></option>
				 <option value="city">City/State</option>
				
				 <option value="team">Missional Team Name</option>
				 <option value="region">Region</option>
					  </select> 
				</div>
			</div></div>
			  
		<div class="field">

			  
			 <label>Date :</label>
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
				
				  	<select name="periodEndYear">
					<%for(int i=0; i<(year+2); i++){ %>
					  <option value="<%=i+"" %>" <%=year==i?"selected":"" %>><%=i+"" %></option>
					 <%} %>
					
					</select>
				</td>
			
	  </div>
	<div class="field">
<input id="conditionalSubmit" type="submit" value="Make My Report">
	</div>
<div class="clear"></div>
</div>
	<div class="clear"></div>
</div>
<div class="clear"></div>
</div>	
</form>
</div>
<%@ include file="/modules/layout/footer.jspf"%>