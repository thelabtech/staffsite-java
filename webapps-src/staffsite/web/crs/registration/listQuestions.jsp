<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<jsp:useBean id="helper" class="org.alt60m.crs.html.QuestionHelper"/>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Registration registration = (Registration)ar.getObject("registration");
	RegistrationType regType = registration.getRegistrationType();
	Conference conference = (Conference)ar.getObject("conference");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));

	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	String pageTitle = "Questions for " + registration.getFirstName() + " " + registration.getLastName();
%>
<%@ include file="/crs/e_user_header.jspf" %>
<%
	registrationMenu.setActives(new boolean[]{
		true,
		true, 
		true, 
		true, 
		true, 
		true, 
		true, 
		true, 
		false, 
		false, 
		true
	});
otherOptionsMenu.setActives(new boolean[]{
		true,
		true,
		true
	});
	

	accountManagementMenu.setActives(new boolean[]{
		true
	});
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		var form = document.theForm;

		if(!requiredFilled(form)){
			alert("You must fill out all of the required fields to continue.");
		} else {
			document.theForm.action.value = action;
			document.theForm.submit();
		}
	}
//-->
</SCRIPT>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
<TR>
	<TD VALIGN="TOP" WIDTH="150" ROWSPAN="3">
		<%=registrationMenu.display(isSpouse ? 5 : 2)%>
		<p>
		<%=otherOptionsMenu.display(0)%>
		<P>
		<TABLE CLASS="box" WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
			<TR><TD CLASS="subboxheader">Key</TD></TR>
			<TR><TD CLASS="cell"><INPUT CLASS="required" VALUE="Required Fields"></TD></TR>
			<TR><TD CLASS="cell"><INPUT CLASS="empty" VALUE="Optional Fields"></TD></TR>
		</TABLE>
		<P>
		<%=accountManagementMenu.display(0)%>
	</TD>
	<TD VALIGN="TOP" COLSPAN="2">
	<FORM NAME='theForm' ACTION="/servlet/CRSRegister" METHOD="post">
	<INPUT TYPE=hidden NAME="action">
	<%
	if(isSpouse){
	%>
	<input TYPE=hidden VALUE="T" NAME="spouseReg">				
	<%
	}
	%>
	<input TYPE="hidden" NAME="activeID" VALUE="<%=registration.getRegistrationID()%>"> 
	<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2"><%=registration.getFirstName()%>'s Questions for <%=conference.getName()%></TD>
		</TR>
		<TR>
			<TD COLSPAN="2">
<%
		if(ar.getCollection("Questions").size() > 0){		
			
			if(isSpouse)
			{
				%>
				<div class="cell">Please answer the following questions on behalf of your spouse.</div>
				<%
			}
			Iterator questions = ar.getCollection("Questions").iterator();
			Iterator answers = ar.getCollection("Answers").iterator();
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
					<%=helper.print(question.getBody(), String.valueOf(question.getQuestionID()), question.getRequired(), " (" + question.getAnswerType() + ") ", answer,7000)%> 
<%
			}
			/* askSpouse, askChildren, askCommute  */
			if (regType.getAskSpouse()){
			}
			if (regType.getAskChildren()){
			}
			
			
		} else {
%>
			<div class="cell"><B><%=conference.getName()%></B> has no questions</div>
<%
		}
%>
			</TD>
		</TR>
		<TR>
			<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSRegister?action=editPersonDetails<%=isSpouse ? "&spouseReg=T" : ""%>" CLASS="button">&lt; &lt; Back</A></TD>
			<TD CLASS="button" ALIGN="RIGHT"><A HREF="javascript: goNext('saveRegistrationQuestions')" CLASS="button">Next &gt; &gt;</A></TD>
		</TR>
	</TABLE>
	<P>
	<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<TR>
			<TD CLASS="boxheader" COLSPAN="2">Instructions</TD>
		</TR>
		<TR>
			<TD CLASS="cell" COLSPAN="2">This page contains information administrators use to make room assignments, coordinate rides, and plan other important conference details.</TD>
		</TR>
	</TABLE>
	</FORM>
	</TD>
</TR>
</TABLE>
<%@ include file="/crs/e_user_footer.jspf" %>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
