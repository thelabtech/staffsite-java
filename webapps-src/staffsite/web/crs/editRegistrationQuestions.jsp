<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="helper"
	class="org.alt60m.crs.html.QuestionHelper" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Registration registration = (Registration)ar.getObject("registration");
	Conference conference = (Conference)ar.getObject("conference");

	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Questions for " + registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName();
%>
<%@ include file="/crs/e_header.jspf"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.theForm;
		if(!requiredFilled(form)){
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
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"
			ROWSPAN="3"><%=toolsMenu.display(0)%>
		<P><%=conferenceMenu.display(2)%>
		</TD>
		<TD
			VALIGN="TOP"
			COLSPAN="2">
		<FORM
			NAME='theForm'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"> <INPUT
			TYPE=hidden
			NAME="registrationID"
			VALUE="<%=ar.getValue("registrationID")%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="4"><%=registration.getPerson().getFirstName()%>'s
				Questions for <%=conference.getName()%></TD>
			</TR>
			<%
		if(ar.getCollection("questions").size() > 0){		
			Iterator questions = ar.getCollection("questions").iterator();
			Iterator answers = ar.getCollection("answers").iterator();
			Hashtable hashAnswers = new Hashtable();
			while(answers.hasNext()){
				Answer nextAnswer = (Answer)answers.next();
				hashAnswers.put(String.valueOf(nextAnswer.getQuestionID()), nextAnswer.getBody());
			}

			for(int i = 1; questions.hasNext(); i++){
				Question question = (Question)questions.next();
				String answer = hashAnswers.get(String.valueOf(question.getQuestionID())) == null ? "" : (String)hashAnswers.get(String.valueOf(question.getQuestionID()));
				helper.setAnswerType(question.getAnswerType());
%>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					ALIGN="LEFT"
					VALIGN="TOP"
					WIDTH="*"
					COLSPAN="4"><%=helper.print(question.getBody(), String.valueOf(question.getQuestionID()), question.getRequired(), " (" + question.getAnswerType() + ") ", answer,2500)%></TD>
			</TR>
			<%
			}
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
					COLSPAN="4"
					ALIGN="CENTER"><B><%=conference.getName()%></B> has no staff
				questions</TD>
			</TR>
			<%
		}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="8">
				<TABLE
					CELLSPACING="0"
					CELLPADDING="0"
					BORDER="0"
					WIDTH="100%">
					<TR>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=showRegistration&registrationID=<%=registration.getRegistrationID()%>"
							CLASS="button">Cancel</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"><A
							HREF="javascript: goNext('saveRegistrationQuestions', 'save')"
							NAME="save"
							CLASS="button">Save Changes</A></TD>
					</TR>
				</TABLE>
				</TD>
			</TR>
		</TABLE>
		</FORM>
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
