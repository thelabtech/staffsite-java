<!-- everything but the 2 jsp sections are maintained by the www.uscm.org webmaster. Note that the
links and images need to be absolute URL's because this page resides on the application server  -->
<!-- start jsp code section 1  -->
<%@ page import="java.util.*, org.alt60m.servlet.*" %>
<%	Iterator i = ActionResults.getActionResults(session).getCollection("campusinfo").iterator(); %>
<% String font = "<font face='Arial' size='2' color='#000000'>";	%>
<!-- end jsp code section 1 -->

<HTML>
<HEAD>
<TITLE>EveryStudent.com: your campus</TITLE>




<script src="http://www.everystudent.com/_utm.js"></script>
<style>
A:hover {color:FF0000}
</style>


<!-------------- BEGIN HOMEPAGE HEADER 2 ---------------->



<!-------------------- BEGIN COPYING THE JAVASCRIPT SECTION HERE ------------------->


<script language="javascript">
<!--
  function floatingWindow(){
    var MapWin = window.open( "sitemap.html", 
                              "newWin", 
                              "scrollbars=1,width=297,height=647" ) ;
    // This is the key to making opener() resolve in the popup window
    MapWin.opener = window.parent ;
  }
// -->
</script>


<!-- Begin MouseOver Library -->

<script language="javascript">


<!--

  function msover( name ) {
  // --------------------------------------------------------------------------------
  // Purpose: Turn on the image and status text for a mouseOver
  //
    // Error handling
    window.onerror = null ;

    // Post the 'on' image
    if ( document.images ) {
      document.images[name].src = eval( name + '_over.src' ) ;
    }

    // All browsers that have JavaScript should be able to update the status window
    window.status = eval( name + '_status' ) ;
  }

  function msoff( name ) {
  // --------------------------------------------------------------------------------
  // Purpose: Turn off the image and blank out the status area for mouseOut
  //
    // Error handling
    window.onerror = null ;

    // Post the 'off' image
    if ( document.images ) {
      document.images[name].src = eval( name + '.src' ) ;
    }

    // All browsers that have JavaScript should be able to update the status window
    // This goes blank automatically for some browsers, but do this for safety
    window.status = "" ;
  }


        
// -->


</script>

<!-- End MouseOver Library -->


<script language="javascript">

<!--

  window.onerror = null ;

  // --------------------------------------------------------------------------------
  // Purpose: Initialize the image array and preload all images
  //
  if (document.images) 
     {     
     var existence = new Image();
     existence.src = "http://www.everystudent.com/images/home3/existence.gif";
     var existence_over = new Image();
     existence_over.src = "http://www.everystudent.com/images/home3/existence_over.gif";
     
     var jesus = new Image();
     jesus.src = "http://www.everystudent.com/images/home3/jesus.gif";
     var jesus_over = new Image();
     jesus_over.src = "http://www.everystudent.com/images/home3/jesus_over.gif";
     
     var experience = new Image();
     experience.src = "http://www.everystudent.com/images/home3/experience.gif";
     var experience_over = new Image();
     experience_over.src = "http://www.everystudent.com/images/home3/experience_over.gif";
     
     var connect = new Image();
     connect.src = "http://www.everystudent.com/images/home3/connect.gif";
     var connect_over = new Image();
     connect_over.src = "http://www.everystudent.com/images/home3/connect_over.gif";
     
     var issues = new Image();
     issues.src = "http://www.everystudent.com/images/home3/issues.gif";
     var issues_over = new Image();
     issues_over.src = "http://www.everystudent.com/images/home3/issues_over.gif";
     
     var enigmas = new Image();
     enigmas.src = "http://www.everystudent.com/images/home3/enigmas.gif";
     var enigmas_over = new Image();
     enigmas_over.src = "http://www.everystudent.com/images/home3/enigmas_over.gif";
     
     var forum = new Image();
     forum.src = "http://www.everystudent.com/images/home3/forum.gif";
     var forum_over = new Image();
     forum_over.src = "http://www.everystudent.com/images/home3/forum_over.gif";
     
     var personal = new Image();
     personal.src = "http://www.everystudent.com/images/home3/personal.gif";
     var personal_over = new Image();
     personal_over.src = "http://www.everystudent.com/images/home3/personal_over.gif";
     
     var video = new Image();
     video.src = "http://www.everystudent.com/images/home3/video.gif";
     var video_over = new Image();
     video_over.src = "http://www.everystudent.com/images/home3/video_over.gif";
     
    }

  // Initialize status bar messages
  //
  existence_status = "What evidence is there for the existence of God? What is God like?"; 
  jesus_status = "Is Jesus God? What do we really know about him? What about other religions?";
  experience_status = "What is it like to know God? Real life stories.";
  forum_status = "Answers to requested Q & A topics. Let's hear your questions.";
  personal_status = "Life is a challenge. Email one of us with whatever's on your mind.";
  connect_status = "How does one come to know God? Read God's words for yourself.";
  video_status = "Nothing scripted. Real life stories about knowing God.";
  enigmas_status = "Why is there evil, suffering, death? How do you deal with life's hard times?"; 
  issues_status = "Sex, relationships, drinking, inner strength, ethnic issues, and more.";
  

