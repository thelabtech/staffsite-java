<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	Conference conference = (Conference)ar.getObject("conference");
	boolean onlyOneRegType = ar.getValue("onlyOneRegType") != null && ((String)ar.getValue("onlyOneRegType")).equals("true");
	Registration registration = new Registration();
	Date thisDay = new Date();
	boolean regCurrent = conference.getPreRegStart() != null &&
		conference.getPreRegEnd() != null &&
		(thisDay.after(conference.getPreRegStart()) || org.alt60m.util.DateUtils.isSameDay(thisDay, conference.getPreRegStart())) &&
		(thisDay.before(conference.getPreRegEnd()) || org.alt60m.util.DateUtils.isSameDay(thisDay, conference.getPreRegEnd()));
	boolean isSpouse = false;
	String pageTitle = "";
%>
<%@ include file="/crs/e_user_header.jspf"%>
<%
	registrationMenu.setActives(new boolean[]{
		true,
		true,
		true,
		false,
		false,
		false,
		false,
		false,
		false,
		false,
		false
	});
otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});

if (clk1==false) { pageTitle = "Campus Crusade for Christ Login"; }
else { pageTitle = "Conference Registration Tool Login"; }
%>

<script LANGUAGE="JavaScript">
	<!--
		function goNext(action){
			var form = document.theForm;
			form.Username.value = form.Username.value.toLowerCase();
			if(!requiredFilled(form)){
				alert("You must both a username and a password to continue.");
			} else{
				form.action.value = action;
				form.submit();
			}
		}
	//-->
