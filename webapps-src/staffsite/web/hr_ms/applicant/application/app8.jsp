<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<%=mshtmlutils.printInputArea("Do you have any particular conditions which may limit you, such as serious allergies requiring medication, back problems, limited mobility, extremely poor eyesight, hearing loss, etc. ?","29", "yesno", 0, "_29a", ((Boolean)personHash.get("_29a")).toString(), false)%>
	<%=mshtmlutils.printInputArea("If yes, please specify:","", "textarea", 750, "_29b", (String)personHash.get("_29b"), false)%>
	<%=mshtmlutils.printInputArea("If you are on medication, can you bring enough to last the entire summer?","", "yesno", 0, "_29c", ((Boolean)personHash.get("_29c")).toString(), false)%>
	<%=mshtmlutils.printInputArea("If yes, please specify:","", "textarea", 750, "_29f", (String)personHash.get("_29f"), false)%>
	<%=mshtmlutils.printInputArea("Are you currently or have you been under a doctor's care in the past year?","", "yesno", 0, "_29d", ((Boolean)personHash.get("_29d")).toString(), false)%>
	<%=mshtmlutils.printInputArea("If yes, please specify:","", "textarea", 750, "_29e", (String)personHash.get("_29e"), false)%>
		</TD>
	</TR>
<!--	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">29)</TD>
		<TD CLASS="appquestion">
		Do you have any particular conditions which may limit you, such as serious allergies requiring medication, back problems, limited mobility, extremely poor eyesight, hearing loss, etc. ?	
		<DIV CLASS="applist"><%=util.yesNo("_29a",((Boolean)personHash.get("_29a")).toString())%> &nbsp; If yes, please specify:</DIV>
<TR><TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">29)</TD><TD CLASS="appquestion">Do you have any? Old Stuff
		<DIV CLASS="applist"><TEXTAREA onFocus="Highlight(this)" onBlur="UnHighlight(this)" name="_29b" rows=7 cols=50><%=(String)personHash.get("_29b") == null? "" : (String)personHash.get("_29b")%></TEXTAREA></DIV>
		If you are on medication, can you bring enough to last the entire summer?<BR>
		<DIV CLASS="applist"><%=util.yesNo("_29c",((Boolean)personHash.get("_29c")).toString())%></DIV>
		Are you currently or have you been under a doctor's care in the past year?
		<DIV CLASS="applist"><%=util.yesNo("_29d",((Boolean)personHash.get("_29d")).toString())%> If yes, please explain:</DIV>
		<DIV CLASS="applist"><TEXTAREA onFocus="Highlight(this)" onBlur="UnHighlight(this)" name="_29e" rows=5 cols=50><%=(String)personHash.get("_29e") == null? "" : (String)personHash.get("_29e")%></TEXTAREA></DIV>
		</TD>
	</TR>-->
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