// -->


</script>



<!-------------------------- STOP COPYING THE JAVASCRIPT HERE -------------------------->


</HEAD>





<body background="http://www.everystudent.com/images/caramelback2.gif" bgcolor="999966" text="000000" link="003399" vlink="003399" alink="003399" topmargin="0" leftmargin="0" rightmargin="0" marginwidth="0" marginheight="0">


<A NAME="top"> 

<CENTER>


<!-- TABLE ONE -->

<TABLE BORDER=0 WIDTH=710 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=TOP WIDTH=710 HEIGHT=10 BGCOLOR=003366><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=10 WIDTH=2></TD>
</TR>
</TABLE>



<!-- TABLE TWO -->


<TABLE WIDTH=710 BORDER=0 CELLPADDING=0 CELLSPACING=0>
<TR>
<TD VALIGN=TOP WIDTH=3 BGCOLOR=003366> &nbsp; </TD>
<TD VALIGN=TOP HEIGHT=80 BGCOLOR=000000><A HREF="http://www.everystudent.com/index.html"><IMG SRC="http://www.everystudent.com/images/topgraphic4.jpg" BORDER=0 WIDTH=702 HEIGHT=80 ALT="Looking at the big questions of college life, God, meaning, and everything"></A></TD>
<TD VALIGN=TOP WIDTH=3 BGCOLOR=003366> &nbsp; </TD></TR>
</TABLE>


<TABLE BORDER=0 WIDTH=710 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=TOP WIDTH=3 BGCOLOR=003366><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=6 WIDTH=3></TD>
<TD VALIGN=TOP WIDTH=704 BGCOLOR=000000><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=10 WIDTH=1></TD>
<TD VALIGN=TOP WIDTH=3 BGCOLOR=003366><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=6 WIDTH=3></TD>
</TR>
</TABLE>



<!-- TABLE THREE -->

<TABLE WIDTH=710 BORDER=0 CELLPADDING="0" CELLSPACING="0"> 
<TR>
<TD VALIGN=TOP WIDTH=3 BGCOLOR=003366 ROWSPAN=2> &nbsp; </TD>
<TD VALIGN=TOP WIDTH=152 ALIGN=CENTER BGCOLOR=003366><BR>

