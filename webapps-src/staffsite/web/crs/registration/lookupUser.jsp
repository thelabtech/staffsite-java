<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean" />
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
	String pageTitle = "Find a Person By Email";
	Hashtable requestHash = ar.getHashtable("request");
	String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	boolean noMatches= false;
	if(ar.getValue("maxSize")==null||ar.getValue("maxSize").equals("0")) // if there are no real results
	{
		noMatches= true;
	}
%>
<%@ include file="/crs/e_user_header.jspf"%>
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
<table WIDTH="100%" ALIGN="CENTER" CELLPADDING="0" CELLSPACING="10">
	<tr>
		<td VALIGN="TOP" WIDTH="150" ROWSPAN="3"><%=registrationMenu.display(0)%>
		<p>
		<%=otherOptionsMenu.display(0)%>
		<p>
		<table CLASS="box" WIDTH="100%" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td CLASS="subboxheader">Key</td>
			</tr>
			<tr>
				<td CLASS="cell"><input CLASS="required" VALUE="Required Fields"></td>
			</tr>
			<tr>
				<td CLASS="cell"><input CLASS="empty" VALUE="Optional Fields"></td>
			</tr>
		</table>
		<p><%=accountManagementMenu.display(0)%>
		</td>
		<td VALIGN="TOP" COLSPAN="2">
		<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<tr>
				<td ALIGN="CENTER" COLSPAN="2" CLASS="boxheader">Find by Email</td>
			</tr>
			<tr>
				<td COLSPAN="2" CLASS="cell">Type your spouse's email address here and click "search."</td>
			</tr>
			<form ACTION="/servlet/CRSRegister" METHOD="POST" NAME="theForm"><input
				TYPE="HIDDEN" NAME="nextAction"
				VALUE="<%=ar.getValue("nextAction")%>"> <input TYPE="HIDDEN"
				NAME="nextVar" VALUE="<%=ar.getValue("nextVar")%>"> <input
				TYPE="HIDDEN" NAME="lookupMessage"
				VALUE="<%=ar.getValue("lookupMessage")%>"> <input TYPE="HIDDEN"
				NAME="action" VALUE="lookupSSM"> <%
							Enumeration requestE = requestHash.keys();
							String passThrough = "";
							while (requestE.hasMoreElements()) {
								String key = (String)requestE.nextElement();
								if(!key.equals("email") && !key.equals("nextAction") && !key.equals("nextVar") && !key.equals("lookupMessage") && !key.equals("action") && !key.equals("offset") && !key.equals("size")){
									passThrough += key + "=" + (String)requestHash.get(key) + "&";
					%> <input TYPE="HIDDEN" NAME="<%=key%>"
				VALUE="<%=(String)requestHash.get(key)%>"> <%
								}
							}
					%>
			<tr>
				<td ALIGN="RIGHT" CLASS="hl" WIDTH="20%">Email</td>
				<td ALIGN="LEFT" CLASS="cell"><input WIDTH="20" NAME="email" class="required"
					VALUE="<%=ar.getValue("email") != null ? ar.getValue("email") : ""%>"></td>
			</tr>
			<tr>
				<td ALIGN="RIGHT" CLASS="button" COLSPAN="2"><a
					HREF="javascript: document.theForm.submit()" CLASS="button">Search</a></td>
			</tr>
			
			</form>
		</table>
		<p>
		<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<tr>
				<td ALIGN="RIGHT" CLASS="button" COLSPAN="3"> If you can't find your spouse, add them to the system.<br /><br /><a
					HREF="/servlet/CRSRegister?action=createSpouseLogin" CLASS="button">Add spouse</a></td>
			</tr>
			<%
				if(ar.getCollection("users") != null){
					Iterator users = ar.getCollection("users").iterator();
					String passURL = "&email=" + ar.getValue("email");
			%>
			<tr>
				<td ALIGN="CENTER" COLSPAN="3" CLASS="boxheader">Your search
				returned <%=ar.getValue("maxSize")%> people
				<br>
				<%
				if(!noMatches){
				%>
					If you see your spouse's email address below, click it to proceed.
				<%
				}
				%>
				</td>
	
			</tr>
			<%
					if(users.hasNext()){
			%>
			<tr>
				<td ALIGN="CENTER" COLSPAN="3" CLASS="pager"><%=formatter.displayPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "People", "/servlet/CRSRegister?action=lookupSSM" + passURL)%>
				</td>
			</tr>
			<%
						formatter.setHeaderNames(new String[] {"Email"});
						formatter.setHeaderSorts(new boolean[] {false});
						formatter.setHeaderWidths(new String[] {""});
						formatter.setHeaderAligns(new String[] {"LEFT"});
			%>
			<%=formatter.displayHeader( ar.getValue("orderCol"), ar.getValue("order"), "Emails", "/servlet/CRSRegister?action=lookupSSM" + passURL)%>
			<%
			for(int i = 0; users.hasNext(); i++){
				org.alt60m.security.dbio.model.User user = (org.alt60m.security.dbio.model.User)users.next();
			%>
			<tr>
				<td CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>" VALIGN="TOP"
					COLSPAN="2"><a CLASS="<%=(i%2 == 0) ? "linkcell" : "linkcell2" %>"
					HREF="/servlet/CRSRegister?action=confirmSpouse&ssm=<%=user.getUserID()%>"><%=user.getUsername()%></a></td>
			</tr>
			<%
			}
	%>
			<tr>
				<td ALIGN="CENTER" COLSPAN="3" CLASS="smallpager"><%=formatter.displaySmallPager( ar.getValue("offset"), ar.getValue("size"), ar.getValue("maxSize"), "People", "/servlet/CRSRegister?action=lookupSSM" + passURL)%>
				</td>
			</tr>
			<%
			} else {
	%>
			<tr>
				<td CLASS="cell" ALIGN="CENTER" COLSPAN="3">There aren't any people
				who match <b>'<%=ar.getValue("email")%>'</b></td>
			</tr>
			<%
			}
		}
	%>
		</table>
		<p>
		<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<tr>
				<td CLASS="boxheader"><img SRC="/crs/images/info.gif"> Instructions</td>
			</tr>
			<tr>
				<td class="cell"><%
						if(ar.getCollection("users") == null){
				%>
				<p>If your spouse has a login for this system but has never registered for a conference or event, you might be able to find their record by searching for their email address. If your spouse has multiple email addresses, be sure to search for all of them.</p>
				<%
						} else {
				%>
				<p>If your spouse's email address appears in the search results above, you may click it to proceed and enter your spouse's information. If not, you may search for another email address, or click the "Add Spouse" button above to create a new record for your spouse.</p>
				<%
						}
				%></td>
			</tr>
			<tr>
				<td CLASS="cell"></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<%@ include file="/crs/e_user_footer.jspf"%>
<%
} catch (Exception e) {
	e.printStackTrace();
	throw new Exception(e);
}
%>
