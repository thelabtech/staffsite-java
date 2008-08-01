<%@ page import="org.alt60m.servlet.*, java.util.*, java.text.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
org.apache.commons.logging.Log log = org.apache.commons.logging.LogFactory.getLog("org.alt60m.infobase.jsp.view_person");
SimpleDateFormat normalDateFormat = new SimpleDateFormat("MM/dd/yyyy");
SimpleDateFormat noYearDateFormat = new SimpleDateFormat("MM/dd");
boolean isHr = (new Boolean(ar.getValue("isHR"))).booleanValue();
boolean isStaff = (new Boolean(ar.getValue("isStaff"))).booleanValue();

Vector<Hashtable<String,String>>teams=(Vector<Hashtable<String,String>>)ar.getCollection("teams");

String ministry = "Campus Ministry";
String jobTitle = "";
String mobilePhone = "";
String firstName = "";
String staffID = "";
String accountCode = "";
String deptID = "";
String city = "";
String zip = "";
String otherCity = "";
String maritalStatus = "";
String email = "";
String position = "";
String workPhone = "";
String note = "";
Boolean isMale ;
String title = "";
String region = "";
String team = "";
String otherCountry = "";
String otherZip = "";
String role = "";
String namePrefix = "";
String jobCode = "";
String country = "";
String homePhone = "";
String countryCode = "";
String state = "";
String deptName = "";
String spouseName = "";

String address4 = "";
String url = "";
String address3 = "";
String address2 = "";
String pager = "";
String address1 = "";
String marriageDate = "";
String hireDate = "";
String birthDate = "";
;
String preferredName = "";
String lastName = "";

String fax = "";

String status = "";
String strategy = "";
if (isStaff){
Hashtable h = ar.getHashtable("staffInfo");

	isMale = (Boolean)h.get("IsMale");
	title = (String)h.get("Title");
	
	firstName = (String)h.get("FirstName");
	preferredName = (String)h.get("PreferredName");
	lastName = (String)h.get("LastName");
	namePrefix = (String)h.get("NamePrefix");
	
	maritalStatus = (String)h.get("MaritalStatus");
	spouseName = (String)h.get("SpouseFirstName");
	
	address1 = (String)h.get("Address1");
	address2 = (String)h.get("Address2");
	address3 = (String)h.get("Address3");
	address4 = (String)h.get("Address4");
	city = (String)h.get("City");
	state = (String)h.get("State");
	zip = (String)h.get("Zip");
	country = (String)h.get("Country");
	countryCode = (String)h.get("CountryCode");
	
	otherCity = (String)h.get("OtherCity");
	otherZip = (String)h.get("OtherZip");
	otherCountry = (String)h.get("OtherCountry");
	
	
	homePhone = (String)h.get("HomePhone");
	workPhone = (String)h.get("WorkPhone");
	mobilePhone = (String)h.get("MobilePhone");
	pager = (String)h.get("Pager");
	fax = (String)h.get("Fax");
	
	email = (String)h.get("Email");
	url = (String)h.get("Url");
	
	ministry = (String)h.get("Ministry");
	
	deptID = (String)h.get("DeptId");
	deptName = (String)h.get("DeptName");
	if("CHRISTIAN LEADERSHIP".equalsIgnoreCase(deptName)){deptName="Faculty Commons";}
	
	region = (String)h.get("Region");
	if("CL".equalsIgnoreCase(region)){region="FC";} 
	
	role = (String)h.get("Role");
	jobTitle = (String)h.get("JobTitle");
	position = (String)h.get("Position");		
	jobCode = (String)h.get("JobCode");
	
	team = (String)h.get("Team");
	status = (String)h.get("JobStatus");
	strategy = (String)h.get("Strategy");
	
	staffID = (String)h.get("AccountNo");
	accountCode = (String)h.get("AccountCode");
			
	note = (String)h.get("Note");
	  
  	marriageDate = "";
	hireDate = "";
	birthDate = "";
	if(h.get("MarriageDate") != null)
		marriageDate = normalDateFormat.format((Date)h.get("MarriageDate"));
	if(h.get("BirthDate") != null) 
		birthDate = noYearDateFormat.format((Date)h.get("BirthDate"));
	if(h.get("HireDate") != null)
		hireDate = normalDateFormat.format((Date)h.get("HireDate"));
   
}
else
{
	Hashtable h = ar.getHashtable("address");
	Hashtable p = ar.getHashtable("personInfo");
	
	title = (String)p.get("Title");
	isMale = (Boolean)(p.get("Gender").equals("1"));
	//firstName = (String)p.get("FirstName");
	preferredName = (String)p.get("PreferredName");
	lastName = (String)p.get("LastName");
	
	maritalStatus = (String)p.get("MaritalStatus");
	spouseName = (String)p.get("SpouseFirstName");
	
	address1 = (String)h.get("Address1");
	address2 = (String)h.get("Address2");
	address3 = (String)h.get("Address3");
	address4 = (String)h.get("Address4");
	city = (String)h.get("City");
	state = (String)h.get("State");
	zip = (String)h.get("Zip");
	country = (String)h.get("Country");
	
	homePhone = (String)h.get("HomePhone");
	workPhone = (String)h.get("WorkPhone");
	mobilePhone = (String)h.get("CellPhone"); //note not MobilePhone as above
	fax = (String)h.get("Fax");
		
	email = (String)p.get("Email");
	url = (String)h.get("Url");
	
	birthDate = "";
	if(p.get("RawBirthDate") != null) 
			birthDate = noYearDateFormat.format((Date)p.get("RawBirthDate"));
	
	
}
%>
<% String pageTitle = "Missional Team Member Information: " + preferredName + " " + lastName; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<P ALIGN="CENTER"><CENTER>
<TABLE WIDTH="98%" BORDER="0" CELLPADDING="2" CELLSPACING="0">
<TR><TD WIDTH="50%" valign="top">
<% box.setTitle("&nbsp;Contact Information");
   box.setStyle("Classic");
	 box.setWidth("98%");