<!-- BEGIN DEPARTMENTS -->
<a href="http://www.everystudent.com/menus/existence.html" onMouseOver="msover('existence') ; return true;" onMouseOut="msoff('existence') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/existence.gif" name="existence" ALT="The Existence" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR>
<a href="http://www.everystudent.com/menus/jesus.html" onMouseOver="msover('jesus') ; return true;" onMouseOut="msoff('jesus') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/jesus.gif" name="jesus" ALT="And Jesus?" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR>
<a href="http://www.everystudent.com/menus/experience.html" onMouseOver="msover('experience') ; return true;" onMouseOut="msoff('experience') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/experience.gif" name="experience" ALT="The Experience" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR>
<a href="http://www.everystudent.com/menus/connect.html" onMouseOver="msover('connect') ; return true;" onMouseOut="msoff('connect') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/connect.gif" name="connect" ALT="Connect" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR>
<a href="http://www.everystudent.com/menus/issues.html" onMouseOver="msover('issues') ; return true;" onMouseOut="msoff('issues') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/issues.gif" name="issues" ALT="Life Issues" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR>
<a href="http://www.everystudent.com/menus/enigmas.html" onMouseOver="msover('enigmas') ; return true;" onMouseOut="msoff('enigmas') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/enigmas.gif" name="enigmas" ALT="Enigmas" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR>
<a href="http://www.everystudent.com/menus/forum.html" onMouseOver="msover('forum') ; return true;" onMouseOut="msoff('forum') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/forum.gif" name="forum" ALT="Q & A Forum" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR>
<a href="http://www.everystudent.com/menus/personal.php" onMouseOver="msover('personal') ; return true;" onMouseOut="msoff('personal') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/personal.gif" name="personal" ALT="Get Personal" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR>
<a href="http://www.everystudent.com/videoroom.php" onMouseOver="msover('video') ; return true;" onMouseOut="msoff('video') ; return true;"><IMG SRC="http://www.everystudent.com/images/home3/video.gif" name="video" ALT="Video Room" VSPACE=0 BORDER=0 WIDTH=148 HEIGHT=29></A><BR><IMG 
SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=8 WIDTH=2><BR><A HREF="http://www.everystudent.com/sitemap.html"><FONT SIZE=1 COLOR=FFFFFF 
FACE=verdana,arial,helvetica>site map</FONT></A><BR><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=8 WIDTH=2><br><a 
href="http://www.everystudent.com/sendtofriend2.php?articleName=EveryStudent.com:+A+Safe+Place+to+Explore+Who+God+Is"><FONT SIZE=1 COLOR=FFFFFF 
FACE=verdana,arial,helvetica>email site<BR>to friend</FONT></a><BR><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=8 
WIDTH=2><BR><A HREF="http://www.everystudent.com/menus/link.html"><FONT SIZE=1 COLOR=FFFFFF 
FACE=verdana,arial,helvetica>link to site</FONT></a><BR><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=8 WIDTH=2><BR><A HREF="http://www.everystudent.com/index.html"><FONT SIZE=1 COLOR=FFFFFF 
FACE=verdana,arial,helvetica>home</FONT></A><BR><BR><BR>


<FORM ACTION="http://search.freefind.com/find.html" METHOD="GET" target="_self">
<FONT size=1 face="verdana,arial,helvetica" COLOR=FFFFFF>search</FONT><BR><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=2 WIDTH=2><BR>
<INPUT TYPE="HIDDEN" NAME="id" SIZE="-1" VALUE="82264460">
<INPUT TYPE="HIDDEN" NAME="pageid" SIZE="-1" VALUE="r">
<INPUT TYPE="HIDDEN" NAME="mode" SIZE="-1" VALUE="ALL">
<INPUT type="HIDDEN" name="n" value="0">
<INPUT TYPE="TEXT" NAME="query" SIZE="10" style="color: #000000; background: #efefe7">
<INPUT TYPE="SUBMIT" VALUE=" find " style="background: #efefe7; color: #003366; font-size: 7pt"><BR><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" HEIGHT=2 WIDTH=2><br>
<FONT size=1 face="arial,helvetica" COLOR=FFFFFF>powered by <A HREF="http://www.freefind.com"><FONT COLOR=6699CC>FreeFind</FONT></A></font></FORM>

<BR>

<!-- END DEPARTMENTS -->







</TD>

