<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">8)</TD>
		<TD CLASS="appquestion">
		What church do you attend?
		<DIV CLASS="applist">
			at Home: &nbsp;
			<INPUT type=text <%=PersonInputValue(isSubmitted, personHash, "_8a",30,NoEditAfterSubmit)%> CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
		</DIV>
		<DIV CLASS="applist">
			at School: 
			<INPUT type=text <%=PersonInputValue(isSubmitted, personHash, "_8b",30,NoEditAfterSubmit)%> CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
		</DIV>
		(Note: While on the project, you may be asked to attend a church that is of a different denomination.)
		</TD>
	</TR>
	<%=mshtmlutils.printInputArea("What is your understanding of the Spirit-filled life?","9", "textarea", 750, "_9", (String)personHash.get("_9"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("Describe your relationship with God. What has God been teaching you recently?","10", "textarea", 750, "_10", (String)personHash.get("_10"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("Are you willing to follow project policies and project leadership even though you might not totally agree with them in every situation?","11", "yesno", 0, "_11a", ((Boolean)personHash.get("_11a")).toString(), false)%>
	<%=mshtmlutils.printInputArea("Why or why not?","", "textarea", 500, "_11b", (String)personHash.get("_11b"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("Are you dating someone applying to this project?","12", "yesno", 0, "_12a", ((Boolean)personHash.get("_12a")).toString(), false)%>
		<DIV CLASS="applist">If yes, who? <INPUT type=text <%=PersonInputValue(isSubmitted, personHash, "_12b",20,NoEditAfterSubmit)%>><BR>
		The emotional and spiritual atmosphere can be intense on project.  Relationships with the opposite sex in these contexts can be challenging and even distracting from the mission, if problems develop.  Thus, we may choose to assign separate placement in the case of pre-engaged couples.</DIV>
		</TD>
	</TR>
	<%=mshtmlutils.printInputArea("Have you ever been involved in the practice of speaking in tongues?","13", "yesno", 0, "_13a", ((Boolean)personHash.get("_13a")).toString(), false)%>
	<%=mshtmlutils.printInputArea("Are you presently doing so?","", "yesno", 0, "_13b", ((Boolean)personHash.get("_13b")).toString(), false)%>
	<%=mshtmlutils.printInputArea("This project has very specific objectives.  Historically, we have found that the issue of tongues can be divisive. For the sake of unity, are you willing to suspend any public practice of tongues and refrain from discussing and/or promoting the issue for the duration of this project?","", "yesno", 0, "_13c", ((Boolean)personHash.get("_13c")).toString(), false)%></TD>
	</TR>
	<%=mshtmlutils.printInputArea("What is your understanding of and attitude toward taking the initiative in evangelism?","14", "textarea", 750, "_14", (String)personHash.get("_14"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("Are you willing to be trained in taking the initative in evangelism?","15", "yesno", 0, "_15", ((Boolean)personHash.get("_15")).toString(), false)%>
		</TD>
	</TR>
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">16)</TD>
		<TD CLASS="appquestion">
		How confident are you in using the Four Spiritual Laws/Would You Like To Know God Personally booklets?
		<DIV CLASS="applist">
		<%	Integer _16 = (Integer)personHash.get("_16");
			if (_16 == null) _16 = new Integer(-1); %>
			<INPUT type=radio name="_16" value="0"<%=_16.intValue() == 0 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Have never used<BR>
			<INPUT type=radio name="_16" value="1"<%=_16.intValue() == 1 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Not very<BR>
			<INPUT type=radio name="_16" value="2"<%=_16.intValue() == 2 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Average<BR>
			<INPUT type=radio name="_16" value="3"<%=_16.intValue() == 3 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Confident<BR>
			<INPUT type=radio name="_16" value="4"<%=_16.intValue() == 4 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Very confident
		</DIV>
		</TD>
	</TR>
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">17)</TD>
		<TD CLASS="appquestion">
		I share my faith:
		<DIV CLASS="applist">
		<%	Integer _17 = (Integer)personHash.get("_17");
			if (_17 == null) _17 = new Integer(-1); %>
			<INPUT type=radio name="_17" value="0"<%=_17.intValue() == 0 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Weekly<BR>
			<INPUT type=radio name="_17" value="1"<%=_17.intValue() == 1 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Monthly<BR>
			<INPUT type=radio name="_17" value="2"<%=_17.intValue() == 2 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Occasionally<BR>
			<INPUT type=radio name="_17" value="3"<%=_17.intValue() == 3 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Seldom<BR>
			<INPUT type=radio name="_17" value="4"<%=_17.intValue() == 4 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> Never
		</DIV>
		</TD>
	</TR>
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