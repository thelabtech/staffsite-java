<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*" %>

<%@ page import="org.alt60m.hr.review360.html.*" %>
<% java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat ("MM/dd/yyyy"); %>
<%@ include file="/style.jspf" %>
<%
	ActionResults tub;
	tub = ActionResults.getActionResults(session);
	Vector myReviews = (Vector) tub.getCollection("Reviews");
	Hashtable mySession = (Hashtable) tub.getHashtable("ReviewSession");
	Iterator r360list = myReviews.iterator();
		// String fName = tub.getValue("ReviewForPName");
	Review360Summary everybody = new Review360Summary();
	Collection summaries = new LinkedList();
	everybody.setLeadershipLevel("Total Average");
	boolean foundone = false;
		while(r360list.hasNext()){
		Hashtable my360 = (Hashtable)r360list.next();
		Review360Summary temp = new Review360Summary(my360);
		Iterator i = summaries.iterator();
		foundone = false;
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
			
			if(mySummary.getLeadershipLevel().equals(my360.get("LeadershipLevel"))){
				mySummary.append(my360);
				everybody.append(my360);
				foundone = true;
				break;
			}
		}
		if(!foundone){
			summaries.add(temp);
			everybody.append(my360);
		}
	}
		Iterator i = summaries.iterator();
	while(i.hasNext()){
		Review360Summary mySummary = (Review360Summary)i.next();
		mySummary.calc();
	}
		everybody.calc();
		int tableWidth = 700;
	String bar = "<TR><TD COLSPAN='4'" + bgcolorB + "><IMG SRC='/images/blank.gif' HEIGHT='1' WIDTH='" + tableWidth + "'></TD></TR>";
%>
<%@ include file="questionsInclude.jspf" %>
<%
		QuestionHelper qh = new QuestionHelper(fName); 
%>
	<HTML>
	<HEAD>
		<TITLE>360 Summary For <%=tub.getValue("ReviewFor")%></TITLE>
	</HEAD>
	<BODY bgcolor="#FFFFFF" TEXT="#000000" onLoad="alert('Press BACK on your browser to return to the administration page. For best PRINTING results, turn on the print background option in your browser settings. See note on administration page for details.')">
	<CENTER>
	<TABLE WIDTH="<%=tableWidth%>" BORDER="0" CELLPADDING="2" CELLSPACING="0">
		<%=bar%>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4"><IMG SRC="/images/360logo.gif" BORDER="0" ALIGN="BOTTOM"><%=fontB5%>360 Summary For <%=tub.getValue("ReviewFor")%></FONT></TD>
		</TR>
		<%=bar%>
		<TR>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="25%"><%=fontB%>Review Name</FONT></TD>
			<TD <%=bgcolorW%> WIDTH="25%"><%=fontB%><%=mySession.get("Name")%></FONT></TD>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="25%"><%=fontB%>Date Review Started</FONT></TD>
			<TD <%=bgcolorW%> WIDTH="25%"><%=fontB%><%=dateFormatter.format((Date)mySession.get("DateStarted"))%></TD>
		</TR>
		<TR>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="20%"><%=fontB%>Review Requested By</FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%><%=tub.getValue("RequestedByName")%></FONT></TD>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="20%"><%=fontB%>Date Review Due</FONT></TD>
			<TD <%=bgcolorW%>><%=fontB%>
			<% if(mySession.get("DateDue") != null) { %>
			<%=dateFormatter.format((Date)mySession.get("DateDue"))%>
			<% } %></TD>
		</TR>
		<%=bar%>
		<TR>
			<TD <%=bgcolorG%> ALIGN="RIGHT" WIDTH="20%"><%=fontB%>Purpose</FONT></TD>
			<TD <%=bgcolorW%> COLSPAN="3"><%=fontB%><%=mySession.get("Purpose")%></TD>
		</TR>
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>Respose Key:</FONT></TH></TR>
<%
		i = summaries.iterator();
				while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<%=mySummary.getInfo()%>
<%
		}
%>
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>I) Leadership Relationships - Leader and God</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q1%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
				while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ1()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q2l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
				i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q2r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q2b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>I) Leadership Relationships - Leader and Self (<%=fontL%>DI</FONT>CE)</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q3%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
				i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ3()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q4%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
				i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ4()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>I) Leadership Relationships - Leader and Self (DI<%=fontL%>CE</FONT>)</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q5%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
				i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ5()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q6%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
				i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ6()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>I) Leadership Relationships - Leader and Others</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q7%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
				i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ7()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q8l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
				i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ8()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ8()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ8()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ8()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ8()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ8()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q8r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q8b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>II) Leadership Roles - Direction Setter</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q9%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ9()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q10l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ10()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ10()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ10()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ10()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ10()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ10()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q10r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q10b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>II) Leadership Roles - Spokesperson</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q11%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ11()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q12l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ12()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ12()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ12()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ12()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ12()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ12()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q12r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q12b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>II) Leadership Roles - Coach</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q13%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ13()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q14l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ14()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ14()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ14()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ14()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ14()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ14()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q14r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q14b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>II) Leadership Roles - Change Agent</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q15%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ15()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q16l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ16()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ16()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ16()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ16()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ16()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ16()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q16r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q16b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>III) Leadership Responsibilities - Cast Vision</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q17%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ17()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q18l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ18()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ18()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ18()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ18()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ18()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ18()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q18r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q18b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>III) Leadership Responsibilities - Formulate Strategy</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q19%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ19()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q20l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ20()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ20()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ20()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ20()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ20()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ20()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q20r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q20b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>III) Leadership Responsbilities - Align</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q21%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ21()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q22l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ22()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ22()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ22()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ22()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ22()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ22()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q22r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q22b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>III) Leadership Responsibilities - Motivate</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q23%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ23()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q24l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ24()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ24()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ24()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ24()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ24()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ24()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q24r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q24b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>IV) Leadership Results</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q25%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ25()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>V) Professionalism</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q26%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ26()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q27%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ27()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
		<%=bar%>
		<TR><TD <%=bgcolorW%> COLSPAN="4"><%=fontB%><B>Summary - <%=fontL%>FL</FONT>OATS</B> - <I>Comment on how <%=fName%> leads according to our design principles:</I></FONT></TD></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q28f1%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ28f1()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->

