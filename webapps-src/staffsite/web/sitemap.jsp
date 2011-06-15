<HTML>
<HEAD>
<TITLE>Sitemap</TITLE>
</HEAD>
<% int curr_tab = 5; %>
<%@ include file="/header.jspf"%>

<% box.setStyle("rounded");%>
<% box.setColor(color3);%>
<% box.setTitleFontSize("5");	%>
<% box.setTitle("Site Map");	%>
<%=box.printTop()%>
<p><%=fontB%>
	<B>Lost?</B><br>
	Hopefully this site map will help you find what you need.<br>
	All the major pages and tools are listed here.
</p></font>

	<% box.reset();%>
	<% box.setStyle("classic");%>
	<% box.setColor(color2);%>
	<%=box.printTop()%>
		<table width='100%' border=0 cellspacing=0 cellpadding=0>
		<tr><td <%=tableRightWB%>><B><A HREF="/servlet/StaffController?action=showHome">Home</a>	</B>					</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	The main entry page with LX articles, Quicklinks, Search bars, and other tools.	</td></tr>
		<tr><td <%=tableRightWB%> nowrap>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/StaffController?action=showOccasions">Special Occasions</a>	</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	Birthdays, Wedding and Staff Anniversaries in the next week	</font></td></tr>

		<tr><td><B><A HREF="/servlet/StaffController?action=showMPD">MPD</a>	</B>						</td><td> &nbsp; </td><td><%=fontTextS%>	Ministry Partner Development Tools and Account Balance Listing.	</td></tr>
		<tr><td>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/StaffController?action=loginPS&section=SaiServlet" target='_blank'>Staff Account Information</A> </td><td> &nbsp; </td><td><%=fontTextS%> (view Donor Addresses, Donation Information, Staff Expense Report) </font></td></tr>
		<tr><td>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/StaffController?action=loginPS&section=ReimbServlet" target='_blank'>Reimbursements</A>			</td><td> &nbsp; </td><td><%=fontTextS%>  (personal ministry reimbursements) </font></td></tr>
		<tr><td>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/StaffController?action=loginStaffWeb&staffwebpath=mpdonline" target='_blank'>mpdonline.org</A>													</td><td> &nbsp; </td><td><%=fontTextS%> (Corporate Crusade MPD site)</font></td></tr>
		<tr><td>&nbsp; &nbsp; &nbsp;	<A HREF="http://home.ccci.org/wolbrink/tntmpd/" target='_blank'>TntMPD</A>										</td><td> &nbsp; </td><td><%=fontTextS%> (an offline program for managing your MPD)</font></td></tr>

		<tr><td <%=tableRightWB%>><B><A HREF="/servlet/StaffController?action=showTools">Tools</A></B>				</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	.	</td></tr>
		<tr><td <%=tableRightWB%>>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/InfoBaseController">Campus InfoBase</a>	</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	Information on all campuses involved with the Campus Ministry.	</font></td></tr>
		<tr><td <%=tableRightWB%>>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/InfoBaseController?action=showSuccessCriteriaHome">Success Criteria</a>	</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	Entering and viewing Success Criteria.	</font></td></tr>
		<tr><td <%=tableRightWB%>>&nbsp; &nbsp; &nbsp;	<A HREF="/quest/index.jsp">QuEST Survey Tool</a>			</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	View and Enter QuEST survey results into the QuEST Database. 	</font></td></tr>
<!--		<tr><td <%=tableRightWB%> nowrap>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/wsnsummerproject?action=showIndex">WSN Summer Project Tool</a>	</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	Leaders can automatically generate new account numbers for accepted students, track their balances, etc..	</font></td></tr>	-->
		<tr><td <%=tableRightWB%> nowrap>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/WsnSpController?action=showIndex">WSN Summer Project Tool</a>	</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	Leaders can automatically generate new account numbers for accepted students, track their balances, etc..	</font></td></tr>
		<tr><td <%=tableRightWB%>>&nbsp; &nbsp; &nbsp;	<A HREF="/servlet/Review360Controller">Review 360</a>	</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	The entire 360 process is on the web. No more hours of paperwork!! 	</font></td></tr>


		<tr><td><B><A HREF="/servlet/CmsController">Resources</A>	</B>			</td><td> &nbsp; </td><td><%=fontTextS%>	The Resource Center and Content Management System. Get the resources you need and share what you have created.	</td></tr>

		<tr><td <%=tableRightWB%>><B><A HREF="/links.jsp">Links</A></B>				</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	Other Crusade ministry websites and useful links.	</td></tr>


		<tr><td><B><A HREF="/sitemap.jsp">Sitemap</A></B>				</td><td> &nbsp; </td><td><%=fontTextS%>	This page.	</td></tr>

		<tr><td <%=tableRightWB%>><B><a href="JavaScript: popupWindow('http://wiki.uscm.org/display/CMIT/Home', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help</a></B>				</td><td <%=tableRightWB%>> &nbsp; </td><td <%=tableRightWB%>><%=fontTextS%>	The help system.	</td></tr>

		<tr><td><B><A HREF="/logout.jsp">Logoff</A></B>				</td><td> &nbsp; </td><td><%=fontTextS%>	Though not really a page, this will log you out of this system.	</td></tr>


		</table>



	<%=box.printBottom()%>

<% box.setStyle("rounded");%>
<%=box.printBottom()%>

<%@ include file="/footer.jspf" %>
</BODY>
</HTML>