</script>
<table
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<tr>
		<!-- REMOVED SEP 11/1/04 *****************
		<td
			VALIGN="TOP"
			WIDTH="150"><%=registrationMenu.display(3)%>
		</td>
		***************************************-->
		<td VALIGN="TOP">
		<table
			width="100%"
			class="box"
			cellspacing="0">
			<tr>
				<td
					colspan="3"
					class="boxheader"><%=conference.getName()%></td>
			</tr>

			<!-- COMMENT OUT THIS SECTION TO TURN OFF CRS -->
			<%
				if(regCurrent) {
			%>
			<form
				name="theForm"
				action="/servlet/CRSRegister"
				method="POST">
				<input type="hidden" name="action" value="userAuthenticate">
				<input type="hidden" name="regTypeID" value="<%=ar.getValue("regTypeID")%>">
				<input type="hidden" name="ConferenceID" value="<%=conference.getConferenceID()%>">
				<input type="hidden" name="FromLoginPage" value="true">
			<tr>
				<td
					class="cell"
					colspan="3">
				<p><b>Please read these instructions before logging in:</b>
				<p><b>Please use Internet Explorer to register.</b> Currently, this
				site is optimized for <a href="http://mozilla.org" target="_blank">Mozilla Firefox</a>
				and Internet Explorer. You may have problems
				completing the process if you are using a different browser. We are
				working to support other browsers in the future. Thank you for your
				patience and understanding.
		<% // 1/16/2006 - Added SRW to cloak any reference to CCC.
			if  (clk1==false) { //Beginning of conference cloaking if statment for userLogin.jsp
		%>
				<p><b>If you have previously</b> filled out a
				Campus Crusade for Christ online application or registration form,
				please use the same email address and password that you used before
				(help is available if you have forgotten your password).
				<p><b>If this is your first time</b> to log in to Campus Crusade for
				Christ, you may <a
					href="/servlet/AccountController?action=goToPage&page=register&loginPage=/crs/login.jsp?ConferenceID=<%=conference.getConferenceID()%>&type=<%=ar.getValue("type")%>">create
				a new login</a>.
				</div>
				<p><b>CCC Campus Ministry Staff:</b> Please log in
				using your uscm email address (first.last@uscm.org) and your Campus
				Staff Site password. If you don't have a login account for the
				Campus Staff Site, please do not click "create a new login", but
				rather please contact <a
					href="mailto:help@campuscrusadeforchrist.com">help@campuscrusadeforchrist.com</a>.
				<p><b>Other CCC staff</b>, you may <a
					href="/servlet/AccountController?action=goToPage&page=register&loginPage=/crs/login.jsp?ConferenceID=<%=conference.getConferenceID()%>&type=<%=ar.getValue("type")%>">create
				a new login</a> if this is your first time to use the Conference
				Registration System, or use your existing login if you have done
				this before.
				<% } //End of conference cloaking if statement for userLogin.jsp %>
				</div>
				<p><b>Please read the instructions above before logging in.</b>
				<p>
				</td>
			</tr>
			<%if(!onlyOneRegType){ //Beginning OneRegType %><tr>
				<td
					class="hl"
					align="RIGHT"
					width="20%"
					valign="top">Registration Type</td>
				<%
						if("existing".equals(ar.getValue("type"))){
						%>
				<td
					class="cell"
					width="30%">Existing registration type</td>
				<%
						} else {
						%>
				<td
					class="cell"
					width="30%"><b><%=ar.getValue("regTypeLabel")%></b> -
				<%=ar.getValue("regTypeDescription")%></td>
				<%
						}
						%>
				<td
					class="cell"
					width="50%"><a
					href="/servlet/CRSRegister?action=selectEvent&ConferenceID=<%=conference.getConferenceID()%>&regTypeID=<%=ar.getValue("regTypeID")%>"
					class="button">Change registration type</a></td>
			</tr>
				<%} //end OneRegType %>
			<tr>
				<td
					class="hl"
					align="RIGHT"
					width="20%">Login (email address)</td>
				<td class="cell"><input
					class="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					type=TEXT
					name="Username"
					size="30"
					maxlength="80"></td>
				<td class="cell"><a
					href="/servlet/AccountController?action=goToPage&page=register&loginPage=/crs/login.jsp?ConferenceID=<%=conference.getConferenceID()%>%26type=<%=ar.getValue("regTypeID")%>"
					class="button">Click here to create a new login</a></td>
			</tr>
			<tr>
				<td
					class="hl"
					align="RIGHT">Password</td>
				<td class="cell"><input
					class="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					type=PASSWORD
					name="Password"
					maxlength="30"
					size="30"></td>
				<td class="cell"><a
					href="/servlet/AccountController?action=goToPage&page=lookupQuestion&loginPage=/crs/login.jsp?ConferenceID=<%=conference.getConferenceID()%>%26type=<%=ar.getValue("regTypeID")%>"
					class="button">I forgot my password</a></td>
			</tr>
			<tr>
				<td
					class="cell"
					align="RIGHT">&nbsp;</td>
				<td class="cell"><a
					href="javascript: goNext('userAuthenticate')"
					class="button">Login</a></td>
			</tr>
			<tr>
				<td
					class="cell"
					colspan="3">
				<p>See our <a
					href="JavaScript: popupWindow('/general/privacyPolicy.htm', 'Policy', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Privacy
				Policy.</a>
				</td>
			</tr>
			</form>
			<%
				} else {
				%>
			<tr>
				<td class="cell">Online registration is not currently available for
				the conference that you have selected.</td>
			</tr>
			<%
				}
				%>
			<!-- END SECTION TO COMMENT OUT WHEN CRS IS OFF -->

			<!-- PLACEHOLDER CODE WHILE CRS IS OFF -->
			<!--
			<tr>
			<td class="cell"><b>The Conference Registration System is temporarily unavailable.
			Please try again in a few hours.</b></td>
			</tr>
			-->
			<!-- END PLACEHOLDER CODE -->

		</table>
		</td>
	</tr>
</table>
<%@ include file="/crs/e_user_footer.jspf"%>
<%
		} catch (Exception e) {
			e.printStackTrace();
            throw new Exception(e);
        }
%>
