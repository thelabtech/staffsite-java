<!-- everything but the 2 jsp sections are maintained by the www.uscm.org webmaster. Note that the
links and images need to be absolute URL's because this page resides on the application server  -->
<!-- start jsp code section 1  -->
<%@ page import="java.util.*, org.alt60m.servlet.*" %>
<%	Iterator i = ActionResults.getActionResults(session).getCollection("campusinfo").iterator(); %>
<% String font = "<font face='Arial' size='2' color='#000000'>";	%>
<!-- end jsp code section 1 --><html>
<head>
<title>Connect With Other Students</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
p {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
h2 {
	font-family: Verdana,Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #003399;
}
.links {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
h1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
	color: #003399;
	text-transform: lowercase;
}
ul {
	list-style-type: square;
}
-->
</style>

<sCRIPT LANGUAGE=JAVASCRIPT TYPE="TEXT/JAVASCRIPT">
<!--
function makeMonthArray() {this.length=12;
        this[1] = "January", this[2] = "February"; this[3] = "March"; 
        this[4] = "April", this[5] = "May"; this[6] = "June";
        this[7] = "July", this[8] = "August"; this[9] = "September"; 
        this[10] = "October", this[11] = "November"; this[12] = "December"; 
return(this);
}
function makeDayArray() { 
this.length=7;
        this[1] = "Sunday", this[2] = "Monday"; this[3] = "Tuesday";
        this[4] = "Wednesday", this[5] = "Thursday"; this[6] = "Friday"; 
        this[7] = "Saturday"; 
return(this);
}
function writeDate() { 
        attdate = new Date();
        monthName = new makeMonthArray();
        dayName = new makeDayArray();
        day = attdate.getDay() + 1;
        date = attdate.getDate();
        month = attdate.getMonth() + 1;
       year = attdate.getYear();
        sec = attdate.getSeconds()
        if (90 <=year && year < 2000) { 
                year = 1900 + year;
        } 
		dateStr = dayName[day];
        dateStr += ", "; 
		dateStr += monthName[month];
        dateStr += " "; 
        dateStr += date; 
        dateStr += ", "; 
        dateStr += year;
document.write(dateStr);
}
//-->
</script>


</head>
<body bgcolor="#ffffff">
<a name="top"></a> 
<table border="0" cellpadding="0" cellspacing="0" width="600">
  <tr> 
    <td width="150" height="75" valign="top"> <img src="http://www.godsquad.com/images/gs2/gslogo.gif" width="134" height="75" align="absmiddle"></td>
    <td width="422" valign="middle">
<h1>connect with other students</h1></td>
  </tr>
  <tr> 
    <td height="10" colspan="2" valign="top" background="http://www.godsquad.com/images/DIVIDER.GIF"><img src="http://www.godsquad.com/Images/spacer.gif" height="10"> 
    </td>
  </tr>
  <tr> 
    <td colspan="2" valign="top"> <img src="http://www.godsquad.com/images/SPACER.GIF" width="1" height="1"> 
      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="50" rowspan="2" valign="top">&nbsp;</td>
        </tr>
        <tr> 
          <td width="600" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td valign="top"><span class="body">
                  <form name=frmDetails action="http://staff.campuscrusadeforchrist.com/servlet/InfoBaseController" method=post>
                    <div align="right"><span class="body"> 
                      <input type=hidden name='action' value='listCampus'>
                      <input type=hidden name='view' value='godsquad'>
                      <input type=hidden name='searchby' value='state'>
                      <strong><font color="#003399">New Search</font></strong> 
                      <select name=searchstring>
                        <option>Select a State</option>
                        <option value="AL">Alabama</option>
                        <option value="AK">Alaska</option>
                        <option value="AZ">Arizona</option>
                        <option value="AR">Arkansas</option>
                        <option value="CA">California</option>
                        <option value="CO">Colorado</option>
                        <option value="CT">Connecticut</option>
                        <option value="DC">Washington, D.C. </option>
                        <option value="DE">Delaware</option>
                        <option value="FL">Florida</option>
                        <option value="GA">Georgia </option>
                        <option value="HI">Hawaii</option>
                        <option value="ID">Idaho </option>
                        <option value="IL">Illinois</option>
                        <option value="IN">Indiana</option>
                        <option value="IA">Iowa</option>
                        <option value="KS">Kansas </option>
                        <option value="KY">Kentucky </option>
                        <option value="LA">Louisiana </option>
                        <option value="ME">Maine </option>
                        <option value="MD">Maryland</option>
                        <option value="MA">Massachusetts</option>
                        <option value="MI">Michigan</option>
                        <option value="MN">Minnesota </option>
                        <option value="MS">Mississippi</option>
                        <option value="MO">Missouri </option>
                        <option value="MT">Montana </option>
                        <option value="NE">Nebraska</option>
                        <option value="NV">Nevada </option>
                        <option value="NH">New Hampshire </option>
                        <option value="NJ">New Jersey </option>
                        <option value="NM">New Mexico</option>
                        <option value="NY">New York</option>
                        <option value="NC">North Carolina</option>
                        <option value="ND">North Dakota</option>
                        <option value="OH">Ohio</option>
                        <option value="OK">Oklahoma</option>
                        <option value="OR">Oregon</option>
                        <option value="PA">Pennsylvania</option>
                        <option value="RI">Rhode Island</option>
                        <option value="SC">South Carolina</option>
                        <option value="SD">South Dakota</option>
                        <option value="TN">Tennessee</option>
                        <option value="TX">Texas</option>
                        <option value="UT">Utah</option>
                        <option value="VT">Vermont</option>
                        <option value="VA">Virginia</option>
                        <option value="WA">Washington</option>
                        <option value="WV">West Virginia</option>
                        <option value="WI">Wisconsin</option>
                        <option value="WY">Wyoming</option>
                      </select>
                      <input type="submit" value="Find" name="submit2">
                      </span> </div>
                  </form>
                  </span><span class="body"> 
                  <!-- start jsp code section 2 
		This creates a table of campuses in a given state with width=100%. 
		You can set the font and the color of the text in the first jsp section at the top of this file.
			-->
                  <!-- insert campus list here -->
                  <table>
                    <%	while(i.hasNext()) {	Hashtable h = (Hashtable)i.next();	%>
                    <tr> 
                      <td><%=font%><a href="/locator/gs/detail.jsp?&campusID=<%=h.get("TargetAreaID")%>"><%=h.get("Name")%></font></a></td>
                      <td><%=font%><%=h.get("City")%>, <%=h.get("State")%>&nbsp;</font></td>
                    </tr>
                    <% } %>
                  </table>
                  <!-- end campus list -->
                  <!-- end jsp code section 2  -->
                  </span> <br> <p><span class="body">If you believe this information 
                    to be in error, please <a href="mailto:studentlinc@uscm.org">e-mail 
                    us</a>.</span></p>
                  <form>
                    <font color="#003399" size="4" face="Verdana, Arial, Helvetica, sans-serif"> 
                    <input name="button" type="button" onClick="window.close()" value="Close Window">
                    </font> 
                  </form>
                  <p>&nbsp;</p></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td colspan="2" valign="top">&nbsp; </td>
  </tr>
</table>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</body>
</html>
