<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.util.Toolbox, org.alt60m.crs.model.*" %>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean"/>
<%
	selBool.setLabels("Yes","No");
%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Registration registration = (Registration)ar.getObject("registration");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	String pageTitle = "Find a Person";
	Hashtable requestHash = ar.getHashtable("request");
	String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	boolean noMatches=false;
	boolean sameLastName= false;
	boolean firstSearch= true;
	
	if(registration.getPerson().getLastName().equals(ar.getValue("lastName")))  // if the logged-in user's last name was searched for
	{																				
		sameLastName= true;
	}
	
	if(ar.getValue("maxSize")!=null&&(ar.getValue("maxSize").equals("0")|(ar.getValue("maxSize").equals("1")&&sameLastName))) // if there are no real results (exclude the logged in user)
	{
		noMatches= true;
	}
	if(session.getAttribute("last_action").equals("lookupPerson"))
	{
		firstSearch= false;
	}
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
<script LANGUAGE="JavaScript">
	<!--
		function goNext(action){
			var form = document.theForm;
			if(!requiredFilled(form)){
				alert("You must fill out all of the required fields to continue.");
			} else {
				form.action.value = action;
				form.submit();
			}
		}
	//-->
</script>
<%
Enumeration requestE = requestHash.keys();
String passThrough = "";
while (requestE.hasMoreElements()) {
	String key = (String)requestE.nextElement();
	if(!key.equals("firstName") && !key.equals("lastName") && !key.equals("nextAction") && !key.equals("nextVar") && !key.equals("lookupMessage") && !key.equals("action") && !key.equals("offset") && !key.equals("size")){
		passThrough += key + "=" + (String)requestHash.get(key) + "&";
	}
}
%>
<table WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
	<tr>
		<td VALIGN="TOP" WIDTH="150" ROWSPAN="3">
			<%=registrationMenu.display(0)%>
			<p>
			<%=otherOptionsMenu.display(0)%>
			<p>
			<table CLASS="box" WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
				<tr><td CLASS="subboxheader">Key</td></tr>
				<tr><td CLASS="cell"><input CLASS="required" VALUE="Required Fields"></td></tr>
				<tr><td CLASS="cell"><input CLASS="empty" VALUE="Optional Fields"></td></tr>
			</table>
			<p>
			<%=accountManagementMenu.display(0)%>
		</td>
		<td VALIGN="TOP" COLSPAN="2">
			
			<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
				<tr>
					<td ALIGN="CENTER" COLSPAN="2" CLASS="boxheader"><%=ar.getValue("lookupMessage")%></td>
				</tr>
					
					<tr>
						<td COLSPAN="2" CLASS="cell">
				<%if(firstSearch){%>
							You indicated that your spouse will be attending this event. 
							<%if(!noMatches){%>
								To identify your spouse, please click his/her name if it appears in the list below.
							<%}%>
						<%}else{%>
							<%if(!noMatches){%>
								If your spouse's name appears in the list below, click it to proceed.
								<br /><br />
				<%}%>
								If you think your spouse might have an existing record under a different first name (such as a nickname), you may use the search fields below to search again.
								<br /><br />
								If you have finished searching and haven't found your spouse's name, use the "Can't find your spouse by name?" link to proceed.
					<%
								}
						if(!(firstSearch&noMatches))	// only show list if there are real matches and it's not the first search for spouse
						{
					%>
					
						</td>
					</tr>
					
				</form>
			</table>
			<p>
			
			<!-- SEARCH RESULTS BOX -->
			<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<%
				if(ar.getCollection("persons") != null){
					Iterator persons = ar.getCollection("persons").iterator();
					String passURL = Toolbox.escapeSingleQuotes("&lastName=" + ar.getValue("lastName") + "&firstName=" + ar.getValue("firstName") + "&lookupMessage=" + ar.getValue("lookupMessage") + "&nextAction=" + ar.getValue("nextAction") + "&nextVar=" + ar.getValue("nextVar") + "&" + passThrough);
			%>
			<tr>
				<td ALIGN="CENTER" COLSPAN="3" CLASS="boxheader">
				<%
				if(!firstSearch){
				%>
					Your search returned <%=ar.getValue("maxSize")%> people
					<p>
				<%
				}
				if(!noMatches){
				%>
				If you see your spouse's name below, click it to proceed.
				<%
				}
				%>
				</td>
			</tr>
			<%
					if(persons.hasNext()){
			%>
			<tr>
				<td ALIGN="CENTER" COLSPAN="3" CLASS="pager">
					<%=formatter.displayPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "People", "/servlet/CRSRegister?action=lookupPerson" + passURL)%>
				</td>
			</tr>
			<%
						formatter.setHeaderNames(new String[] {"FirstName", "LastName", "City/State"});
						formatter.setHeaderSorts(new boolean[] {true, true, false});
						formatter.setHeaderWidths(new String[] {"", "", ""});
						formatter.setHeaderAligns(new String[] {"LEFT", "LEFT", "left"});
			%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Persons Table", "/servlet/CRSRegister?action=lookupPerson" + passURL)%>
			<%
						for(int i = 0; persons.hasNext(); i++){
							Person person = (Person)persons.next();
			%>
			<tr>
				<td CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>" VALIGN="TOP" COLSPAN="2"><a CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>" HREF="/servlet/CRSRegister?action=confirmSpouse&foundID=<%=person.getPersonID()%>&<%=passThrough%>"><%=person.getFirstName()%> <%=person.getLastName()%></a></td>
				<td CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="TOP"><%=person.getCity()%>, <%=person.getState()%></a></td>
			</tr>
			<%
						} // end for
			%>
			<tr>
				<td ALIGN="CENTER" COLSPAN="3" CLASS="smallpager">
					<%=formatter.displaySmallPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "People", "/servlet/CRSRegister?action=lookupPerson" + passURL)%>
				</td>
			</tr>
			<%
					} else {
			%>
			<tr>
				<td CLASS="cell" ALIGN="CENTER" COLSPAN="3">There aren't any people who match <b>'<%=ar.getValue("firstName")%> <%=ar.getValue("lastName")%>'</b></td>
			</tr>
						</tr>
			<%
					} // end else
				}	// end if
			%>
		</table>
		<!-- END EARCH RESULTS BOX -->
		

				<p>
	<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<tr>
					<td ALIGN="CENTER" CLASS="boxheader" COLSPAN="2">Search for your spouse</td>
		</tr>
		<tr>
					<td class="cell" COLSPAN="2">
	<%
	//}
}	// end big if on search results box

