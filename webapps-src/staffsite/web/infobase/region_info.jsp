<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />
<jsp:useBean id="states" class="org.alt60m.html.SelectState" />
<jsp:useBean id="lanes" class="org.alt60m.html.SelectLane" />
<jsp:useBean id="strategies" class="org.alt60m.html.SelectLane" />
<jsp:useBean id="status" class="org.alt60m.html.SelectStatus" />
<jsp:useBean id="country" class="org.alt60m.html.SelectCountry" />

<%
String region = request.getParameter("region");
String pageTitle = ""; 
if (region.equals("NE")){
	pageTitle="Northeast Regional Team";
} else if (region.equals("MA")){
	pageTitle="Mid Atlantic Regional Team";
} else if (region.equals("MS")){
	pageTitle="Mid South Regional Team";
} else if (region.equals("SE")){
	pageTitle="Southeast Regional Team";
} else if (region.equals("GL")){
	pageTitle="Great Lakes Regional Team";
} else if (region.equals("UM")){
	pageTitle="Upper Midwest Regional Team";
} else if (region.equals("GP")){
	pageTitle="Great Plains Regional Team";
} else if (region.equals("MA")){
	pageTitle="Red River Regional Team";
} else if (region.equals("GNW")){
	pageTitle="Greater Northwest Regional Team";
} else if (region.equals("SW")){
	pageTitle="Pacific Southwest Regional Team";
}

ActionResults ar; 
ar = ActionResults.getActionResults(session);
Hashtable h = new Hashtable();
h = ar.getHashtable("regionalteam");
Iterator infoI = ar.getCollection("regionalInfo").iterator();

%>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>

<br>
<table ALIGN="CENTER" width="98%" border="0" cellpadding=0 cellspacing=0>
	<tr>
		<td width="35%" valign="top">
			
		<!-- Team Info table -->
		<table width="100%" border="0" cellspacing="0" cellpadding=3 <%=bgcolorL%>>
			<form method="post" action="/servlet/InfoBaseController">
				<input type="hidden" name="action" value="saveRegionInfo">
				<!-- <input type=hidden name="TeamID" value="=myRegionalTeam.getTeamID()"> -->
				<input type=hidden name="region" value="<%=region%>">
				<tr <%=bgcolorB%>><td colspan="2"><%=fontW3%><b>Regional Team Contact Info:</b></font></td></tr>
				<tr <%=bgcolorL%>> 
					<td>&nbsp;
					</td>
					<td>
						<%=fontB1%>(* = Required field)</font>
					</td>
				</tr>
				<tr>
					<td><div align="right"><%=fontB%>*Name:</font></div></td>
					<td width="65%"><input type="text" name="Name" value="<%=h.get("Name")%>" size="24" maxlength=100></td>
				</tr>
				<tr> 
					<td><div align="right"><%=fontB%>Address 1:</font></div></td>
					<td><input type="text" name="Address1" value="<%=h.get("Address1")%>" size="24" maxlength=35></td>
				</tr>
				<tr> 
					<td><div align="right"><%=fontB%>Address 2:</font></div></td>
					<td><input type="text" name="Address2" value="<%=h.get("Address2")%>" size="24" maxlength=35></td>
				</tr>
				<tr> 
					<td><div align="right"><%=fontB%>City:</font></div></td>
					<td><input type="text" name="City" value="<%=h.get("City")%>" size="24" maxlength=30></td>
				</tr>
				<tr> 
					<td><div align="right"><%=fontB%>State:</font></div></td>
					<td> 
						<%
							states.setName("State");
							states.setCurrentValue((String)h.get("State"));
						%><%=states.print()%>
					</td>
				</tr>
				<tr> 
					<td><div align="right"><%=fontB%>ZIP:</font></div></td>
					<td><input type="text" name="Zip" value="<%=h.get("Zip")%>" size="24" maxlength=10></td>
				</tr>
				<tr> 
					<td><div align="right"><%=fontB%>*Country:</font></div></td>
					<td>
						<%
							country.setName("Country");
							country.setCurrentValue((String)h.get("Country"));
						%>
							<%=country.print()%>
					</td>
				</tr>
				<tr> 
					<td width="35%"><div align="right"><%=fontB%>Phone:</font></div></td>
					<td width="65%"><input type="text" name="Phone" value="<%=h.get("Phone")%>" size="24" maxlength=24></td>
				</tr>
				<tr> 
				   <td width="35%"><div align="right"><%=fontB%>Fax:</font></div></td>
				   <td width="65%"><input type="text" name="Fax" size="24" value="<%=h.get("Fax")%>" maxlength=24></td>
				</tr>
				<tr> 
				   <td width="35%"><div align="right"><%=fontB%>Email:</font></div></td>
				   <td width="65%"><input type="text" name="Email" size="24" value="<%=h.get("Email")%>" maxlength=50></td>
				</tr>
				<tr> 
					<td width="35%">
						<div align="right"><%=fontB%>
						<a href="<%=h.get("Url")%>" target="_blank">Webpage:</a></font></div>
					</td>
					<td width="65%"><input type="text" name="Url" size="24" value="<%=h.get("Url")%>" maxlength=255></td>
				</tr>
				<tr> 
				   <td width="35%"><div align="right"><%=fontB%>Note:</font></div></td>
				   <td width="65%"><textarea name="Note" cols="22" rows="5" wrap="VIRTUAL"><%=h.get("Note")%></textarea></td>
				</tr>
				<tr> 
					<td colspan="2">
						<center><%=fontB%><br>
						<input type="submit" name="UpdateTeamInfo" value="Update Team Info"></font></center>
					</td>
				</tr>
			</table>
			</form>
		</td>
		<td valign="top"> <!--right column-->
			
			<!--success criteria table-->
			<table align=center width="95%" border="0" <%=bgcolorL%> cellpadding="2" cellspacing="2">
				<tr <%=bgcolorB%>>
					<td colspan="2">
					<%=fontW3%><b>Regional Success Criteria</b></font>
					</td>
				</tr>
				<tr> 
					<td>
						<!--stat table start here-->
						<table align=center cellpadding=0 cellspacing=0 border=3>
            <TR>
					<%
						boolean bAltColor = false;
						Hashtable thisStat = null;
						while(infoI.hasNext()) {
							thisStat = (Hashtable)infoI.next();
							if (bAltColor) {
								out.println("<td bgcolor='#ffffff' align='center'><font size=1>");
							} else {
								out.println("<td bgcolor='#dddddd' align='center'><font size=1>");
							}
							bAltColor = !bAltColor;
              out.print(thisStat.get("PeriodBeginShort") + " to " + thisStat.get("PeriodEndShort"));
							out.print("</TD>");
						}
						%>
							</tr>
							<TR>
					<%
						infoI = ar.getCollection("regionalInfo").iterator();
						bAltColor = false;
						thisStat = null;
						while(infoI.hasNext()) {
							thisStat = (Hashtable)infoI.next();
							if (bAltColor) {
								out.println("<td bgcolor='#ffffff' align='center'><font size=1>");
							} else {
								out.println("<td bgcolor='#dddddd' align='center'><font size=1>");
							}
							bAltColor = !bAltColor;
								out.print("<A HREF='/servlet/InfoBaseController?action=editRegionalSuccessCriteria&region=" + request.getParameter("region"));
							if(((String)thisStat.get("RegionalStatId")).equals("")) {
								out.print("&periodbegin=" + thisStat.get("PeriodBegin") + "&periodend=" +thisStat.get("PeriodEnd") + "'>");
								out.print("<img src='/infobase/images/reddot.gif' border=0>");
							}
							else {
								out.print("&statisticid="+(String)thisStat.get("RegionalStatId")+ "'>");
								
								out.print("<img src='/infobase/images/greendot.gif' border=0>");
							}
							out.print("</A></TD>");
						}
						%>
						</TR>
						</table>
						<!--stat table end here-->
					</td>
				</tr>
			</table>
			<br>

			<!-- Reports table -->
			<table align=center width="95%" border="0" <%=bgcolorL%>>
				<tr <%=bgcolorB%>>
					<td colspan="2">
						<font face="Arial, Helvetica, sans-serif" size=3 color="#ffffff"><b>Success Criteria Reports</b></font>
					</td>
				</tr>
				<tr>
					<td>
						<form name=reports action="/servlet/InfoBaseController?action=createReport" method=post>
						<input type="hidden" name="type" value="regional">
						<input type="hidden" name="region" value="<%=request.getParameter("region")%>"><p align="center"><%=fontB%>[<a href="javascript:document.reports.submit()">Regional Success Criteria Reports</a>]</font></p>
						<!--(<a href="/sc?page=/ib/report_region.jsp&region=GP">YTD</a>)-->
						</form>
					</td>
				</tr>
			</table>

