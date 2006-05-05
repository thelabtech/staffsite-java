<%@ page import="org.alt60m.ministry.model.dbio.*,org.alt60m.wsn.sp.model.dbio.*,java.util.*" %>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean" />
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="formatter" class="org.alt60m.html.Formatter" scope="request"/>


<% Hashtable h = (Hashtable) session.getValue("tub"); %>
<% String highlightYellow = "style=\"background-color: #FFFF00\""; %>
<% Collection questionList = (Collection)h.get("Questions");%>
<% String projectID = (String) h.get("id");%>

<HTML>
<HEAD>
<TITLE>Project Specific Application Questions</TITLE>

<%@ include file="/validate.js" %>

</HEAD>

<% String pageTitle = "Project Specific Application Questions"; %>
<%@ include file="wsnspheader.jspf"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		var form = document.questions;
		form.action.value = action;
		form.submit();
	}
//-->
</SCRIPT>
<p> &nbsp;

<TABLE WIDTH="100%" BORDER="0">
<TR><td colspan='2'><font face="arial" size="3" color="#000000"><b>Project Specific Application Questions</b></td></font>
<td colspan='2'> &nbsp; </td>

<!-- ------------TOOL BOX---------- -->
<td rowspan='7' colspan='2' align='center' valign='top' nowrap>
<%=fontTextL%><b>Available Tools</font></b><br>
	<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=<%=session.getValue("MyHomeAction")%>"><IMG SRC="/wsnsp/images/wsn_myhome.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="My WSN Home"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=appinfo"><IMG SRC="/wsnsp/images/wsn_addapp.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Applicant"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/servlet/WsnSpController?action=clearTub&view=staffappsearch"><IMG SRC="/wsnsp/images/wsn_addstaff.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Add Staff"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistapps.jsp"><IMG SRC="/wsnsp/images/wsn_searchpeople.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Applicant"></a></TD></tr>
		<tr valign='top'><td colspan=2><a href="/wsnsp/dbio/filterlistprojects.jsp"><IMG SRC="/wsnsp/images/wsn_searchproj.gif" WIDTH="102" HEIGHT="16" BORDER=0 ALT="Search Projects"></a></TD></tr>
	</TABLE>
	<%=fontTextL%><b>Links</font></b><br>
	<table width='100%' border='1' bgcolor="<%=bordercolor%>" bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr valign='top'><td colspan=2><%=fontTextM%><a href="JavaScript: popupWindow('/cms/content/00000129400.htm', 'WSNSPTHelp', 'scrollbars=yes,resizable')">Q & A</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><A HREF="/servlet/CmsController?action=browse&catId=1000029" target='_blank'>Resource Center</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href="/servlet/CmsController?action=browse&catId=00000056972" target='_blank'>Leader's Notebook</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href="/cms/content/00000038954.doc" target='_blank'>Applicant Flowchart</a></font></TD></tr>
<tr valign='top'><td colspan=2><%=fontTextM%><a href='/wsnsp/dbio/info_old.jsp'>Old Announcements</a></font></TD></tr>
	</TABLE>
</td>
</tr>

<TR>
<!--
<TD
	VALIGN="TOP"
	WIDTH="150">
		&nbsp;
</TD>
-->
<TD VALIGN="TOP">
<FORM NAME='questions'
	ACTION="/servlet/WsnSpController"
	METHOD="post">
<INPUT TYPE=hidden NAME="id" VALUE="<%=projectID%>">
<INPUT TYPE=hidden NAME="action" VALUE="updateQuestionOrder">
<INPUT TYPE=hidden NAME="view" VALUE="showprojectinfo">
<INPUT TYPE=hidden NAME="orderCol" VALUE="<%=h.get("orderCol")%>">
<INPUT TYPE=hidden NAME="order" VALUE="<%=h.get("order")%>">

<TABLE
	BORDER="1"
	CELLSPACING="0"
	WIDTH="100%"
	CLASS="box" >
	<%
	
if(questionList.size() > 0){		
	Iterator questions = questionList.iterator();


	formatter.setHeaderNames(new String[] {"Order", "Question", "Answer Type", "Required", "Answers", ""});
	formatter.setHeaderSorts(new boolean[] {true, true, true, true, false, false});
	formatter.setHeaderWidths(new String[] {"12%", "*", "18%", "10%", "7%", "7%"});
	formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "CENTER", "CENTER", "", ""});
