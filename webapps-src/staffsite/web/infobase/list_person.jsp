<%@ page import="org.alt60m.servlet.*, org.alt60m.ministry.model.dbio.Contact, java.util.*" %>
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
		String this_personid;
		String this_staffid;
		String regionID = "";
		String mode = (String)ar.getValue("mode");
		String group = "";
		
	 %>
<% box.setTitle("&nbsp;Staff Search Results");%>
<% box.setSubPad("0"); %>
<% box.setStyle("classic");%>
<% box.setWidth("95%"); %>

<%=box.printTop()%>
	<TABLE WIDTH="100%" BORDER="0" CELLSPACING="2" CELLPADDING="2">
	<TR>
	
	<TD BGCOLOR="<%= color2 %>"><%=font%><B>Name</B></FONT></TD>
	<TD BGCOLOR="<%= color2 %>"><%=font%><B>Location</B></FONT></TD>
	<TD BGCOLOR="<%= color2 %>"><%=font%><B>E-mail</B></FONT></TD>
	</TR>
	<% 
	Hashtable<String, Object> currentAddress=new Hashtable<String, Object>();
	Vector<Contact> contacts=(Vector)ar.getCollection("contacts");
	Vector<Hashtable<String, Object> > addresses=(Vector)ar.getCollection("addresses");
	Iterator contactIter = contacts.iterator();
	Iterator addressIter = addresses.iterator();
	   while(contactIter.hasNext()) {
			 Contact currentPerson = (Contact)contactIter.next();
			if(addressIter.hasNext()){ currentAddress=(Hashtable<String, Object> )addressIter.next();}
       this_address1 = (String)currentAddress.get("Address1");
			 this_address2 = (String)currentAddress.get("Address2");
			 this_address3 = (String)currentAddress.get("Address3");
			 this_address4 = (String)currentAddress.get("Address4");
			 this_city = (String)currentAddress.get("City");
			 this_state = (String)currentAddress.get("State");
			 this_zip = (String)currentAddress.get("Zip");
			 this_country = (String)currentAddress.get("Country");
			 this_email = (String)currentPerson.getEmail();
			 
			 
				if((currentPerson.getPreferredName()!=null)&&
						(!((String)currentPerson.getPreferredName()).equals(""))&&
						(!((String)currentPerson.getPreferredName()).equals(" "))&&
						(!((String)currentPerson.getPreferredName()).equals((String)currentPerson.getFirstName())))
				{
					this_preferredName =( (String)currentPerson.getFirstName())+" ("+( (String)currentPerson.getPreferredName())+")";
				}
				else
				{
					this_preferredName =( (String)currentPerson.getFirstName());
				}
			  
			 this_lastName = (String)currentPerson.getLastName();
			 this_personid = (String)(currentPerson.getPersonID()+"");
			 this_staffid = (String)(currentPerson.getAccountNo()+"");
			 String record_color="blue";
			 %>
				<%
				if ((this_personid.equals("0")||this_personid==null||this_personid.equals(""))
						&&
						(!(this_staffid.equals("0")||this_staffid==null||this_staffid.equals("")))){
					record_color="black";
				}
				else if ((!(this_personid.equals("0")||this_personid==null||this_personid.equals("")))
						&&
						(this_staffid.equals("0")||this_staffid==null||this_staffid.equals(""))){
					record_color="green";
				}
				
				%>
				<TR>
				<%if(!((this_personid.equals("0")||this_personid==null)||(this_personid.equals("")))){ %>
				<TD  ><%=font%><A style="color:<%= record_color%>" HREF="/servlet/InfoBaseController?action=showPersonInfo&accountNo=<%=this_staffid%>&personID=<%= this_personid %>"> <B><%=this_preferredName +" " + this_lastName %></B></A></FONT></TD>
				<%}else{ %>
				<TD style="color:<%= record_color%>"><%=font%><A style="color:<%= record_color%>" HREF="/servlet/InfoBaseController?action=showStaffInfo&staffid=<%= this_staffid %>"> <B><%=this_preferredName +" " + this_lastName %></B></A></FONT></TD>
				<%} %>
				<TD style="color:<%= record_color%>"><%=font%><% if(!this_address1.trim().equals("")) out.print(this_address1);
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
<tr><td colspan="3" style="padding-left:30px;"><%=font%><i>
<br>
<p style="font-weight:bold;color:black;line-height:15px;margin:0px;padding:0px;">Black - Record in the PeopleSoft Database Only</p>
<p style="font-weight:bold;color:blue;line-height:15px;margin:0px;padding:0px;">Blue - Matched Record between PeopleSoft and Campus Databases</p>
<p style="font-weight:bold;color:green;line-height:15px;margin:0px;padding:0px;">Green - Record in Campus Database Only</p>
</td></tr>
		</TABLE>
		
<%=box.printBottom()%>
<!-- <%=fontB%><%=ar.toHTML()%> -->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>