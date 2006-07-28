<%@ page import="org.alt60m.ministry.model.dbio.*,org.alt60m.wsn.sp.model.dbio.*,java.util.*" %>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean" />
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="formatter" class="org.alt60m.html.Formatter" scope="request"/>


<% Hashtable h = (Hashtable) session.getValue("tub"); %>
<% String highlightYellow = "style=\"background-color: #FFFF00\""; %>
<% Question q = new Question((String)h.get("questionID"));%>
<% if(h.get("questionID").equals("")) {q.getQuestionText().setStatus("custom");} %>
<% String projectID = (String) h.get("id");%>

<HTML>
<HEAD>
<TITLE>Edit Question Details</TITLE>

<%@ include file="/validate.js" %>

</HEAD>

<% String pageTitle = "Edit Question Details"; %>
<%@ include file="wsnspheader.jspf"%>

<p> &nbsp;

<TABLE WIDTH="100%" BORDER="0">
<TR><td colspan='2'><font face="arial" size="3" color="#000000"><b>Edit Question Details</b></font></td>
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
<TD VALIGN="TOP">
<TABLE
WIDTH="100%"
ALIGN="CENTER"
CELLPADDING="0"
CELLSPACING="10">
<TR>
	<TD VALIGN="TOP">
	<FORM
		NAME='theForm'
		ACTION="/servlet/WsnSpController"
		METHOD="post"><INPUT
		TYPE=hidden
		NAME="action"
		VALUE="saveQuestionDetails"> <INPUT
		TYPE=hidden
		NAME="QuestionID"
		VALUE="<%=q.getQuestionID()%>"> <INPUT
		TYPE=hidden
		NAME="QuestionTextID"
		VALUE="<%=q.getQuestionTextID()%>"> <INPUT
		TYPE=hidden
		NAME="ProjectID"
		VALUE="<%=projectID%>">  <INPUT
		TYPE=hidden
		NAME="id"
		VALUE="<%=projectID%>"> <INPUT
		TYPE=hidden
		NAME="order"
		VALUE="<%=h.get("order")%>"> <INPUT
		TYPE=hidden
		NAME="orderCol"
		VALUE="<%=h.get("orderCol")%>">
	<TABLE
		BORDER="0"
		CELLSPACING="0"
		WIDTH="100%"
		CLASS="box">
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT"
				VALIGN="TOP"><font face="arial" size="2" color="#000000">Question<br>
			(max 250 characters)</font></TD>
			<TD CLASS="cell"><TEXTAREA
				COLS="60"
				ROWS="2"
				maxlength= "250"
				NAME="Body"
				CLASS="required"
				onFocus="Highlight(this)"
				onBlur="UnHighlight(this)"
				onKeyDown="textCounter(this.form.Body,this.form.remLenBody,250);"
				onKeyUp="textCounter(this.form.Body,this.form.remLenBody,250);"
				><%=q.getQuestionText().getBody()%></TEXTAREA>
				<% int tmpLength = 250 - q.getQuestionText().getBody().length(); %>
				<div class="small" align="right"><font face="arial" size="2" color="#000000">Characters remaining: </font><input type="text" name="remLenBody" size="3" disabled="disabled" maxlength="3" value="<%=tmpLength%>"></div></TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT"
				VALIGN="TOP"><font face="arial" size="2" color="#000000">Answer Type</font></TD>
			<TD CLASS="cell"><%
		formatter.setSelectName("AnswerType");
		//formatter.setSelectDisabled(common);
		formatter.setSelectOptionNames(QuestionText.answerTypeNames);
		formatter.setSelectOptions(QuestionText.answerTypes);
		formatter.setSelectClass("required");
%> <%=formatter.displaySelect(q.getQuestionText().getAnswerType())%></TD>
		</TR>
		<% 
	selBool.setLabels("Yes","No");
%>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT"
				VALIGN="CENTER"><font face="arial" size="2" color="#000000">Required</font></TD>
			<TD CLASS="cell"><font face="arial" size="2" color="#000000"><%
		selBool.setCurrentValue(q.getRequired());
		selBool.setName("Required");