<TD VALIGN=TOP WIDTH=1 ROWSPAN=2 BGCOLOR=000000 VALIGN=BOTTOM><IMG SRC="http://www.everystudent.com/images/transparentdot.gif" WIDTH=1 HEIGHT=1></TD>
<TD VALIGN=TOP WIDTH=551 ROWSPAN=2 BGCOLOR=efefe7> 



<!-- BEGIN CONTENT TABLE -->

<TABLE BORDER=0 WIDTH=551 CELLSPACING=0 CELLPADDING=20>
<TR>
<TD BGCOLOR=efefe7 VALIGN=TOP><FONT Face="verdana,arial,helvetica" SIZE=2>

<!-------------- END HOMEPAGE HEADER 2 ---------------->


<!-- BEGIN CONTENT SECTION -->

<p><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>Connecting 
                With Other Students </strong></font></p>
              <form name=frmDetails action="http://staff.campuscrusadeforchrist.com/servlet/InfoBaseController" method=post>
                    <div align="right"><span class="body"> 
                       <input type=hidden name='action' value='listCampus'>
                                <input type=hidden name='view' value='everystudent'>
                                <input type=hidden name='searchby' value='state'>
                                <select name=searchstring>
                  <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> New 
                  Search</font> 
                  
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
                     </div>
                  </form>
                   
                  <!-- start jsp code section 2 
		This creates a table of campuses in a given state with width=100%. 
		You can set the font and the color of the text in the first jsp section at the top of this file.
			-->
                  <!-- insert campus list here -->
                  <table>
                    <%	while(i.hasNext()) {	Hashtable h = (Hashtable)i.next();	%>
                    <tr> 
                      <td><%=font%><a href="/locator/everystudent/detail.jsp?&campusID=<%=h.get("TargetAreaID")%>"><%=h.get("Name")%></font></a></td>
                      <td><%=font%><%=h.get("City")%>, <%=h.get("State")%>&nbsp;</font></td>
                    </tr>
                    <% } %>
                  </table>
                  <!-- end campus list -->
                  <!-- end jsp code section 2  -->
                  </span> <br> 
                    <p><font size="2" face="Verdana, Arial, Helvetica, sans-serif">If 
                you believe this information to be in error, please <a href="mailto:studentlinc@uscm.org">e-mail 
                us</a>.</font></p>
                  

<!-- END CONTENT SECTION -->















   

<!-------------- BEGIN ARTICLE FOOTER ---------------->

<P>      
<BR>

 
<FONT Face="verdana,arial,helvetica" SIZE=2> 
<A HREF="#top">top of page</A><BR>
<A HREF="http://www.everystudent.com/index.html">homepage</A>
</FONT><BR><BR><FONT FACE=verdana,arial,helvetica SIZE=1>&copy; EveryStudent.com<BR>
</FONT><BR>


</TD></TR></TABLE>

<!-- END CONTENT TABLE -->

</TD>

<TD VALIGN=TOP WIDTH=3 BGCOLOR=003366>&nbsp;  </TD>
</TR>
</TABLE>

<!-- END MAIN TABLE -->



<!-- TABLE FOUR -->

<TABLE BORDER=0 WIDTH=710 CELLSPACING=0 CELLPADDING=0>
<TR>
<TD VALIGN=TOP WIDTH=710 BGCOLOR=003366>&nbsp;  </TD>
</TR>
</TABLE>




<p>

<FONT FACE=verdana,arial,helvetica SIZE=2>&copy; EveryStudent.com<BR>
explore issues about college life and God<BR>


<A HREF="http://www.everystudent.com/menus/about.html"><FONT SIZE=1 COLOR=FFFFFF FACE=verdana,arial,helvetica>about site</FONT></a><BR><A HREF="http://www.everystudent.com/contact.html"><FONT COLOR=FFFFFF SIZE=1>contact webmaster</FONT></A></FONT><BR> 

<BR><BR>
</CENTER>


<!-------------- END ARTICLE FOOTER ---------------->


 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</BODY>
</HTML>


