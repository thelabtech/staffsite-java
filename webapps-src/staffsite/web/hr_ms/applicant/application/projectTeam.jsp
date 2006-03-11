<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<%@ include file="header.jspf" %>
<%
	personHash = infoBean.getWsnApplicationHash(userID,userEmail);
	WsnApplicationID = (String)personHash.get("WsnApplicationID");
	String projectID = (String)personHash.get("FinalWsnProjectID");
	Hashtable project = infoBean.getProject(projectID);
	Collection friends = infoBean.getParticipants(projectID);
	Hashtable pcHash = infoBean.getProjectCoordinator(projectID);
	Hashtable pdHash = infoBean.getProjectDirector(projectID);
	Hashtable apdHash = infoBean.getAssosciateProjectDirector(projectID);
%>
<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<!-- the following CurrentEmail field is necessary in order that the person's SSM Email Address (added by infoBean.getWsnApplicationHash()) is persisted back to the database when the WsnApplicationID is "new"-->
<INPUT TYPE="hidden" NAME="CurrentEmail" <%=(String)personHash.get("CurrentEmail") == null? "" : " value= \""+(String)personHash.get("CurrentEmail")+"\""%>>

<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">
			<div class="pageheading"><%=project.get("Name")%></div><br />
			<% if (pcHash != null) {
				out.println("<b>Project Coordinator:</b><br />");
				out.println("<div style=\"margin-left:15px;\">"+pcHash.get("LegalFirstName")+" "+pcHash.get("LegalLastName")+"</div><br />");
			} %>
			<% if (pdHash != null) {
				out.println("<b>Project Director:</b><br />");
				out.println("<div style=\"margin-left:15px;\">"+pdHash.get("LegalFirstName")+" "+pdHash.get("LegalLastName")+"</div><br />");
			} %>
			<% if (apdHash != null) {
				out.println("<b>Asosciate Project Director:</b><br />");
				out.println("<div style=\"margin-left:15px;\">"+apdHash.get("LegalFirstName")+" "+apdHash.get("LegalLastName")+"</div><br />");
			} %>
			<% Iterator itr = friends.iterator();
				if (itr.hasNext()) {
					out.println("<b>Other students on this project:</b><br />");
					out.println("<div style=\"margin-left:15px;\">");
					while(itr.hasNext()) {
						Hashtable participantHash = (Hashtable)itr.next();
						if(!(participantHash.get("WsnApplicationID").equals(WsnApplicationID)))
							out.println(participantHash.get("LegalFirstName")+" "+participantHash.get("LegalLastName")+" [<a href=\"mailto:"+participantHash.get("CurrentEmail")+"\">email</a>]<br />");
					}
					out.println("</div><br />");
				}
			%>
		</TD>
	</TR>
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button">
				<% if (pageNum == 1) { %>
				&nbsp;
				<% } else { %>
				<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A>
				<% } %>
				</TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button">
				<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A>
				</TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button">
				<% if (pageNum == pages.length) { %>
				<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[0]%>')">Home&gt;&gt;</A>
				<% } else { %>
				<A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum]%>')">Next&gt;&gt;</A>
				<% } %>
				</TD>
			</TR>
</TABLE>
<%@ include file="footer.jspf" %>