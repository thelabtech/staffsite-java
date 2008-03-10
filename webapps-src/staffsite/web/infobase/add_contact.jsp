<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
%>
<% String pageTitle="Add a new contact"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<P ALIGN="CENTER"><FORM NAME="addContact" ACTION="/servlet/InfoBaseController?action=saveContact" METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="targetareaid" VALUE="<%= request.getParameter("targetareaid") %>">
<INPUT TYPE="HIDDEN" NAME="activityid" VALUE="<%= request.getParameter("activityid") %>">
<%
		box.setTitle("Select a person");
		box.setStyle("Classic");
		box.setWidth("");
		out.print(box.printTop());
%>
<P ALIGN="CENTER">
<%= font %>
<%
if("region".equals(request.getParameter("mode"))) {
%>This is a list of staff members in the <%= ar.getValue("region") %> region.<BR>Select a person from this list to add them as a contact person.<% 
} 
	else if (ar.getValue("infoMessage")==null){ %>
Here is a list of staff members with the last name you typed.<BR>Select one to add them as a contact person.<% } 
	else { 
		out.print(ar.getValue("infoMessage"));
 } %>


</FONT>
<P ALIGN="CENTER">
<SELECT NAME="accountno">
	<% Iterator staffI = ar.getCollection("staff").iterator();
	   while(staffI.hasNext()) {
			 Hashtable currentStaff = (Hashtable)staffI.next();
			 %>
			<OPTION VALUE="<%= currentStaff.get("AccountNo") %>"><%= (String)currentStaff.get("PreferredName") + " " + (String)currentStaff.get("LastName") %></OPTION>
				<% } %>
</SELECT>&nbsp;<INPUT TYPE="SUBMIT" VALUE="Assign"></FORM>
<FORM NAME="addContact" ACTION="/servlet/InfoBaseController?action=addContact" METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="targetareaid" VALUE="<%= request.getParameter("targetareaid") %>">
<INPUT TYPE="HIDDEN" NAME="activityid" VALUE="<%= request.getParameter("activityid") %>">
				 <INPUT TYPE="hidden" NAME="mode" VALUE="lastName"><%= font %>
				 <%
if("region".equals(request.getParameter("mode"))) {
%>Or, if the staff member you wish to add is not in the <%= ar.getValue("region") %> region,<BR> type their last name here:<% 
} else { %>If the staff member you wish to add is not in the list above, check the spelling of their<BR>last name and try again.  If you still cannot find them, <A HREF="mailto:help@campuscrusadeforchrist.com">contact us</A>.<% } %>

<P ALIGN="center">
				 <INPUT TYPE="text" NAME="lastName" MAXLENGTH="30" VALUE="<%= (request.getParameter("lastName") == null) ? "" : request.getParameter("lastName") %>">&nbsp;
				 <INPUT TYPE="submit" VALUE="Search">
				 </FORM>
<%= box.printBottom() %>
				 
<!--<%=fontB%><%=ar.toHTML()%>-->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>