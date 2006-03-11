<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<INPUT TYPE="HIDDEN" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<!--
	Since checkboxes do not return a value pair if check box is unchecked, we will insert an "Checkbox<fieldname>"
	hidden field for each checkbox field.  If this field exists, the save function will check to see if the
	expected field is there.  If not, adds it as a FALSE.  If there, changes it from ON to TRUE.  This assumes that
	the checkboxes are boolean in the database, and char[FT] in the persistance object.
-->
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">1)</TD>
		<TD CLASS="appquestion">
			Are you considering or interested in:
			<DIV CLASS="applist">

				<%=PersonCheckBox(isSubmitted, personHash, "_1a",NoEditAfterSubmit)%> Campus Crusade for Christ, Impact, Destino or Epic staff<BR>
				<%=PersonCheckBox(isSubmitted, personHash, "_1b",NoEditAfterSubmit)%> 9-12 month internship<BR>
				<%=PersonCheckBox(isSubmitted, personHash, "_1c",NoEditAfterSubmit)%> Missions<BR>
				<%=PersonCheckBox(isSubmitted, personHash, "_1d",NoEditAfterSubmit)%> Other ministries
			</DIV>
			<%=mshtmlutils.printInputArea("Have you participated in a Campus Crusade / Impact / Destino / Epic project before?","", "yesno", 0, "_1e", ((Boolean)personHash.get("_1e")).toString(), false)%>
			<%=mshtmlutils.printInputArea("If yes, which one(s)?  Did you fulfill your support commitment on your previous project(s)?","", "textarea", 300, "_1f", (String)personHash.get("_1f"), false)%>

            <%=PersonCheckBox(isSubmitted, personHash, "IsApplyingForStaffInternship",NoEditAfterSubmit)%>
            Apply to be a <b>Summer Project Staff Intern</b> by clicking here and obtaining one additional spiritual leader reference (two spiritual leader references total).  This is for the student who is looking for a greater leadership challenge and has been involved in a summer project before.
		</TD>
	</TR>
	<%=mshtmlutils.printInputArea("Are you a U.S. citizen?","2", "yesno", 0, "UsCitizen", ((Boolean)personHash.get("UsCitizen")).toString(), false)%>
		If No, please answer the following:
		<DIV CLASS="applist">What country are you a citizen of?
		<DIV CLASS="applist"><INPUT TYPE=text <%=PersonInputValue(isSubmitted, personHash, "_2b",20,NoEditAfterSubmit)%>></DIV>
		<%=mshtmlutils.printInputArea("Can you get a work visa?","", "yesno", 0, "_2c", ((Boolean)personHash.get("_2c")).toString(), false)%>
		</TD>
	</TR>
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">3)</TD>
		<TD CLASS="appquestion">
			High school honors, activities and leadership<BR>
			(Check all the apply)
			<DIV CLASS="applist">
                <%=PersonCheckBox(isSubmitted, personHash, "_3a",NoEditAfterSubmit)%> A. Scholastic Honors<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_3b",NoEditAfterSubmit)%> B. Class Officer<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_3c",NoEditAfterSubmit)%> C. Student Council<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_3d",NoEditAfterSubmit)%> D. Club Memberships<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_3e",NoEditAfterSubmit)%> E. Drama and/or Music<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_3f",NoEditAfterSubmit)%> F. Athletics<BR>
				<%=PersonCheckBox(isSubmitted, personHash, "_3g",NoEditAfterSubmit)%> G. Other
				<INPUT TYPE=text <%=PersonInputValue(isSubmitted, personHash, "_3h",20,NoEditAfterSubmit)%>>
			</DIV>
		</TD>
	</TR>
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">4)</TD>
		<TD CLASS="appquestion">
			College honors, activities and leadership<BR>
			(Check all the apply)
			<DIV CLASS="applist">
				<%=PersonCheckBox(isSubmitted, personHash, "_4a",NoEditAfterSubmit)%> A. Scholastic Honors<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_4b",NoEditAfterSubmit)%> B. Student Government<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_4c",NoEditAfterSubmit)%> C. Fraternity/Sorority<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_4d",NoEditAfterSubmit)%> D. Resident Assistant<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_4e",NoEditAfterSubmit)%> E. Club Memberships<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_4f",NoEditAfterSubmit)%> F. Drama and/or Music<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_4g",NoEditAfterSubmit)%> G. Athletics<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_4h",NoEditAfterSubmit)%> H. Other
				<INPUT TYPE=text <%=PersonInputValue(isSubmitted, personHash, "_4i",20,NoEditAfterSubmit)%>>
			</DIV>
		</TD>
	</TR>
	<TR>
		<TD CLASS="appnumber" VALIGN="TOP" ALIGN="RIGHT">5)</TD>
		<TD CLASS="appquestion">
			Ministry skills and talents<BR>
			(Check all the apply)
			<DIV CLASS="applist">
				<%=PersonCheckBox(isSubmitted, personHash, "_5a",NoEditAfterSubmit)%> A. Drama<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_5b",NoEditAfterSubmit)%> B. Organization<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_5d",NoEditAfterSubmit)%> C. Language
				<INPUT TYPE=text <%=PersonInputValue(isSubmitted, personHash, "_5e",20,NoEditAfterSubmit)%>> (Specify)<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_5c",NoEditAfterSubmit)%> D. Public Speaking<BR>
                <%=PersonCheckBox(isSubmitted, personHash, "_5f",NoEditAfterSubmit)%> E. Music &nbsp; &nbsp; &nbsp;
				<INPUT TYPE=text <%=PersonInputValue(isSubmitted, personHash, "_5g",20,NoEditAfterSubmit)%>> (Specify instrument/voice)

			</DIV>
	<%=mshtmlutils.printInputArea("Would you be interested in helping lead music on project?","", "yesno", 0, "_5h", ((Boolean)personHash.get("_5h")).toString(), false)%>
		</TD>
	</TR>
	<%=mshtmlutils.printInputArea("How have you spent your last two summers?","6", "textarea", 750, "_6", (String)personHash.get("_6"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("Employment experience<BR>(Name/Job Title/Dates of Employment, most recent first):","7", "textarea", 1000, "_7", (String)personHash.get("_7"), false)%></td></tr>
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