%>
				<p>
				<%
					if(noMatches)
					{
		%>T<%
					} 
					else 
					{
		%>If your spouse's name is not in the list above, please t<%
		}
		out.write("ype ");
					%>
		his/her first and last name here and click "search."
	</td>
</tr>
<form ACTION="/servlet/CRSRegister" METHOD="POST" NAME="theForm">
<input TYPE="HIDDEN" NAME="nextAction" VALUE="<%=ar.getValue("nextAction")%>">
<input TYPE="HIDDEN" NAME="nextVar" VALUE="<%=ar.getValue("nextVar")%>">
<input TYPE="HIDDEN" NAME="lookupMessage" VALUE="<%=ar.getValue("lookupMessage")%>">
<input TYPE="HIDDEN" NAME="action" VALUE="lookupPerson">

<%
requestE = requestHash.keys();
while (requestE.hasMoreElements()) {
	String key = (String)requestE.nextElement();
	if(!key.equals("firstName") && !key.equals("lastName") && !key.equals("nextAction") && !key.equals("nextVar") && !key.equals("lookupMessage") && !key.equals("action") && !key.equals("offset") && !key.equals("size")){
%>
<input TYPE="HIDDEN" NAME="<%=key%>" VALUE="<%=(String)requestHash.get(key)%>">
<%
	}
}
%>
	<tr>
		<td ALIGN="RIGHT" CLASS="hl" WIDTH="20%">First Name</td>
		<td ALIGN="LEFT" CLASS="cell"><input WIDTH="20" class="required" NAME="firstName" onFocus="Highlight(this)" onBlur="UnHighlight(this)" VALUE="<%=(firstSearch||(ar.getValue("firstName") == null)) ? "":ar.getValue("firstName")%>"></td>
	</tr>
	<tr>
		<td ALIGN="RIGHT" CLASS="hl">Last Name</td>
		<td ALIGN="LEFT" CLASS="cell"><input WIDTH="20" class="required" NAME="lastName" onFocus="Highlight(this)" onBlur="UnHighlight(this)" VALUE="<%=(firstSearch||(ar.getValue("lastName") == null)) ? "" : ar.getValue("lastName")%>"></td>
	</tr>
	<tr>
		<td ALIGN="RIGHT" CLASS="button" COLSPAN="2"><a HREF="javascript: goNext('lookupPerson')" CLASS="button">Search</a></td>
	</tr>
</form>
					<%
	if(!firstSearch)
					{
					%>
	<tr>
		<td CLASS="smallpager" ALIGN="CENTER" COLSPAN="3" BORDER="1"><a class="linkcell" href="/servlet/CRSRegister?action=createSpouseLogin"><b>Can't find your spouse by name? Click here to create a new record.</b></a></td>
	</tr>
					<%
					}
					%>
</table>
<p>
	<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<tr>
			<td CLASS="boxheader"><img SRC="/crs/images/info.gif"> Instructions</td>
		</tr>
		<tr>
			<td class="cell">
						<p>
				If your spouse has registered for a event using this system in the past, this page allows you to select his/her existing record and join it with your own.  If there is no existing record, the next page will give you an opportunity to add one.
				<br /><br />
				Identifying your spouse is a one-time process, which you won't have to repeat when you register for future events.  Once you have identified your spouse, you will have an opportunity to register him or her for this event.
				
			</td></tr>
		<tr>
			<td CLASS="cell">
			</td>
		</tr>
	</table>
	</td>
</tr>
</table>
<%@ include file="/crs/e_user_footer.jspf" %>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>