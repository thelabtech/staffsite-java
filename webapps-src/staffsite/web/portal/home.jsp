<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,javax.mail.*,javax.mail.internet.*,javax.activation.*, javax.xml.transform.stream.*, javax.xml.transform.*, java.net.*" %>
<%@ page import="org.alt60m.staffSite.bean.dbio.*,org.alt60m.staffSite.model.dbio.StaffSitePref" %>
<jsp:useBean id="internetsearch" class="org.alt60m.html.InternetSearch" />
<jsp:useBean id="biblesearch" class="org.alt60m.html.BibleSearch" />
<jsp:useBean id="birthdays" class="org.alt60m.html.Birthdays" />
<jsp:useBean id="weddings" class="org.alt60m.html.Weddings" />
<jsp:useBean id="staffSearch" class="org.alt60m.html.InfoBaseLookup" />
<jsp:useBean id="articles" class="org.alt60m.html.HomePageArticles" />

<jsp:useBean id="newsfeed" class="org.alt60m.html.NewsFeed" /><jsp:useBean id="regionalarticles" class="org.alt60m.html.HomePageArticles" />
<jsp:useBean id="references" class="org.alt60m.html.dbio.References" />

<HTML>
<HEAD>
<TITLE>Campus Staff Site</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
</HEAD>
<% int curr_tab = 1; %>
<% String pageTitle = "&nbsp;";
	String campusOnly = "";
//	String homePageArticlesToDisplay = "";
	String region = "";
//	String regionalNews = "";
	campusOnly = (String)session.getValue("campusOnly");
//	homePageArticlesToDisplay = (String)session.getValue("homePageArticlesToDisplay");
//	regionalNews = (String)session.getValue("regionalNews");
%>
   	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
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
<%@ include file="/header.jspf" %>
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
<!--				<a href="JavaScript: popupWindow('http://mymail.ccci.org', 'LoginEmail', 'dependent=no,scrollbars=yes,resizable')" onMouseOver="window.status='Show my uscm email'; return true;" onMouseOut="window.status=''; return true;"><br>Upgraded USCM Mailbox<br><br></A>-->
				<a href="JavaScript: popupWindow('http://mymail.uscm.org', 'LoginEmail', 'dependent=no,scrollbars=yes,resizable')" onMouseOver="window.status='Show my uscm email'; return true;" onMouseOut="window.status=''; return true;">My USCM Mailbox<br>(use Outlook password)<br><br></A>
