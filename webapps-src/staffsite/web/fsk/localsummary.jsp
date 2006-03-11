<%@ page import="java.util.*" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<% 
Hashtable h = (Hashtable) session.getValue("tub");
Hashtable app = (Hashtable)h.get("0");
Hashtable orders = (Hashtable) session.getValue("orders");
Hashtable distributions = (Hashtable) session.getValue("distributions");
%>

<html>
<head>
<title><%=session.getValue("fskUserRegion")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<% 
String pageTitle = new String();
if (app == null) {
	pageTitle = "Summary for " +session.getValue("fskUserFirstName") +"&nbsp;" + session.getValue("fskUserLastName"); 
} else {
	pageTitle = "Summary for " + formHelp.value((String)app.get("FirstName")) +"&nbsp;" + formHelp.value((String)app.get("LastName")); 
}
%>
<%@ include file="/fsk/fskheader.jspf"%>

<body>
<p><%=fontText%>
Welcome to the Freshman Survival Kit Ordering Site.  We are praying for you and trusting that this strategy will help you
connect with lost students and see God change them into Christ centered laborers.
<BR><BR>
This page is your summary page. Here you can see how many kits you were allocated, and you can add to the number of kits allocated with kits 
you will be paying for from your campus account.  These are called, "Locally Raised" kits.  You can also create a new order or change an existing 
order. On Monday, May 16, 2005, we will begin ordering the material.  After that date, we cannot guarantee that all items will be available.
You can change your shipping and order information until Monday, July 11, 2005.  At that time we will pull the data offline to prepare for fulfillment.
<BR>
<BR>
You can start choosing the products that will go in your FSK's by clicking the "Add New Order" button at the bottom.  
You can have your kits sent to multiple addresses by "submitting" an order, returning to this page and using the "Add New Order" button 
as many times as necessary.  
<BR><BR>
Resources for follow-up are available on http://www.godsquad.com.  Begin praying and planning now on how to use these kits to connect with students. 
</font></p>
<%=fontText%>
<%
if (app == null) {
%>
	<BR><BR>
	<b>You currently don't have any kits allocated to you.</b> To order kits, you need to add an allocation by clicking <a href="/servlet/FskController?action=allocKits&accountno=<%=session.getValue("accountNo")%>&fname=<%=session.getValue("fskUserFirstName")%>&lname=<%=session.getValue("fskUserLastName")%>&region=<%=session.getValue("fskUserRegion")%>">HERE</a>.
	<BR><BR>
<%
} else {
%>
<table>
	<td>
		<table cellspacing=1 cellpadding=5 border=1>
			<tr><td colspan=2 align=left <%=bgcolorB%>><%=fontW%><b>Kit Allotment Summary:</b></font></td></tr>
			<tr><td <%=bgcolorL%>>Locally Raised <a href="/servlet/FskController?action=allocKits&accountno=<%=session.getValue("fskLocalLeaderAccountNo")%>&fname=<%=app.get("FirstName")%>&lname=<%=app.get("LastName")%>&region=<%=app.get("Region")%>&id=<%=app.get("AllocationID")%>">(Edit)</a></td>
				<td>&nbsp;<%=formHelp.value((String)app.get("LocallyRaised"))%></td></tr>
			<tr><td <%=bgcolorL%>>Regional Allotment</td><td>&nbsp;<%=formHelp.value((String)app.get("RegionalAllotment"))%></td></tr>
			<tr><td <%=bgcolorL%>>Regionally Raised</td><td>&nbsp;<%=formHelp.value((String)app.get("RegionallyRaised"))%></td></tr>
			<tr><td <%=bgcolorL%>>Impact Allocation</td><td>&nbsp;<%=formHelp.value((String)app.get("ImpactAllotment"))%></td></tr>
			<tr><td <%=bgcolorL%>>Forerunner Allocation</td><td>&nbsp;<%=formHelp.value((String)app.get("ForerunnerAllotment"))%></td></tr>
			<tr><td <%=bgcolorL%>>National Allotment</td><td>&nbsp;<%=formHelp.value((String)app.get("NatlDonation"))%></td></tr>
			<tr><td <%=bgcolorL%>><b>Total Kits Available</b></td><td><b>&nbsp;<%=formHelp.value((String)app.get("TotalAlloc"))%></b></td></tr>
			<tr><td <%=bgcolorL%>>Regional Notes</td><td>&nbsp;<%=formHelp.value((String)app.get("RegNotes"))%></td></tr>
			<tr><td <%=bgcolorL%>>Impact Notes</td><td>&nbsp;<%=formHelp.value((String)app.get("ImpactNotes"))%></td></tr>
			<tr><td <%=bgcolorL%>>Forerunner Notes</td><td>&nbsp;<%=formHelp.value((String)app.get("ForerunnerNotes"))%></td></tr>
			<tr><td <%=bgcolorL%>>National Notes</td><td>&nbsp;<%=formHelp.value((String)app.get("NatlNotes"))%></td></tr>
		</table>
	  <td width=200> <p><small>Please enter any kits being paid for with locally raised funds.<br>
	        Do this by clicking on "Edit".</small>
	</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	    <p>&nbsp;    </p></td>
	</td>
</table>

<p><strong>To help in our fund development efforts</strong>, 
  please fill in the, &quot;Planned Campus Distribution List.&quot;  below. Tell us the campuses where you plan (may not be actual) 
  to distribute the kits and the number of kits that you hope to distribute on 
  each campus.</p>

<table>
	<td width=406> 
		<table cellspacing=1 cellpadding=5 border=1>
			<tr><td colspan=4 align=left <%=bgcolorB%>><%=fontW%><b>Planned Campus Distribution List:</b></td></tr>
			<tr <%=bgcolorL%>> <th width=200>Campus</th> <th width=45>Kits</th> <th width=101>&nbsp;</th></tr>
				<%
				if (distributions == null) {
				%>
					<tr><td colspan=4><%=fontText%>There are currently no distributions listed.</td></tr>
				<%
				} else if (!distributions.containsKey("0")) {
				%>
						<tr><td colspan=4><%=fontText%>There are currently no distributions listed.</td></tr>
				<%
				} else {
							Integer counter= new Integer(0);
							while (distributions.containsKey(counter.toString())){
								Hashtable d = (Hashtable)distributions.get(counter.toString());
				%>
			<tr><td>&nbsp;<%=fontText%><%=formHelp.value((String)d.get("CampusName"))%></td>
				<td>&nbsp;<%=fontText%><%=formHelp.value((String)d.get("TotalKits"))%></td>
				<td>&nbsp;<a href="/servlet/FskController?action=showDistribution&accountno=<%=formHelp.value((String)app.get("AccountNo"))%>&id=<%=d.get("DistributionID")%>&allocationID=<%=app.get("AllocationID")%>&undistributed=<%=app.get("Undistributed")%>">[View/Edit]</a></td>
			 </tr>
				<%
							counter=new Integer(counter.intValue()+1);
							}
						}
				%>
			 <tr <%=bgcolorL%>> 
				
          <td colspan=1><b>Total Kits Distributed</b></td>
				<td><b>&nbsp;<%=fontText%><%=formHelp.value((String)app.get("TotalDistributed"))%></b></td>
				<td>&nbsp;</td>
			 </tr>
		</table>
		<td width=200> <small>(To edit the distribution list, click the [view/edit] 
		  link, then just change the fields and click the submit button at the bottom 
		  of the page.)</small>
		</td>
	</td>
</table>
				<%
				if ((distributions != null) && (distributions.containsKey("0"))){
				%>
<br>
<table cellspacing=1 cellpadding=5 border=1>
	<tr><td <%=bgcolorL%>><b>Kits Left To Distribute</b></td><td>&nbsp;<b><%=fontText%><% if (formHelp.value((String)app.get("Undistributed")).startsWith("-")) {%></font><%=fontR%><% ; }%><%=formHelp.value((String)app.get("Undistributed"))%></b></font>&nbsp;</td></tr>
</table>
<%
}
%>
<p><%=fontText3%><a href="/servlet/FskController?action=enterDistribution&accountno=<%=formHelp.value((String)app.get("AccountNo"))%>&allocationID=<%=app.get("AllocationID")%>&undistributed=<%=app.get("Undistributed")%>">Add New Distribution Location</a></font></p>
<br>

<table>
	<tr>
		<td width=500>
			<table cellspacing=1 cellpadding=5 border=1>
				<tr><td colspan=4 align=left <%=bgcolorB%>><%=fontW%><b>Order List:</b></font></td></tr>
					<tr <%=bgcolorL%>><th width=100>Order#</th><th width=175>Campus</th><th width=50>Kits</th><th width=100>&nbsp;</th></tr>
<%
					if (orders == null) {
						%>
						<tr><td colspan=4><%=fontText%>There are currently no orders.</font></td></tr>
						<%
					} else if (!orders.containsKey("0")) {
						%>
						<tr><td colspan=4><%=fontText%>There are currently no orders.</font></td></tr>
						<%
					} else {
						Integer counter= new Integer(0);
						while (orders.containsKey(counter.toString())){
							Hashtable o = (Hashtable)orders.get(counter.toString());
							%>
							<tr><td>&nbsp;<%=fontText%><%=o.get("FskOrderId")%></td>
								<td>&nbsp;<%=fontText%><%=formHelp.value((String)o.get("CampusName"))%></td>
								<td>&nbsp;<%=fontText%><%=formHelp.value((String)o.get("TotalKits"))%></td>
								<td>&nbsp;<a href="/servlet/FskController?action=showOrder&accountno=<%=formHelp.value((String)app.get("AccountNo"))%>&id=<%=o.get("FskOrderID")%>&allocationID=<%=app.get("AllocationID")%>">[View/Edit]</a></td></tr>
							<%
							counter=new Integer(counter.intValue()+1);
						}
					}
%>
				<tr <%=bgcolorL%>>
          <td colspan=2><b>Total Kits Ordered</b></td>
          <td><b>&nbsp;<%=fontText%><%=formHelp.value((String)app.get("TotalOrdered"))%></b></td><td>&nbsp;</td></tr>
			</table>
		</td>
		<td width=200>
			<small>(To edit the order, click the [view/edit] link, then just change the fields and click the submit button at the bottom of the page.
				The changes will not register if you do not click the "submit" button.)</small>
		</td>
	</tr>
</table>
<br>
<table cellspacing=1 cellpadding=5 border=1>
	<tr><td <%=bgcolorL%>><b>Kits Left To Order</b></td><td>&nbsp;<b><%=fontText%><% if (formHelp.value((String)app.get("Unordered")).startsWith("-")) {%></font><%=fontR%><% ; }%><%=formHelp.value((String)app.get("Unordered"))%></b></font>&nbsp;</td></tr>
</table>
<BR>
<p>
<%=fontText3%><a href="/servlet/FskController?action=enterOrder&accountno=<%=formHelp.value((String)app.get("AccountNo"))%>&allocationID=<%=app.get("AllocationID")%>">Add New Order</a></font>
<BR>
<BR>
<%=fontText%>View kit contents and descriptions<a name="fsk"> </a><a href='#fsk' onClick="window.open('/fsk/Descrip.htm', 'Descriptions', 'height=450,width=600,dependent=yes,scrollbars=yes,resizable=yes,toolbar=yes,menubar=yes')">here.</a></font>
<br>
</P>
<%
}
%>
<%@ include file="/footer.jspf" %>
</body>
</html>
