<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<jsp:useBean id="selBool" class="org.alt60m.html.SelectBoolean"/>
<%
	selBool.setLabels("Yes","No");
%>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	Conference conference = (Conference)ar.getObject("conference");
	Registration registration = (Registration)ar.getObject("registration");
	Person spouse = (Person)ar.getObject("spouse");
	
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	String pageTitle = "Confirm Spouse";
	Hashtable requestHash = ar.getHashtable("request");
	String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	boolean noMatches=false;
	boolean sameLastName= false;
	boolean firstSearch= true;
	
	if(registration.getPerson().getLastName().equals(ar.getValue("lastName")))  // if the logged-in user's last name was searched for
	{																				
		sameLastName= true;
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
					<td ALIGN="CENTER" COLSPAN="2" CLASS="boxheader">Confirm Spouse Selection</td>
				</tr>
				<tr>
					<td COLSPAN="2" CLASS="cell">
					You selected   <b>
					<%
					if(ar.getValue("ssm")!=null)
					{
					%>
						<%=spouse.getEmail()%>
					<%
					} else {
					%>
						<%=spouse.getFirstName()%> <%=spouse.getLastName()%>								<%
								boolean noCity= spouse.getCity()==null||"".equals(spouse.getCity());
								boolean noState= spouse.getState()==null||"".equals(spouse.getState());
								if (!(noCity&noState))
								{
									if (!noCity)
									{
										%>(<%=spouse.getCity()%><%
										if(noState)
										{
										%>)<%
										}
									}
									if (!noState)
									{
										if(!noCity)
										{
											%>,&nbsp;<%
										}else{
											%>(<%
										}
									%><%=spouse.getState()%>)<%
									}
								}
						%>
						<%
					}
					%>
					</b>   to be set as your spouse.  
					<p>
					If this is incorrect, click "Back" to return to the previous screen and select the correct spouse.
					<p>
					If it is correct, click "Next" to register your spouse and complete the registration process.
					
					</td>
				</tr>
				<%
							Enumeration requestE = requestHash.keys();
							String passThrough = "";
							while (requestE.hasMoreElements()) {
								String key = (String)requestE.nextElement();
								if(!key.equals("firstName") && !key.equals("lastName") && !key.equals("nextAction") && !key.equals("nextVar") && !key.equals("lookupMessage") && !key.equals("action") && !key.equals("offset") && !key.equals("size")){
									passThrough += key + "=" + (String)requestHash.get(key) + "&";
					%>
					<%
								}
							}
					%>
				
				<tr>
					<TD CLASS="button" ALIGN="LEFT"><A CLASS="button" HREF="JavaScript:history.go(-1)">&lt; &lt; Back</a></TD>
					<TD CLASS="button" ALIGN="RIGHT"><A CLASS="button" 
					<%
					if(ar.getValue("ssm")!=null)
					{
					%>
						HREF="/servlet/CRSRegister?action=addSpouse&ssm=<%=ar.getValue("ssm")%>&<%=passThrough%>"
					<%
					} else {
					%>
						HREF="/servlet/CRSRegister?action=addSpouse&foundID=<%=ar.getValue("foundID")%>&<%=passThrough%>"
					<%
					}
					%>
					>Next &gt; &gt;</a></TD>
					</tr>
					
				</form>
			</table>
			<p>
			
<p>
	<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
		<tr>
			<td CLASS="boxheader"><img SRC="/crs/images/info.gif"> Instructions</td>
		</tr>
		<tr>
			<td class="cell">
				<p>
				<b>Note:</b>  Once you click "Next", you can't easily change your spouse (if you have mistakenly selected the wrong person as your spouse) without help from the event administrator, so please make sure that this is actually your spouse before continuing.
				
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