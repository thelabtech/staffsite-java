<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Registration registration = (Registration)ar.getObject("registration");
	RegistrationType regType = registration.getRegistrationType();
	Person person = registration.getPerson();
	Conference conference = (Conference)ar.getObject("conference");

	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Registration of " + person.getFirstName() + " " + person.getLastName();
	
	Hashtable gender = new Hashtable();
	gender.put("M", "Male");
	gender.put("F", "Female");
	gender.put("", "");

	Hashtable maritalStatus = new Hashtable();
	maritalStatus.put("S", "Single");
	maritalStatus.put("M", "Married");
	maritalStatus.put("D", "Divorced");
	maritalStatus.put("", "");
%>
<%@ include file="/crs/e_header.jspf"%>
<TABLE WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
	<TR>
		<TD VALIGN="TOP" WIDTH="150" ROWSPAN="3"><%=toolsMenu.display(0)%>
		<P>
		<TABLE BORDER="0" CELLSPACING="0" CLASS="box">
			<TR>
				<TD CLASS="subboxheader">Jump to:</TD>
			</TR>
			<TR>
				<TD CLASS="menu"><A HREF="#reg" CLASS="menu">- Registration Info</A></TD>
			</TR>
			<TR>
				<TD CLASS="menu"><A HREF="#personal" CLASS="menu">- Personal Info</A></TD>
			</TR>
			<TR>
				<TD CLASS="menu"><A HREF="#contact" CLASS="menu">- Contact Info</A></TD>
			</TR>
			<TR>
				<TD CLASS="menu"><A HREF="#payments" CLASS="menu">- Payment History</A></TD>
			</TR>
			<TR>
				<TD CLASS="menu"><A HREF="#question" CLASS="menu">-
				Questions/Answers</A></TD>
			</TR>
			<TR>
				<TD CLASS="menu"><A HREF="#merch" CLASS="menu">- Merchandise</A></TD>
			</TR>
		</TABLE>
		<P><%=conferenceMenu.display(2)%>
		</TD>
		<TD VALIGN="TOP" COLSPAN="2"><A NAME="reg">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader" COLSPAN="2">Registration Info <A
					HREF="/servlet/CRSAdmin?action=editRegistration&registrationID=<%=registration.getRegistrationID()%>"
					CLASS="button">Edit</A> <A
					HREF="/servlet/CRSAdmin?action=confirmDeleteRegistration&registrationID=<%=registration.getRegistrationID()%>"
					CLASS="button">Delete</A></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" WIDTH="20%">Full Name</TD>
				<TD CLASS="cell"><%=person.getFirstName()%> <%=person.getMiddleInitial()%>
				<%=person.getLastName()%> <%
			if("staff".equals(registration.getRegistrationType())){
%> 
				<A CLASS="button" TARGET=_blank
					HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%=person.getAccountNo()%>">Lookup
				<%=person.getFirstName()%> <%=person.getLastName()%> in the Infobase</A>
				<%
			}
%>
				</TD>
			</TR>
			<%
			if(registration.getSpouseComing() == 2 && registration.getSpouseRegistrationID() > 0){
				Registration spouse = registration.getSpouse();
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" WIDTH="20%">Spouse Full Name</TD>
				<TD CLASS="cell"><%=spouse.getPerson().getFirstName()%> <%=spouse.getPerson().getMiddleInitial()%>
				<%=spouse.getPerson().getLastName()%> <%
			if("staff".equals(spouse.getRegistrationType())){
%> 
				<A CLASS="button" TARGET=_blank
					HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%=spouse.getPerson().getAccountNo()%>">Lookup
				<%=spouse.getPerson().getFirstName()%> <%=spouse.getPerson().getLastName()%>
				in the Infobase</A> 
			<%
			}
			%>

				<br /><br /><A CLASS="button" TARGET=_blank
					HREF="/servlet/CRSAdmin?action=showRegistration&registrationID=<%=spouse.getRegistrationID()%>">View Spouse Registration</A>
				</TD>
			</TR>
			<%
			}
			%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Email</TD>
				<TD CLASS="linkcell"><A CLASS="linkcell"
					HREF="mailto:<%=person.getEmail()%>"><%=person.getEmail()%></A></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Registration Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(registration.getRegistrationDate())%></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Pre Registered?</TD>
				<TD CLASS="cell"><%=registration.getPreRegistered() ? "Yes" : "No"%></TD>
			</TR>
			<%
		if(regType.decodeProfile(10) >= 1) {
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Arrival Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(registration.getArriveDate())%></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Departure Date</TD>
				<TD CLASS="cell"><%=formatter.formatDate(registration.getLeaveDate())%></TD>
			</TR>
			<%
		}
		if(regType.getAskChildren()){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Number of Children</TD>
				<TD CLASS="cell"><%=ar.getCollection("childRegistrations").size()%></TD>
			</TR>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Additional Rooms</TD>
				<TD CLASS="cell"><%=registration.getAdditionalRooms()%></TD>
			</TR>
			<%
		}
