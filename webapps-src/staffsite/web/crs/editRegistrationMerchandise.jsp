<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Registration registration = (Registration)ar.getObject("registration");
	Conference conference = (Conference)ar.getObject("conference");

	if(ar==null){
		response.sendRedirect("/servlet/CRSAdmin");
	}
	String pageTitle = "Staff Registration of " + registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName();
	Hashtable gender = new Hashtable();
	gender.put("M", "Male");
	gender.put("F", "Female");
	gender.put("", "");
	Hashtable maritalStatus = new Hashtable();
	maritalStatus.put("S", "Single");
	maritalStatus.put("M", "Married");
	maritalStatus.put("D", "Divorced");

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
		<TABLE
			BORDER="0"
			CELLSPACING="0"
			WIDTH="100%"
			CLASS="box">
			<TR>
				<TD
					CLASS="boxheader"
					COLSPAN="7">Requested Merchandise</TD>
			</TR>
			<FORM
				NAME='theForm'
				ACTION="/servlet/CRSAdmin"
				METHOD="post"><INPUT
				TYPE=hidden
				NAME="action"
				VALUE="saveRegistrationMerchandise"> <INPUT
				TYPE=hidden
				NAME="registrationID"
				VALUE="<%=registration.getRegistrationID()%>"> <%
		if(ar.getCollection("merchandise").size() > 0){	
			Iterator choices = ar.getCollection("choices").iterator(); 
			Hashtable hashMerchandise = new Hashtable();
			while(choices.hasNext()){
				Merchandise m = (Merchandise)choices.next();
				hashMerchandise.put(String.valueOf(m.getMerchandiseID()), "CHECKED");
			}

			Iterator options = ar.getCollection("merchandise").iterator();

			formatter.setHeaderNames(new String[] {"Order?", "Name", "Amount", "Note"});
			formatter.setHeaderSorts(new boolean[] {false, false, false, false});
			formatter.setHeaderWidths(new String[] {"7%", "30%", "10%", "*"});
			formatter.setHeaderAligns(new String[] {"CENTER", "LEFT", "RIGHT", "LEFT"});
%> <%=formatter.displayHeader( request.getParameter("orderCol"), request.getParameter("order"), "Merchandise Table", "/servlet/CRSAdmin?action=listMerchandise")%>
			<%
			for(int i = 0; options.hasNext(); i++){
				Merchandise m = (Merchandise)options.next();
%>
			<TR>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="CENTER"
					ALIGN="CENTER"><INPUT
					TYPE="CHECKBOX"
					NAME="choices"
					value="<%=m.getMerchandiseID()%>"
					<%=hashMerchandise.get(String.valueOf(m.getMerchandiseID()))%>></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"><%=m.getName()%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"
					ALIGN="RIGHT">$<%=formatter.formatDecimal(m.getAmount())%></TD>
				<TD
					CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>"
					VALIGN="TOP"><%=m.getNote()%></TD>
			</TR>
			<%
			}
		} else {
%>
			<TR>
				<TD
					CLASS="cell"
					ALIGN="CENTER"
					COLSPAN="8">There isn't any merchandise to display</TD>
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
							HREF="/servlet/CRSAdmin?action=showConference"
							CLASS="button">Cancel</A></TD>
						<TD
							CLASS="button"
							ALIGN="RIGHT"><A
							HREF="javascript: goNext('saveRegistrationMerchandise', 'save')"
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
