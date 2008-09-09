<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="lanes" class="org.alt60m.html.SelectLane" />
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />
<jsp:useBean id="states" class="org.alt60m.html.SelectState" />
<jsp:useBean id="countries"  class="org.alt60m.html.SelectCountry" />

<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);

String pageTitle="Update Missional Team";
String mode = new String (request.getParameter("mode"));

String noMovements = new String ();
	if (mode.equals("update")) 
	{
	noMovements =ar.getValue("noMovements");
	}
String localLevelID = new String();
String targetareaid = new String();
String strategy = new String();
String from = new String();
Hashtable h = new Hashtable();
String referrer = new String();
String currentteamid = new String();
String activityid = new String();
String status = new String();
String region = new String();

%>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>

<SCRIPT LANGUAGE="JavaScript" >
<!--

	
function verifyInput() {
	var returnVal = true;
	for(var i=0; i<verifyInput.arguments.length; i++) {
		returnVal = (returnVal && ((verifyInput.arguments[i].value != null) && (verifyInput.arguments[i].value.length != 0)));
	}
	return returnVal;
}

function teamVerify() {
	var isValid = true;
	isValid = verifyInput(document.TeamInfoForm.Name, document.TeamInfoForm.Lane, document.TeamInfoForm.Region, document.TeamInfoForm.Country);
	if(!isValid) {
		alert("You must provide the Missional Team name, strategy, region, and country.");
	}
	return isValid;
}
// -->
</SCRIPT>

<br>
<center>
<% 
	box.setTitle("Missional Team Info");	
	box.setColor(colorL);
	box.setWidth("400");
	box.setStyle("Classic");