%> <%=selBool.printRadioBoolean()%></font></TD>
		</TR>
		<TR>
			<TD
				CLASS="button"
				ALIGN="LEFT"><A
				HREF="/servlet/WsnSpController?action=listQuestions&id=<%=projectID%>"
				CLASS="button">Cancel</A></TD>
			<TD
				CLASS="button"
				ALIGN="RIGHT"><A
				HREF="JavaScript:theForm.submit()"
				NAME="save"
				CLASS="button">Save</A></TD>
		</TR>
	</TABLE>
	</FORM>
	<p></p>
	<TABLE
		BORDER="1"
		CELLSPACING="0"
		WIDTH="100%"
		CLASS="box">
		<TR>
			<TD CLASS="boxheader">Instructions</TD>
		</TR>
		<TR>
			<TD CLASS="cell">Enter the new question into the yellow, mandatory
			field. Use the "answer type" menu to format how
			you want people to respond to the question (see <A HREF="#answerKey">Answer
			Type Key</A>). If you want to require applicants to answer this
			question before moving on to the next screen, click "Yes" beside
			"Required" (if you click "no," the question will be asked but
			applicants will be able to skip it if they want).</TD>
		</TR>
	</TABLE>
	<P>
	<TABLE
		BORDER="1"
		CELLSPACING="0"
		WIDTH="100%"
		CLASS="box">
		<TR>
			<TD
				CLASS="boxheader"
				COLSPAN="2"><A NAME="answerKey">Answer Type Key</TD>
		</TR>
		<TR>
			<TD
				CLASS="cell"
				COLSPAN="2">If you have never set up a project
			before, it is suggested that you experiment with all of these answer
			types in order to figure out what they look like on the actual
			project application, before you actually have people start
			applying for your project.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT"
				WIDTH="20%">Section Divider</TD>
			<TD CLASS="cell">Not a question, but a way to separate groupings of
			questions. Basically, a text section title. Example: "The following
			questions deal with your personal testimony."</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Section Info</TD>
			<TD CLASS="cell">Additional text about this section of questions,
			usually inserted after a Section Divider. Example: "Your personal
			testimony is the story of how you came to know Christ and what He
			has done in your life."</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Yes or No</TD>
			<TD CLASS="cell">This will give registrants a drop down menu, from
			which they can select "yes" or "no."</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Check box</TD>
			<TD CLASS="cell">This allows you to build a list of items, from
			which registrants can choose as many as apply to them. To set this
			up, first add a question with a Section Divider or Section Info
			answer type, such as "Which of the following would you be willing to
			do at this conference?" Then, add a question with a Check Box answer
			type for each of the items that you want on your list, such as one
			question for "lead music," another question for "set up chairs,"
			another question for "cook breakfast," etc.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">1-10</TD>
			<TD CLASS="cell">The numbers 1 through 10, with radio buttons for
			the registrant to select one, will be displayed beneath the text you
			enter in the "question" field.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Date</TD>
			<TD CLASS="cell">Registrants will given a date field in which they
			must type a date in MM/DD/YYYY format.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">T-shirt Size</TD>
			<TD CLASS="cell">Registrants will choose S, M, L, XL or XXL from a
			dropdown menu.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Single Character</TD>
			<TD CLASS="cell">This provides a text box into which registrants may
			enter a single character.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Small Text</TD>
			<TD CLASS="cell">This provides a text box into which registrants may
			enter up to 15 characters.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Medium Text</TD>
			<TD CLASS="cell">This provides a text box into which registrants may
			enter up to 30 characters.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Paragraph</TD>
			<TD CLASS="cell">This provides a text box into which registrants may
			enter as much text as they want.</TD>
		</TR>
		<TR>
			<TD
				CLASS="hl"
				ALIGN="RIGHT">Custom dropdown</TD>
			<TD CLASS="cell">This provides a standard drop down menu. To
			populate your menu, put the options in the "question" field,
			separated by semicolons. Since this does not have an associated
			question text, use a question with Section Divider or Section Info
			answer type above it. Example: Add the question "Which seminar do
			you want to attend?" with Section Info as the answer type, then add
			another question "Creationism; Theology; Evangelism; Bible Study"
			with Custom Dropdown as the answer type.</TD>
		</TR>
	</TABLE>
	</TD>
</TR>
</TABLE>

</TR>
</TABLE>

<%@ include file="wsnspfooter.jspf"%>
</HTML>