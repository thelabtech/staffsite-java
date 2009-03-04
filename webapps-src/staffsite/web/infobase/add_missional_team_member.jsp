<%@ page import="org.alt60m.servlet.*, org.alt60m.ministry.model.dbio.Contact, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
%>
<% String pageTitle="Add a new Missional Team member"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<P ALIGN="CENTER">
<FORM NAME="addPersonContact" ACTION="/servlet/InfoBaseController?action=addMissionalTeamMember" METHOD="POST">
<INPUT TYPE="HIDDEN" NAME="teamID" VALUE="<%= request.getParameter("teamID") %>">
<INPUT TYPE="HIDDEN" NAME="locallevelid" VALUE="<%= request.getParameter("teamID") %>">
<%
		box.setTitle("Select a person");
		box.setStyle("Classic");
		box.setWidth("");
		out.print(box.printTop());
%>
<%= font %>
Search by <i>Last Name</i>. If the person you wish to add is not in the list below, check the spelling of their<BR>last name and try again.  If you still cannot find them, <A HREF="/servlet/InfoBaseController?action=makeNewPerson&purpose=team&activityid=&teamID=<%= request.getParameter("teamID")%>">click here</A>.

<P ALIGN="center">
				 <INPUT TYPE="text" NAME="lastName" MAXLENGTH="30" VALUE="<%= (request.getParameter("lastName") == null) ? "" : request.getParameter("lastName") %>">&nbsp;
				 <INPUT TYPE="submit" VALUE="Search">
<P ALIGN="CENTER">
<%= font %>
<%
 if (ar.getValue("infoMessage")==null){ %>
Here is a list of people in the Campus Ministry system.<BR>Select one to add them as a Missional Team member.<% } 
	else { 
		out.print(ar.getValue("infoMessage"));
 } %>


</FONT>

<P ALIGN="CENTER">
</FORM>
<FORM NAME="addPersonContact" ACTION="/servlet/InfoBaseController?action=saveTeamMember" METHOD="POST">
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
</SELECT>&nbsp;
<INPUT TYPE="HIDDEN" NAME="targetareaid" VALUE="<%= request.getParameter("targetareaid") %>">
<INPUT TYPE="HIDDEN" NAME="teamID" VALUE="<%= request.getParameter("teamID") %>">
<INPUT TYPE="HIDDEN" NAME="locallevelid" VALUE="<%= request.getParameter("teamID") %>">
				 <INPUT TYPE="hidden" NAME="search" VALUE="lastName">
<INPUT TYPE="SUBMIT" VALUE="Assign">
				 </FORM>
<%= box.printBottom() %>
				 
<!--<%=fontB%><%=ar.toHTML()%>-->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>