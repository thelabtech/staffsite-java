<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	String label = (String)ar.getValue("label");
	Question q = (Question)ar.getObject("question");
	boolean common = q.getQuestionText().getStatus().equals("common");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean onlyOneRegType = (session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true"))||(ar.getValue("onlyOneRegType") != null && ((String)ar.getValue("onlyOneRegType")).equals("true"));
	
	String pageTitle = "Edit Question";
	Conference conference = (Conference)ar.getObject("conference");
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		if(form.AnswerType.value != "divider" && !requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else {
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.submit();
			}
		}
	}
//-->
</SCRIPT>
<%@ include file="/crs/e_header.jspf"%>
<%
if(newEvent){
	creationMenu.setActives(new boolean[]{
		true,
		true, 
		true, 
		false
	});
}
%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150">
			<%=toolsMenu.display(0)%><P>
			<%=newEvent ? creationMenu.display(3) : conferenceMenu.display(8)%>

				</TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='theForm'
			ACTION="/servlet/CRSAdmin"
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
			NAME="ConferenceID"
			VALUE="<%=session.getValue("eventLoggedIn")%>"> <INPUT
			TYPE=hidden
			NAME="order"
			VALUE="<%=ar.getValue("order")%>"> <INPUT
			TYPE=hidden
			NAME="orderCol"
			VALUE="<%=ar.getValue("orderCol")%>"> <INPUT
			TYPE=hidden
			NAME="Status"
			VALUE="<%=q.getQuestionText().getStatus()%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="2">Question Details</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Question<br>
				(max 250 characters)</TD>
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
					<%=common ? "DISABLED" : ""%>><%=q.getQuestionText().getBody()%></TEXTAREA>
					<% int tmpLength = 250 - q.getQuestionText().getBody().length(); %>
					<div class="small" align="right">Characters remaining: <input type="text" name="remLenBody" size="3" disabled="disabled" maxlength="3" value="<%=tmpLength%>"></div></TD>
			</TR>
			<%if(!newEvent&&!onlyOneRegType){%><TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Registration Type</TD>
				<TD CLASS="cell"><%=label%></TD>
			</TR>
			<%}%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Answer Type</TD>
				<TD CLASS="cell"><%
			formatter.setSelectName("AnswerType");
			formatter.setSelectDisabled(common);
			formatter.setSelectOptionNames(QuestionText.answerTypeNames);
			formatter.setSelectOptions(QuestionText.answerTypes);
			formatter.setSelectClass("required");
%> <%=formatter.displaySelect(q.getQuestionText().getAnswerType())%></TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="TOP">Question Type</TD>
				<TD CLASS="cell"><%=q.getQuestionText().getStatus()%></TD>
			</TR>
			<% 
		selBool.setLabels("Yes","No");
%>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT"
					VALIGN="CENTER">Required</TD>
				<TD CLASS="cell"><%
			selBool.setCurrentValue(q.getRequired());
			selBool.setName("Required");
%> <%=selBool.printRadioBoolean()%></TD>
			</TR>
			<TR>
				<TD
					CLASS="button"
					ALIGN="LEFT"><A
					HREF="/servlet/CRSAdmin?action=listRegTypeQuestions"
					CLASS="button">Cancel</A></TD>
				<TD
					CLASS="button"
					ALIGN="RIGHT"><A
					HREF="javascript: goNext('saveQuestionDetails', 'save')"
					NAME="save"
					CLASS="button">Save</A></TD>
			</TR>
		</TABLE>
		</FORM>
		<p></p>
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">Enter the new question into the yellow, mandatory
				field. Use the "answer type" menu to format how
				you want people to respond to the question (see <A HREF="#answerKey">Answer
				Type Key</A>). If you want to require registrants to answer this
				question before moving on to the next screen, click "Yes" beside
				"Required" (if you click "no," the question will be asked but
				registrants will be able to skip it if they want).</TD>
			</TR>
		</TABLE>
		<P>
		<TABLE
			BORDER="0"
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
					COLSPAN="2">If you have never set up a conference in the CRS
				before, it is suggested that you experiment with all of these answer
				types in order to figure out what they look like on the actual
				registration website, before you actually have people start
				registering for your event.</TD>
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
				enter up to 7000 characters.</TD>
			</TR>
			<TR>
				<TD
					CLASS="hl"
					ALIGN="RIGHT">Region</TD>
				<TD CLASS="cell">This provides a pulldown menu of the ten regions of
				the US Campus Ministry.</TD>
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
		<%@ include file="/crs/e_footer_help.jspf"%>
		</TD>
	</TR>
</TABLE>
<%@ include file="/crs/e_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
