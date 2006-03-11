<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion"/>
<jsp:useBean id="box" class="org.alt60m.html.Box"/>

<%@ include file="/style.jspf"%>

<HTML>
<HEAD>
<TITLE>Campus Crusade Login Help</TITLE>
</HEAD>
<body>
<center>
<TABLE WIDTH=550 BORDER=0 CELLPADDING=0 CELLSPACING=0>
	<TR>
		<TD>
			<IMG SRC="/images/login_01.gif"><IMG SRC="/images/login_02.gif">
		</TD>
		<TD>
			<a href="javascript:window.close()"><%=fontB%>[Close]</font></a>
		</TD>
	</TR>
</TABLE>

<table width="550" align=center>
	<tr>
		<td>

			<%=fontB%>
			<br>
			<center>
			<% 
				box.setTitle("E-Mail and Campus Staff Site Account Request");
				box.setWidth("400");
				box.setColor(colorL);
				box.setBodyColor(colorL);
			%>	
			<%=box.printTop()%>
			<table>
				<form name=myForm method=post action="emailrequest.jsp">
				<tr><td>	<%=fontB%>First Name: 		</td><td>	<input type=text size=12 name="firstName">	</td></tr>
				<tr><td>	<%=fontB%>Last Name: 		</td><td>	<input type=text size=12 name="lastName">	</td></tr>
				<tr><td>	<%=fontB%>Staff Account #: 	</td><td>	<input type=text size=12 name="accountNo">	</td></tr>
				<tr><td>	<%=fontB%>Password:			</td><td>	<input type=password size=12 name="password"> <font size=1>(<a href="#criteria">see password criteria below</a>)</font>		</td></tr>
				<tr><td>	<%=fontB%>Re-enter password:</td><td>	<input type=password size=12 name="passwordConf"></td></tr>
				<tr><td>	<%=fontB%>Region: 			</td><td>	<%	regions.setName("region");	%>	<%=regions.print()%></td></tr>
				<tr><td>	<%=fontB%>If female and married, is your husband on staff? </td><td> <select name="married"> <option> <option>Yes <option>No </select> </td></tr>
				<tr><td>	<%=fontB%>Are you in Campus Ministry (only Campus Ministry staff receive uscm.org email addresses) </td><td> <select name="campus"> <option> <option>Yes <option>No </select> </td></tr>
				<tr><td colspan=2>	<br><%=fontB%>How can we contact you when we are finished creating your account? (fill in one)	</td>	</tr>
				<tr><td>	<%=fontB%>An existing e-mail:</td><td>	<input type=text size=20 name="email">		</td></tr>
				<tr><td>	<%=fontB%>Phone:			</td><td>	<input type=text size=12 name="phone">		</td></tr>
				</form>
			</table>

			<br>
			<center>
			<A HREF="JavaScript:document.myForm.submit()" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';"><IMG BORDER="0" NAME="submitbutton" VALIGN="CENTER" SRC="/images/submit_boff.gif"></A>
			</center>
			<p>
			<%=box.printBottom()%>
			</center>

			<br>You will be contacted once your web account and your uscm e-mail account are set up.<br>
			In the meantime, if you have questions, you can <a href="mailto:help@campuscrusadeforchrist.com">e-mail</a> us.<br>
			<br>
			<br>
			<br>
			<center><a name="criteria">
			<% 
				box.setTitle("Password Criteria");
				box.setWidth("400");
				box.setColor(colorL);
			%>	
			<%=box.printTop()%>
			<%=fontB%>
			  The password criteria is as follows:</B>.<br>
			  <br>

			  1. Must begin with a capital letter<br>
			  2. 10-14 characters<br>
			  3. Must have at least one number or symbol (eg. 1234567890 ~`!@#$%^&*()_+=-[]\|}{;'":/.,<>? )<br>
			  4. Must NOT contain any part of your name or the word "password"<br>
			  <br>

			  Examples of acceptable passwords:<br>
			  Julie!Laurel<br>
			  UMRebels#1<br>
			  NittanyLion1<p>
			   
			  Examples of passwords that <b>don't</b> meet the minimum requirements (Assuming the user's name is Joe Staff):<br>
			  Joe&Suzie! (includes part of the user's name)<br>
			  Password123 (includes the word password)<br>
			  julie!laurel (does not begin with a capital letter)<p>
			  </font>
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
