<%@ page import="org.alt60m.wsn.sp.model.dbio.*" %>
<jsp:useBean id="infoBean" class="org.alt60m.hr.ms.bean.dbio.MSInfoBean"/>
<jsp:useBean id="helper" class="org.alt60m.wsn.sp.html.QuestionHelper"/>

<%@ include file="header.jspf" %>

<INPUT TYPE="hidden" NAME="WsnApplicationID" VALUE="<%=WsnApplicationID%>">
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
	<% 
	// show additional questions for each project
	String projectPrefChoice[] = {		(String)personHash.get("ProjectPref1")==null?"":(String)personHash.get("ProjectPref1"),
										(String)personHash.get("ProjectPref2")==null?"":(String)personHash.get("ProjectPref2"),
										(String)personHash.get("ProjectPref3")==null?"":(String)personHash.get("ProjectPref3"),
										(String)personHash.get("ProjectPref4")==null?"":(String)personHash.get("ProjectPref4"),
										(String)personHash.get("ProjectPref5")==null?"":(String)personHash.get("ProjectPref5")
									};
	
	if(projectPrefChoice[0].equals("") & projectPrefChoice[1].equals("") & projectPrefChoice[2].equals("")& projectPrefChoice[3].equals("")& projectPrefChoice[4].equals(""))
	{
	%>
		<TR>
			<TD>You have not indicated any project preferences, so you have no project specific questions to answer.</TD>
		</TR>
	<%
	}
	else
	{
		Collection personAnswers = infoBean.listWsnApplicationAnswers(WsnApplicationID);
		Vector usedProjects = new Vector();
		
		for(int projectPrefIndex=0;projectPrefIndex<5;projectPrefIndex++)
		{			
			String projectID = projectPrefChoice[projectPrefIndex];
			if(!projectID.equals("")&&!usedProjects.contains(projectID))//(if they haven't already been asked - if they have duplicate project prefs)
			{
				usedProjects.add(projectID);	// add this project to the list of projects whose questions have been asked already on this page
				%>
				<TR>
					<TD ALIGN="RIGHT" CLASS="app" colspan="2">
						<TABLE BORDER="1" rules="none" border="1">
							<TR>
								<TD ALIGN="LEFT" CLASS="app" WIDTH="20%" valign="top" colspan="2"><%=projectName[projectPrefIndex]%></TD>
							</TR>
							<%
							Collection projectQuestions = infoBean.listProjectQuestions(projectID, "displayOrder", "ASC");
							
							// if project has any additional questions, show them 
							if(projectQuestions.isEmpty()){
							%>
							<TR>
								<TD ALIGN="CENTER" CLASS="app" WIDTH="20%" valign="top" colspan="2">No additional questions.</TD>
							</TR>
							<%
							}
							else
							{
								Iterator questions = projectQuestions.iterator();
								Iterator answers = personAnswers.iterator();
								
								Hashtable hashAnswers = new Hashtable();
								while(answers.hasNext()){
									Answer nextAnswer = (Answer)answers.next();
									hashAnswers.put(String.valueOf(nextAnswer.getQuestionID()), nextAnswer.getBody());
								}
			
								for(int i = 1; questions.hasNext(); i++)
								{
									Question question = (Question)questions.next();
									String answer = hashAnswers.get(String.valueOf(question.getQuestionID())) == null ? "" : (String)hashAnswers.get(String.valueOf(question.getQuestionID()));
									helper.setAnswerType(question.getAnswerType());
								%>
									
								<TR>
								<TD ALIGN="LEFT" CLASS="app" valign="top">
								<%=helper.print(question.getBody(), String.valueOf(question.getQuestionID()), question.getRequired(), " (" + question.getAnswerType() + ") ", answer,1000)%> 
								</TD>
								</TR>
								<%
								}
							}
							%>
						</TABLE>
						<br /><br />
					</TD>
				</TR>
				
				<%
				}	// end if - whether preference has been indicated
			}	// end repeat for each project
		}
		%>
		<TR>
		<TD COLSPAN="2">
		<TABLE WIDTH="100%" CELLSPACING="0">
			<TR>
				<TD ALIGN="LEFT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum - 2]%>')" CLASS="button">&lt;&lt;Back</A></TD>
				<TD ALIGN="CENTER" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', 'finishA')" CLASS="button">Save Work/Finish Later</A></TD>
				<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="33%" CLASS="button"><A CLASS="button" HREF="JavaScript: doPostFormNextAction('appFormSave', 'goToView', '<%=pages[pageNum]%>')">Next&gt;&gt;</A></TD>
			</TR>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<%@ include file="footer.jspf" %>
