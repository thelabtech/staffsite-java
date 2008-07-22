<jsp:useBean id="states" class="org.alt60m.html.SelectState" />
<jsp:useBean id="country" class="org.alt60m.html.SelectCountry" />

<html>
<head>
<title>Campus InfoBase Homepage</title>
</head>

<% String pageTitle = "Main Page"; %>
<%@ include file="/infobase/ibheader.jspf" %>

<table width="100%" border="0" align="center">
	<tr valign="top"> 
        <td width="130" align="right"> 
			<br>
			<table width="100%" border="0" bgcolor="#E3E3E3" bordercolor="#7788BB">
				<tr>
					<TD <%=tableCenterB%>><%=fontW%><B>Staff Lookup&nbsp;</B></font>
						
					</td>
				</tr>
				<tr <%=bgcolorL%> bordercolor="#6699CC" valign="middle"> 
					<td>
						<table width="100%" border="0">
							<form method="post" name="stafflastnamesearch" action="/servlet/InfoBaseController">
							<INPUT TYPE=HIDDEN name="searchby" value="lastname">
							<tr><td width="8%" valign="middle" align="center"><%=fontB%>Last Name:</font></td></tr>
							<tr>
								<td width="29%" valign="middle" align="center"> 
								  <INPUT TYPE=HIDDEN name="mode" value="list">
									<input type=HIDDEN name="action" value="listPerson">
									<INPUT TYPE=HIDDEN name="searchby" value="lastname">
									<input type="text" name="searchtext" size="12">
								</td>
							</tr>
							<tr><td width="21%" valign="middle" align="center" <%=bgcolorL%>><a href="Javascript: document.stafflastnamesearch.submit()" onMouseOut="changeImages('Image6','/images/search_boff.gif')" onMouseOver="changeImages('Image6','/images/search_bon.gif')"><img name="Image6" border="0" src="/images/search_boff.gif"></a></td></tr>
							</form>
						</table>
					</td>
				</tr>
            </table>
			<br>
			<table width="100%" border="0" bgcolor="#E3E3E3" bordercolor="#7788BB"> 
				<tr><TD <%=tableCenterB%>><%=fontW%><B>Regional Offices</B></font></td></tr>
				<tr <%=bgcolorL%> bordercolor="#6699CC" valign="middle">
					<td>
						<center>
							<%=fontB%>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=NE"><span title="region link" litUpl>Northeast</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=MA"> <span title="region link2" litUpl>Mid-Atlantic</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=MS"> <span title="region link3" litUpl>MidSouth</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=SE"> <span title="region link4" litUpl>Southeast</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=GL"> <span title="region link5" litUpl>Great Lakes</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=UM"> <span title="region link6" litUpl>Upper Midwest</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=GP"> <span title="region link7" litUpl>Great Plains Int'l</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=RR"> <span title="region link8" litUpl>Red River</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=NW"> <span title="region link9" litUpl>Greater Northwest</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=SW"> <span title="region link0" litUpl>Pacific Southwest</a><br>
							<a href="/servlet/InfoBaseController?action=editRegionInfo&region=NC"> <span title="region link1" litUpl>National Campus Office</a><br><br>
							</font>
						</center>
					</td>
				</tr>
            </table>
			<br>
			<table width="100%" border="0" bgcolor="#E3E3E3" bordercolor="#7788BB">
				<tr>
					<TD <%=tableCenterB%>><%=fontW%><B>Success Criteria&nbsp;</B></font>
						
					</td>
				</tr>
				<tr <%=bgcolorL%> bordercolor="#6699CC" valign="middle"> 
					<td>
						<table width="100%" border="0">
							<tr>
								<td valign="middle" align="center">
									<%=fontB%><a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">How to enter Success Criteria</a><BR><BR>
									<a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">How to get Success Criteria Reports</a>
									</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
            </table>
		</td>

		<td>
			<table align="center" >
			<tr>
				<td align="center">
					<!--<img border="0" src="/infobase/images/usmap.gif" usemap="#USMap" width="500" height="313"> -->
                    <img border="0" src="/infobase/images/usmap08.gif" usemap="#USMap" width="500" height="313">				</td>
<td width="90" align="left">
					<FONT FACE="Arial" SIZE="3" COLOR="#7788BB"><b>Locate a campus by clicking on a state:</b></font><br>
				</td>
			</tr>
			<tr>
				<td>
					<table border="0">
						<form method="post" name="countrysearch" action="/servlet/InfoBaseController">
						<input type=hidden name="action" value="detailedListCampus">
						<input type=hidden name="searchby" value="country">
						<INPUT TYPE=hidden name=view value=campusList>
						<tr>
							<td><img border="0" src="/infobase/images/worldblown.gif"></td>
							<td valign="middle">
								<FONT FACE="Arial" SIZE="3" COLOR="#7788BB"><b>or by selecting a country:</b></font></br>
								<%country.setName("searchstring");%>
		            <%=country.print()%><br>
								<a href="Javascript:document.countrysearch.submit()" onMouseOut="changeImages('Image9', '/images/search_boff.gif')" onMouseOver="changeImages('Image9','/images/search_bon.gif')"><img name="Image9" align="right" border="0" src="/images/search_boff.gif"></a>
							</td>
							<!-- <td width="230" align="right">
								<a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">How to enter Success Criteria</a><BR><BR>
								<a href="JavaScript: popupWindow('/help/help_success_criteria_reports.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">How to get Success Criteria Reports</a>
								</font>
							</td> -->
						</tr>
						</form>
					</table>
				</td>
 				<td width="100" align="left">
				</td>
 			</tr>
			</table>
		</td>

	</tr>