%>
<%=box.printTop() %>
				<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<TR><TD VALIGN="TOP"><%=font%><B>Name: </B></FONT></TD><TD><%= font %><%= (title!=null ? title : "") + " " + firstName + " " + lastName %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Preferred Name: </B></FONT></TD><TD><%= font %><%= preferredName %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Address: </B></FONT></TD><TD><%= font %>
				              <%if(!address1.trim().equals("")) out.print(address1);
				                if(!address2.trim().equals("")) out.print("<BR>"+address2);
				                if(!address3.trim().equals("")) out.print("<BR>"+address3);
				                if(!address4.trim().equals("")) out.print("<BR>"+address4);
												out.print("<BR>");
				                if(!city.equals("")) out.print(city+", ");
				                if(!state.equals("")) out.print(state+" ");
				                if(!zip.equals("")) out.print(zip+" ");
				                if(!country.equals("")) out.print("<BR>" + country);%></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>E-mail: </B></FONT></TD><TD><%= font %><A HREF="mailto: <%= email %>"><%= email %></A></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Home Phone: </B></FONT></TD><TD><%= font %><%= homePhone %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Work Phone: </B></FONT></TD><TD><%= font %><%= workPhone %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Mobile Phone: </B></FONT></TD><TD><%= font %><%= mobilePhone %></TD></TR>
				<!-- Took out the following three fields since they aren't populated in the staff table ~JCS 02/07 -->
				<% /* if (!"CAMPUS MINISTRY".equalsIgnoreCase(ministry)) { %>
					<TR><TD VALIGN="TOP"><%=font%><B>Pager: </B></FONT></TD><TD><%= font %><%= pager %></TD></TR>
					<TR><TD VALIGN="TOP"><%=font%><B>Fax: </B></FONT></TD><TD><%= font %><%= fax %></TD></TR>
					<TR><TD VALIGN="TOP"><%=font%><B>Website URL: </B></FONT></TD><TD><%= font %><A HREF="<%= url %>"><%= url %></A></TD></TR>
				<% } */%>
				</TABLE>
