<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,javax.mail.*,javax.mail.internet.*,javax.activation.*, javax.xml.transform.stream.*, javax.xml.transform.*, java.net.*" %>
<%@ page import="org.alt60m.staffSite.bean.dbio.*,org.alt60m.staffSite.model.dbio.StaffSitePref,org.alt60m.staffSite.model.dbio.StaffSiteProfile,org.alt60m.util.ObjectHashUtil" %>
<jsp:useBean id="internetsearch" class="org.alt60m.html.InternetSearch" />
<jsp:useBean id="biblesearch" class="org.alt60m.html.BibleSearch" />
<jsp:useBean id="birthdays" class="org.alt60m.html.Birthdays" />
<jsp:useBean id="weddings" class="org.alt60m.html.Weddings" />
<jsp:useBean id="staffSearch" class="org.alt60m.html.InfoBaseLookup" />
<jsp:useBean id="articles" class="org.alt60m.html.HomePageArticles" />
<jsp:useBean id="regionalarticles" class="org.alt60m.html.HomePageArticles" />
<jsp:useBean id="newsfeed" class="org.alt60m.html.NewsFeed" />
<jsp:useBean id="references" class="org.alt60m.html.dbio.References" />
<jsp:useBean id="preferences" class="org.alt60m.staffSite.bean.dbio.UserPreferences" />

<HTML>
<HEAD>
<TITLE>Campus Staff Site</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
</HEAD>
<% int curr_tab = 1; %>
<% String pageTitle = "&nbsp;";
	StaffSiteProfile prof = new StaffSiteProfile("3951"); //LIVE testing.login
//	StaffSiteProfile prof = new StaffSiteProfile("2983"); //TEST testing.login
	String campusOnly = preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "OCCASIONSCAMPUSONLY")!=null?preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "OCCASIONSCAMPUSONLY"):"true";
	String homePageArticlesToDisplay = preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "HOMEPAGEARTICLESTODISPLAY")!=null?preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "HOMEPAGEARTICLESTODISPLAY"):"3";
	String region = "";
	String accountNo = prof.getAccountNo();
	String loggedIn = prof.getStaffSiteProfileID();
	session.setAttribute("loggedIn", prof.getStaffSiteProfileID());
	session.setAttribute("profile", ObjectHashUtil.obj2hash(prof));
	session.setAttribute("userName", prof.getUserName());
	session.setAttribute("accountNo", prof.getAccountNo());
	session.setAttribute("isHR", "false");
	session.setAttribute("zipCode",  preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "ZIPCODE")!=null?preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "ZIPCODE"):"NO");
	session.setAttribute("boxStyle",  preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "BOXSTYLE")!=null?preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "BOXSTYLE"):"rounded");
	session.setAttribute("homePageArticlesToDisplay",  preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "HOMEPAGEARTICLESTODISPLAY")!=null?preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "HOMEPAGEARTICLESTODISPLAY"):"3");
	session.setAttribute("campusOnly",  preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "OCCASIONSCAMPUSONLY")!=null?preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "OCCASIONSCAMPUSONLY"):"true");
	session.setAttribute("weatherType",  preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "WEATHERTYPE")!=null?preferences.getPreferenceValue(prof.getStaffSiteProfileID(), "WEATHERTYPE"):"today");
%>
<%
	Hashtable profile = ObjectHashUtil.obj2hash(prof);
		String profileId = "";
	if (profile!=null){
		profileId = (String)profile.get("StaffSiteProfileId");
	}
	java.util.GregorianCalendar today = new java.util.GregorianCalendar();
