<jsp:useBean id="states" class="org.alt60m.html.SelectState" />
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />
<jsp:useBean id="countries"  class="org.alt60m.html.SelectCountry" />

<html>
<head>
<title>Add Ministry Location To InfoBase</title>
</head>

<% String pageTitle = "Add Ministry Location To InfoBase"; %>
<%@ include file="/infobase/ibheader.jspf" %>

<p>
<%=fontB%>
<form method="post" action="/servlet/InfoBaseController" method="post">
 <input type=hidden name="action" value="saveNewCampus">
<b>Step 1.</b> Before you fill out this form, be sure to check multiple places to make sure the Ministry Location is not already 
in the system. Check at least 3 places, i.e. U of XYZ, or 
University of XYZ, or XYZ University.  The standard format to use when entering the Ministry Location below is to spell 
it all out such as, University of California at Santa Barbara.
<br><br>
<b>Step 2.</b> Fill in the form and click submit.<br><br>
(*required field)<br>
*Ministry Location Name: <input type="text" name="name"><br>
Address 1: <input type="text" name="address1"><br>
Address 2: <input type="text" name="address2"><br>
*City: <input type="text" name="city"><br>
State: 
<%
	states.setName("state");
%>
	<%=states.print()%><br>
	(State is required if US Ministry Location)<BR>
Zip: <input type="text" name="zip"><br>
*Country:
		<%
		countries.setName("country");
		//countries.setCurrentValue(targetAreaW.getCountry());
		%>
		<%=countries.print()%>
<BR>Phone: <input type="text" name="phone"><br>
Fax: <input type="text" name="fax"><br>
Email: <input type="text" name="email"><br>
URL: <input type="text" name="url"><br>
Abbreviation: <input type="text" name="abbrv"><br>
Fice: <input type="text" name="fice"><br>
<!--Population: <input type="text" name="population"><br>-->
Notes (20480 characters): <input type="textarea" name="note"><br>
Alternate Name: <input type="text" name="altName"><br>
*Is this Ministry Location secure? <br>
(I.e. don't tell public we are here. <br>
Closed countries are secure.) &nbsp&nbsp Yes<input type="radio" name="isSecure" value=true>&nbsp&nbsp No<input type="radio" name="isSecure" value=false><br>
Region: 
	<%
		regions.setName("region");
	%>
	<%=regions.print()%>
<BR>MPTA: <input type="text" name="mpta"><br>
URL of Target Area Logo:
<input type="text" name="urlToLogo" size="27" maxlength="255">
<BR>Month and Day School Starts:
<input type="text" name="monthSchoolStarts" size="5" maxlength="10"><%=fontB%>&nbsp;<i>(ie: AUG30)</i></font>
<BR>Month and Day School Stops:
<input type="text" name="monthSchoolStops" size="5" maxlength="10"><%=fontB%>&nbsp;<i>(ie: MAY06)</i></font>
<BR>Semester System?
<input type="radio" name="isSemester">Yes 
<input type="radio" name="isSemester">No
<BR>
</font>
<input type="submit" value="Save">
</form>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>