<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">18)</TD>
		<TD CLASS="appquestion">
		How long have you been involved with Campus Crusade for Christ, Impact, Epic or Destino?
		<DIV CLASS="applist">
		<%	Integer _18 = (Integer)personHash.get("_18");
			if (_18 == null) _18 = new Integer(-1); %>
			<INPUT type=radio name="_18" value="0"<%=_18.intValue() == 0 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> less than 1 year<BR>
			<INPUT type=radio name="_18" value="1"<%=_18.intValue() == 1 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> 1-2 years<BR>
			<INPUT type=radio name="_18" value="2"<%=_18.intValue() == 2 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> 2-3 years<BR>
			<INPUT type=radio name="_18" value="3"<%=_18.intValue() == 3 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> 3-4 years<BR>
			<INPUT type=radio name="_18" value="4"<%=_18.intValue() == 4 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> more than 4 years<BR>
			<INPUT type=radio name="_18" value="5"<%=_18.intValue() == 5 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> not actively involved<BR>
			<INPUT type=radio name="_18" value="6"<%=_18.intValue() == 6 ? " checked=\"checked\"" : ""%><%=isSubmitted?" DISABLED":""%>> from a non-staffed campus
		</DIV>
		</TD>
	</TR>
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">19)</TD>
		<TD CLASS="appquestion">
		What outreaches have you been involved with other than Campus Crusade?<BR>
		(Check all the apply.)
		<DIV CLASS="applist">
            <%=PersonCheckBox(isSubmitted, personHash, "_19a",NoEditAfterSubmit)%> local church<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_19b",NoEditAfterSubmit)%> Bible study<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_19c",NoEditAfterSubmit)%> summer missions<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_19d",NoEditAfterSubmit)%> musical group<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_19e",NoEditAfterSubmit)%> other
            <INPUT type=text <%=PersonInputValue(isSubmitted, personHash, "_19f",20,NoEditAfterSubmit)%>>
		</DIV>
		</TD>
	</TR>
	<%=mshtmlutils.printInputArea("Please indicate any training you have received. (Include how long the training was and if it was with Campus Crusade for Christ, Impact, Epic or Destino.)<br>Evangelism (testimony, gospel presentation):","20", "textarea", 500, "_20a", (String)personHash.get("_20a"), false)%>
	<%=mshtmlutils.printInputArea("Discipleship:","", "textarea", 500, "_20b", (String)personHash.get("_20b"), false)%>
	<%=mshtmlutils.printInputArea("Small/Large group Bible studies (including both leading and attending):","", "textarea", 500, "_20c", (String)personHash.get("_20c"), false)%></td></tr>
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">21)</TD>
		<TD CLASS="appquestion">
		Do you hold a regular position in your local campus ministry?

		<DIV CLASS="applist"><%=PersonYesNo(isSubmitted, personHash, "_21j",NoEditAfterSubmit)%></DIV>	<!-- TODO!!!!!! It's not 11a! -->
		(Check all that apply)
		<DIV CLASS="applist">
			<%=PersonCheckBox(isSubmitted, personHash, "_21a",NoEditAfterSubmit)%> emcee or weekly meeting leader<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_21b",NoEditAfterSubmit)%> song/music leader<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_21c",NoEditAfterSubmit)%> social coordinator<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_21d",NoEditAfterSubmit)%> Bible study leader<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_21e",NoEditAfterSubmit)%> prayer coordinator<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_21f",NoEditAfterSubmit)%> planning weekly meeting<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_21g",NoEditAfterSubmit)%> promotional/special events<BR>
            <%=PersonCheckBox(isSubmitted, personHash, "_21h",NoEditAfterSubmit)%> other
			<INPUT type=text <%=PersonInputValue(isSubmitted, personHash, "_21i",20,NoEditAfterSubmit)%>>
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