%>
	<font face="arial" size="2" color="#000000">
	<%= formatter.displayHeader( (String)h.get("orderCol"), (String)h.get("order"), "Questions Table", "/servlet/WsnSpController?action=listQuestions&id="+projectID)%>
	</font>
	<INPUT
		TYPE="hidden"
		NAME="questionSize"
		Value="<%=questionList.size()%>">
	
		<%
	for(int i = 0; questions.hasNext(); i++){
		Hashtable questionHash = (Hashtable)questions.next();
		Question question = new Question(((Integer)questionHash.get("QuestionID")).intValue());
		Answer a = new Answer();
		a.setQuestion(question);
		int aCount = a.count();
%>
	<INPUT
		TYPE="hidden"
		NAME="<%=i%>QuestionID"
		Value="<%=question.getQuestionID()%>">
	<TR>
		<TD
			VALIGN="CENTER"><INPUT
			CLASS="required"
			onFocus="Highlight(this)"
			onBlur="UnHighlight(this)"
			NAME="<%=i%>DisplayOrder"
			size=2
			maxlength=3
			value="<%=question.getDisplayOrder()%>"></TD>
		<TD
			VALIGN="CENTER"><font face="arial" size="2" color="#000000"><%=question.getQuestionText().getBody()%></font></TD>
		<TD
			VALIGN="CENTER"
			ALIGN="CENTER"><font face="arial" size="2" color="#000000"><%=formatter.displayArrayName(question.getQuestionText().getAnswerType(), QuestionText.answerTypes, QuestionText.answerTypeNames)%></font></TD>
		<TD
			VALIGN="CENTER"
			ALIGN="CENTER"><font face="arial" size="2" color="#000000"><%=question.getRequired() ? "Yes" : "No"%></font></TD>
		<TD
			VALIGN="CENTER"
			ALIGN="CENTER"><font face="arial" size="2" color="#000000"><A
			CLASS="button"
			HREF="/servlet/WsnSpController?action=editQuestionDetails&id=<%=projectID%>&questionID=<%=question.getQuestionID()%>">Edit</A></font></TD>
		<TD
			VALIGN="CENTER"
			ALIGN="CENTER"><font face="arial" size="2" color="#000000"><A
			CLASS="button"
			HREF="/servlet/WsnSpController?action=deleteQuestion&id=<%=projectID%>&questionID=<%=question.getQuestionID()%>"
			onMouseOver="return overlib('<B>WARNING!</B><BR>This is not undoable!');"
			onMouseOut="return nd();">Delete</A></font></TD>
	</TR>
	<%
	}
} else {
%>
	<TR>
		<TD
			ALIGN="CENTER"
			COLSPAN="8">There aren't any items to display</TD>
	</TR>
	<%
}
%>
	<TR>
		<TD
			ALIGN="CENTER"
			COLSPAN="8">
		<TABLE
			CELLSPACING="5"
			CELLPADDING="0"
			BORDER="0"
			WIDTH="100%">
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/WsnSpController?view=showprojectinfo&action=showProj&id=<%=projectID%>"
					CLASS="button">Cancel</A></TD>
				<%
		if(questionList.size() > 1){
%>
				<TD
					CLASS="button"
					ALIGN="CENTER"><A
					HREF="javascript: document.questions.submit()"
					NAME="rearrange"
					CLASS="button">Rearrange Questions</A></TD>
				<%
		}
%>
				<TD
					CLASS="button"
					ALIGN="CENTER"><A
					HREF="/servlet/WsnSpController?action=newQuestion&id=<%=projectID%>&order=<%=h.get("order")%>&orderCol=<%=h.get("orderCol")%>"
					CLASS="button">New Question</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveQuestions')"
					NAME="save"
					CLASS="button">Save Changes</A></TD>
			</TR>

		</TABLE>
		</TD>
	</TR>
</TABLE>
</FORM>
<P>
<TABLE
	BORDER="0"
	CELLSPACING="0"
	WIDTH="100%"
	CLASS="box">
	<TR>
		<TD CLASS="boxheader">Instructions</TD>
	</TR>
	<TR>
		<TD CLASS="cell">
		<font face="arial" size="2" color="#000000"><p>From this page you may create additional questions to get
		information for planning your project. To start, select "New Question." This
		will allow you to write your own question. If you need to rearrange
		the order of your questions, you may type numbers in the boxes to
		the left, then click "Rearrange Questions" (if you do not click
		"Rearrange Questions" before making additional changes, all of your
		numbers will revert to 0).</p></font>
		</TD>
	</TR>
</TABLE>
</TD>
</TR>

</TABLE>

<%@ include file="wsnspfooter.jspf"%>
</HTML>