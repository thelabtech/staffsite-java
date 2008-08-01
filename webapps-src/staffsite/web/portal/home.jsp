<%@ page import="org.alt60m.servlet.*" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,javax.mail.*,javax.mail.internet.*,javax.activation.*, javax.xml.transform.stream.*, javax.xml.transform.*, java.net.*" %>
<%@ page import="org.alt60m.staffSite.bean.dbio.*,org.alt60m.staffSite.model.dbio.StaffSitePref" %>
<% int curr_tab = 1; 
ActionResults ar; 
ar = ActionResults.getActionResults(session);
%>
<%@ include file="/header.jspf" %>
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

<script type="text/javascript" language="javascript">
function toggleDiv(who){
	var el=document.getElementById(who);
	if((el.style.height=='auto')||(el.style.height=='')){
		el.style.height='16px';
		el.style.overflow='hidden';
		}
		else
		{
		el.style.height='auto';
		el.style.overflow='visible';
		}
}
</script>
<TITLE>Campus Staff Site</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</style>
	
<STYLE TYPE="text/css">
	.fakeLink A:visited
		{
		color:<%=color1%>;
		
		}
	.fakeLink A:hover
		{
		color:<%=color1%>;
		
		}
	.fakeLink A:link
		{
		color:<%=color1%>;
		
		}
	#wayforward{
		width:140px;
		margin-bottom:25px;
		border: solid #0071ce 1px;
	}
	#wayforward h1{
	width:140px;
	height:38px;
	padding:0px;
	margin:0px;
	background:#fff url(https://staff.campuscrusadeforchrist.com/cms/content/5833.jpg) top left no-repeat;
	}
	#wayforward li{
	padding:0px;
	margin:0px;
	list-style:none;
	font-size:10px;
	font-family:verdana,arial,sans-serif;
	padding-bottom:10px;
	}
	#podcasts{
	padding:5px;
	margin:0px;
	}
</STYLE>	

</HEAD>

<% String pageTitle = "&nbsp;";
	String pileUpSuccessCriteriaIds = "";
	int numSCI = 0;
	String campusOnly = "";
//	String homePageArticlesToDisplay = "";
	String region = "";
//	String regionalNews = "";
	campusOnly = (String)session.getValue("campusOnly");
