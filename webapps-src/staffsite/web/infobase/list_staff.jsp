<%@ page import="org.alt60m.servlet.*, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);

%>
<% String pageTitle="Staff Search Results"; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>
<%@ include file="/infobase/ibheader.jspf" %>
<P ALIGN="CENTER">
<%	String this_address1;
		String this_address2;
		String this_address3;
		String this_address4;
		String this_city;
		String this_state;
		String this_zip;
		String this_country;
		String this_email;
		String this_preferredName;
		String this_lastName;
		String this_staffid;
		String regionID = "";
		String mode = (String)ar.getValue("mode");
		String group = "";
		if(mode.equals("associate")) {
			regionID = (String)ar.getValue("groupid");
		}
	 %>
<% box.setTitle("&nbsp;Staff Search Results");%>
<% box.setSubPad("0"); %>
<% box.setStyle("classic");%>
<% box.setWidth("95%"); %>

<%=box.printTop()%>
	<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
	<TR>
	<% if(mode.equals("associate")) { %>
	<TD BGCOLOR="<%= color2 %>"><%=font%><B>Add</B></FONT></TD>
	<FORM NAME="associateForm" METHOD="POST" ACTION="/servlet/InfoBaseController?action=saveAssociateStaff&locallevelid=<%= regionID %>">
	<% } %>
	<TD BGCOLOR="<%= color2 %>"><%=font%><B>Name</B></FONT></TD>
	<TD BGCOLOR="<%= color2 %>"><%=font%><B>Location</B></FONT></TD>
	<TD BGCOLOR="<%= color2 %>"><%=font%><B>E-mail</B></FONT></TD>
	</TR>
	<% Iterator staffI = ar.getCollection("staff").iterator();
	   while(staffI.hasNext()) {
			 Hashtable currentStaff = (Hashtable)staffI.next();
       this_address1 = (String)currentStaff.get("Address1");
			 this_address2 = (String)currentStaff.get("Address2");
			 this_address3 = (String)currentStaff.get("Address3");
			 this_address4 = (String)currentStaff.get("Address4");
			 this_city = (String)currentStaff.get("City");
			 this_state = (String)currentStaff.get("State");
			 this_zip = (String)currentStaff.get("Zip");
			 this_country = (String)currentStaff.get("Country");
			 this_email = (String)currentStaff.get("Email");
			 this_preferredName = (String)currentStaff.get("PreferredName");
			 this_lastName = (String)currentStaff.get("LastName");
			 this_staffid = (String)currentStaff.get("AccountNo");
			 %>
				<TR>
				<% if(mode.equals("associate")) { %>
				<TD ALIGN="CENTER" BGCOLOR="<%= color2 %>"><%=font%><INPUT TYPE="CHECKBOX" NAME="staffid" VALUE="<%= this_staffid %>"></FONT></TD>
				<% } %>
				<TD><%=font%><A HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= this_staffid %>"> <B><%=this_preferredName +" " + this_lastName %></B></A></FONT></TD>
				<TD><%=font%><% if(!this_address1.trim().equals("")) out.print(this_address1);
				                if(!this_address2.trim().equals("")) out.print("<BR>"+this_address2);
				                if(!this_address3.trim().equals("")) out.print("<BR>"+this_address3);
				                if(!this_address4.trim().equals("")) out.print("<BR>"+this_address4);
												out.print("<BR>");
				                if(!this_city.equals("")) out.print(this_city+", ");
				                if(!this_state.equals("")) out.print(this_state+" ");
				                if(!this_zip.equals("")) out.print(this_zip+" ");
				                if(!this_country.equals("")) out.print(this_country);
												%>
			 </FONT></TD>
				<TD><%=font%><% if(!this_email.equals("")) out.print("<A HREF=\"mailto:"+this_email+"\">"+this_email+"</A>"); %></FONT></TD>
				</TR>
			 <%
		 }
		%>
		</TABLE>
		<% if(mode.equals("associate")) { %>
   	<P ALIGN="CENTER"><INPUT TYPE="SUBMIT" VALUE="Add Staff"></FORM><% } %>
<%=box.printBottom()%>
<!-- <%=fontB%><%=ar.toHTML()%> -->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>