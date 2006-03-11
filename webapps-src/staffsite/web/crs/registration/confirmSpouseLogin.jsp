<%@ page
	import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*"%>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean" />
<%
	selBool.setLabels("Yes","No");
%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	Conference conference = (Conference)ar.getObject("conference");
	Registration registration = (Registration)ar.getObject("registration");
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	
	String pageTitle = "Add Spouse";
	Hashtable requestHash = ar.getHashtable("request");
	String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
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
				<td ALIGN="CENTER" COLSPAN="2" CLASS="boxheader">Confirm Spouse Login</td>
			</tr>
			<tr>
				<td COLSPAN="2" CLASS="cell">
				<% 
					if("true".equals(ar.getValue("ssmExists"))){ // SSM exists, add spouse
				%>
						You entered <b><%=ar.getValue("email")%></b> as your spouse's email address.  If this is incorrect, click "Back" to return to the previous screen and correct it.  If it is correct, click "Next" to register your spouse and complete the registration process. 
				<%
					}
					else		// create SSM and add spouse
					{
				%>
						You entered <b><%=ar.getValue("email")%></b> as your spouse's email address.  If this is not correct, click "Back" to fix it, otherwise, click "Next" to create a login for your spouse using this email address. 
				<%
					}
				%>
				</td>
			</tr>
			<form ACTION="/servlet/CRSRegister" METHOD="POST" NAME="theForm"><input
				TYPE="HIDDEN" NAME="nextAction"
				VALUE="<%=ar.getValue("nextAction")%>"> <input TYPE="HIDDEN"
				NAME="nextVar" VALUE="<%=ar.getValue("nextVar")%>"> <input
				TYPE="HIDDEN" NAME="lookupMessage"
				VALUE="<%=ar.getValue("lookupMessage")%>"> <input TYPE="HIDDEN"
				NAME="action" VALUE="createSSM"> <%
							Enumeration requestE = requestHash.keys();
							String passThrough = "";
							while (requestE.hasMoreElements()) {
								String key = (String)requestE.nextElement();
								if(!key.equals("email") && !key.equals("nextAction") && !key.equals("nextVar") && !key.equals("lookupMessage") && !key.equals("action") && !key.equals("offset") && !key.equals("size")){
									passThrough += key + "=" + (String)requestHash.get(key) + "&";
					%> <input TYPE="HIDDEN" NAME="<%=key%>"
				VALUE="<%=(String)requestHash.get(key)%>"> <%
								}	// end if
							}	// end while
					%>
			<input type="hidden" NAME="email" VALUE="<%=ar.getValue("email")%>">

			<tr>
			<TD ALIGN="LEFT" CLASS="button"><A CLASS="button" HREF="JavaScript:history.go(-1)">&lt; &lt; Back</a></TD>
			<td ALIGN="RIGHT" CLASS="button">
			<a	HREF="javascript: goNext('
			<% 
				if("true".equals(ar.getValue("ssmExists"))){
			%>
					addSpouse
			<%
				}
				else
				{
			%>
					createSSM
			<%
				}
			%>
			')" CLASS="button">Next &gt; &gt;</a></td>
			</tr>
			
			</form>
		</table>
		<p>
		<% 
		if(!"true".equals(ar.getValue("ssmExists"))){ // SSM doesn't exist, will be created
		%>
		<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
			<tr>
				<td CLASS="boxheader"><img SRC="/crs/images/info.gif"> Instructions</td>
			</tr>
			<tr>
				<td class="cell">
				<p>When you click "next", a login account will be created for your spouse.  The username will be the email address you entered above, and the password will be the same as yours. Your spouse's secret question and answer will also be the same as yours. Your spouse may use this account to register for future events.
				</td>
			</tr>
			<tr>
				<td CLASS="cell"></td>
			</tr>
		</table>
		<%
		}
		%>
		
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