</table>
<br>
<%@ include file="/infobase/ibfooter.jspf" %>
<map name="USMap">
<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=WA" shape="rect" coords="45, 20, 92, 54">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=AK" shape="rect" coords="1,0 36,33">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=HI" shape="rect" coords="10,224 53,256">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=OR" shape="rect" coords="36, 62, 88, 95">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=ID" shape="polygon" coords="100, 43, 101, 71, 93, 101, 132, 110, 136, 86, 122, 86, 113, 70, 114, 58">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=MT" shape="polygon" coords="193, 41, 192, 78, 139, 74, 133, 79, 125, 69, 123, 60, 110, 33">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=ND" shape="polygon" coords="200, 42, 199, 68, 252, 68, 245, 42">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=WY" shape="polygon" coords="143, 85, 138, 123, 189, 126, 192, 88">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=CA" shape="polygon" coords="31, 97, 57, 102, 51, 135, 95, 193, 85, 209, 68, 211, 42, 180, 24, 126">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=NV" shape="polygon" coords="66, 106, 106, 113, 99, 171, 95, 183, 60, 135">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=UT" shape="polygon" coords="131, 116, 116, 112, 107, 164, 142, 169, 148, 130, 131, 128">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=AZ" shape="polygon" coords="142, 178, 107, 173, 104, 192, 94, 218, 124, 231, 135, 230">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=CO" shape="polygon" coords="155, 134, 207, 132, 207, 173, 149, 170">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=NM" shape="polygon" coords="196, 180, 153, 177, 144, 231, 163, 227, 195, 225">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=SD" shape="polygon" coords="201, 78, 201, 104, 254, 105, 253, 76">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=NE" shape="polygon" coords="197, 112, 199, 125, 214, 126, 215, 138, 265, 137, 252, 111">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=KS" shape="polygon" coords="214, 148, 214, 171, 273, 172, 268, 144">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=OK" shape="polygon" coords="276, 209, 275, 178, 231, 177, 233, 204">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=TX" shape="polygon" coords="284, 256, 257, 271, 250, 299, 240, 295, 214, 249, 194, 258, 175, 235, 205, 232, 205, 187, 223, 188, 227, 215, 279, 219, 283, 240">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=MN" shape="polygon" coords="253, 43, 260, 69, 263, 96, 297, 96, 281, 85, 285, 67, 288, 55, 301, 47, 266, 43">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=IA" shape="polygon" coords="260, 105, 269, 129, 299, 128, 307, 116, 298, 101">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=WI" shape="polygon" coords="325, 107, 309, 106, 294, 82, 294, 63, 324, 73">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=MO" shape="polygon" coords="272, 139, 281, 156, 280, 176, 316, 174, 313, 157, 294, 134">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=IL" shape="polygon" coords="327, 113, 332, 153, 325, 162, 309, 140, 313, 113">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=AR" shape="polygon" coords="282, 185, 284, 210, 306, 214, 314, 193, 313, 182">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=LA" shape="polygon" coords="288, 224, 296, 254, 328, 260, 325, 244, 308, 242, 312, 226, 308, 220">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=FL" shape="polygon" coords="356, 241, 412, 235, 435, 275, 431, 290, 416, 285, 395, 246">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=GA" shape="polygon" coords="365, 192, 377, 236, 407, 227, 411, 216, 380, 188">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=SC" shape="polygon" coords="386, 188, 413, 210, 426, 192, 413, 183, 395, 183">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=AL" shape="polygon" coords="359, 194, 343, 193, 343, 241, 348, 241, 348, 232, 371, 230">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=MS" shape="polygon" coords="337, 196, 320, 197, 313, 209, 315, 238, 332, 240, 340, 243">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=IN" shape="polygon" coords="353, 115, 337, 118, 341, 155, 360, 141">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=MI" shape="polygon" coords="300,58 333,73 342,112 375,109 376,86 348,52 318,46 300,58">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=OH" shape="polygon" coords="361, 116, 388, 107, 389, 122, 384, 133, 378, 140, 363, 138">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=TN" shape="polygon" coords="320, 182, 318, 193, 373, 185, 390, 166">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=KY" shape="polygon" coords="324, 176, 382, 164, 385, 157, 377, 142, 363, 144, 352, 157, 338, 160">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=WV" shape="polygon" coords="394, 128, 384, 141, 389, 157, 399, 149, 414, 129, 399, 129">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=PA" shape="polygon" coords="393, 103, 396, 123, 432, 117, 434, 94, 413, 99">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=NC" shape="polygon" coords="388, 180, 398, 165, 445, 157, 451, 169, 433, 190, 411, 176">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=VA" shape="polygon" coords="418, 136, 406, 155, 393, 159, 412, 159, 438, 152, 435, 138">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=NY" shape="polygon" coords="443, 90, 432, 87, 401, 96, 414, 65, 437, 54, 441, 74">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=MD" shape="rect" coords="455, 146, 481, 164">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=DE" shape="rect" coords="452, 132, 481, 145">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=NJ" shape="rect" coords="459, 118, 487, 129">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=NJ" shape="rect" coords="438, 101, 451, 124">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=CT" shape="rect" coords="463, 101, 492, 116">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=CT" shape="rect" coords="448, 87, 463, 98">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=RI" shape="rect" coords="477, 89, 495, 99">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=MA" shape="rect" coords="474, 58, 499, 73">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=MA" shape="rect" coords="449, 78, 477, 86">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=ME" shape="rect" coords="458, 18, 485, 55">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=VT" shape="rect" coords="400, 31, 428, 49">
	<area href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=NH" shape="rect" coords="427, 14, 450, 28">
<area shape="rect" coords="457,165,485,183" href="/servlet/InfoBaseController?action=detailedListCampus&view=campusList&searchby=state&searchstring=DC">
</map>
</html>