%>
		</TABLE></TD>
	</TR>
	<TR>
		<TD VALIGN="TOP" WIDTH="50%"><A NAME="personal">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader" COLSPAN="2">Personal Info</TD>
			</TR>
			<%
		if(regType.decodeProfile(1) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP" width="30%">Birth Date</TD>
				<TD CLASS="cell"><%=person.getBirthDate()%></TD>
			</TR>
			<%
		}
		if(regType.decodeProfile(12) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Marital Status</TD>
				<TD CLASS="cell"><%=maritalStatus.get(registration.getPerson().getMaritalStatus())%></TD>
			</TR>
			<%
		}
		if(regType.decodeProfile(11) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT">Account No</TD>
				<TD CLASS="cell"><%=person.getAccountNo()%></TD>
			</TR>
			<%
		}
		if((regType.decodeProfile( 6) >= 1) ||
			(regType.decodeProfile( 7) >= 1) ||
			(regType.decodeProfile( 8) >= 1) ||
			(regType.decodeProfile( 9) >= 1)) {
%>
			<TR>
				<TD CLASS="subboxheader" COLSPAN="2">School Info</TD>
			</TR>
			<%
		}
		if(regType.decodeProfile( 6) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Campus</TD>
				<TD CLASS="cell"><%=person.getCampus()%></TD>
			</TR>
			<%
		}
		if(regType.decodeProfile( 7) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Year In School</TD>
				<TD CLASS="cell"><%=person.getYearInSchool()%></TD>
			</TR>
			<%
		}
		if(regType.decodeProfile( 8) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Graduation Date</TD>
				<TD CLASS="cell" VALIGN="TOP"><%=person.getGraduationDate()%></TD>
			</TR>
			<%
		}
		if(regType.decodeProfile( 9) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Greek Affiliation</TD>
				<TD CLASS="cell"><%=person.getGreekAffiliation()%></TD>
			</TR>
			<%
		}
%>
		</TABLE></TD>
		<TD VALIGN="TOP" WIDTH="50%"><A NAME="contact">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader" COLSPAN="2">Contact Info</TD>
			</TR>
			<%
		if(regType.decodeProfile( 2) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP" WIDTH="25%">Current
				Address</TD>
				<TD CLASS="cell"><%=person.getAddress1()%><BR>
				<%
			if(person.getAddress2() != null && !person.getAddress2().equals("")){
%> <%=person.getAddress2()%><BR>
				<%
			}
%> <%=person.getCity()%>, <%=person.getState()%> <%=person.getZip()%> <BR>
				<%
			if(person.getCountry() != null && !person.getCountry().equals("")){
%> <%=person.getCountry()%><BR>
				<%
			}
%></TD>
			</TR>
			<%
		}
		if(regType.decodeProfile( 2) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Current Phone</TD>
				<TD CLASS="cell"><%=person.getHomePhone()%></TD>
			</TR>
			<%
		}
		if(regType.decodeProfile( 4) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Permanent Address</TD>
				<TD CLASS="cell"><%=person.getPermanentAddress1()%><BR>
				<%
			if(person.getPermanentAddress2() != null && !person.getPermanentAddress2().equals("")){
%> <%=person.getPermanentAddress2()%><BR>
				<%
			}
%> <%=person.getPermanentCity()%>, <%=person.getPermanentState()%> <%=person.getPermanentZip()%>
				<BR>
				<%
			if(person.getPermanentCountry() != null && !person.getPermanentCountry().equals("")){
%> <%=person.getPermanentCountry()%><BR>
				<%
			}
%></TD>
			</TR>
			<%
		}
		if(regType.decodeProfile( 5) >= 1){
%>
			<TR>
				<TD CLASS="hl" ALIGN="RIGHT" VALIGN="TOP">Permanent Phone</TD>
				<TD CLASS="cell"><%=person.getPermanentPhone()%></TD>
			</TR>
			<%
		}