<!--				<a href="JavaScript: popupWindow('/help/help_mailbox.jsp', 'MailboxLogin', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">&nbsp;&nbsp;Which link (above) should I use?</a><br></font></center>-->
				<%=box.printBottom()%>
				<br>
			<%// } %>

			<!-- <% box.setTitle("The SLICE");	%>
			<%=box.printTop()%>
			<center>
			<a TARGET="_blank" href="http://CTLSilhouette.wsu.edu/surveys/ZS31670" onMouseOver="window.status='Complete The SLICE - Part I'; return true;" onMouseOut="window.status=''; return true;">The SLICE - Part I<br><br></A>
			<a TARGET="_blank" href="http://www.surveymonkey.com/s.asp?u=74436876183" onMouseOver="window.status='Complete The SLICE - Part II'; return true;" onMouseOut="window.status=''; return true;">The SLICE - Part II<br><br></A>
			<%=box.printBottom()%>
			<br> -->

			<!-- This section is for Summer Project and STINT/Internship Reference links -->
			<%// if (isStudent.equals("false")) { %>
				<% box.setTitle("My References");%>
				<%=box.printTop()%>
				<center>
				<% references.initReferences((String)session.getValue("accountNo")); %>
				<%=references.print() %>
				<!-- End section for Summer Project and STINT/Internship Reference links -->
				</center>
				<%=box.printBottom()%>
				<br>
			<%// } %>
			<%// if (isStudent.equals("false")) { %>
				<% box.setTitle("Important");	%>
				<%=box.printTop()%>
				<center>

				<!-- This link goes in each year in Feb. for 2 weeks
				<%=fontR%><b>New!</b><BR></font><%=fontB%><a href="http://staff.uscm.org/survey"><b>Staff Survey 2004</b></A></font><br><%=fontS%><br><br>
			    -->
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
			<!-- end infobase search module -->
				<% box.setTitle("Search the InfoBase");%>
				<%=box.printTop()%>
				<FORM name="ibsearch" ACTION="JavaScript:ibsearch();">
					<img src="/images/blank.gif" width="15" height="1"><input type=radio name="search" checked> Staff (last name)<br>
					<img src="/images/blank.gif" width="15" height="1"><input type=radio name="search"> Campus<br>
					<!--<img src="/images/blank.gif" width="15" height="1"><INPUT TYPE=radio name="search"> Team<br>-->
					<center>
					<INPUT TYPE=text size=15 maxlength=255 ALIGN='CENTER' NAME="query" value='<%=profile.get("LastName")%>'><br>

					<A HREF="JavaScript: ibsearch();" onMouseOver="document.ibsearchbutton.src='/images/search_bon.gif';" onMouseOut="document.ibsearchbutton.src='/images/search_boff.gif';"><IMG NAME="ibsearchbutton" SRC="/images/search_boff.gif" BORDER="0" ALIGN="TOP"></A>
					<br>
					<img src="/images/blank.gif" width="1" height="15" valign="bottom">
					<a href="/servlet/InfoBaseController">[InfoBase]</a>
					</center>
				<%=box.printBottom()%>
				</form>


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
				regionalarticles.setRegion(region);
				regionalarticles.setNumOfArticles("3"); %>
				<%=regionalarticles.print()%>
			</font>
			<%	//COMMUNICATIONS LX ARTICLES INSERTED HERE
				articles.setCategoryId("10");
				articles.setNumOfArticles("5");%>
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
			<a href='/servlet/InfoBaseController?action=showSuccessCriteriaHome'><img src="/images/small_check.gif" border='0'>Go to Success Criteria</a><br>
			<a href='/servlet/Review360Controller'><img src="/images/small_360.gif" border='0'>Work on a 360 review</a><br>
			<%// if (isStudent.equals("false")) { %>
				<a href='https://staff2.ccci.org/ss/pages/PFormFrame.html' target='_blank'><img src="/images/small_note.gif" border='0'>Get forms</a><br>
				<a href='https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/SaiServlet' target='_blank'><img src="/images/small_dollar.gif" border='0'>See my staff account</a><br>
				<a href='/servlet/CmsController'><img src="/images/small_disk.gif" border='0'>Find/submit a resource</a><br>
				<A href='http://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/ReimbServlet' target="_blank"><img src="/images/small_dollar.gif" border='0'>Reimburse Expenses</A><BR>
				<a href="JavaScript: popupWindow('/help/help_home.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><img src="/images/small_question.gif" border='0'>Get Help</a><br>
				<a href='http://staffweb.ccci.org' target='_blank'><img src="/images/staffweb_icon.gif" border='0'>Go to StaffWeb</a><br>
				<a href="https://staff2.ccci.org/ss/concurSamlAdapter" target='_blank'><img src="/images/logo_onecard.gif" border='0'>Log on to OneCard</a><br>
				<a href="https://staff2.ccci.org/fs/NatlPrograms/National%20Programs.htm" target='_blank'><img src="/images/national_discounts.gif" border='0'>See National Discount Programs</a><br>
			<%// } %>
			</font>
			<%=box.printBottom()%>
			<br>

			<!-- start 'SLICE' module -->
			<% box.setTitle("SLICE Survey 2007");%>
			<%=box.printTop()%>
			<%=fontS%>
				<a href='https://staff.campuscrusadeforchrist.com/cms/content/5649.html'>See national results</a><br>	
			</font>
			<%=box.printBottom()%>
			<br>
			<!-- *******************************************************-->
			
			<!-- start 'Staff Opportunities' module -->
			<% box.setTitle("Staff Opportunities");%>
			<%=box.printTop()%>
			<%=fontS%>
				<a href='/servlet/CmsController?action=browse&catId=1000155'>See all opportunities</a><br>
			</font>
			<%=box.printBottom()%>
			<br>
			<!-- *******************************************************-->

			<!-- start infobase search module -->
			<% box.setTitle("Bookmarks");%>
			<%=box.printTop()%>
				<%=fontB%><B>Success Criteria</B><br></font><%=fontB1%>

				<% String profileID = (String)session.getValue("loggedIn"); %>
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
<%@ include file="/frontpagefooter.jspf" %>
</HTML>