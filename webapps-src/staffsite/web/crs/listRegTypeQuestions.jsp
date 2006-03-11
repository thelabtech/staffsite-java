<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	Conference conference = (Conference)ar.getObject("conference");
	RegistrationType rt = (RegistrationType)ar.getObject("RegistrationType");
	String typeLabel = rt.getLabel();	
	
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean newRegType = session.getValue("newRegType") != null && ((String)session.getValue("newRegType")).equals("true");
	boolean onlyOneRegType = session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true");
	
	String view = ar.getValue("view");
	String pageTitle = "Conference Specific Questions" + (onlyOneRegType?"":(" for "+typeLabel));
%>
<SCRIPT LANGUAGE="JavaScript">
<!--

	function goNextWithRedirect(action, nextAction, buttonname){
		var form = document.questions;
		if(!requiredFilled(form)){
			alert("You must fill out all of the yellow fields to continue.");
		} else {
			if(submitOnce(buttonname)) {
				form.action.value = action;
				form.nextAction.value = nextAction;
				form.submit();
			}
		}
	}
	
	function goNext(action,buttonname){
		goNextWithRedirect(action,null,buttonname);
	}
	function emptyfunction(){
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
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(3) : conferenceMenu.display(8)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM NAME='questions'
			ACTION="/servlet/CRSAdmin"
			METHOD="post">
		<INPUT TYPE=hidden NAME="action" VALUE="updateQuestionOrder">
		<INPUT TYPE=hidden NAME="nextAction">
		<INPUT TYPE=hidden NAME="orderCol" VALUE="<%=ar.getValue("orderCol")%>">
		<INPUT TYPE=hidden NAME="order" VALUE="<%=ar.getValue("order")%>">

		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<%
		if(ar.getCollection("Questions").size() > 0){		
			Iterator questions = ar.getCollection("Questions").iterator();


			formatter.setHeaderNames(new String[] {"Order", "Question", "Answer Type", "Required", "Type", "Answers", "", ""});
			formatter.setHeaderSorts(new boolean[] {true, true, true, true, true, false, false, false});
			formatter.setHeaderWidths(new String[] {"12%", "*", "15%", "10%", "5%", "7%", "7%", "7%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "CENTER", "CENTER", "CENTER", "", "", ""});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Questions Table", "/servlet/CRSAdmin?action=listRegTypeQuestions")%>
			<INPUT
				TYPE="hidden"
				NAME="questionSize"
				Value="<%=ar.getCollection("Questions").size()%>">
			<%
			for(int i = 0; questions.hasNext(); i++){
				Question question = (Question)questions.next();
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
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><INPUT
					CLASS="required"
					onFocus="Highlight(this)"
					onBlur="UnHighlight(this)"
					NAME="<%=i%>DisplayOrder"
					size=2
					maxlength=3
					value="<%=question.getDisplayOrder()%>"></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><%=question.getQuestionText().getBody()%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><%=formatter.displayArrayName(question.getQuestionText().getAnswerType(), QuestionText.answerTypes, QuestionText.answerTypeNames)%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><%=question.getRequired() ? "Yes" : "No"%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><%=question.getQuestionText().getStatus()%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><%=aCount%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=editQuestionDetails&questionID=<%=question.getQuestionID()%>">Edit</A></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=deleteQuestion&questionID=<%=question.getQuestionID()%>"
					onMouseOver="return overlib('<B>WARNING!</B><BR>This is not undoable!');"
					onMouseOut="return nd();">Delete</A></TD>
			</TR>
			<%
			}
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
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
					CELLSPACING="0"
					CELLPADDING="0"
					BORDER="0"
					WIDTH="100%">
					<%
			//	if(newEvent && newRegType){ //why new reg type AND new event?  why not just new reg type?
			if(newRegType){				// replaced 5/9/05 S.Paulis

%>
					<TR>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=editProfileQuestions"
							CLASS="button">&lt;&lt; Back</A></TD>
						<%
				if(ar.getCollection("Questions").size() > 1){
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
							HREF="/servlet/CRSAdmin?action=newQuestion&order=<%=ar.getValue("order")%>&orderCol=<%=ar.getValue("orderCol")%>"
							CLASS="button">New Question</A></TD>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="/servlet/CRSAdmin?action=listCommonQuestions"
							CLASS="button">Load Common Questions</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"
							COLSPAN="2"><A
							HREF="javascript: goNext('saveQuestions', 'save')"
							NAME="save"
							CLASS="button">Next &gt;&gt;</A></TD>
					</TR>
					<% 
		} else{
%>
					<TR>
						<!-- removed - not necessary
						<TD CLASS="button" ALIGN="LEFT"><A HREF="/servlet/CRSAdmin?action=listRegistrationTypes" CLASS="button">List Types</A></TD>
						-->
						<%
				if(ar.getCollection("Questions").size() > 1){
%>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="javascript: document.questions.submit()"
							NAME="rearrange"
							CLASS="button">Rearrange Questions</A></TD>
						
						<TD
							CLASS="button"
							ALIGN="CENTER"
						<%
				}
				else
				{
%>
						<TD
							CLASS="button"
							ALIGN="LEFT"
<%
}
%>
						><A
							HREF="/servlet/CRSAdmin?action=newQuestion&order=<%=ar.getValue("order")%>&orderCol=<%=ar.getValue("orderCol")%>"
							CLASS="button">New Question</A></TD>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="/servlet/CRSAdmin?action=listCommonQuestions"
							CLASS="button">Load Common Questions</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"><A
							HREF="javascript: goNext('saveQuestions', 'save')"
							NAME="save"
							CLASS="button">Save Changes</A></TD>
					</TR>
					<TR>
					<TD COLSPAN="5" CLASS="button">
						<TABLE WIDTH="100%">
							<TR>
								<TD CLASS="button" ALIGN="CENTER">
								<A HREF="javascript: goNextWithRedirect('saveQuestions','editRegistrationType', 'rt')" CLASS="button" NAME="rt">Edit Registrant Type</A><br><br>
								<A HREF="javascript: goNextWithRedirect('saveQuestions','editFinancialDetails', 'financial')" CLASS="button" NAME="financial">Edit Financial Details</A><br><br>
								<A HREF="javascript: goNextWithRedirect('saveQuestions','listRegTypeMerchandise', 'merchandise')" CLASS="button" NAME="merchandise">Edit Additional Expenses</A><br><br>
								<A HREF="javascript: goNextWithRedirect('saveQuestions','editProfileQuestions', 'profile')" CLASS="button" NAME="profile">Edit Profile Questions</A><br><br>
								<A HREF="javascript: emptyfunction('saveQuestions','listRegTypeQuestions', 'questions')" CLASS="inactivebutton" NAME="questions">Edit Custom Questions</A></TD>
								</TD>
							</TR>
						</TABLE>
					</TD>
					</TR>

					
					<% 
		}
%>
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
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">
				<p>From this page you may create additional questions to get
				information for planning your conference. Clicking "Load Common
				Questions" will bring you to a list of commonly asked questions,
				from which you can select the ones you want to ask for your
				conference. If you have a more specific question or one that does
				not appear in the Common Questions list, select "New Question." This
				will allow you to write your own question. If you need to rearrange
				the order of your questions, you may type numbers in the boxes to
				the left, then click "Rearrange Questions" (if you do not click
				"Rearrange Questions" before making additional changes, all of your
				numbers will revert to 0). Please keep in mind that if you are going
				to need a report later that uses any of the information requested in
				these questions, you will need to include them.</p>
				<P>Hover over the blue question marks <img
					src='/crs/images/info.gif'
					height=15
					width=15
					onmouseover="return overlib('Hi!');"
					onmouseout="return nd();"> for additional information
				</TD>
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
