<%@ page import="org.alt60m.ministry.model.*,java.util.*" %>
<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="selRegion" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="selState" class="org.alt60m.html.SelectState"/>
<jsp:useBean id="selBoolean" class="org.alt60m.html.SelectBoolean"/>
<jsp:useBean id="selAOA" class="org.alt60m.html.SelectAoA"/>
<jsp:useBean id="selCountry" class="org.alt60m.html.SelectCountry"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Travel Information"; %>

<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/WsnSpController">
<input type="hidden" name="action" value="adminEditProj">
<input type="hidden" name="view" value="showprojectinfo">
<input type="hidden" name="id" value="<%=h.get("WsnProjectID")%>">

<p> &nbsp;
<table width='100%' border='0'>
<TR><td colspan='2'><%=fontText%><b><%=formHelp.value((String)h.get("Name"))%>  &nbsp; <% if (h.get("PartnershipRegion")!=null){%><% selRegion.setCurrentValue((String)h.get("PartnershipRegion")); %><%=font%>(<%=selRegion.display()%> Partnership)</font> <%}%>Summer Project Travel Information</td></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;US Gateway City</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="DestinationGatewayCity" SIZE=20 MAXLENGTH=30 VALUE="<%=formHelp.value((String)h.get("DestinationGatewayCity"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Outbound Flight Date</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="DepartDateFromGateCity" SIZE=10 MAXLENGTH=8 VALUE="<%=formHelp.value((String)h.get("DepartDateFromGateCity"))%>" ></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;International Gateway City</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LocationGatewayCity" SIZE=20 MAXLENGTH=30 VALUE="<%=formHelp.value((String)h.get("LocationGatewayCity"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Arrival Date at International Gateway City</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="ArrivalDateAtLocation" SIZE=10 MAXLENGTH=8 VALUE="<%=formHelp.value((String)h.get("ArrivalDateAtLocation"))%>" ></FONT></TD></tr>

<TR><td><%=font%><b>&nbsp;&nbsp;Departure Date from International Gateway City to US</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="DepartureDateFromLocation" SIZE=10 MAXLENGTH=8 VALUE="<%=formHelp.value((String)h.get("DepartureDateFromLocation"))%>" ></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Arrival Date at US Gateway City from Int'l</b></FONT> <%=fontTextS%>(mm/dd/yy)</TD><td><%=font%><INPUT TYPE=Text NAME="ArrivalDateAtGatewayCity" SIZE=10 MAXLENGTH=8 VALUE="<%=formHelp.value((String)h.get("ArrivalDateAtGatewayCity"))%>"></FONT></TD></tr>

<TR><td><%=font%><b>&nbsp;&nbsp;Flight Budget</b></FONT></TD><td><b>$</b><%=font%><INPUT TYPE=Text NAME="FlightBudget" SIZE=10 MAXLENGTH=9 VALUE="<%=formHelp.value((String)h.get("FlightBudget"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Outbound Flight Numbers</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="GatewayCitytoLocationFlightNo" SIZE=30 MAXLENGTH=50 VALUE="<%=formHelp.value((String)h.get("GatewayCitytoLocationFlightNo"))%>"></FONT></TD></tr>
<TR><td><%=font%><b>&nbsp;&nbsp;Return Flight Numbers</b></FONT></TD><td><%=font%><INPUT TYPE=Text NAME="LocationToGatewayCityFlightNo" SIZE=30 MAXLENGTH=50 VALUE="<%=formHelp.value((String)h.get("LocationToGatewayCityFlightNo"))%>"></FONT></TD></tr>

</TABLE>
<p>
<input type='Submit' value='Save'>
</form>
<% String worldTravel = request.getParameter("wt");
	if (worldTravel!=null)  {
		%><form method="post" action="/servlet/WsnSpController"><input type="hidden" name="action" value="showWorldTravel"><input type="hidden" name="view" value="worldtravel">
		<input type='submit' value='Back to WorldTravel'></form><%
	}
%>

<%@ include file="wsnspfooter.jspf" %>
</HTML>