%>
<%@ include file="/headers/javascript.jspf"%>
<%@ include file="/style.jspf"%>
<STYLE>
SPAN {cursor: hand ; }
.onme1 {color: #D5DAEA ; }
.offme{color: #7788BB ; }
</STYLE> 
<%@ include file="/headers/box.jspf"%>

<body BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#336699" VLINK="#336699" leftmargin='0' topmargin='0' marginwidth='0' marginheight='0' ONLOAD="header_init();">
<%@ include file="/headers/overlib.jspf"%>
<CENTER>
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0><!-- Whole Page table -->
	<TR>
		<TD>
		<!-- Header begin -->
<SCRIPT LANGUAGE="JavaScript">
<!--
var preloadFlag = false;
function preloadImages() {
	if (document.images) {
		header_05_header_08_over = newImage("/images/header_05-header_08_over.gif");
		header_05_header_09_over = newImage("/images/header_05-header_09_over.gif");
		header_05_header_10_over = newImage("/images/header_05-header_10_over.gif");
		header_05_header_11_over = newImage("/images/header_05-header_11_over.gif");
		header_05_header_12_over = newImage("/images/header_05-header_12_over.gif");
		header_08_over = newImage("/images/header_08-over.gif");
		header_09_over = newImage("/images/header_09-over.gif");
		header_10_over = newImage("/images/header_10-over.gif");
		header_11_over = newImage("/images/header_11-over.gif");
		header_12_over = newImage("/images/header_12-over.gif");
		preloadFlag = true;
	}
}
// -->
</SCRIPT>
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD ROWSPAN=3><IMG SRC="/images/header_01.gif" WIDTH=51 HEIGHT=77></TD>
		<TD ROWSPAN=2><IMG SRC="/images/header_02.gif" WIDTH=102 HEIGHT=56></TD>
		<TD ROWSPAN=2 VALIGN="TOP" ALIGN="LEFT">
		<!-- White space for text -->
		<%=fontB1%><BR></FONT>
		<%=fontB%><b>Welcome,&nbsp;<%=profile.get("FirstName")%>&nbsp;<%=profile.get("LastName")%>!</b>
		<BR><%=fontB1%>
<%
		java.text.SimpleDateFormat headerFormatter = new java.text.SimpleDateFormat ("EEEE, MMMM d, yyyy");
		out.println("&lt;" + headerFormatter.format(today.getTime()) + "&gt;");
%>
		</FONT></FONT>
		</TD>
		<TD COLSPAN=6 ALIGN=RIGHT>
		<!-- other link text -->
		<%=fontB1%>
		| <A HREF="/sitemap.jsp"><%=fontB1%>site map</FONT></A>
		| <a href="JavaScript: popupWindow('http://wiki.uscm.org/display/CMIT/Home', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><%=fontB1%>help</FONT></a>
		| <A HREF="/logout.jsp"><%=fontB1%>logoff</FONT></A>
		|&nbsp;&nbsp;&nbsp;&nbsp;
		</FONT>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN=6><IMG NAME="header_05" SRC="/images/header_05.gif" WIDTH=298 HEIGHT=35></TD>
	</TR>
	<TR>
		<TD><IMG SRC="/images/header_06.gif" WIDTH=102 HEIGHT=21></TD>
		<TD><IMG SRC="/images/header_07.gif" WIDTH=309 HEIGHT=21></TD>
		<TD><A HREF="/servlet/StaffController?action=showHome"
				ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_08_over.gif', 'header_08', '/images/header_08-over.gif'); return true;"
				ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_08', '/images/header_08.gif'); return true;">
				<IMG NAME="header_08" SRC="<% if(curr_tab == 1){%>/images/header_08-over.gif<%} else {%>/images/header_08.gif <%}%>" WIDTH=53 HEIGHT=21 BORDER=0></A></TD>
		<TD><A HREF="/servlet/StaffController?action=showMPD"
				ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_09_over.gif', 'header_09', '/images/header_09-over.gif'); return true;"
				ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_09', '/images/header_09.gif'); return true;">
				<IMG NAME="header_09" SRC="<% if(curr_tab == 2){%>/images/header_09-over.gif<%} else {%>/images/header_09.gif <%}%>" WIDTH=45 HEIGHT=21 BORDER=0></A></TD>
		<TD><A HREF="/servlet/StaffController?action=showTools"
				ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_10_over.gif', 'header_10', '/images/header_10-over.gif'); return true;"
				ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_10', '/images/header_10.gif'); return true;">
				<IMG NAME="header_10" SRC="<% if(curr_tab == 3){%>/images/header_10-over.gif<%} else {%>/images/header_10.gif <%}%>" WIDTH=51 HEIGHT=21 BORDER=0></A></TD>
		<TD><A HREF="/servlet/CmsController"
				ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_11_over.gif', 'header_11', '/images/header_11-over.gif'); return true;"
				ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_11', '/images/header_11.gif'); return true;">
				<IMG NAME="header_11" SRC="<% if(curr_tab == 4){%>/images/header_11-over.gif<%} else {%>/images/header_11.gif <%}%>" WIDTH=85 HEIGHT=21 BORDER=0></A></TD>
		<TD><A HREF="/links.jsp"
				ONMOUSEOVER="changeImages('header_05', '/images/header_05-header_12_over.gif', 'header_12', '/images/header_12-over.gif'); return true;"
				ONMOUSEOUT="changeImages('header_05', '/images/header_05.gif', 'header_12', '/images/header_12.gif'); return true;">
				<IMG NAME="header_12" SRC="<% if(curr_tab == 5){%>/images/header_12-over.gif<%} else {%>/images/header_12.gif <%}%>" WIDTH=53 HEIGHT=21 BORDER=0></A></TD>
		<TD><IMG SRC="/images/header_13.gif" WIDTH=11 HEIGHT=21></TD>
	</TR>
</TABLE>
		<P>
		<!-- Header end -->
		</TD>
	</TR>
	<TR>
		 <TD BGCOLOR="#FFFFFF" ALIGN="LEFT" CELLSPACING="0">
		 <!--Start all table-->
<% region = (String)profile.get("region"); %>
<% try { %>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" <%=bgcolorW%>>
	<tr valign=top>
		<td width="140">
			
			<% box.setStyle(boxStyle);	//will set it for all the following boxes until we call it again%>
			<% box.setColor(color3);%>
			<% box.setBodyColor(color3);%>
			<%// if (isStudent.equals("false")) { %>
				<% box.setTitle("Check Email");	%>
				<%=box.printTop()%>
				<center>
				<a href="JavaScript: popupWindow('/servlet/StaffController?action=loginEmail', 'LoginEmail', 'dependent=no,scrollbars=yes,resizable')" onMouseOver="window.status='Show my uscm email'; return true;" onMouseOut="window.status=''; return true;">my uscm mailbox</A></font></center>
				<%=box.printBottom()%>
				<br>
			<%// } %>			
			<!-- This section is for Summer Project and STINT/Internship Reference links -->
			<%// if (isStudent.equals("false")) { %>
				<% box.setTitle("My References");%>
				<%=box.printTop()%>
				<center>
				<% references.initReferences(accountNo); %>
				<%=references.print() %>
				<!-- End section is for Summer Project and STINT/Internship Reference links -->
				</center>
				<%=box.printBottom()%>
				<br>
			<%// } %>			
			<%// if (isStudent.equals("false")) { %>
				<% box.setTitle("Important");	%>
				<%=box.printTop()%>
				<center>
			
				<!-- This link goes in each year in Feb. for 2 weeks <%=fontR%><b>New!</b><BR></font><%=fontB%><a href="http://staff2.uscm.org/survey"><b>Staff Survey 2003</b></A></font><br><%=fontS%>(Give us your opinion<BR>by March 5)</font><br><br>  -->
			
				<a href="/servlet/HRUpdateController">Change my Personal or Job Information</A></font></center>
				<%=box.printBottom()%>
				<br>
			<%// } %>			
			<% box.setTitle("Staff Birthdays");	%>
			<%=box.printTop()%>
			<% birthdays.initBirthdays(getServletContext().getRealPath("/")); %>
			<% birthdays.setJustCampus(campusOnly);%>
			<%=birthdays.print()%>
			<%=box.printBottom()%>
			<br>
			<% box.setTitle("Wedding Anniv.");	%>
			<%=box.printTop()%>
			<% weddings.initWeddings(getServletContext().getRealPath("/")); %>
			<% weddings.setJustCampus(campusOnly);%>
			<%=weddings.print()%>
			<%=box.printBottom()%>
			<br>
				<% box.setTitle("Search the InfoBase");%>
				<%=box.printTop()%>
				<FORM name="ibsearch" ACTION="JavaScript:ibsearch();">
					<img src="/images/blank.gif" width="15" height="1"><input type=radio name="search" checked> Staff (last name)<br>
					<img src="/images/blank.gif" width="15" height="1"><input type=radio name="search"> Campus<br>
					<!--<img src="/images/blank.gif" width="15" height="1"><INPUT TYPE=radio name="search"> Team<br>-->
					<center>
					<INPUT TYPE=text size=15 maxlength=255 ALIGN='CENTER' NAME="query" value='<%=profile.get("LastName")%>'><br>

					<A HREF="JavaScript: document.ibsearch.submit()" onMouseOver="document.ibsearchbutton.src='/images/search_bon.gif';" onMouseOut="document.ibsearchbutton.src='/images/search_boff.gif';"><IMG NAME="ibsearchbutton" SRC="/images/search_boff.gif" BORDER="0" ALIGN="TOP"></A>
					<br>
					<img src="/images/blank.gif" width="1" height="15" valign="bottom">
					<a href="/servlet/InfoBaseController">[InfoBase]</a>
					</center>
				<%=box.printBottom()%>
				</form>

				<script>
				function ibsearch() {
					if (document.ibsearch.search[0].checked) {
						document.ibstaff.searchtext.value = document.ibsearch.query.value;
						document.ibstaff.submit();
					}
					if (document.ibsearch.search[1].checked) {
						document.ibcampus.searchstring.value = document.ibsearch.query.value;
						document.ibcampus.submit();
					}
				}
				</script>

				<form name="ibstaff" action="/servlet/InfoBaseController" method="post">
				<input type=HIDDEN name="action" value="listStaff">
				<INPUT TYPE=HIDDEN name="searchby" value="lastname">
				<INPUT TYPE=HIDDEN name="mode" value="list">
				<input type=hidden name="searchtext">
				</form>

				<FORM NAME="ibcampus" ACTION="/servlet/InfoBaseController" METHOD="POST">
				<input type=hidden name="action" value="detailedListCampus">
				<input type=hidden name="searchby" value="name">
				<INPUT TYPE="hidden" name="view" value="campusList">
				<input type="hidden" name="searchstring">
				</FORM>
			<!-- end infobase search module -->

			<!-- start generic search module -->
				<% box.setTitle("Search");%>
				<%=box.printTop()%>
				<FORM name="miscsearch" action="JavaScript:miscsearch();">
					<input type=radio name="search" checked> Internet
					<input type=radio name="search"> <a href="http://bible.gospelcom.net/cgi-bin/bible?language=english" target="_blank">Bible</a><br>
					<center>
					<INPUT TYPE=text size=15 maxlength=255 ALIGN="CENTER" NAME="query"><br>
					<A HREF="JavaScript: document.miscsearch.submit()" onMouseOver="document.miscsearchbutton.src='/images/search_bon.gif';" onMouseOut="document.miscsearchbutton.src='/images/search_boff.gif';"><IMG NAME="miscsearchbutton" SRC="/images/search_boff.gif" BORDER="0" ALIGN="TOP"></A>
					</center>
				<%=box.printBottom()%>
				</form>

				<script>
					function miscsearch() {
						if (document.miscsearch.search[0].checked) {
							document.google.q.value = document.miscsearch.query.value;
							document.google.submit();
						}	
						if (document.miscsearch.search[1].checked) {
							document.gospelcom.search.value = document.miscsearch.query.value;
							document.gospelcom.submit();
						}
					}
				</script>

				<form NAME="gospelcom" ACTION="http://bible.gospelcom.net/cgi-bin/bible" Target="_blank" METHOD="POST">
				<input type="hidden" name="version" value="NASB">
				<input type="hidden" NAME="search">
				<input type="hidden" name="maxmatches" value="10">
				</form>

				<FORM name="google" action="http://www.google.com/custom" TARGET="_blank" method=GET>
				<INPUT TYPE=hidden name=q>
				<INPUT type=hidden name=cof VALUE="T:<%=color1%>;GFNT:<%=color2%>;AH:left;L:http://teststaff.uscm.org/images/CMlogobig.gif;LH:141;LW:75;AWFID:863b3dadb1d27dcd;">
				<!--GIMP:importanttextcolor;T:txtcolor;BIMG:bgrnd url;ALC:alink;L:http://mylogo;LH:50%;LW:50%;GFNT:faint text;LC:lnkcolor;BGC:bgcolor;AH:left;VLC:vlink;GALT:alt text;AWFID:863b3dadb1d27dcd;-->
				</FORM>
			<!-- end generic search module -->

		</td>
		<td width="2%"></td>

		<% box.setStyle("neoclassic");%>

		<td valign="top"  width="540">
		<p>&nbsp;<br>

			<%	//REGIONAL ARTICLES INSERTED HERE
				//regionalarticles.setRegion(region);
				//regionalarticles.setNumOfArticles("3"); %>
				<%//=regionalarticles.print()%>
			</font>
			<%	//COMMUNICATIONS LX ARTICLES INSERTED HERE
				articles.setCategoryId("10");
				articles.setNumOfArticles(homePageArticlesToDisplay); %>
				<%=articles.print()%>
			</font>


			<%--<b><i><FONT FACE="Arial" SIZE="3" COLOR="#336699">Other News...</a></font></b></i><br>&nbsp;<br>--%>
			<%--<%=newsfeed.print()%>--%>
			<%--
			String url = "http://p.moreover.com/cgi-local/page?c=Religion%20news&o=xml";

			Source xsl = new StreamSource(this.getServletConfig().getServletContext().getRealPath("/newsfeed.xsl"));
			Source xml = new StreamSource(url);

			System.setProperty("javax.xml.transform.TransformerFactory", "com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl");  //Needed for JDK 1.5.0
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(xsl);
			transformer.transform(xml, new StreamResult(out));
			--%>

		</td>

		<% box.setStyle(boxStyle); box.setScreenAlign("right");%>

		<td width="2%"></td>

		<td valign='top' width=140>

			<!-- start 'Quicklinks' module -->
			<% box.setTitle("I want to...");%>
			<%=box.printTop()%>
			<%=fontS%>
			<a href='/servlet/InfoBaseController?action=showSuccessCriteriaHome'><img src="/images/small_chart.gif" border='0'>&nbsp;Go&nbsp;to&nbsp;Success&nbsp;Criteria</a><br>
			<a href='/servlet/Review360Controller'><img src="/images/small_360.gif" border='0'>&nbsp;Work&nbsp;on&nbsp;a&nbsp;360&nbsp;review</a><br>
			<%// if (isStudent.equals("false")) { %>
				<a href='/servlet/StaffController?action=loginPS&section=PFormFrame' target='_blank'><img src="/images/small_note.gif" border='0'>&nbsp;Get&nbsp;forms</a><br>
				<a href='/servlet/StaffController?action=loginPS&section=servlet/SaiServlet' target='_blank'><img src="/images/small_dollar.gif" border='0'>&nbsp;See&nbsp;my&nbsp;staff&nbsp;account</a><br>
				<a href='/servlet/CmsController'><img src="/images/small_disk.gif" border='0'>&nbsp;Find/submit&nbsp;a&nbsp;resource</a><br>
				<a href='http://www.lxonline.org' target="_blank"><img src="/images/small_lx.gif" border='0'>&nbsp;Read&nbsp;LX</a><br>
				<A HREF="/servlet/StaffController?action=loginPS&section=servlet/ReimbServlet" target="_blank"><img src="/images/small_dollar.gif" border='0'>&nbsp;Reimburse&nbsp;Expenses</A><BR>
				<a href="JavaScript: popupWindow('http://wiki.uscm.org/display/CMIT/Home', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><img src="/images/small_question.gif" border='0'>&nbsp;Get&nbsp;Help</a><br>
				<a href='/servlet/StaffController?action=loginStaffWeb' target='_blank'><img src="/images/small_chart.gif" border='0'>&nbsp;Go&nbsp;to&nbsp;StaffWeb</a><br>
				<a href="http://www.CampusStories.org" target='_blank'><img src="/images/lightbulb.gif" border='0'>&nbsp;Find&nbsp;a&nbsp;Ministry&nbsp;Story</a><br>
				<a href="http://myexpense.captura.net/?legalentity=ccci_wsl" target='_blank'><img src="/images/mastercard.gif" border='0'>&nbsp;Log&nbsp;on&nbsp;to&nbsp;OneCard</a><br>
			<%// } %>			
			</font>
			<%=box.printBottom()%>
			<br>

			<!-- start infobase search module -->
			<% box.setTitle("Bookmarks");%>
			<%=box.printTop()%>
				<%=fontB%><B>Success Criteria</B><br></font><%=fontB1%>

				<% String profileID = loggedIn; %>
				<% Iterator prefs;

				%>
				<%
					Bookmarks bookmarks = new Bookmarks();
					StaffSitePref pref = null;
					prefs = bookmarks.getBookmarkValues(profileID, Bookmarks.STATISTIC).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (StaffSitePref)prefs.next();
							%>
								<a href="/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid=<%=pref.getValue()%>"><%=pref.getDisplayName()%></a><BR>
							<%
						}
					}
					%>
				<%=hr%>
				</font><%=fontB%><B>Campus</B><br></font><%=fontB1%>
				<% prefs = bookmarks.getBookmarkValues(profileID, Bookmarks.TARGET_AREA).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (StaffSitePref)prefs.next();
							%>
								<a href="/servlet/InfoBaseController?action=showTargetArea&targetareaid=<%=pref.getValue()%>"><%=pref.getDisplayName()%></a><BR>
							<%
						}
					}
					%>
				<%=hr%>
				</font><%=fontB%><B>Team</B><br></font><%=fontB1%>
				<% prefs = bookmarks.getBookmarkValues(profileID, Bookmarks.LOCAL_LEVEL).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (StaffSitePref)prefs.next();
							%>
								<a href="/servlet/InfoBaseController?action=showTeam&locallevelid=<%=pref.getValue()%>"><%=pref.getDisplayName()%></a><BR>
							<%
						}
					}
					%>
			<%=box.printBottom()%>
			<p>
			<% box.setTitle("Customize");%>
			<%=box.print("<a href='/servlet/StaffController?action=showCustomize'>Customize</a> my homepage")%>
		</td>

	</tr>
</TABLE>
<br>
<% } catch (Exception e) { e.printStackTrace(); }%>
		</TD><!--Closing global table-->
	</TR>
</TABLE>
  <center>
  <table width="755" border="0">
	<tr>
		<td width="180"></td>

		<td align="center">
		  <!-- <a href="/general/feedback.jsp"><img src="/images/info.gif" border="0" align="center" alt="Info" WIDTH="42" HEIGHT="41"></a> -->
		  <font size="2"><i>© 2002 Campus Crusade for Christ International<br>
		  <font size="2"><i><a href="/general/feedback.jsp">Send us feedback.</a></i><br>
		</td>
	</tr>
  </table>
  </center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>

</HTML>