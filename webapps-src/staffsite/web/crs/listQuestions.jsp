<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Vector regTypesV = (Vector)ar.getObject("RegistrationTypes");

	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	String view = ar.getValue("view");
	String pageTitle = "Conference Specific Questions";	
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action, buttonname){
		var form = document.questions;
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
<%@ include file="/crs/e_header.jspf"%>
<TABLE
	WIDTH="100%"
	ALIGN="CENTER"
	CELLPADDING="0"
	CELLSPACING="10">
	<TR>
		<TD
			VALIGN="TOP"
			WIDTH="150"><%=toolsMenu.display(0)%>
		<P><%=newEvent ? creationMenu.display(8) : conferenceMenu.display(13)%>
		</TD>
		<TD VALIGN="TOP">
		<FORM NAME='questions'
			ACTION="/servlet/CRSAdmin"
			METHOD="post">
		<INPUT TYPE=hidden NAME="view" VALUE="<%=view%>">
		<INPUT TYPE=hidden NAME="action" VALUE="updateQuestionOrder">
		<INPUT TYPE=hidden NAME="orderCol" VALUE="<%=ar.getValue("orderCol")%>">
		<INPUT TYPE=hidden NAME="order" VALUE="<%=ar.getValue("order")%>">
		<TABLE
			BORDER="0"
			CELLSPACING="0">
			<TR>
				<% /* iterate over all RegistrationTypes */
					Iterator regTypes = regTypesV.iterator();
					for(int i = 0; regTypes.hasNext(); i++){
						Vector v = (Vector)regTypes.next();
						String typeID = (String)v.get(0);
						String typeLabel = (String)v.get(1);
						%>
				<TD CLASS="<%=view.equals(typeID) ? "tabactive" : "tab" %>"><A
					HREF="/servlet/CRSAdmin?action=listQuestions&view=<%=typeID%>"
					CLASS="<%=view.equals(typeID) ? "tabactive" : "tab" %>"><%=typeLabel%></A></TD>
						<%
					}	%>
			</TR>
		</TABLE>
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
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Questions Table", "/servlet/CRSAdmin?action=listQuestions&view=" + view)%>
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
					HREF="/servlet/CRSAdmin?action=editQuestionDetails&questionID=<%=question.getQuestionID()%>&view=<%=view%>">Edit</A></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><A
					CLASS="button"
					HREF="/servlet/CRSAdmin?action=deleteQuestion&questionID=<%=question.getQuestionID()%>&view=<%=view%>"
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
		if(newEvent){
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
							HREF="/servlet/CRSAdmin?action=newQuestion&view=<%=view%>&order=<%=ar.getValue("order")%>&orderCol=<%=ar.getValue("orderCol")%>"
							CLASS="button">New Question</A></TD>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="/servlet/CRSAdmin?action=listCommonQuestions&view=<%=view%>"
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
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=showConference"
							CLASS="button">Cancel</A></TD>
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
							HREF="/servlet/CRSAdmin?action=newQuestion&view=<%=view%>&order=<%=ar.getValue("order")%>&orderCol=<%=ar.getValue("orderCol")%>"
							CLASS="button">New Question</A></TD>
						<TD
							CLASS="button"
							ALIGN="CENTER"><A
							HREF="/servlet/CRSAdmin?action=listCommonQuestions&view=<%=view%>"
							CLASS="button">Load Common Questions</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"><A
							HREF="javascript: goNext('saveQuestions', 'save')"
							NAME="save"
							CLASS="button">Save Changes</A></TD>
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