//	homePageArticlesToDisplay = (String)session.getValue("homePageArticlesToDisplay");
//	regionalNews = (String)session.getValue("regionalNews");
%>

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
		<!--	<%// if (isStudent.equals("false")) { %>
				<% box.setTitle("2008 SLICE Survey");	%>
				<%=box.printTop()%>
				<center>
					<%=fontB%><a href="http://www.surveymonkey.com/s.aspx?sm=MYaVmsl4muKH2RtEIsrRLg_3d_3d"><b>Take the 2008 SLICE survey</b></A></font><br><%=fontS%><%=box.printBottom()%>
				<br>
			<%// } %> -->
			<%// if (isStudent.equals("false")) { %>
			<% box.setTitle("My Missional Teams");	%>
				<%=box.printTop()%>
				
				<%Hashtable<String,String> thisTeam=new Hashtable<String,String>();
				String personID=ar.getValue("personID");
				Vector<Hashtable<String, String>> teams=org.alt60m.ministry.servlet.InfoBaseTool.listTeamsForPerson(personID);
				Iterator teamsIter=teams.iterator();
				int firsty=0;
				while(teamsIter.hasNext()){%>
				
				<%thisTeam=(Hashtable<String,String>)teamsIter.next();%>
				<A style="border:none;"
					HREF="/servlet/InfoBaseController?action=removeTeamMember&personID=<%= personID %>&locallevelid=<%= thisTeam.get("teamID") %>&teamID=<%= thisTeam.get("teamID") %>&view=home">
				<img alt="Remove" style="border:none;height:10px;width:10px;" src="/infobase/images/reddot.gif"></A>
				
				<A href="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisTeam.get("teamID") %>"><%= fontS %><%= thisTeam.get("name") %></A>
				
				<br><%
				firsty++;
				}%><%=box.printBottom()%>
				<br>
				<% box.setTitle("Important");	%>
				<%=box.printTop()%>
				<center>
				<!-- This link goes in each year in Feb. for 2 weeks
				<%=fontR%><b>New!</b><BR></font><%=fontB%><a href="http://staff.uscm.org/survey"><b>Take te SLICE survey</b></A></font><br><%=fontS%><br><br>
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
					<img src="/images/blank.gif" width="15" height="1"><input type=radio name="search"> Ministry Location<br>
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
				<input type=HIDDEN name="action" value="listPerson">
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
			<a href='http://wiki.uscm.org/'><img src="/images/wiki_icon.png" border='0' style="margin-right:5px;">Go to the Wiki</a><br>
				<a href="https://staff2.ccci.org/ss/concurSamlAdapter" target='_blank'><img src="/images/logo_onecard.gif" border='0' style="margin-right:5px;">Log on to OneCard</a><br>
			<a href='/servlet/InfoBaseController?action=showSuccessCriteriaHome'><img src="/images/small_check.gif" border='0' style="margin-right:5px;">Go to Success Criteria</a><br>
			<a href='/servlet/Review360Controller'><img src="/images/small_360.gif" border='0' style="margin-right:5px;">Work on a 360 review</a><br>
			<%// if (isStudent.equals("false")) { %>
				<a href='https://staff2.ccci.org/ss/pages/PFormFrame.html' target='_blank'><img src="/images/small_note.gif" border='0' style="margin-right:5px;">Get forms</a><br>
				<a href='https://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/SaiServlet' target='_blank'><img src="/images/small_dollar.gif" border='0' style="margin-right:5px;">See my staff account</a><br>
				<A href='http://staff2.ccci.org/ss/pages/EFormFrame.html?MainFrame=../servlet/ReimbServlet' target="_blank"><img src="/images/small_dollar.gif" border='0' style="margin-right:5px;">Reimburse Expenses</A><BR>
				<a href="JavaScript: popupWindow('/help/help_home.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')"><img src="/images/small_question.gif" border='0' style="margin-right:5px;">Get Help</a><br>
				<a href='http://staffweb.ccci.org' target='_blank'><img src="/images/staffweb_icon.gif" border='0' style="margin-right:5px;">Go to StaffWeb</a><br>
				<a href="http://staffweb.ccci.org/legal/index.aspx" targe="_blank"><img src="/images/staffweb_icon.gif" border='0' style="margin-right:5px;">Legal Rights on Campus</a><br>
				<a href='/servlet/CmsController'><img src="/images/small_disk.gif" border='0' style="margin-right:5px;">Resource Center</a><br>
				<a href="https://staff2.ccci.org/fs/NatlPrograms/National%20Programs.htm" target='_blank'><img src="/images/national_discounts.gif" border='0' style="margin-right:5px;">See National Discount Programs</a><br>
			<%// } %>
			</font>
			<%=box.printBottom()%>
			<br>
				<div id="wayforward">
					<h1></h1>
					<ul id="podcasts">
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode11.htm">Episode 11: Putting It All Together (5:39)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode10.htm">Episode 10: Christ-like Leadership (3:06)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode9.htm">Episode 9: The Call - 100 ESM Staff (3:25)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode8.htm">Episode 8: Missional Teams (3:09)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode7.htm">Episode 7: Mobilizing Christ-centered Laborers (3:39)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode6.htm">Episode 6: Gospel Experiences (2:29)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode5.htm">Episode 5: Changed Lives (3:35)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode4.htm">Episode 4: Chain of Missional Objectives (3:12)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode3.htm">Episode 3: Our Value of Growth (5:58)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode2.htm">Episode 2: Our Core DNA (5:02)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode1.htm">Episode 1: What Isn&rsquo;t Changing (5:26)</a></li>
						<li><a href="http://campuscrusadeforchrist.com/wayforward/episode0.htm">Episode 0: Mark&rsquo;s Outtakes (1:23)</a></li>
					</ul>
				</div>
			<!-- start 'SLICE' module -->
			<!-- <% box.setTitle("SLICE Survey 2007");%>
			<%=box.printTop()%>
			<%=fontS%>
				<a href='https://staff.campuscrusadeforchrist.com/cms/content/5649.html'>See national results</a><br>	
			</font>
			<%=box.printBottom()%>
			<br>-->
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

				<% String profileID = (String)session.getValue("loggedIn"); 
					String sCBookMarks="";
				%>
				<% Iterator prefs;%>
				<%
					Bookmarks bookmarks = new Bookmarks();
					StaffSitePref pref = null;
					prefs = bookmarks.getBookmarkValues(profileID, Bookmarks.STATISTIC).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (StaffSitePref)prefs.next();
							
							pileUpSuccessCriteriaIds += "&activities["+pref.getValue()+"]="+pref.getDisplayName();
							numSCI++;
							
								sCBookMarks+="<a href=\"/servlet/InfoBaseController?action=enterSuccessCriteriaForActivity&activityid="+pref.getValue()+"\">"+pref.getDisplayName()+"</a><BR>";
							
						}
					}
					if(!(pileUpSuccessCriteriaIds==""))
						{
						%>
						<br>
						<span style="text-decoration:none;font-size:12px;color:yellow;font-weight:bold;">New!  &nbsp;</span>
						<a style="font-size:12px;" href="/servlet/InfoBaseController?action=enterFastSuccessCriteriaForActivity<%=pileUpSuccessCriteriaIds%>">
						<b>Enter Stats  </b>
						</a><BR>
						<div  class="fakeLink" id="resizingBookMarkSC" style="height:auto;overflow:hidden;margin-top:10px;"  >
					

						<a style="text-decoration:none;display:none;" id="statsToggle" href="javascript:toggleDiv('resizingBookMarkSC');" >
						<i>Individual Movements </i><span style="font-size:12px;">&darr;</span>
						</a><br>
						<%	
						out.print(sCBookMarks);
						%>
						
						</div>
						<script type="text/javascript" language="javascript">
						document.getElementById('resizingBookMarkSC').style.height='16px';
						document.getElementById('resizingBookMarkSC').style.overflow='hidden';
						document.getElementById('statsToggle').style.display='inline';
						
						</script>
						<%
						}
					
					%>
				<%=hr%>
				</font><%=fontB%><B>Ministry Location</B><br></font><%=fontB1%>
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
				</font><%=fontB%><B>Missional Team</B><br></font><%=fontB1%>
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