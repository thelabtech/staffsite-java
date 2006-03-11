<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<%=mshtmlutils.printInputArea("Write a brief statement of how you came to know Jesus Christ personally.","30", "textarea", 750, "_30", (String)personHash.get("_30"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("List your specific reasons for believing God is leading you to a summer project.","31", "textarea", 750, "_31", (String)personHash.get("_31"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("Specify your objectives for this summer, both for yourself and for your ministry.","32", "textarea", 750, "_32", (String)personHash.get("_32"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("What in your opinion are your strengths (character traits / abilities / skills)?<BR>What are your weaknesses?","33", "textarea", 750, "_33", (String)personHash.get("_33"), true)%></td></tr>
	<%=mshtmlutils.printInputArea("Describe your relationship with your parents.  Have you discussed with them your desire to attend a summer project?  What was their response?","34", "textarea", 750, "_34", (String)personHash.get("_34"), true)%></td></tr>
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