%>
<%=box.printTop()%>
	<table align="center" border="0" cellspacing="0" cellpadding=3>
	<form method="post" name="TeamInfoForm" action="/servlet/InfoBaseController" onSubmit="return teamVerify()">
	<input type="hidden" name="action" value="saveTeam">
	<input type="hidden" name="mode" value="<%=mode%>">
	<%
	if (mode.equals("update")) {
		
		h = ar.getHashtable("team");
		
		localLevelID = request.getParameter("locallevelid");
		//helper.find(localLevelID);
		//localLevelW.find(pageContext, "ministry/LocalLevel", null, localLevelID);
		%><input type=hidden name="locallevelid" value="<%=localLevelID%>"><%
	}
	if (mode.equals("add")) {
		//helper.create;
		from = request.getParameter("from");
		if (from.equals("localLevelMetros")) {
			region = request.getParameter("region");
			%><input type=hidden name="region" value="<%=region%>"><%
			%><input type=hidden name="from" value="<%=from%>"><%
		} else {
			targetareaid = request.getParameter("targetareaid");
			strategy = request.getParameter("strategy");
			%>
			<input type=hidden name="from" value="<%=from%>">
			<input type=hidden name="targetareaid" value="<%=targetareaid%>">
			<input type=hidden name="strategy" value="<%=strategy%>">
			<input type=hidden name="justset" value="true">
			<%
			if (from.equals("editActivity")) {
				referrer = request.getParameter("referrer");
				currentteamid = request.getParameter("currentteamid");
				activityid = request.getParameter("activityid");
				status = request.getParameter("status");
				localLevelID = request.getParameter("locallevelid");
				%>
				<input type=hidden name="referrer" value="<%=referrer%>">
				<input type=hidden name="currentteamid" value="<%=currentteamid%>">
				<input type=hidden name="activityid" value="<%=activityid%>">
				<input type=hidden name="status" value="<%=status%>">
				<input type=hidden name="locallevelid" value="<%=localLevelID%>">
				<%
			}
		}
	
	}	
	%>
		<tr <%=bgcolorL%>> 
			<td> 
			</td>
			<td>
				<%=fontB1%>(* = Required field)</font>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Name:</font></div>
			</td>
			<td>
				<input type="text" name="Name" value="<%=h.get("Name") != null ? h.get("Name") : ""%>" size="27" maxlength=100>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Strategy/Ministry:</font></div>
			</td>
			<td>
				<%
				lanes.setName("Lane");
				if(h.get("Lane")!=null)lanes.setCurrentValue((String)h.get("Lane"));
				%>
				<%=lanes.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Region:</font></div>
			</td>
			<td>
				<%
				regions.setName("Region");
				if(h.get("Region")!=null)regions.setCurrentValue((String)h.get("Region"));
				if(from.equals("localLevelMetros"))regions.setCurrentValue(region);
				%>
				<%=regions.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Address 1:</font></div>
			</td>
			<td>
				<input type="text" name="Address1" value="<%=h.get("Address1") != null ? h.get("Address1") : ""%>" size="27" maxlength=35>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Address 2:</font></div>
			</td>
			<td>
				<input type="text" name="Address2" value="<%=h.get("Address2") != null ? h.get("Address2") : ""%>" size="27" maxlength=35>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>City:</font></div>
			</td>
			<td>
				<input type="text" name="City" value="<%=h.get("City") != null ? h.get("City") : ""%>" size="27" maxlength=30>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>State:</font></div>
			</td>
			<td>
				<%
				states.setName("State");
				if(h.get("State")!=null)states.setCurrentValue((String)h.get("State"));
				%>
				<%=states.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>ZIP:</font></div>
			</td>
			<td>
				<input type="text" name="Zip" value="<%=h.get("Zip") != null ? h.get("Zip") : ""%>" size="10" maxlength=10>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>*Country:</font></div>
			</td>
			<td>
				<%
				countries.setName("Country");
				if(h.get("Country")!=null)countries.setCurrentValue((String)h.get("Country"));
				%>
				<%=countries.print()%>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Phone:</font></div>
			</td>
			<td>
				<input type="text" name="Phone" value="<%=h.get("Phone") != null ? h.get("Phone") : ""%>" size="27" maxlength=24>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Fax:</font></div>
			</td>
			<td>
				<input type="text" name="Fax" size="27" value="<%=h.get("Fax") != null ? h.get("Fax") : ""%>" maxlength=24>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%><a href="mailto:<%=h.get("Email") != null ? h.get("Email") : ""%>">Email:</a></font></div>
			</td>
			<td>
				<input type="text" name="Email" size="27" value="<%=h.get("Email") != null ? h.get("Email") : ""%>" maxlength=50>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td>
				<div align="right"><a href="<%=h.get("Url") != null ? h.get("Url") : ""%>"><%=fontB%>CCC Webpage:</font></a></div>
			</td>
			<td>
				<%=fontB1%>(ex: http://www.und.edu/ccc)</font><BR><input type="text" name="Url" size="27" value="<%=h.get("Url") != null ? h.get("Url") : ""%>" maxlength=255>
			</td>
		</tr>
		<%
		
		%>
		<tr <%=bgcolorL%>> 
			<td> 
				
				<div align="right"><%=fontB%>Is this Missional Team Active? <%if (noMovements=="T"){ %><br><br><%} %></font></div>
				
			</td>
			<td ><%=fontB%>
				<%
				boolean isActive = h.get("IsActive") != null ? ((Boolean)h.get("IsActive")).booleanValue() : true;

				if (noMovements=="T")
				{
					if(isActive) 
					{
						%><input type="radio" name="IsActive" value="TRUE" checked>Yes <input type="radio" name="IsActive" value="FALSE">No<%
					} else 
					{
						%><input type="radio" name="IsActive" value="TRUE">Yes <input type="radio" name="IsActive" value="FALSE" checked>No<%
					}
					%><br><i>(This Missional Team has no active movements)</i><%
				}
				else
				{
					%><input type="hidden" name="IsActive" value="TRUE">
					Yes. <%
				}
					
				%>
				</font>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td> 
				<div align="right"><%=fontB%>Note:<br>(max. of <br>255 <br>characters)</font></div>
			</td>
			<td>
				<textarea name="Note" cols="22" rows="5" wrap="VIRTUAL"><%=h.get("Note") != null ? h.get("Note") : ""%></textarea>
			</td>
		</tr>
		<tr <%=bgcolorL%>> 
			<td colspan="2"> 
				<center><br><INPUT TYPE="SUBMIT" VALUE="Update"><!--<a href="javascript: document.MinistryInfoForm.submit()">Update ministry info</a>--><!--onMouseOver="document.updateTeamInfoButton.src='/infobase/images/updateteaminfo_bon.gif';" onMouseOut="document.updateTeamInfoButton.src='/infobase/images/updateteaminfo_boff.gif';"--></center>
			</td>
		</tr>
	</form>
	</table>
<%=box.printBottom()%>
</center>
<br>

<%@ include file="/infobase/ibfooter.jspf" %>
</html>