<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q28f2l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28f2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ28f2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28f2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28f2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ28f2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28f2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q28f2r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q28f2b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->


<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q28l1%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ28l1()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->

<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q28l2l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28l2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ28l2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28l2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28l2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ28l2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28l2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q28l2r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q28l2b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TD <%=bgcolorW%> COLSPAN="4"><%=fontB%><B>Summary - FL<%=fontL%>OA</FONT>TS</B> - <I>Comment on how <%=fName%> leads according to our design principles:</I></FONT></TD></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q28o1%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ28o1()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->

<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q28o2l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28o2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ28o2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28o2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28o2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ28o2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28o2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q28o2r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q28o2b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q28a1%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ28a1()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q28a2l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28a2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ28a2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28a2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28a2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ28a2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28a2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q28a2r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q28a2b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
<%=bar%>
		<TR><TD <%=bgcolorW%> COLSPAN="4"><%=fontB%><B>Summary - FLOA<%=fontL%>TS</FONT></B> - <I>Comment on how <%=fName%> leads according to our design principles:</I></FONT></TD></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q28t1%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ28t1()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q28t2l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28t2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ28t2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28t2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28t2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ28t2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28t2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q28t2r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q28t2b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q28s1%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ28s1()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qr-->
		<TR>
			<TD <%=tableCenterW%> COLSPAN="4">
			<TABLE WIDTH="90%" CELLPADDING="1" CELLSPACING="3" BORDER="0">
				<TR>
					<TD <%=bgcolorG%> COLSPAN="4">
						<%=fontB%>Please rate <%=fName%> on the following scale:</FONT>
					</TD>
				</TR>
				<TR>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
					<TD COLSPAN="2" WIDTH="50%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .5%>" BORDER="0"></TD>
					<TD WIDTH="25%" <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(tableWidth * .7) * .25%>" BORDER="0"></TD>
				</TR>
				<TR>
					<TD ROWSPAN="2" WIDTH="25%" <%=tableLeftWC%>><%=fontB1%><%=q28s2l%></FONT></TD>
					<TD WIDTH="50%" <%=tableCenterW%> COLSPAN="2">
<!--radios-->
						<TABLE BORDER="0" CELLPADDING="1" CELLSPACING="0" WIDTH="100%">
							<TR>
								<TD WIDTH="100%" <%=tableCenterB%>>
									<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableCenterW + ">" + "<IMG SRC='/images/blank.gif' HEIGHT=1 WIDTH='" + ((tableWidth * .5)/10) +  "' BORDER='0'></TD>");
											}
%>
										</TR>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>

										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=mySummary.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28s2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(mySummary.getQ28s2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(mySummary.getQ28s2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<%
		}
%>
<!--Everybody-->
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftW%>><%=fontB1%><%=everybody.getLeadershipLevel()%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28s2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
										<TR>
											<TD <%=bgcolorW%> COLSPAN="10">
												<TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0">
													<TR><TD <%=tableLeftB%>><%=fontW1%><%=Math.round(everybody.getQ28s2()*100)/100f%></FONT></TD></TR>
													<TR><TD <%=tableLeftW%>><IMG SRC="/images/blank.gif" HEIGHT="1" WIDTH="<%=(everybody.getQ28s2()/10)*(tableWidth * .5)%>"></TD></TR>
												</TABLE>
											</TD>
										</TR>
<!--Everybody-->
										<TR>
<%
											for(int count = 1; count <= 10; count++){
												out.print("<TD " + tableLeftW + ">" + fontB1 + count + "</FONT></TD>");
											}
%>
										</TR>
									</TABLE>
								</TD>
							</TR>
						</TABLE>
<!--radios-->
					</TD>
					<TD ROWSPAN="2" WIDTH="25%" <%=bgcolorW%>><%=fontB1%><%=q28s2r%></FONT></TD>
				</TR>
				<TR>
					<TD <%=tableCenterW%>><%=fontB1%><%=q28s2b%></font></TD>
				</TR>
			</TABLE>
			<BR>
			</TD>
		</TR>
<!--qr-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>Summary - Priorities</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q29%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ29()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q30%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ30()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>Summary - Suggestions</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q31%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ31()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q32%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ32()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
		<%=bar%>
		<TR><TH ALIGN="LEFT" <%=bgcolorW%> COLSPAN="4"><%=fontB%>Summary - Other Comments</FONT></TH></TR>
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q33%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ33()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->
<!--qb-->
		<TR>
			<TD <%=bgcolorG%> COLSPAN="4">
			<%=fontB%>
			<BLOCKQUOTE>
			<%=q34%>
			</TD>
		</TR>
		<TR>
			<TD <%=bgcolorW%> COLSPAN="4">
			<BLOCKQUOTE>
<%
		i = summaries.iterator();
		while(i.hasNext()){
			Review360Summary mySummary = (Review360Summary)i.next();
%>
			<B><%=mySummary.getLeadershipLevel()%></B><BR>
			<%=mySummary.getQ34()%>
<%
		}
%>
			</BLOCKQUOTE>
			</FONT>
			</TD>
		</TR>
<!--qb-->

		<%=bar%>



	</TABLE>
<%@ include file="/headers/google_analytics.jspf"%>
	</BODY>
	</HTML>
