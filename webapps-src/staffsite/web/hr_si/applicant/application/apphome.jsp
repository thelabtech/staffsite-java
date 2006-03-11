<% try{%>

<%@ include file="header.jspf" %>
<%
	String AppID = a.getApplicationID();

	// Get the up to 4 reference hashtables for this application
	// Get STAFF MEMBER REFERENCE (stored in variables prefixed with "refs9")
	SIReference refs9Obj = siBean.getSIReferenceByType(AppID, "S");
	String refs9Status = "NONE";
	if (refs9Obj != null)
		refs9Status = refs9Obj.loadWorkflowStatusText();

	// Get DISCIPLER REFERENCE (stored in variables prefixed with "refd9")
	SIReference refd9Obj = siBean.getSIReferenceByType(AppID, "D");
	String refd9Status = "NONE";
	if (refd9Obj != null)
		refd9Status = refd9Obj.loadWorkflowStatusText();

	// Get ROOMMATE REFERENCE (stored in variables prefixed with "refr9")
	SIReference refr9Obj = siBean.getSIReferenceByType(AppID, "R");
	String refr9Status = "NONE";
	if (refr9Obj != null)
		refr9Status = refr9Obj.loadWorkflowStatusText();

	// Get FRIEND REFERENCE (stored in variables prefixed with "reff9")
	SIReference reff9Obj = siBean.getSIReferenceByType(AppID, "F");
	String reff9Status = "NONE";
	if (reff9Obj != null)
		reff9Status = reff9Obj.loadWorkflowStatusText();
%>
<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="postAppHome";
-->
</script>

<input type="hidden" name="ApplicationID" value="<%=a.getApplicationID()%>"/>
<input type="hidden" name="SIPersonID" value="<%=p.getSIPersonID()%>"/>
<input type="hidden" name="AppType" value="<%=appType%>"/>

<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2"><% if (!"".equals(p.getFirstName())){%><STRONG>Welcome, <%=p.getFirstName()%>!</STRONG><%}%></TD>
	</TR>
	<tr>
	<TD CLASS="app" COLSPAN="2">
		<table class="app" width="100%" cellpadding="0" cellspacing="0">
			<TR>
				<TD CLASS="app" WIDTH="70%" align="center" rowspan="2" valign="top">
					<table class="app" width="100%" cellpadding="0" cellspacing="0"><tr><td class="app" align="center">
						<font class="heading">Apply 4 STINT/Internship.com</font><p align="left">You now can apply for STINT and/or an Internship through this web site.  This online application allows you to designate your ministry interest in an international STINT location, a U.S. Internship, or both.  One application does both.</p><p align="left">We are so glad you have decided to apply for a STINT and/or Internship.  We hope we can serve you in any way we can.  We would encourage you to start with the Instructions and FAQ pages. Those two pages are designed to give you direction and answer questions that you may have.</p><p align="left">Come back to this page frequently to monitor the status of you and your references completing the six required parts in order for your application to be considered (your application, payment, and four completed references).  It is your responsibility to make sure your references complete their portions of your application.  Even though they will receive an email with a link to fill out your reference, it’s a good idea for you to email them as well so they know to be looking for it.</p><p align="left">We look forward to hear from you!</p>
						<% if (isSubmitted) {%><B>NOTE: Since your application has already been submitted, you may only make changes to the Personal Information, References, and Payment pages. You may also answer any questions which were left blank.</B><BR><% } %>
						</td></tr>
					</table>
				<table class="app" WIDTH="100%" align="center" rowspan="2" valign="top">
				<tr><td class="app">
					<table class="insidebox" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td class="insidebox" align="center" colspan="4"><font class="heading">Application Status</font></td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%">Date Started</td>
							<td class="insidebox" align="center" width="25%">Date Submitted</td>
							<td class="insidebox" align="center" width="25%">Date Changed</td>
							<td class="insidebox" align="center" width="25%">Payment</td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%"><%=a.getDateAppStarted()==null?"&nbsp;":util.formatDate(a.getDateAppStarted())%></td>
							<td class="insidebox" align="center" width="25%"><%=a.getDateSubmitted()==null?"Not Complete":util.formatDate(a.getDateSubmitted())%></td>
							<td class="insidebox" align="center" width="25%"><%=util.formatDate(a.getDateAppLastChanged())%></td>
							<td class="insidebox" align="center" width="25%"><%=a.getIsPaid()==true?"Paid":"Not Paid"%></td>
						</tr>
					</table>
				</td></tr>
				<tr><td class="app">
					<P>&nbsp;
					
				</td></tr>
				<tr><td class="app">
					<table class="insidebox" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td class="insidebox" align="center" colspan="4"><font class="heading">Staff Reference</font></td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%">Name</td>
							<td class="insidebox" align="center" width="25%">Status</td>
							<td class="insidebox" align="center" width="25%">Started Date</td>
							<td class="insidebox" align="center" width="25%">Submitted Date</td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%"><a href="javascript: doPostForm('refs')"><%=(refs9Obj == null) ? "&nbsp;" : refs9Obj.getFirstName() + " " + refs9Obj.getLastName()%></a></td>
							<td class="insidebox" align="center" width="25%"><%=refs9Status%></td>
							<td class="insidebox" align="center" width="25%"><%=(refs9Obj == null) ? "&nbsp;" : util.formatDate(refs9Obj.getCreateDate())%></td>
							<td class="insidebox" align="center" width="25%"><%=(refs9Obj == null) ? "&nbsp;" : util.formatDate(refs9Obj.getFormSubmittedDate())+"&nbsp;"%></td>
						</tr>
					</table>
				</td></tr>
				<tr><td class="app">
					<table class="insidebox" width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td class="insidebox" align="center" colspan="4"><font class="heading">Discipler Reference</font></td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%">Name</td>
							<td class="insidebox" align="center" width="25%">Status</td>
							<td class="insidebox" align="center" width="25%">Started Date</td>
							<td class="insidebox" align="center" width="25%">Submitted Date</td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%"><a href="javascript: doPostForm('refs')"><%=(refd9Obj == null) ? "&nbsp;" : refd9Obj.getFirstName() + " " + refd9Obj.getLastName()%></a></td>
							<td class="insidebox" align="center" width="25%"><%=refd9Status%></td>
							<td class="insidebox" align="center" width="25%"><%=(refd9Obj == null) ? "&nbsp;" : util.formatDate(refd9Obj.getCreateDate())%></td>
							<td class="insidebox" align="center" width="25%"><%=(refd9Obj == null) ? "&nbsp;" : util.formatDate(refd9Obj.getFormSubmittedDate())+"&nbsp;"%></td>
						</tr>
					</table>
				</td></tr>
				<tr><td class="app">
					<table class="insidebox" width="100%" cellpadding="0" cellspacing="0">
						<tr>
						<td class="insidebox" align="center" colspan="4"><font class="heading">Roommate Reference</font></td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%">Name</td>
							<td class="insidebox" align="center" width="25%">Status</td>
							<td class="insidebox" align="center" width="25%">Started Date</td>
							<td class="insidebox" align="center" width="25%">Submitted Date</td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%"><a href="javascript: doPostForm('refs')"><%=(refr9Obj == null) ? "&nbsp;" : refr9Obj.getFirstName() + " " + refr9Obj.getLastName()%></a></td>
							<td class="insidebox" align="center" width="25%"><%=refr9Status%></td>
							<td class="insidebox" align="center" width="25%"><%=(refr9Obj == null) ? "&nbsp;" : util.formatDate(refr9Obj.getCreateDate())%></td>
							<td class="insidebox" align="center" width="25%"><%=(refr9Obj == null) ? "&nbsp;" : util.formatDate(refr9Obj.getFormSubmittedDate())+"&nbsp;"%></td>
						</tr>
					</table>
				</td></tr>
				<tr><td class="app">
					<table class="insidebox" width="100%" cellpadding="0" cellspacing="0">
						<tr>
						<td class="insidebox" align="center" colspan="4"><font class="heading">Friend Reference</font></td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%">Name</td>
							<td class="insidebox" align="center" width="25%">Status</td>
							<td class="insidebox" align="center" width="25%">Started Date</td>
							<td class="insidebox" align="center" width="25%">Submitted Date</td>
						</tr>
						<tr>
							<td class="insidebox" align="center" width="25%"><a href="javascript: doPostForm('refs')"><%=(reff9Obj == null) ? "&nbsp;" : reff9Obj.getFirstName() + " " + reff9Obj.getLastName()%></a></td>
							<td class="insidebox" align="center" width="25%"><%=reff9Status%></td>
							<td class="insidebox" align="center" width="25%"><%=(reff9Obj == null) ? "&nbsp;" : util.formatDate(reff9Obj.getCreateDate())%></td>
							<td class="insidebox" align="center" width="25%"><%=(reff9Obj == null) ? "&nbsp;" : util.formatDate(reff9Obj.getFormSubmittedDate())+"&nbsp;"%></td>
						</tr>
					</table>
				</td></tr>
				</table>
				</TD>
			</tr>
			<tr>
				<TD CLASS="app" align="center" width="30%" valign="top">
									<% box.setTableInside(true); %>
									<% box.setWidth("100%"); %>
									<% box.setTitle("Other Helpful Sites");	%>
									<%=box.printTop() %>
									<TR>
										<TD class="insidebox" align="center">
											<a href="http://www.campuscrusadeforchrist.com/wsn/">This is where I live</a>
										</td>
									</tr>
									<tr>
										<TD class="app" align="center">
											<font class="reallysmall">Find out about our international STINT and summer project opportunities.</font>
										</TD>
									</TR>
									<TR>
										<TD class="insidebox" align="center">
											<a href="http://www.campuscrusadeforchrist.com">Campus Crusade for Chirst</a>
										</td>
									</tr>
									<tr>
										<TD class="app" align="center">
											<font class="reallysmall">Find out about our Campus Crusade and all of our ministry opportunities.</font>
										</TD>
									</TR>
									<%=box.printBottom()%>
							<font class="heading" align="center">Applications are<br>On-Line!</font>
				</td></tr>
			</table>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button">&nbsp;</TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostForm('<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%=box.printBottom()%>
</FORM>
<small>P=<%=p.getSIPersonID()%> A=<%=AppID%></small>
<%@ include file="/hr_si/siMainFooter.jspf" %>
<%}catch(Exception e){e.printStackTrace();}%>
