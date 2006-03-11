<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean
	id="selBool"
	class="org.alt60m.html.SelectBoolean" />
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	if(ar==null){ 
		response.sendRedirect("/servlet/CRSAdmin");
	}
	boolean newEvent = session.getValue("newEvent") != null && ((String)session.getValue("newEvent")).equals("true");
	boolean onlyOneRegType = (session.getValue("onlyOneRegType") != null && ((String)session.getValue("onlyOneRegType")).equals("true"))||(ar.getValue("onlyOneRegType") != null && ((String)ar.getValue("onlyOneRegType")).equals("true"));
	String pageTitle = "Common Questions";
	String label = ar.getValue("label");
%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function goNext(action){
		// First check to see if all the required fields have something in them
		if(requiredFilled(document.questions)){
			// Next check for specific content
			document.questions.action.value = action;
			document.questions.submit();
		}
	}

-->
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
			WIDTH="150"><%=toolsMenu.display(0)%></TD>
		<TD VALIGN="TOP">
		<FORM
			NAME='questions'
			ACTION="/servlet/CRSAdmin"
			METHOD="post"><INPUT
			TYPE=hidden
			NAME="action"
			VALUE="">
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="5">Common Questions<%=(newEvent&&onlyOneRegType)?"":" for "+label%></TD>
			</TR>
			
			<%
		if(ar.getCollection("Questions").size() > 0){		
			Vector questions = (Vector)ar.getCollection("Questions");
			Vector checks = (Vector)ar.getCollection("QuestionsAdded");

			formatter.setHeaderNames(new String[] {"Question", "AnswerType", "(Don't add) / (Include) / (Require)"});
			formatter.setHeaderSorts(new boolean[] {true, true, false});
			formatter.setHeaderWidths(new String[] {"*", "10%", "35%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "CENTER"});
%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Common Questions Table", "/servlet/CRSAdmin?action=listCommonQuestions")%>
			<%
			for(int i = 0; i < questions.size(); i++){
				QuestionText qt = (QuestionText)questions.get(i);
				String checked = (String)checks.get(i);
%>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><%=qt.getBody()%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"><%=formatter.displayArrayName(qt.getAnswerType(), QuestionText.answerTypes, QuestionText.answerTypeNames)%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM"
					ALIGN="CENTER"><INPUT
					TYPE="RADIO"
					NAME="Q<%=qt.getQuestionTextID()%>"
					VALUE=""
					<% if(checked.equals("")) { %>checked <%}
					else {%>
					onmouseover="return overlib('If you would like to delete this question, please click &quot;cancel&quot; to return to the previous page, and click the &quot;delete&quot; button corresponding to this question. Checking this now will not do anything.');"
					onMouseOut="return nd();"<%}%>>/<INPUT
					TYPE="RADIO"
					NAME="Q<%=qt.getQuestionTextID()%>"
					VALUE="I"
					<% if(checked.equals("I")) { %>checked <%}%>>/<INPUT
					TYPE="RADIO"
					NAME="Q<%=qt.getQuestionTextID()%>"
					VALUE="R"
					<% if(checked.equals("R")) { %>checked <%}%>></TD>
			
			</TR>
			<%
			}
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="4">There aren't any common questions to display</TD>
			</TR>
			<%
		}
%>
			<TR>
				<TD
					ALIGN="CENTER"
					COLSPAN="5">
				<TABLE
					CELLSPACING="0"
					CELLPADDING="0"
					BORDER="0"
					WIDTH="100%">
					<TR>
						<TD
							CLASS="button"
							ALIGN="LEFT"><A
							HREF="/servlet/CRSAdmin?action=listRegTypeQuestions"
							CLASS="button">Cancel</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"><A
							HREF="javascript: goNext('addCommonQuestions')"
							CLASS="button">Add Selected Questions</A></TD>
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
				<TD CLASS="boxheader"><IMG SRC="/crs/images/info.gif"> Instructions</TD>
			</TR>
			<TR>
				<TD CLASS="cell">
				<p>Use the radio buttons for each question to include it (middle radio button) or
				require it (right radio button). If you select "include," the
				question will be asked, but the registrant will be able to proceed
				to the next page without answering it. If you select "require," the
				registrant will have to answer the question in order to proceed to
				the next page. Please
				keep in mind that if you are going to need a report later that uses
				any of the information requested in these questions, you will need
				to include them.</p>
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