<%= box.printBottom() %>
</TD>
<TD WIDTH="50%" VALIGN="TOP">
<% box.setTitle("&nbsp;Misc Information"); %>
<%=box.printTop() %>
<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<!--<TR><TD VALIGN="TOP"><%=font%><B>Gender: </B></FONT></TD><TD><%= font %><%= (isMale.booleanValue() ? "Male" : "Female") %></TD></TR>
				--><% if(maritalStatus.equals("M"))
					   maritalStatus = "Married";
           else
					   maritalStatus = "Single";
						 %>
				<TR><TD VALIGN="TOP"><%=font%><B>Marital Status: </B></FONT></TD><TD><%= font %><%= maritalStatus %></TD></TR>
        <% if(maritalStatus.equals("Married")) { %>
				<TR><TD VALIGN="TOP"><%=font%><B>Spouse Name: </B></FONT></TD><TD><%= font %><%= (spouseName!=null ? spouseName : "") %></TD></TR>
				<TR><TD VALIGN="TOP"><%=font%><B>Marriage Date: </B></FONT></TD><TD><%= font %><%= marriageDate %></A></TD></TR>
        <% } %>
				<TR><TD VALIGN="TOP"><%=font%><B>Birthday: </B></FONT></TD><TD><%= font %><%= birthDate %></TD></TR>
				
				<%if(isStaff){ %>
				<TR><TD VALIGN="TOP"><%=font%><B>Joined Staff: </B></FONT></TD><TD><%= font %><%= hireDate  %></TD></TR>
				
				<TR><TD VALIGN="TOP"><%=font%><B>Region: </B></FONT></TD><TD><%= font %><%= region %></TD></TR>
				<% if (!"CAMPUS MINISTRY".equalsIgnoreCase(ministry)) { %>
					<TR><TD VALIGN="TOP"><%=font%><B>Dept. Name: </B></FONT></TD><TD><%= font %><%= deptName %></TD></TR>
					<TR><TD VALIGN="TOP"><%=font%><B>Job Title: </B></FONT></TD><TD><%= font %><%= jobTitle %></TD></TR>
					<TR><TD VALIGN="TOP"><%=font%><B>Job Code: </B></FONT></TD><TD><%= font %><%= jobCode %></A></TD></TR>
				<% } else { %>
					<TR><TD VALIGN="TOP"><%=font%><B>Ministry: </B></FONT></TD><TD><%= font %><%= ministry %></TD></TR>
					<TR><TD VALIGN="TOP"><%=font%><B>Status: </B></FONT></TD><TD><%= font %><%= status %></TD></TR>
					<TR><TD VALIGN="TOP"><%=font%><B>Strategy: </B></FONT></TD><TD><%= font %><%= strategy %></A></TD></TR>
					<TR><TD VALIGN="TOP"><%=font%><B>Position: </B></FONT></TD><TD><%= font %><%= position %></A></TD></TR>
					
					<TR><TD VALIGN="TOP"><%=font%><B>Job: </B></FONT></TD><TD><%= font %><%= jobTitle %></A></TD></TR>				
				<% } %>
					<TR><TD VALIGN="TOP"><%=font%><B>Note: </B></FONT></TD><TD><%= font %><%= note %></A></TD></TR>
				<%} %>
				
				
				<%Hashtable<String,String> thisTeam=new Hashtable<String,String>();
				Iterator teamsIter=teams.iterator();
				int firsty=0;
				while(teamsIter.hasNext()){%>
				<TR><TD VALIGN="TOP"><%if(firsty<1){%><%=font%><B>Missional Team<%=(teams.size()>1)?"s":"" %>: </B></FONT><%}%>&nbsp;</TD>
				<%thisTeam=(Hashtable<String,String>)teamsIter.next();%>
				<TD>
				<%if ((ar.getValue("userPersonID").equals(ar.getValue("personID")))||(isHr)){ %>
				<A style="border:none;"
					HREF="/servlet/InfoBaseController?action=removeTeamMember&accountNo=<%=staffID %>&personID=<%= ar.getValue("personID") %>&locallevelid=<%= thisTeam.get("teamID") %>&teamID=<%= thisTeam.get("teamID") %>&view=person">
				<img alt="Remove" style="border:none;height:10px;width:10px;" src="/infobase/images/reddot.gif"></A>
				<%} %>
				
				<A href="/servlet/InfoBaseController?action=showTeam&locallevelid=<%= thisTeam.get("teamID") %>"><%= font %><%= thisTeam.get("name") %></A></TD></TR><%
				firsty++;
				}%>
				</TABLE>
				<%= box.printBottom() %>
				
				<% if(isHr) { %><BR>
<% box.setTitle("&nbsp;HR only information"); %>
<%=box.printTop() %>
<TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<TR><TD VALIGN="TOP"><%=font%><B>Children: </B></FONT></TD><TD><%=font%><%
				Iterator c = ar.getCollection("dependentInfo").iterator();
				while(c.hasNext()) {
					out.print(c.next() + "<BR>");
				}
				%></FONT></TD></TR>

				</TABLE>
				<%= box.printBottom() %>
					<% } %>
</TD>
</TR>
 
</TABLE>

</CENTER>
		<!--<%=fontB%><%=ar.toHTML()%>-->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>
