<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="appquestion" colspan="2">
			The Bible makes it clear that we should avoid sexual immorality (I Thessalonians 4:3-6).  Though God's forgiveness is complete, there is a distinction between forgiveness for past sins and being suitable for spiritual leadership.  I Timothy 3 outlines qualifications necessary for those who desire to be spiritual leaders, such as being "above reproach" and having a "good reputation."
			<P>
			Please answer the following questions honestly. Your answers to these questions will not necessarily disqualify you for acceptance, provided:  1) it can be determined that convictions are strong and consistent with Scripture, and 2) a sufficient time-tested track record of victory has been established. The information you share with us will be treated confidentially. We may need to phone you if we have questions.  If you prefer to discuss your answers in more detail over the phone, we still need you to respond to the questions in  writing.
			<P>
			<TABLE>
				<TR>
					<TD valign="top">
						Phone call requested?
						<DIV CLASS="applist">
							<%=PersonYesNo(isSubmitted, personHash, "CiPhoneCallRequested",NoEditAfterSubmit)%>
						</DIV>
					</TD>
					<TD valign="top" width="50">
						&nbsp;
					</TD>
					<TD valign="top">
						If yes, please enter the following:
						<TABLE cellspacing=0 cellpadding=0>
							<TR>
								<TD ALIGN="RIGHT">
									Phone number:
								</TD>
								<TD>
									<INPUT type=text onFocus="Highlight(this)" onBlur="UnHighlight(this)" <%=PersonInputValue(isSubmitted, personHash, "CiPhoneNumber",20,NoEditAfterSubmit)%>>
								</TD>
							</TR>
							<TR>
								<TD ALIGN="RIGHT">
									Best Time of day to call:
								</TD>
								<TD>
									<INPUT type=text onFocus="Highlight(this)" onBlur="UnHighlight(this)" <%=PersonInputValue(isSubmitted, personHash, "CiBestTimeToCall",10,NoEditAfterSubmit)%>>
								</TD>
							</TR>
							<TR>
								<TD ALIGN="RIGHT">
									Time Zone:
								</TD>
								<TD>
									<INPUT type=text onFocus="Highlight(this)" onBlur="UnHighlight(this)" <%=PersonInputValue(isSubmitted, personHash, "CiTimeZone",10,NoEditAfterSubmit)%>>
								</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<%=mshtmlutils.printInputArea("Do you have a police or prison record?","22", "yesno", 0, "_22a", ((Boolean)personHash.get("_22a")).toString(), false)%>
	<%=mshtmlutils.printInputArea("If yes, please explain:<BR>(If you prefer a phone call to discuss this answer, type 'Please Call' in the box below.)","", "textarea", 750, "_22b", (String)personHash.get("_22b"), false)%></td></tr>
	<%=mshtmlutils.printInputArea("Do you consume alcoholic beverages?","23", "yesno", 0, "_23a", ((Boolean)personHash.get("_23a")).toString(), false)%>
	<%=mshtmlutils.printInputArea("In what situations and how often do you use alcohol?<BR>Would you consider this an area with which you struggle?<BR>(If you prefer a phone call to discuss this answer, type 'Please Call' in the box below.)","", "textarea", 750, "_23b", (String)personHash.get("_23b"), false)%></td></tr>
	<%=mshtmlutils.printInputArea("In the last 12 months, have you used narcotics, halucinogens, or drugs not prescribed by a physician?","24", "yesno", 0, "_24a", ((Boolean)personHash.get("_24a")).toString(), false)%>
	<%=mshtmlutils.printInputArea("If yes, please explain in detail:<BR>(If you prefer a phone call to discuss this answer, type 'Please Call' in the box below.)","", "textarea", 750, "_24b", (String)personHash.get("_24b"), false)%></td></tr>
	<%=mshtmlutils.printInputArea("What convictions have you developed in the area of sexual purity (i.e., petting, pornography, sexual involvment)?<BR>Please be specific.<BR>(If you prefer a phone call to discuss this answer, type 'Please Call' in the box below.)","25", "textarea", 750, "_25", (String)personHash.get("_25"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("In the last 12 months have you had an incident which would not be considered \"above reproach\" (i.e. light or heavy petting/sexual intercourse/oral sex/pornography)?","26", "yesno", 0, "_26a", ((Boolean)personHash.get("_26a")).toString(), false)%>
	If so, when was the last occurrence? (month/year)<INPUT type=text name="_26date" size=10 maxlength=10 onFocus="Highlight(this)" onBlur="UnHighlight(this)"<%=(String)personHash.get("_26date") == null? "" : " value= \""+(String)personHash.get("_26date")+"\""%>>
	<%=mshtmlutils.printInputArea("If yes, please explain the details below.<BR>Include steps you have taken to change that involvement.<BR>Is anyone holding you accountable in this area?<BR>(If you prefer a phone call to discuss this answer, type 'Please Call' in the box below.)","", "textarea", 750, "_26b", (String)personHash.get("_26b"), false)%></td></tr>
	<%=mshtmlutils.printInputArea("In the past 12 months have you struggled with or participated in homosexual relationships/practice?","27", "yesno", 0, "_27a", ((Boolean)personHash.get("_27a")).toString(), false)%>
	<%=mshtmlutils.printInputArea("If yes, please explain the details below.<BR>Is anyone holding you accountable in this area?<BR>(If you prefer a phone call to discuss this answer, type 'Please Call' in the box below.)","", "textarea", 750, "_27b", (String)personHash.get("_27b"), false)%></td></tr>
	<%=mshtmlutils.printInputArea("In the last 12 months, have you struggled with an eating disorder?","28", "yesno", 0, "_28a", ((Boolean)personHash.get("_28a")).toString(), false)%>
	<%=mshtmlutils.printInputArea("If yes, please explain the details below.<BR>Include steps you have taken to change that involvement.<BR>Is anyone holding you accountable in this area?<BR>(If you prefer a phone call to discuss this answer, type 'Please Call' in the box below.)","", "textarea", 750, "_28b", (String)personHash.get("_28b"), false)%></td></tr>
	<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>