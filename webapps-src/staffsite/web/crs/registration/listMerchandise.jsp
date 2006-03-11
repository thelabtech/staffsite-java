<%@ page import="org.alt60m.servlet.*, java.util.*, org.alt60m.util.ArrayHelper, org.alt60m.crs.model.*" %>
<%
try{
	ActionResults ar = ActionResults.getActionResults(session);
	if(ar==null){
		response.sendRedirect("/servlet/CRSRegister");
	}
	Registration registration = (Registration)ar.getObject("registration");
	Conference conference = (Conference)ar.getObject("conference");
	String pageTitle = "Registration of " + registration.getPerson().getFirstName() + " " + registration.getPerson().getLastName();
	boolean isSpouse = session.getAttribute("spouseRegID") != null && (session.getAttribute("spouseRegID").equals(String.valueOf(registration.getRegistrationID())));
	Hashtable gender = new Hashtable();
	gender.put("1", "Male");
	gender.put("0", "Female");
	gender.put("", "");
	Hashtable maritalStatus = new Hashtable();
	maritalStatus.put("S", "Single");
	maritalStatus.put("M", "Married");
	maritalStatus.put("D", "Divorced");
	maritalStatus.put("P", "Separated");
	maritalStatus.put("W", "Widowed");
	String view = ar.getValue("view");
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
			<%=registrationMenu.display(isSpouse ? 6 : 3)%>
			<p>
			<%=otherOptionsMenu.display(0)%>
			<p>
			<%=accountManagementMenu.display(0)%>
		</td>
		<td VALIGN="TOP" COLSPAN="2">
			<table BORDER="0" CELLSPACING="0" WIDTH="100%" CLASS="box">
				<tr>
					<td CLASS="boxheader" COLSPAN="3"><%=conference.getName()%> Additional Expenses</td>
				</tr>
				<tr>
					<td CLASS="cell" COLSPAN="3">
					<%
					if(isSpouse)
					{
					%>
						Please select additional merchandise and activities for your spouse. The expenses will be added to your conference fee.
					<%
					}
					else
					{
					%>
						This page allows you to choose additional merchandise and activities. The expenses will be added to your conference fee.
					<%
					}
					%>
					</td>
				</tr>
				<form NAME='merchandise' ACTION="/servlet/CRSRegister" METHOD="post">
				<%
				if(!isSpouse){
				%>
				<input TYPE=hidden VALUE="T" NAME="spouseReg">				
				<%
				}
				%>
				<input TYPE=hidden NAME="action" VALUE="saveRegistrationMerchandise">
				<input TYPE=hidden NAME="view" VALUE="<%=view%>">
				<input TYPE="hidden" NAME="activeID" VALUE="<%=registration.getRegistrationID()%>"> 
				<tr>
					<td CLASS="subboxheader" WIDTH="10%">&nbsp;</td>
					<td CLASS="subboxheader">Item</td>
					<td CLASS="subboxheader" ALIGN="RIGHT" WIDTH="15%">Price</td>
				</tr>
				<%
				if(ar.getCollection("merchandise").size() > 0){
					Iterator choices = ar.getCollection("choices").iterator();
					Hashtable hashMerchandise = new Hashtable();
					while(choices.hasNext()){
						Merchandise m = (Merchandise)choices.next();
						hashMerchandise.put(String.valueOf(m.getMerchandiseID()), "CHECKED");
					}
					Iterator options = ar.getCollection("merchandise").iterator();
					for(int i = 0; options.hasNext(); i++){
						Merchandise m = (Merchandise)options.next();
				%>
				<tr>
				<%if (m.getAmount()==0){
				%>
					<td></td>
					<td CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM" ALIGN="CENTER"><b><%=m.getName()%></b></td>
					<td></td>
					</tr>
					<tr>
					<td></td>
					<td CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM" ALIGN="CENTER"><%=m.getNote()%></td>
					<td></td>
					</tr>
				<%} 
					else {  %>
						<td CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM" ALIGN="CENTER" ROWSPAN="2"><input TYPE="CHECKBOX" NAME="choices" value="<%=m.getMerchandiseID()%>" <%=hashMerchandise.get(String.valueOf(m.getMerchandiseID()))%>></td>
						<td CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM"><b><%=m.getName()%></b></td>
						<td CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM" ALIGN="RIGHT">$<%=formatter.formatDecimal(m.getAmount())%></td>
						</tr>
					<tr>
						<td CLASS="<%=(i%2 == 0) ? "cell" : "cell2" %>" VALIGN="BOTTOM" COLSPAN="2"><%=m.getNote()%></td>
				</tr>
					<%}%>
				<%
					}
				} else {
				%>
				<tr>
					<td CLASS="cell" ALIGN="CENTER" COLSPAN="3">There aren't any additional expenses</td>
				</tr>
				<%
				}
				%>
				<tr>
					<td ALIGN="CENTER" COLSPAN="3"><table CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
							<tr>
								<td CLASS="button" ALIGN="LEFT"><a HREF="/servlet/CRSRegister?action=listQuestions<%=isSpouse ? "&spouseReg=T" : ""%>" CLASS="button">&lt; &lt; Back</a></td>
								<td CLASS="button" ALIGN="RIGHT"><a HREF="javascript: document.merchandise.submit()" CLASS="button">Next &gt; &gt;</a></td>
							</tr>
						</table></td>
				</tr>
			</table>
			</form>
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