<!-- Reports table **Note: this old version of the reports table was commented out, so I left it here for reference even though the new one is here --RDH 6/19/2002
			<table align=center width="95%" border="0" <%=bgcolorL%>>
				<tr <%=bgcolorB%>>
					<td colspan="2">
						<font face="Arial, Helvetica, sans-serif" size=3 color="#ffffff"><b>Success Criteria Reports</b></font>
					</td>
				</tr>
				<tr>
					<td>
						<form method="post" action="/ib/view_regional_reports.jsp">
						<input type="hidden" name="page" value="/ib/view_regional_reports.jsp">
						<input type=hidden name="CA" value="ON">
						<input type=hidden name="WS" value="ON">
						<input type=hidden name="WI" value="ON">
						<input type=hidden name="SC" value="ON">
						<input type=hidden name="II" value="ON">
						<input type=hidden name="ID" value="ON">
						<input type=hidden name="IE" value="ON">
						<input type=hidden name="BR" value="ON">
						<input type=hidden name="FromYear" value="ZZ">
						<input type=hidden name="region" value="<%=request.getParameter("region")%>">
						<%=fontB%><input type="submit" value="All Strategies/Past 16 weeks"></font>
					</td>
				</tr>
				</form>
				<tr>
					<td>
						<a href="/sc?page=/ib/spec_regional_report.jsp&region=<%=request.getParameter("region")%>">Any strategy/Any time period</a>
					</td>
				</tr>
			</table>
			<br>-->

			<br>

			<!-- misc table -->
			<table align=center width="95%" border="0" <%=bgcolorL%> cellpadding="2" cellspacing="2">
				<tr <%=bgcolorB%>>
					<td colspan="2">
						<%=fontW3%><b>Other Information</b></font>
					</td>
				</tr>
				<tr>
					<td align=center>
						<form method="post" name="teams" action="/servlet/InfoBaseController">
						<input type="hidden" name="action" value="listLLMetros">
						<input type=hidden name="searchby" value="region">
						<input type=hidden name="region" value="<%=region%>">
						<input type=hidden name="lane" value="CA">
						<%=fontB%>[<a href="javascript:document.teams.submit()">List Teams in this Region</a>]</font>
						</form>
						<form name=campuses method="post" action="/servlet/InfoBaseController">
						<input type="hidden" name="action" value="detailedListCampus">
						<input type=hidden name="searchby" value="region">
						<input type=hidden name="view" value="campusList">
						<input type=hidden name="searchstring" value="<%=region%>">
						<%=fontB%>[<a href="javascript:document.campuses.submit()">List Campuses in this Region</a>]</font>
						</form>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



<!-- <%=fontB%><%=ar.toHTML()%> -->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>