<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ page import="java.util.*, org.alt60m.servlet.*, java.text.SimpleDateFormat, java.text.ParsePosition" %>
<%
	Collection usProjects = infoBean.getCurrentProjectsByType('u');
	Collection wsnProjects = infoBean.getCurrentProjectsByType('w');
	Collection solProjects = infoBean.getCurrentProjectsByType('s');
	Collection regionalProjects = infoBean.getCurrentProjectsByType('r');
	Collection ibsProjects = infoBean.getCurrentProjectsByType('i');
	Hashtable project = new Hashtable();
%>
<%!
private String prettyPrintProjects(Collection projects, String title) {
	String returnString = "";
	Iterator itr = projects.iterator();
	if (itr.hasNext()) {
		returnString += "\n<table>\n\t<tr>";
		returnString += "\n\t\t<td colspan=\"4\" style=\"text-align=center;\"><font size=\"-1\"><b>"+title+"</b><hr style=\"height:1px; width:100%; color: #0066cc;\"></font></td></tr>";
		returnString += "\n\t<tr>\n\t\t<td><font size=\"-1\"><b>Project</b></font></td>";
		returnString += "\n\t\t<td><font size=\"-1\"><b>Start Date</b></font></td>";
		returnString += "<td><font size=\"-1\">&nbsp;</font></td>";
		returnString += "\n\t\t<td><font size=\"-1\"><b>End Date</b></font></td>\n\t</tr>";
		while (itr.hasNext()) {
			Hashtable project = (Hashtable)itr.next();
			project.put("StudentStartDate", new SimpleDateFormat("dd MMMM yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse((String)project.get("StudentStartDate"), new ParsePosition(0))));
			project.put("StudentEndDate", new SimpleDateFormat("dd MMMM yyyy").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse((String)project.get("StudentEndDate"), new ParsePosition(0))));
			returnString += "\n\t<tr>\n\t\t<td><font size=\"-1\"><a href=\"http://staff.campuscrusadeforchrist.com/servlet/MSController?action=getProject&url=/hr_ms/cmDetail.jsp&projectID="+project.get("WsnProjectID")+"\">"+project.get("Name")+"</a></font></td>";
			returnString += "\n\t\t<td><font size=\"-1\">"+project.get("StudentStartDate")+"</font></td>";
			returnString += "\n\t\t<td><font size=\"-1\"> - </font></td>";
			returnString += "\n\t\t<td><font size=\"-1\">"+project.get("StudentEndDate")+"</font></td>\n\t</tr>";
		}
		returnString += "\n\t\t<td colspan=\"4\" style=\"text-align=center;\"><hr style=\"height:1px; width:100%; color: #0066cc;\"><font size=\"-1\"><b><a href=\"http://staff.campuscrusadeforchrist.com/servlet/MSController\">Apply On-Line!</a></b></font></td></tr>";
		returnString += "\n</table></p>";
	}
		return returnString;
}
%>
<HTML>
<HEAD>
<meta name="description" content="The Campus Ministry of Campus Crusade for Christ International">
<meta name="keywords" content="student, campus, ministry, college, university, God, religion">
<TITLE>Beyond Campus - 2003 Summer Projects</TITLE>

<style type="text/css">
<!---
A {text-decoration: none;}
A:link {text-decoration: none;}
A:active {text-decoration: none;}
A:visited {text-decoration: none;}
A:hover {text-decoration: underline;}

P {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; color: #000000; text-decoration: none}

.list{font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; color: #000000; text-decoration: none}


.body {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #000000; text-decoration: none}

.white {font-family: Verdana, Arial, Helvetica, sans-serif; font-size:
10px; color: #ffffff; text-decoration: none}

.beige {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #999966; text-decoration: none}

.blue {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; color: #003399; text-decoration: none}
-->
</style>
<script language='javascript'>
<!--
/********************************************
AUTHOR:WWW.CGISCRIPT.NET.LLC
URL:http://www.cgiscript.net
Use the code for FREE but leave this message intact
Download your FREE CGI/Perl Scripts today!
( http://www.cgiscript.net/scripts.htm )
****************************************************/
 var acePopup8Window=null;
function acePopup8(mypage,myname,w,h,pos,infocus){
if(pos=='random'){
LeftPosition=(screen.width)?Math.floor(Math.random()*(screen.width-w)):100;
TopPosition=(screen.height)?Math.floor(Math.random()*((screen.height-h)-75)):100;}
if(pos=='center'){
LeftPosition=(screen.width)?(screen.width-w)/2:100;
TopPosition=(screen.height)?(screen.height-h)/2:100;}
else if((pos!='center' && pos!='random') || pos==null){LeftPosition=100;TopPosition=100;}settings='width='+ w + ',height='+ h + ',top=' + TopPosition + ',left=' + LeftPosition + ',location=no,directories=no,menubar=no,toolbar=no,status=no,scrollbars=no,resizable=no,dependent=no';
acePopup8Window=window.open('',myname,settings);
if(infocus=='front'){acePopup8Window.focus();acePopup8Window.location='http://www.campuscrusadeforchrist.com/getinvolved/cmi/kairos/kairos-info.html';}
}
//-->
</script>	
</HEAD>

<body bgcolor="#ffffff" text="#000000" link="#003399" vlink="#999999" alink="#3366cc" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0">
<!--Entire page table -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td>
<!--Table for header plus two spacers -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
          
<tr><td colspan=2><img src="http://www.campuscrusadeforchrist.com/images/shim.gif" WIDTH="1" HEIGHT="25"></td>
	</tr>
  <tr> 
    <td width="95%" valign="top"> 
      
<!--Table 2 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"> 
            
<!--Table 1 -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="10%"><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="50" height="8"></td>
                <td valign="bottom" width="90%"><a href="http://www.campuscrusadeforchrist.com/index.html"><img src="http://www.campuscrusadeforchrist.com/images/logo_sm.gif" alt="Campus Crusade for Christ" width="138" height="85" border="0"></a></td>
              </tr>
            </table>
<!--End of Table 1 -->
          </td>
          <!--end of first two cells that will stretch -->
          <td width="40" valign="top"><img src="http://www.campuscrusadeforchrist.com/images/dottedline_vert_sm02.gif" width="40" height="63"></td>
          <td width="200" valign="top">
			<!--BEGIN MINISTRY LOCATOR TABLE-->


<FORM name=frmDetails action="http://staff.campuscrusadeforchrist.com/servlet/InfoBaseController" method=post>
<input type=hidden name='action' value='listCampus'>
<input type=hidden name='view' value='uscm'>
<input type=hidden name='searchby' value='state'>
  <table width="200" border="0" cellspacing="0" cellpadding="0">
    <tr valign="top"> 
      <td colspan="2"><img src="http://www.campuscrusadeforchrist.com/images/locator.jpg" width="200" height="35"></td>
  </tr>
    <tr valign="top"> 
      <td width="129"> 
        <select name=searchstring>
        <option value="no state selected" selected>Choose State</option>
        <option value="AL">Alabama </option>
        <option value="AK">Alaska </option>
        <option value="AZ">Arizona </option>
        <option value="AR">Arkansas </option>
        <option value="CA">California </option>
        <option value="CO">Colorado </option>
        <option value="CT">Connecticut </option>
        <option value="DE">Delaware </option>
        <option value="FL">Florida </option>
        <option value="GA">Georgia </option>
        <option value="HI">Hawaii </option>
        <option value="ID">Idaho </option>
        <option value="IL">Illinois </option>
        <option value="IN">Indiana </option>
        <option value="IA">Iowa </option>
        <option value="KS">Kansas </option>
        <option value="KY">Kentucky </option>
        <option value="LA">Louisiana </option>
        <option value="ME">Maine </option>
        <option value="MD">Maryland </option>
        <option value="MA">Massachusetts </option>
        <option value="MI">Michigan </option>
        <option value="MN">Minnesota </option>
        <option value="MS">Mississippi </option>
        <option value="MO">Missouri </option>
        <option value="MT">Montana </option>
        <option value="NE">Nebraska </option>
        <option value="NV">Nevada </option>
        <option value="NH">New Hampshire </option>
        <option value="NJ">New Jersey </option>
        <option value="NM">New Mexico </option>
        <option value="NY">New York </option>
        <option value="NC">North Carolina </option>
        <option value="ND">North Dakota </option>
        <option value="OH">Ohio </option>
        <option value="OK">Oklahoma </option>
        <option value="OR">Oregon </option>
        <option value="PA">Pennsylvania </option>
        <option value="RI">Rhode Island </option>
        <option value="SC">South Carolina </option>
        <option value="SD">South Dakota </option>
        <option value="TN">Tennessee </option>
        <option value="TX">Texas </option>
        <option value="UT">Utah </option>
        <option value="VT">Vermont </option>
        <option value="VA">Virginia </option>
        <option value="WA">Washington </option>
        <option value="DC">Washington D.C. </option>
        <option value="WV">West Virginia </option>
        <option value="WI">Wisconsin </option>
        <option value="WY">Wyoming </option>
      </select>
      </td>  
      <td width="83" valign="top" align="right"> 
        <input type="submit" value="Schools" name="submit">
      </td>
  </tr>
</table></FORM>
<!--END MINISTRY LOCATOR TABLE-->

			</td></tr>
  
      </table>
<!--End of Table 1 -->
    </td>
    <td width="5%"><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="50" height="1"></td>
  </tr>
<tr><td colspan=2><img src="http://www.campuscrusadeforchrist.com/images/shim.gif" WIDTH="1" HEIGHT="15"></td>
	</tr></table>
<!--End of Header Table -->
</td></tr>
<!--End of Page Table Row #1 --></table>
<!--Entire Page Table Row #4 Starts Here -->
<tr> 
  <td align="bottom"> 
    <!--Start of Table to go within Page Table Row #4 -->
    <table width="100%" border="0" cellspacing="0" cellpadding="0" background="http://www.campuscrusadeforchrist.com/images/bluestripe02.gif" height="55" bgcolor="#003399">
      <tr> 
        <td width="95%" valign="bottom"> 
          <table width="100%" border="0" cellspacing="0" cellpadding="0" height="55">
            <tr> 
              <td valign="bottom"> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0" height="55">
                  <tr> 
                    <td width="10%"><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="50" height="8"></td>
                    <td valign="bottom" width="90%"><img src="http://www.campuscrusadeforchrist.com/images/spring02/beyond.gif" width="300" height="40"></td>
                  </tr>
                </table>
              </td>
              <!--end of first two cells that will stretch -->
              <td width="40"><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="40" height="1"></td>
              <td width="200" valign="top">&nbsp; </td>
            </tr>
          </table>
        </td>
        <td width="5%"><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="50" height="1"></td>
      </tr>
    </table>
    <!--End of Table within Page Table Row#4 -->
  </td>
</tr>
<!--PageTable Row #5 -->
<tr> 
  <td><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="100%" height="15"></td>
</tr>
<!--Page Talbe Row #6 - Main Body Content -->
<tr> 
  <td> 
    <!--Table within Row #6 -->
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td width="95%"> 
          <!--Table 2 -->
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr> 
              <td valign="top"> 
                <!--Table 1 -->
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td width="10%"><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="50" height="8"></td>
                    <td valign="top" width="90%"> 
                      <p><font size="+1" color="#003399">eDit The Story of Your Life</font></p>
                      <p><font color="#003399">2003 Summer Projects | Campus Crusade for Christ</font></p>
                      <img src="http://www.campuscrusadeforchrist.com/images/summerprojects03/edit.jpg" width="160" height="137" align="right">
<%=prettyPrintProjects(usProjects, "U.S. Summer Projects")%>
                      <img src="http://www.campuscrusadeforchrist.com/beyondcampus/Beach%20Evangelism%201.jpg" width="160" height="100" align="left">
<%=prettyPrintProjects(wsnProjects, "W.S.N. Summer Projects")%>
<%=prettyPrintProjects(solProjects, "School of Leadership Summer Projects")%>
<%=prettyPrintProjects(regionalProjects, "Regional Summer Projects")%>
<%=prettyPrintProjects(ibsProjects, "Institute of Biblical Studies Summer Projects")%>
                      </td>
                  </tr>
                </table>
                <!--End of Table 1 -->
              </td>
              <!--end of first two cells that will stretch -->
              <td width="40"><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="40" height="1"></td>
              <td width="200" valign="top"> 
                
<table cellpadding="0" cellspacing="0" border="0" width="200">
  <tr><td width="200" valign="top"><a href="http://www.campuscrusadeforchrist.com/index.html"><IMG SRC="http://www.campuscrusadeforchrist.com/images/nav_home.gif" ALT="" WIDTH="41" HEIGHT="20" BORDER="0"></a><br>
      <a href="http://www.campuscrusadeforchrist.com/aboutus/index.html"><img height=20 alt="about us" src="http://www.campuscrusadeforchrist.com/images/spring02/about.jpg" width=60 border=0></a><br>
      <img height=20 alt="beyond campus" src="http://www.campuscrusadeforchrist.com/images/spring02/beyond.jpg" width=105 border=0><br>
      <a class=beige href="http://www.campuscrusadeforchrist.com/beyondcampus/christmas.html">Christmas Conferences</a> |<br>
      <a class=beige href="http://www.campuscrusadeforchrist.com/beyondcampus/summer03.html">Summer Projects</a> | <A class=beige href="http://www.campuscrusadeforchrist.com/getinvolved/cmi/home.html">Internships</A> <br>
      <a class=beige href="javascript:acePopup8('http://www.campuscrusadeforchrist.com/getinvolved/cmi/kairos/kairos-info.html','acePopup8','540','534','center','front');">Kairos Project </a>| <A class=beige href="http://www.campuscrusadeforchrist.com/beyondcampus/investing.html"> Investing Your Life</A><br>
      <a href="http://www.campuscrusadeforchrist.com/Mintools/index.html"><img height=20 alt="stuff you can use" src="http://www.campuscrusadeforchrist.com/images/spring02/stuff.jpg" width=110 border=0></a><br>
      <a class=beige href="http://www.campuscrusadeforchrist.com/mintools/index.html">Ministry Resources</A> | <a href="http://www.campuscrusadeforchrist.com/Mintools/biblestudies/crucomm.html" class="beige">cru.comm       </a><br>
      <a href="http://www.campuscrusadeforchrist.com/Mintools/biblestudies/interacta.html" class="beige">Interacta</a> 
      <span class="beige">| <a href="http://www.campuscrusadeforchrist.com/Mintools/lifeconcepts.html" class="beige">Life Concepts</a></span><br>
      <a href="http://www.campuscrusadeforchrist.com/wsn/index.html"><img height=20 alt=international src="http://www.campuscrusadeforchrist.com/images/spring02/wsn.jpg" width=175 border=0></a><br>
			<a href="http://www.campuscrusadeforchrist.com/esm/index.html"><img height=20 alt="ethnic students" src="http://www.campuscrusadeforchrist.com/images/spring02/esm.jpg" width=155 border=0></a><br>
      <a href="http://www.campuscrusadeforchrist.com/parents/index.html"><img height=20 alt="just for parents" src="http://www.campuscrusadeforchrist.com/images/spring02/parents.jpg" width=95 border=0></a><br>
      <a href="http://www.campuscrusadeforchrist.com/partners/index.html"><img alt="financial partners" src="http://www.campuscrusadeforchrist.com/images/spring02/partners.jpg" width="115" height="20" border="0"></a><br>
      <a href="http://www.campuscrusadeforchrist.com/giving.html"><img src="http://www.campuscrusadeforchrist.com/images/spring02/donate.jpg" width="100" height="20" border="0"></a><br>
      <a href="http://www.campuscrusadeforchrist.com/aboutus/contactus.html"><img height=20 alt="contact us" src="http://www.campuscrusadeforchrist.com/images/spring02/contact.jpg" width=70 border=0></a><br>
    <br>
    <br>
    <img height=2 src="http://www.campuscrusadeforchrist.com/images/dottedline_horiz.gif" width=60 border=0><br>
    <br>
      <img height=25 alt="featured site" src="http://www.campuscrusadeforchrist.com/images/spring02/featured.jpg" width=80 border=0><br>
      <a href="http://www.onedayoffaith.com" target="_blank"><img src="http://www.campuscrusadeforchrist.com/images/oct/what_r1_c1.jpg" border="0" width="160" height="40"></a> 
      <p>
      <p>
			  <a href="http://www.campuscrusadeforchrist.com/othersites.html"><img height=20 alt="other recommended sites" src="http://www.campuscrusadeforchrist.com/images/spring02/recommend.jpg" width=125 border=0></a><br>
        <a href="http://www.everystudent.com" target="_blank" class=beige>EveryStudent.com</a> | <a href="http://www.godsquad.com" target="_blank" class=beige>GodSquad</a><br>
        <a href="http://www.waymore.org" target="_blank" class=beige>Waymore</a> | <a href="http://www.campuscrusadeforchrist.com/othersites.html" class="beige">More...</a>
      <p>
	  <p><IMG SRC="http://www.campuscrusadeforchrist.com/images/dottedline_horiz.gif" WIDTH="60" HEIGHT="2" BORDER="0"> 
  <P class="beige">Campus Crusade for Christ is the collegiate ministry of <a href="http://www.ccci.org" target="_blank" class="blue"><font color="#003399">Campus Crusade for Christ International</font></a>, a family of more than 50 ministries worldwide.</P>
			 </td></tr></table>
              </td>
            </tr>
          </table>
          <!--End of Table 2 -->
        </td>
        <td width="5%"><img src="http://www.campuscrusadeforchrist.com/images/spacer.gif" width="50" height="1"></td>
      </tr>
    </table>
    <!--End of Table within Row #6  -->
  </td>
</tr>
<!--Page Table Row #7 -->
<tr valign="top"> 
  <td> 
     
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="http://www.campuscrusadeforchrist.com/images/spring02/dottedline_horiz_foot.gif">
  <tr>
<td valign="top"><BR>
      <BR>
      <br>
      <span class="beige">&copy; 2002 Campus Crusade for Christ. All rights reserved. 
      </span><A HREF="mailto:webmaster@uscm.org" class="blue">webmaster@uscm.org</A> 
    </td>
  </tr>
</table>

  </td>
</tr>
<%@ include file="/headers/google_analytics.jspf"%>
</body>
</html>
