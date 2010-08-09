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




<form name="reportCriteria" method="post" action="/servlet/Report" onsubmit="return submitReportForm(this)">
<input type="hidden" name="action" value="statReport">
<%
Integer yearvar=1998;	
String teamID="";
	String region="";
	String targetAreaID = ar.getValue("targetareaid");
	String type = ar.getValue("type");
	if(targetAreaID != null) {
		type = "targetarea";
	}
	if(type.equals("locallevel") && ar.getValue("locallevelid") != null){
		teamID = ar.getValue("locallevelid");
	} else if(type.equals("regional")) {		
		region = ar.getValue("region");
	}
	
%>
<input type=hidden name="teamID" value="<%=teamID%>">
<input type=hidden name="region" value="<%=region%>">
<input type=hidden name="targetareaid" value="<%=targetAreaID%>">
<input type=hidden name=type value="<%= type %>">
<div class="strategy">
<div class="details">  
<div class="thecolumn" style="float: left;">
		<div class="field">
		  <br/><br/>
                            <label>Ministries:</label>

           <div class="box">
				<ul id="boxes" style="list-style:none;background:none;height:auto;text-alogn:left;" >
				 		<li ><img src="/modules/images/checkAll.gif" id="checkAllButton" onClick="check();"/></li>
						<li ><input type="checkbox" name="strategies"   value="FS" >Campus Field Ministry</li>
						<li ><input type="checkbox" name="strategies"   value="II" >EFM-Impact</li>
						<li ><input type="checkbox" name="strategies"   value="IE" >EFM-Epic</li>
						<li ><input type="checkbox" name="strategies"   value="ID" >EFM-Destino</li>
						<li ><input type="checkbox" name="strategies"   value="IN" >EFM-Nations</li>
						<li ><input type="checkbox" name="strategies"   value="BR" >Bridges</li>
						<li ><input type="checkbox" name="strategies"   value="WS" >WSN Local Teams</li>
						
						<li ><input type="checkbox" name="strategies"   value="AA" >Athletes In Action</li>
                        <li ><input type="checkbox" name="strategies"   value="FC" >Faculty Commons</li>
                        <li ><input type="checkbox" name="strategies"   value="SV" >Student Venture</li>
						<li ><input type="checkbox" name="strategies"   value="KC" >Korean CCC</li>
						<li ><input type="checkbox" name="strategies"   value="GK" >Greek</li>
						<li ><input type="checkbox" name="strategies"   value="VL" >Valor</li>
						<li ><input type="checkbox" name="strategies"   value="OT" >Other</li>
						<li ><input type="checkbox" name="strategies"  onclick="checkEvents();" value="EV" >Projects and Conferences without a specified Ministry</li>
			</ul>
		</div>
    </div><!-- end field -->
	<div class="clear"></div>
</div>


<div class="thecolumn" style="float: right; margin-top: 30px;">
		<div class="field">
		                <label>Type:</label>

           <div class="box">
		<ul style="list-style:none;background:none;height:auto;">
			<li ><input type="checkbox" name="strategies"  checked value="CM" >Campus Report (traditional Success Criteria report)</li>
			<li ><input type="checkbox" name="strategies" id="C2" onClick="checkAll();"  value="C2" >Conference Stats</li>
			<li ><input type="checkbox" name="strategies" id="SP" onClick="checkAll();"  value="SP" >Summer Project Stats</li>
		</ul>
		</div></div>

		
		  
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

	<div class="field">
		                <label>Date Range:</label>

           <div class="box">
		<ul style="list-style:none;background:none;height:auto;">
			<li >From:&nbsp;
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
			<li >To:&nbsp;
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
		</div></div>
		

				<div class="field">
			  
		</div>
		
		<div class="field">
			  Report will cover from the first of the "from" month through the end of the "to" month.<br>
			For a particular school year or range of school years, choose August for From and To months and the appropriate From/To years. 
		

		</div>
	<div class="field">	
			
		
		  <input type="submit" value="Make My Report">
		
	</div>
	<div class="clear"></div>	
</div>
		
		
		  
	 
		
	
<div class="clear"></div>
</div>
<div class="clear"></div>
</div>	
	
</form>


<%@ include file="/modules/layout/footer.jspf"%>