%>
		</TABLE></TD>
	</TR>
	<TR>
		<TD VALIGN="TOP" COLSPAN="2"><%
if(regType.getAskChildren()){
%> <A NAME="children">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader" COLSPAN="7">Children</TD>
			</TR>
			<%
		if(ar.getCollection("childRegistrations").size() > 0){		
			formatter.setHeaderNames(new String[] {"Name", "Dates at Conference", "Birth Date", "Age", "Needs<BR>Child Care"});
			formatter.setHeaderSorts(new boolean[] {false, false, false, false, false});
			formatter.setHeaderWidths(new String[] {"15%", "20%", "7%", "5%", "7%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "LEFT", "RIGHT", "RIGHT"});
%>
			<%=formatter.displayHeader("5","", "Children Table", "")%>
			<%
				Iterator children = ar.getCollection("childRegistrations").iterator();
				for(int i = 1; children.hasNext(); i++){
					ChildRegistration cr = (ChildRegistration)children.next();

					// Create a calendar object with the date of birth
					Calendar dateOfBirth = new GregorianCalendar();
					dateOfBirth.setTime(cr.getBirthDate());
						
					// Get age based on year
					int age = today.get(Calendar.YEAR) - dateOfBirth.get(Calendar.YEAR);
					
					// Add the tentative age to the date of birth to get this year's birthday
					dateOfBirth.add(Calendar.YEAR, age);
					
					// If this year's birthday has not happened yet, subtract one from age
					if (today.before(dateOfBirth)) {
						age--;
					}
%>
			<TR>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"><%=cr.getFirstName()%>
				<%=cr.getLastName()%></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"><%=formatter.formatDate(cr.getArriveDate())%>
				- <%=formatter.formatDate(cr.getLeaveDate())%></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"><%=formatter.formatDate(cr.getBirthDate())%></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"
					ALIGN="RIGHT"><%=age%></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"
					ALIGN="RIGHT"><%=cr.getInChildCare() ? "Yes" : "No"%></TD>
			</TR>
			<%
				}
			} else {
%>
			<TR>
				<TD CLASS="cell" COLSPAN="7" ALIGN="CENTER"><B><%=person.getFirstName()%>
				<%=person.getLastName()%></B> has indicated no children coming to
				this conference</TD>
			</TR>
			<%
			}
%>
		</TABLE>
		<%
			}
%>
		<P>
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader" COLSPAN="7">Payment History <A
					HREF="/servlet/CRSAdmin?action=editRegistrationPayments&registrationID=<%=registration.getRegistrationID()%>"
					CLASS="button">Edit Payments</A></TD>
			</TR>
			<%
		if(ar.getCollection("payments").size() > 0){		
			formatter.setHeaderNames(new String[] {"Transaction Date", "Posted Date", "Posted", "Type", "Debit", "Credit", "Total"});
			formatter.setHeaderSorts(new boolean[] {false, false, false, false, false, false, false});
			formatter.setHeaderWidths(new String[] {"13%", "13%", "7%", "*", "12%", "12%", "12%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "RIGHT", "CENTER", "LEFT", "RIGHT", "RIGHT", "RIGHT"});
%>
			<%=formatter.displayHeader("7","", "Payment Table", "")%>
			<%
				Iterator payments = ar.getCollection("payments").iterator();
				float runningTotal = 0;
				for(int i = 1; payments.hasNext(); i++){
					Payment p = (Payment)payments.next();
					runningTotal += p.getCredit() - p.getDebit();
%>
			<TR
				onmouseover="return overlib('Transaction Date: <%=formatter.formatDate(p.getPaymentDate())%><BR>Posted Date: <%=formatter.formatDate(p.getPostedDate())%><BR>Type: <%=formatter.escapeString(p.getType())%><BR>Auth Code: <%=p.getAuthCode()%><BR>Business Unit: <%=p.getBusinessUnit()%><BR>Department: <%=p.getDept()%><BR>Operating Unit: <%=p.getOperatingUnit()%><BR>Project: <%=p.getProject()%><BR>AccountNo: <%=p.getAccountNo()%><BR>Comment: <%=formatter.escapeString(p.getComment())%>', CAPTION, 'Payment Details');"
				onmouseout="return nd();">
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"><%=formatter.formatDate(p.getPaymentDate())%></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"
					ALIGN="RIGHT"><%=formatter.formatDate(p.getPostedDate())%></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"
					ALIGN="CENTER"><%=p.getPosted() ? "<B>X</B>" : ""%></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"><%=p.getType()%></TD>
				<TD NOWRAP CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM" ALIGN="RIGHT">($<%=formatter.formatDecimal(p.getDebit())%>)</TD>
				<TD NOWRAP CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM" ALIGN="RIGHT">$<%=formatter.formatDecimal(p.getCredit())%></TD>
				<TD NOWRAP CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="BOTTOM" ALIGN="RIGHT">$<%=formatter.formatDecimal(runningTotal)%></TD>
			</TR>
			<%
				}
%>
			<TR>
				<TD CLASS="hl" COLSPAN="6" ALIGN="RIGHT">Total</TD>
				<TD CLASS="cell" NOWRAP ALIGN="RIGHT"><B>$<%=formatter.formatDecimal(runningTotal)%></B></TD>
			</TR>
			<%
			} else {
%>
			<TR>
				<TD CLASS="cell" COLSPAN="7" ALIGN="CENTER"><B><%=person.getFirstName()%>
				<%=person.getLastName()%></B> has no payment history</TD>
			</TR>
			<%
			}
%>
		</TABLE>
		<P><A NAME="question">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader" COLSPAN="4">Questions/Answers <A
					HREF="/servlet/CRSAdmin?action=editRegistrationQuestions&registrationID=<%=registration.getRegistrationID()%>"
					CLASS="button">Edit</A></TD>
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
				if(!question.getAnswerType().equals("divider") || !question.getAnswerType().equals("info") || !question.getAnswerType().equals("hide")){
					String answer = hashAnswers.get(String.valueOf(question.getQuestionID())) == null ? "" : (String)hashAnswers.get(String.valueOf(question.getQuestionID()));
%>
			<TR>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" ALIGN="RIGHT"
					VALIGN="TOP" WIDTH="5%"><B><%=i%>)</B></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"><%=question.getQuestionText().getBody()%></TD>
			</TR>
			<TR>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" ALIGN="RIGHT"
					VALIGN="TOP">&nbsp;</TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>">
				<BLOCKQUOTE><%=answer.equals("") ? "No Answer" : answer%>
				</TD>
			</TR>
			<%
				}
			}
		} else {
%>
			<TR>
				<TD CLASS="cell" COLSPAN="4" ALIGN="CENTER"><B><%=conference.getName()%></B>
				has no questions</TD>
			</TR>
			<%
		}
%>
		</TABLE>
		<P><A NAME="merch">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<TR>
				<TD CLASS="boxheader" COLSPAN="2">Requested Additional Expenses <A
					HREF="/servlet/CRSAdmin?action=editRegistrationMerchandise&registrationID=<%=registration.getRegistrationID()%>"
					CLASS="button">Edit</A></TD>
			</TR>
			<%
		if(ar.getCollection("merchandise").size() > 0){		
			formatter.setHeaderNames(new String[] {"Name", "Amount"});
			formatter.setHeaderSorts(new boolean[] {false, false});
			formatter.setHeaderWidths(new String[] {"*", "15%"});
			formatter.setHeaderAligns(new String[] {"LEFT", "RIGHT"});
%>
			<%=formatter.displayHeader("7","", "Merchandise Table", "")%>
			<%
			Iterator merchandise = ar.getCollection("merchandise").iterator();
			int i = 1;
			float total = 0;
			for(; merchandise.hasNext(); i++){
				Merchandise m = (Merchandise)merchandise.next();
				total += m.getAmount();
%>
			<TR>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"><%=m.getName()%></TD>
				<TD CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" ALIGN="RIGHT">$<%=formatter.formatDecimal(m.getAmount())%></TD>
			</TR>
			<%
			}
%>
			<TR>
				<TD CLASS="boxfooter" ALIGN="RIGHT"><B>Total</B></TD>
				<TD CLASS="boxfooter" ALIGN="RIGHT"><B>$<%=formatter.formatDecimal(total)%></B></TD>
			</TR>
			<%
		} else {
%>
			<TR>
				<TD CLASS="cell" ALIGN="CENTER" COLSPAN="2"><B><%=person.getFirstName()%>
				<%=person.getLastName()%></B> hasn't ordered any additional expenses</TD>
			</TR>
			<%
		}
%>
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
