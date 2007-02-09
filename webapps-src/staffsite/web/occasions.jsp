<jsp:useBean id="bday" class="org.alt60m.html.Birthdays" />
<jsp:useBean id="wed" class="org.alt60m.html.Weddings" />
<jsp:useBean id="ann" class="org.alt60m.html.StaffAnniversaries" />
<%
	String campusOnly = "";
	campusOnly = (String)session.getValue("campusOnly");
%>
<HTML>
<HEAD>
<title>Special Occasions</title>

</HEAD>
<% int curr_tab = 3; %>
<%@ include file="/header.jspf" %>

<% box.setTitle("Special Occasions");%>
<% box.setTitleFontSize("5");%>
<% box.setColor(color3);%>
<%=box.printTop()%>
<% box.reset();%>

<%=fontB%>
<CENTER>"There is an appointed time for everything. And there is a time for every event under heaven." Ecclesiastes 3:1</CENTER>
</font>

<%=fontB1%><BR>(Hint: To find a person's email address or home address, just click on their name.  This is helpful for sending e-cards or flowers. You can even copy and paste the person's information from the Staff Site form to the ecard form.)
<BR><BR>
</font>

<table cellpadding=0 cellspacing=0 align=center>
<tr>
	<td valign="top" width="83%">
		<% box.setTitle("Staff Birthdays in the Next Week");%>
		<% box.setColor(color2);%>
		<% box.setStyle("classic");%>
		<%=box.printTop()%>
				<% bday.initBirthdays(getServletContext().getRealPath("/")); %>
				<% bday.setJustCampus(campusOnly);%>
				<%=bday.printWeek()%>
		<%=box.printBottom()%>
		<%=fontB1%>To send a free <B>birthday</b> e-card click <A HREF="http://www.hallmark.com/ecards/" TARGET="_blank">HERE.</A></font>
		<p>
		<% box.setTitle("Wedding Anniversaries in the Next Week");%>
		<%=box.printTop()%>
				<% wed.initWeddings(getServletContext().getRealPath("/")); %>
				<% wed.setJustCampus(campusOnly);%>
				<%=wed.printWeek()%>
		<%=box.printBottom()%>
		<%=fontB1%>To send a free <B>anniversary</b> e-card, click <A HREF="http://www.hallmark.com/ecards/" TARGET="_blank">HERE</A>.</font> 
		<p>
		<% box.setTitle("Staff Anniversaries in the Next Week");%>
		<%=box.printTop()%>
				<% ann.initStaffAnniversaries(getServletContext().getRealPath("/")); %>
				<% ann.setJustCampus(campusOnly);%>
				<%=ann.printWeek()%>
		<%=box.printBottom()%>
		<%=fontB1%>To send an e-card, click <A HREF="http://www.hallmark.com/ecards/" TARGET="_blank">HERE.</A></font> 
	</td>
	<td width="4%">&nbsp;</td>
	<td valign="top" width="13%">
		<%=fontB1%>
		<A HREF="http://www.hallmark.com/ecards/" TARGET="_blank">Send an E-card</A>
		<BR><BR>
		</font>
	</td>
</tr>
</table>
<p>
<% box.setStyle("rounded");%>
<%=box.printBottom()%>

<%@ include file="/footer.jspf" %>

</HTML>