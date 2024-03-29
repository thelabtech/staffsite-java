<%@ page import="org.alt60m.servlet.*" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,javax.mail.*,javax.mail.internet.*,javax.activation.*, javax.xml.transform.stream.*, javax.xml.transform.*, java.net.*" %>
<%@ page import="org.alt60m.staffSite.bean.dbio.*,org.alt60m.staffSite.model.dbio.InfobaseBookmark,org.alt60m.ministry.model.dbio.*" %>
<% int curr_tab = 1; 
ActionResults ar; 
ar = ActionResults.getActionResults(session);
%>
<%@ include file="/header.jspf" %>
<!-- <jsp:useBean id="internetsearch" class="org.alt60m.html.InternetSearch" />
     <jsp:useBean id="biblesearch" class="org.alt60m.html.BibleSearch" /> -->
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
	a.titleLink
		{
		color: #ffffff;
		text-decoration: none;
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
	<a href="JavaScript: popupWindow('http://mail.ccci.org', 'LoginEmail', 'dependent=no,scrollbars=yes,resizable')" onMouseOver="window.status='Show my uscm email'; return true;" onMouseOut="window.status=''; return true;">My USCM Mailbox<br>(use Outlook password)</A>
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

			<!-- This section is for Summer Project and STINT/Internship Reference links -- which don't work -->
			<%// if (isStudent.equals("false")) { %>
		       	<%// box.setTitle("My References");%>
				<%//=box.printTop()%>
				<%// references.initReferences((String)session.getAttribute("userName")); %>
				<%//=references.print() %>
				<%//=box.printBottom()%>
				<!-- <br> -->
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
				<A href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org"%>/teams/<%= thisTeam.get("teamID") %>"><%= fontS %><%= thisTeam.get("name") %></A><br>
                <%
				firsty++;
				}%>
				
				<a href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org"%>/teams">Join Teams</A>
				
				<%=box.printBottom()%>
				<br>
				<!--<% box.setTitle("Important");	%>
				<%=box.printTop()%>
				<center>
				<!-- This link goes in each year in Feb. for 2 weeks
				<%=fontR%><b>New!</b><BR></font><%=fontB%><a href="http://staff.uscm.org/survey"><b>Take the SLICE survey</b></A></font><br><%=fontS%><br><br>
			    -->				
				<!--<a href="/servlet/HRUpdateController">Change my Personal or Job Information</A></font></center>
				<%=box.printBottom()%>
				<br> -->
			<%// } %>
			<!-- start enter stats module -->
			    <% box.setTitle("Enter Stats"); %>
			    <%=box.printTop() %>
			    <a style="font-size:12px;" href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org" %>/stats">
                   <b>Enter Stats</b>
                </a>
                <%=box.printBottom() %>
                <br/>
			<!-- end infobase search module -->
				<% box.setTitle("Search the InfoBase");%>
				<%=box.printTop()%>
				<FORM name="ibsearch" ACTION="JavaScript:ibsearch();">
					<img src="/images/blank.gif" width="15" height="1"><input type=radio name="search" checked> Location<br>
					<img src="/images/blank.gif" width="15" height="1"><input type=radio name="search" > Person<br>
					<img src="/images/blank.gif" width="15" height="1"><input type=radio name="search"> Team<br>
					<center>
					<INPUT TYPE=text size=15 maxlength=255 ALIGN='CENTER' NAME="name" value=''><br>
					<br>
					<A HREF="JavaScript: ibsearch();" onMouseOver="document.ibsearchbutton.src='/images/search_bon.gif';" onMouseOut="document.ibsearchbutton.src='/images/search_boff.gif';"><IMG NAME="ibsearchbutton" SRC="/images/search_boff.gif" BORDER="0" ALIGN="TOP"></A>
					<br>
					<img src="/images/blank.gif" width="1" height="15" valign="bottom">
					<a href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org"%>">[InfoBase]</a>
					</center>
				<%=box.printBottom()%>
				</form>

				<script>
				function ibsearch() {
					if (document.ibsearch.search[0].checked) {
						document.locsearch.name.value = document.ibsearch.name.value;						
						document.locsearch.submit();
					}
					if (document.ibsearch.search[1].checked) {						
						document.persearch.name.value = document.ibsearch.name.value;						
						document.persearch.submit();
					}
					if (document.ibsearch.search[2].checked) {						
						document.teamsearch.name.value = document.ibsearch.name.value;
						document.teamsearch.submit();
					}
				}
				</script>

				<form action="Home" name="locsearch" method="post">
				<input type="hidden" name="type" value="locations"/>
				<input type="hidden" name="action" value="search"/>
				<input name="name" type="hidden" class="name" value=""/>
				</form>

				<form action="Home" name="persearch" method="post">
				<input type="hidden" name="type" value="people"/>
				<input type="hidden" name="action" value="search"/>
				<input name="name" type="hidden" class="name" value=""/>
				</form>

				<form action="Home" name="teamsearch" method="post">
				<input type="hidden" name="type" value="teams"/>
				<input type="hidden" name="action" value="search"/>
				<input name="name" type="hidden" class="name" value=""/>
				</form>

			<!-- end infobase search module -->
			<% box.setTitle("Staff Birthdays");	%>
			<%=box.printTop()%>
			<% birthdays.initBirthdays(getServletContext().getRealPath("/")); %>
			<% birthdays.setJustCampus(campusOnly);%>
			<%=birthdays.print()%>
			<%=box.printBottom()%>
		</td>
		<td width="25"></td>

		<% box.setStyle("neoclassic");%>

		<td valign="top"  width="540">
		<br>

			<%	//REGIONAL ARTICLES INSERTED HERE
				regionalarticles.setRegion(region);
				regionalarticles.setNumOfArticles("3"); %>
				<%=regionalarticles.print()%>
			</font>
			<%	//COMMUNICATIONS LX ARTICLES INSERTED HERE
				articles.setCategoryId("10");
				articles.setNumOfArticles("6");%>
				<%=articles.print()%>
			</font>


			
		</td>

		<% box.setStyle(boxStyle); box.setScreenAlign("right");%>

		<td width="25"></td>

		<td valign='top' width=140>

			<!-- start 'Quicklinks' module -->
			<% box.setTitle("Quick Links");%>
			<%=box.printTop()%>
			<!-- <%=fontS%> *This is the old Quicklinks code*
			<a href='http://wiki.uscm.org/' target='_blank'><img src="/images/wiki_icon.png" border='0' style="margin-right:5px;">Wiki</a><br>
			<a href="https://staff2.ccci.org/ss/concurSamlAdapter" target='_blank'><img src="/images/logo_onecard.gif" border='0' style="margin-right:5px;">OneCard</a><br>
			<a href='/servlet/Report'><img src="/images/small_check.gif" border='0' style="margin-right:5px;">Success Criteria</a><br>
			<a href='<%= (request.getServerName().equals("staff.campuscrusadeforchrist.com") || request.getServerName().equals("staff.uscm.org")) ?
                        "http://pr.uscm.org" : "http://pr.int.uscm.org" %>'><img src="/images/small_360.gif" border='0' style="margin-right:5px;">Panorama</a><br>
			<%// if (isStudent.equals("false")) { %>
			<a href='/servlet/CmsController'><img src="/images/small_disk.gif" border='0' style="margin-right:5px;">Resource Center</a><br>
			<%// } %>
			</font> -->

			<a href="http://wiki.uscm.org/" target="_blank"><img src="/images/wiki_icon.png" border="0"></a></td>
			<td height="" bgcolor="#CCCC99"><%=fontS%><a href="http://wiki.uscm.org/" target="_blank">Wiki</a></font></td></tr>

			<tr><td height="" bgcolor="#CCCC99"><a href="https://staffweb.ccci.org/onecard/index.htm" target="_blank"><img src="/images/logo_onecard.gif" border="0"></a></td>
			<td height="" bgcolor="#CCCC99"><%=fontS%><a href="https://staffweb.ccci.org/onecard/index.htm">OneCard</a></font></td></tr>

			<tr><td height="" bgcolor="#CCCC99"><a href="/servlet/Report"><img src="/images/small_check.gif" border="0"></a></td>
			<td height="" bgcolor="#CCCC99"><%=fontS%><a href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org" %>/reports">Success Criteria</a></font></td></tr>

			<tr><td height="" bgcolor="#CCCC99"><a href="http://pr.uscm.org"><img src="/images/small_360.gif" border="0"></a></td>
			<td height="" bgcolor="#CCCC99"><%=fontS%><a href="http://pr.uscm.org">Panorama</a></font></td></tr>

			<tr><td height="" bgcolor="#CCCC99"><a href="https://www.missionhub.com"><img src="/images/missionhub_icon.gif" width="17" height="17" border="0"></a></td>
			<td height="" bgcolor="#CCCC99"><%=fontS%><a href="https://www.missionhub.com" target="_blank">MissionHub</a></font>

			<%=box.printBottom()%>
			<br/>
			
      <style type=text/css>
      a.sideBar
      {
      height:20px;
      }
      </style>
      
			<!-- start 'Staff Services' module -->
			<% box.setTitle("<a class='titleLink' href='https://staff2.ccci.org/ss/pages/index.html' target='_blank'>Staff Services</a>");%>
			<%=box.printTop()%>
			<%=fontS%>
				<A  class="sideBar"   href='https://staffweb.ccci.org/pay-benefits-staff-expenses/printable-forms/index.htm' target='_blank'>Forms</a><br/>
				<A  class="sideBar"   href='https://staffweb.ccci.org/pay-benefits-staff-expenses/staff-handbook/index.htm' target='_blank'>Handbooks/Manuals</a><br/>
				<A  class="sideBar"   href='https://staffweb.ccci.org/pay-benefits-staff-expenses/reimbursements/index.htm' target="_blank">Reimbursements</A><br/>
				<A  class="sideBar"   href='https://staffweb.ccci.org/mpd-donations/my-donations/index.htm' target="_blank">Donations</A><br/>
				<A  class="sideBar"   href='https://staffweb.ccci.org/pay-benefits-staff-expenses/index.htm' target='_blank'>Staff Services</a>
			</font>
			<%=box.printBottom()%>
			<br/>
			<!-- start 'Staff Web' module -->
			<% box.setTitle("<a class='titleLink' href='http://staffweb.ccci.org/' target='_blank'>StaffWeb</a>");%>
			<%=box.printTop()%>
			<%=fontS%>
				<A  class="sideBar"   href='https://staffweb.ccci.org/ss/servlet/Fin8Reports' target='_blank'>Financial Reports</a><br/>
				<A  class="sideBar"   href="https://staffweb.ccci.org/operations/legal/first-amendment/index.htm" target="_blank">Legal Rights on Campus</a><br/>
				<A  class="sideBar"   href='https://staffweb.ccci.org/mpd-donations/index.htm' target='_blank'>MPD</a><br/>
				<A  class="sideBar"   href="https://staffweb.ccci.org/discounts/index.htm" target='_blank'>National Programs</a><br/>
				<A  class="sideBar"   href='https://staffweb.ccci.org/operations/risk-management/index.htm' target='_blank'>Risk Management (SOS)</a><br/>
				<A  class="sideBar"   href='http://staffweb.ccci.org' target='_blank'>StaffWeb</a><br/>
			</font>
			<%=box.printBottom()%>
			<br/>
			<!-- start 'Global' module -->
			<% box.setTitle("Global");%>
			<%=box.printTop()%>
			<%=fontS%>
				<A  class="sideBar"   href='http://www.gogmx.org' target='_blank'>GMX (Videos)</a><br/>
				<A  class="sideBar"   href='http://mygcx.org' target='_blank'>MyGCX (Communities)</a><br/>
			</font>
			<%=box.printBottom()%>
			<br/>
			<!-- start 'Way Forward' module -->
