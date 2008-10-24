
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="box" class="org.alt60m.html.Box"/>

<%@ include file="/style.jspf"%>

<HTML>
<HEAD>
<TITLE>Campus Crusade Login Help</TITLE>
</HEAD>
<body>
<center>
<TABLE WIDTH=600 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD>
			<IMG SRC="/images/login_01.gif"><IMG SRC="/images/login_02.gif">
		</TD>
		<TD>
			<a href="javascript:window.close()"><%=fontB%>[Close]</font></a>
		</TD>
	</TR>
</TABLE>

<table width="600" align=center>
	<tr>
		<td>

			<%=fontB%>
			<br>
			<center>
			<% 
				box.setTitle("E-Mail and Campus Staff Site Account Request");
				box.setWidth("600");
				box.setColor(colorL);
				box.setBodyColor(colorL);
			%>	
			<%=box.printTop()%>
			
			<table style="border-collapse:collapse;">
				<form name=myForm method=post action="emailrequest.jsp">
				<tr><td colspan="4">	<%=fontB%>Are you in Campus Ministry <br>(only Campus Ministry staff receive <br>uscm.org email addresses and access to the Campus Staff Site) </td><td  colspan="2" width="30%"> <select name="campus"> <option> <option>Yes <option>No </select> </td></tr>
				
				<tr><td colspan="4" bgcolor="#9999FF">	<%=fontB%><font color=white> If you are with another CCC ministry and you are <br>only requesting access to the Campus Staff Site, <br>please give your reason and then proceed with form:</font></font></td><td colspan="2" width="30%" bgcolor="#9999FF" >	<input type=textarea rows=3 width=20 name="nonCampusStaffSiteAccessReason">	</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td colspan="4" align=right>	<%=fontB%>First Name: 		</td><td colspan="2" width="30%">	<input type=text size=12 name="firstName">	</td></tr>
				<tr><td colspan="4" align=right>	<%=fontB%>Last Name: 		</td><td colspan="2" width="30%">	<input type=text size=12 name="lastName">	</td></tr>
				<tr><td colspan="4" align=right>	<%=fontB%>Middle Initial: 		</td><td colspan="2" width="30%">	<input type=text size=12 name="middleInitial">	</td></tr> 
				<tr><td>&nbsp;</td></tr>
				<tr><td colspan="4" align=right>	<%=fontB%>Staff Account #: 	</td><td colspan="2" width="30%">	<input type=text size=12 name="accountNo">	</td></tr>
				<tr><td>&nbsp;</td></tr>
				
				<tr><td colspan="4" align=right>	<%=fontB%>GCX Password
				<br>(The password for the GCX account you have just activated):</td><td colspan="2" width="30%">	<input type=password size=12 name="password"> </td></tr>
				<tr><td colspan="4" align=right>	<%=fontB%>Re-enter password:</td><td colspan="2" width="30%">	<input type=password size=12 name="passwordConf"></td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td colspan="4" align=right>	<%=fontB%>If female and married, is your husband on staff? </td><td colspan="2" width="30%"> <select name="married"> <option> <option>Yes <option>No </select> </td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td colspan="4" align=right>	<%=fontB%>Campus Region (if you know where you will be assigned): </td><td colspan="2" width="30%"> 
					<SELECT NAME="region" >
						<OPTION VALUE=""></OPTION>
						<OPTION VALUE="GL">Great Lakes</OPTION>
						<OPTION VALUE="GP">Great Plains</OPTION>
						<OPTION VALUE="NW">Greater Northwest</OPTION>
						<OPTION VALUE="MA">Mid-Atlantic</OPTION>
						<OPTION VALUE="MS">MidSouth</OPTION>
						<OPTION VALUE="NC">National Campus Office</OPTION>
						<OPTION VALUE="NE">Northeast</OPTION>
						<OPTION VALUE="SW">Pacific Southwest</OPTION>
						<OPTION VALUE="RR">Red River</OPTION>
						<OPTION VALUE="SE">Southeast</OPTION>
						<OPTION VALUE="UM">Upper Midwest</OPTION>
						
					</SELECT>
				</td></tr>
				<tr><td colspan="6">	<br><%=fontB%>How can we contact you when we are finished creating your account? (fill in one)	</td>	</tr>
				<tr><td colspan="4" align=right>	<%=fontB%>An existing e-mail:</td><td colspan="2" width="30%">	<input type=text size=20 name="email">		</td></tr>
				<tr><td colspan="4" align=right>	<%=fontB%>Phone:			</td><td colspan="2" width="30%">	<input type=text size=12 name="phone">		</td></tr>
				</form>
			
				<tr><td colspan="6">
					<%=fontB %>You will be contacted once your Campus Staff Site account and your uscm e-mail account<br> are set up.
					In the meantime, if you have questions, you can <a href="mailto:help@campuscrusadeforchrist.com">e-mail</a> us.</font>
				</td></tr>
				<tr><td colspan="6"><center>
					<A HREF="JavaScript:document.myForm.submit()" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';"><IMG BORDER="0" NAME="submitbutton" VALIGN="CENTER" SRC="/images/submit_boff.gif"></A>
					</center>
				</td></tr>
			</table>

			<%=box.printBottom()%>
			</center>

			
		</td>
	</tr>
	<TR>
		<TD align=right>
			<BR><BR>
			<a href="javascript:window.close()"><%=fontB%>[Close]</font></a>

		</td>
	</tr>
</table>

</center>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>
