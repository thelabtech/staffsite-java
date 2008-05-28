<%@ page import="org.alt60m.servlet.*, org.alt60m.ministry.model.dbio.Contact, java.util.*" %>
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
<P ALIGN="CENTER"><FORM NAME="addPersonContact" ACTION="/servlet/InfoBaseController?action=savePersonContact" METHOD="POST">
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
 if (ar.getValue("infoMessage")==null){ %>
Here is a list of people with the last name you typed.<BR>Select one to add them as a contact person.<% } 
	else { 
		out.print(ar.getValue("infoMessage"));
 } %>


</FONT>
<P ALIGN="CENTER">
<SELECT NAME="personID">
	<% Iterator contacts = ar.getCollection("contacts").iterator();
	   while(contacts.hasNext()) {
			 Contact currentContact = (Contact)contacts.next();
			 %>
			<OPTION VALUE="<%= currentContact.getPersonID() %>">
					<%= (String)currentContact.getFirstName() + " "%>
					<%if((currentContact.getPreferredName()!=null)&&
							(!((String)currentContact.getPreferredName()).equals(""))&&
							(!((String)currentContact.getPreferredName()).equals(" "))&&
							(!((String)currentContact.getPreferredName()).equals((String)currentContact.getFirstName())))
					{
						out.print( "'"+(String)currentContact.getPreferredName()+"' ");
					}
					%>
					<%= (String)currentContact.getLastName()+ " (" +(String)currentContact.getEmail()+")" %>
			</OPTION>
				<% } %>
</SELECT>&nbsp;<INPUT TYPE="SUBMIT" VALUE="Assign"></FORM>
<FORM NAME="addPersonContact" ACTION="/servlet/InfoBaseController?action=addPersonContact" METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="targetareaid" VALUE="<%= request.getParameter("targetareaid") %>">
<INPUT TYPE="HIDDEN" NAME="activityid" VALUE="<%= request.getParameter("activityid") %>">
				 <INPUT TYPE="hidden" NAME="search" VALUE="lastName"><%= font %>
If the person you wish to add is not in the list above, check the spelling of their<BR>last name and try again.  If you still cannot find them, <A HREF="mailto:help@campuscrusadeforchrist.com">contact us</A>.

<P ALIGN="center">
				 <INPUT TYPE="text" NAME="lastName" MAXLENGTH="30" VALUE="<%= (request.getParameter("lastName") == null) ? "" : request.getParameter("lastName") %>">&nbsp;
				 <INPUT TYPE="submit" VALUE="Search">
				 </FORM>
<%= box.printBottom() %>
				 
<!--<%=fontB%><%=ar.toHTML()%>-->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>