<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="org.alt60m.servlet.*" %>
<jsp:useBean id="formhelper" class="org.alt60m.html.FormHelper" />
<%
String zipCode = (String)session.getValue("zipCode");
String weatherType = (String)session.getValue("weatherType");
String campusOnly = (String)session.getValue("campusOnly");
String homePageArticlesToDisplay = (String)session.getValue("homePageArticlesToDisplay");
%>
<HTML>
<HEAD>
<TITLE>Campus Staff Site - Customize Setup</TITLE>
<STYLE TYPE="text/css">
	<!--.nounderline A {text-decoration:none}-->
</STYLE>
</HEAD>
<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy");
	int curr_tab=3;
%>
<%@ include file="/headersmall.jspf" %>

<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%"> <!--Whole page table-->
    <TR>
        <TD <%=bgcolorG%> VALIGN="BOTTOM"><%=fontB5%><B>Customize (Beta 3)</B></FONT></TD>
	</TR>
	<TR>
		<TD <%=bgcolorB%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="1" BORDER="0"></TD>
	</TR>
	<TR><TD ALIGN="CENTER"><BR>

<%=fontL%><div align=left>
This page will contain an ever expanding array of home page customization option. The currently available options are listed below. If you have any suggestions, make sure to <A HREF="mailto:systems.feedback@uscm.org?subject=home+page+customization+suggestions">let us know</A>.</div>
</font>

<form method="POST" action="/servlet/StaffController?action=Customize" NAME="submitForm">
	<br>
	<% box.setStyle("rounded");	//will set it for all the following boxes until we call it again%>
	<% box.setColor(color7);%>
	<% box.setWidth("90%");%>
	<% box.setBodyColor(color7);%>
	<% box.setTableInside(true);%>
	<% box.setSubSpace("1");%>

	<!--<% box.setTitle("Weather");%>
	<%=box.printTop()%>

		<tr><td nowrap align=center>
			<table>
			<tr><td>	<%=font%><p><B>ZipCode</B>:</FONT></td><td> <input type="text" name="zipCode" size="5" maxlength=5 value="<%=zipCode%>"></td></tr>
			<tr><td>	<%=fontS%><p><B>Current Weather</B>:</FONT></td><td> <input type="radio" name="weatherType" value="current" <%=formhelper.check(weatherType,"current")%>></td></tr>
			<tr><td>	<%=fontS%><p><B>Today's Forecast</B>:</FONT></td><td> <input type="radio" name="weatherType" value="today" <%=formhelper.check(weatherType,"today")%>></td></tr>
			</table>
		</td>
		<td rowspan='2'>
			<%=fontTextS%>
			One of the fun customization options that is included on the home page of this site is the current weather. If for some reason your zip code is incorrect, please fix it to the left. <p>
			<b>Notes:</b><BR>
			<li>This only works for 5 digit US zipcodes. Please do not try other countries.</li>
			<li>Retrieving the weather for your zipcode may cause the homepage to load slower. If you do not want the weather to be displayed on the home page, just type in <b>NO</b> in the box instead.</li>
			</font>
		</td>
		</tr>
	<%=box.printBottom()%>
	<BR>
	-->
	
	<!-- taken out by David Bauer 6/23/04 -->
	<!--
	<% box.setTitle("Home Page Articles");%>
	<%=box.printTop()%>

		<tr><td nowrap align=center>
			<table>
			<tr><td>	<%=font%><p><B>Number</B>:</FONT></td><td> <select name='homePageArticlesToDisplay'><option <%=formhelper.select(homePageArticlesToDisplay,"3")%>>3</option><option <%=formhelper.select(homePageArticlesToDisplay,"5")%>>5</option></select></td></tr>
			</table>
		</td>
		<td rowspan='2'>
			<%=fontTextS%>
			You can also choose how many LX articles show up on your homepage. The default is three, but you can have five listed instead.<p>
			<b>Notes:</b><BR>
			<li>Five is good if you do not log in too often, so you can get a bigger collection of what is happening.</li>
			<li>Three is perfect if you only want the latest and greatest stories.</li>
			</font>
		</td>
		</tr>
	<%=box.printBottom()%>

	-->


	<BR>
	<% box.setTitle("Special Occasions");%>
	<%=box.printTop()%>

		<tr><td nowrap align=center>
			<table>
			<tr><td>	<%=font%><p><B>Select</B>:</FONT></td><td> <select name='campusOnly'><option VALUE="true" <%=formhelper.select(campusOnly,"true")%>>Just Campus</option><option value='false' <%=formhelper.select(campusOnly,"false")%>>All Staff</option></select></td></tr>
			</table>
		</td>
		<td rowspan='2'>
			<%=fontTextS%>
			By default, the home page only displays Campus Ministry Staff for the Birthdays and Anniversaries. If you would prefer to see all the staff, change this option.<p>
			<b>Notes:</b><BR>
			<li>The all staff option will usually be pretty long.</li>
			<li>The all staff option may take a little longer to display.</li>
			</font>
		</td>
		</tr>
	<%=box.printBottom()%>
	<BR>
	<% box.setTitle("Look and Feel (Experimental)");%>
	<%=box.printTop()%>

		<tr><td nowrap align=center>
			<table>
			<tr><td>	<%=font%><p><B>Select</B>:</FONT></td><td> <select name='boxStyle'>
			<option VALUE="rounded" <%=formhelper.select(boxStyle,"rounded")%>>Rounded</option>
			<option value='classic' <%=formhelper.select(boxStyle,"classic")%>>NeoClassical</option>
			<option value='gradient1' <%=formhelper.select(boxStyle,"gradient1")%>>Fade</option>
			<option value='simple' <%=formhelper.select(boxStyle,"simple")%>>Simplistic</option>
			</select></td></tr>
			</table>
		</td>
		<td rowspan='2'>
			<%=fontTextS%>
			In an effort to make your stay more enjoyable, we have been experimenting with different site designs. You may change the default value (Rounded) to other styles.<p>
			<b>Notes:</b><BR>
			<li>This is experiemntal and may make some pages look weird.</li>
			<li>Some options may make your pages display slower.</li>
			</font>
		</td></form>
		</tr>
	<%=box.printBottom()%>
	</TD></TR>
	
	
			<tr>
		<td nowrap valign=bottom><br>
				<A HREF="JavaScript: history.go(-1)" onMouseOver="document.backbutton.src='/images/back_bon.gif';" onMouseOut="document.backbutton.src='/images/back_boff.gif';"><IMG  NAME="backbutton" SRC="/images/back_boff.gif" BORDER="0" ALIGN="TOP"></A>&nbsp;
		<A HREF="JavaScript: document.submitForm.submit()" onMouseOver="document.nextbutton.src='/images/next_bon.gif';" onMouseOut="document.nextbutton.src='/images/next_boff.gif';"><IMG NAME="nextbutton" SRC="/images/next_boff.gif" BORDER="0" ALIGN="TOP"></A>

		</td>
		</tr>

	
	<TR>
		<TD COLSPAN="3"><%=hr%></TD>
	</TR>

</TABLE><!--whole page table close-->
<BR>

<%@ include file="/footer.jspf" %>
</HTML>				