<!--			<% box.setTitle("Way Forward");%>
			<%=box.printTop()%>
			<%=fontS%>
				<A  class="sideBar"   href="http://campuscrusadeforchrist.com/wayforward/">Podcasts</a><br>
				<A  class="sideBar"   href="http://wiki.uscm.org/download/attachments/18088024/WayForward+card+2-up.pdf?version=1">Directional Card (pdf)</a>
			</font>
			<%=box.printBottom()%>
			<br>				
-->			<!-- start 'SLICE' module -->
			<!-- <% box.setTitle("SLICE Survey 2007");%>
			<%=box.printTop()%>
			<%=fontS%>
				<a href='https://staff.campuscrusadeforchrist.com/cms/content/5649.html'>See national results</a><br>	
			</font>
			<%=box.printBottom()%>
			<br>-->
			<!-- *******************************************************-->
			
			<!-- start 'Staff Opportunities' module
			<% box.setTitle("Staff Opportunities");%>
			<%=box.printTop()%>
			<%=fontS%>
				<a href='/servlet/CmsController?action=browse&catId=1000155'>Opportunities</a><br>
			</font>
			<%=box.printBottom()%>
			<br> -->
			<!-- *******************************************************-->

			<!-- start infobase search module -->
			<!-- <% box.setTitle("Bookmarks");%>
			<%=box.printTop()%>
				<%=fontB%><B>Success Criteria</B><br></font><%=fontB1%>

				<% String userID = ar.getValue("userID"); 
					String sCBookMarks="";
				%>
				<% Iterator prefs;%>
				<%
					Bookmarks bookmarks = new Bookmarks();
					InfobaseBookmark pref = null;
					
					
						%>
						<br>
						
						<a style="font-size:12px;" href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org" %>/stats">
						<b>Enter Stats  </b>
						</a>
						
				<%=hr%>
				</font><%=fontB%><B>Ministry Location</B><br></font><%=fontB1%>
				<% prefs = bookmarks.getBookmarkValues(userID, Bookmarks.TARGET_AREA).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (InfobaseBookmark)prefs.next();
							%>
								<a href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org" %>/locations/<%=pref.getValue()%>"><%=new TargetArea(pref.getValue()).getName()%></a><BR>
							<%
						}
					}
					%>
				<%=hr%>
				</font><%=fontB%><B>Missional Team</B><br></font><%=fontB1%>
				<% prefs = bookmarks.getBookmarkValues(userID, Bookmarks.LOCAL_LEVEL).iterator();
					if (!prefs.hasNext())  {
						%><i>(none)<i><br><%
					} else {
						while(prefs.hasNext()) {
							pref = (InfobaseBookmark)prefs.next();
							%>
								<a href="<%= request.getServerName().equals("staff.campuscrusadeforchrist.com") ? "https://infobase.uscm.org" : "http://info.int.uscm.org" %>/teams/<%=pref.getValue()%>"><%= new LocalLevel(pref.getValue()).getName() %></a><BR>
							<%
						}
					}
					%>
			<%=box.printBottom()%>
			<p>
			<% box.setTitle("Customize");%>
			<%=box.print("<a href='/servlet/StaffController?action=showCustomize'>Customize</a> my homepage")%>-->

            <% box.setTitle("Wedding Anniv.");  %>
            <%=box.printTop()%>
            <% weddings.initWeddings(getServletContext().getRealPath("/")); %>
            <% weddings.setJustCampus(campusOnly);%>
            <%=weddings.print()%>
            <%=box.printBottom()%>
            
		</td>

	</tr>
</TABLE>
<br>
<% } catch (Exception e) { e.printStackTrace(); }%>
<%@ include file="/frontpagefooter.jspf" %>
</HTML>
