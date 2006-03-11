<!-- everything but the 2 jsp sections are maintained by the www.uscm.org webmaster. Note that the
links and images need to be absolute URL's because this page resides on the application server  -->
<!-- start jsp code section 1  -->
<jsp:useBean id="contacts" class="org.alt60m.ministry.bean.CampusContacts" />
<!-- end jsp code section 1 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Ministry Locations</title>
 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style>
p {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
h1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #003399;
}
.blue {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #003399;

}
.pagetitle {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 24px;
	color: #003399;
	font-weight: normal;
}
.blue {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #003399;
}
</style>
</head>

<body background="http://www.campuscrusadeforchrist.com/images/background2.gif">
  <tr> 
    <td valign="top">      <table width="550" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#003399">
    <tr> 
      <td height="96" valign="bottom" background="/images/background2.gif"> <img src="http://www.campuscrusadeforchrist.com/images/enews/topper2.gif" width="550" height="109" border="0"></td>
    </tr>
    <tr> 
      <td valign="top"> <table width="548" border="0" align="center" cellpadding="5" cellspacing="0">
          <tr> 
            <td valign="top" bgcolor="#FFFFFF"><br>
              <span class="pagetitle">U.S. Ministry Locations </span>             <img src="http://www.campuscrusadeforchrist.com/images/DIVIDER.GIF" width="100%" height="20"></p>			 <table width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                 <td valign="top">
                   <form name=frmDetails action="http://staff.campuscrusadeforchrist.com/servlet/InfoBaseController" method=post>
                     <div align="right"><span class="body">
                       <input type=hidden name='action' value='listCampus'>
                       <input type=hidden name='view' value='uscm'>
                       <input type=hidden name='searchby' value='state'>
                       <strong><font color="#003399">New Search</font></strong>
                       <select name=searchstring style="FONT-SIZE: 8pt">
                         <option>Select a State</option>
                         <option value="AL">Alabama</option>
                         <option value="AK">Alaska</option>
                         <option value="AZ">Arizona</option>
                         <option value="AR">Arkansas</option>
                         <option value="CA1">California: San Fransisco Bay Area</option>
						 <option value="CA2">California: Los Angeles / San Diego Area</option>
						 <option value="CA3">California: Other Areas</option>
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
						 <option value="NY1">New York: New York City Metro Area</option>
						 <option value="NY2">New York: Other Areas</option>
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
                       <input type="submit" value="Find" name="submit" style="FONT-SIZE: 8pt; BACKGROUND: #ffffff; COLOR: #003399">
                     </span></div>
                   </form>
                   <span class="body">
                    <!-- start jsp code section 2  
		This creates a table of contacts on a given campus with width=100%. 
		You can set the font and the color of the text. 
		The font name goes in the qrotes after the first comma.
		The color goes in the quotes after the second comma.
			-->
                  <%
			contacts.setVars(request.getParameter("campusID"), "Arial", "#003399");
			%> <%=contacts.print()%> 
                  <!-- end jsp code section 2  -->
                    <br>
                   <p><span class="body">If you believe this information to be in error, please <a href="mailto:studentlinc@uscm.org">e-mail us</a>.</span></p>
                   <form>
                     <font color="#003399" size="4" face="Verdana, Arial, Helvetica, sans-serif">
                     <input name="button" type="button" onClick="window.close()" value="Close Window">
                     </font>
                   </form>
                   <img src="http://www.campuscrusadeforchrist.com/images/DIVIDER.GIF" width="100%" height="20"> 
                   
                   <p class="blue">&copy; 2003 Campus Crusade for Christ, International</p></td>
               </tr>
             </table>
			
                    <p class="linksblue">&nbsp;</p></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td height="1"><img src="/images/SPACER.GIF" width="1" height="1"></td>
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
