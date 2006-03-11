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
			<BR>
			<b>If you don't have a http://staff.CampusCrusadeForChrist.com account</b>, you can request one by simply filling out this form:<br>
			<br>
			<center>
			<% 
				box.setTitle("Campus Staff Site Account Request");
				box.setWidth("400");
				box.setColor(colorL);
				box.setBodyColor(colorL);
			%>	
			<%=box.printTop()%>
			<table>
				<form name=myForm method=post action="loginhelpnewaccountemail.jsp">
				<tr>
					<td>
						<%=fontB%>First Name: </font>
					</td>
					<td>
						<input type=text size=12 name="firstName">
					</td>
				</tr>
				<tr>
					<td>
						<%=fontB%>Last Name: </font>
					</td>
					<td>
						<input type=text size=12 name="lastName">
					</td>
				</tr>
				<tr>
					<td>
						<%=fontB%>Password:<BR></font>
					</td>
					<td>
						<NOBR><input type=password size=12 maxlength=14 name="password"><%=fontB%> <font size=1>(<a href="#criteria">see password criteria below</a>)</font></NOBR>
					</td>
				</tr>
				<tr>
					<td>
						<%=fontB%>Re-enter password: </font>
					</td>
					<td>
						<input type=password size=12 maxlength=14 name="passwordConf">
					</td>
				</tr>
				<tr>
					<td>
						<%=fontB%>Reason for needing account: </font>
					</td>
					<td>
						<input type=text size=24 name="reason">
					</td>
				</tr>
				<tr>
					<td>
						<%=fontB%>Name and email address of the staff member you are working with for above purpose: </font>
					</td>
					<td>
						<input type=text size=24 name="working_with">
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<br>
						<%=fontB%>How can we contact you when we are finished creating your account? (fill in one)</font>
					</td>
				</tr>
				<tr>
					<td>
						<%=fontB%>An existing e-mail:</font>
					</td>
					<td>
						<input type=text size=20 name="email">
					</td>
				</tr>
				<tr>
					<td>
						<%=fontB%>Phone:</font>
					</td>
					<td>
						<input type=text size=12 name="phone">
					</td>
				</tr>
				</form>
			</table>
			<br>
			<center>
			<A HREF="JavaScript:document.myForm.submit()" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';"><IMG BORDER="0" NAME="submitbutton" VALIGN="CENTER" SRC="/images/submit_boff.gif"></A>
			</center>
			<br><%=fontB%>You will be contacted once your account is set up.<br>
			In the meantime, if you have questions, you can <a href="mailto:help@campuscrusadeforchrist.com">e-mail</a> us.<br>
			</font>
			<a name="criteria">
			<%=box.printBottom()%>
			<P>
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

	<tr>
		<td align=right>
			<BR>
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
