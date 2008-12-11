<%@ page import="org.alt60m.servlet.*, org.alt60m.ministry.model.dbio.Person,org.alt60m.ministry.model.dbio.Address, java.util.*" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
Hashtable holdPerson=new Hashtable();
if (ar.getHashtable("holdPerson")!=null){
	holdPerson=ar.getHashtable("holdPerson");
}
String teamID=ar.getValue("teamID");
Boolean confirmed=false;
 String pageTitle= "Add New Person To InfoBase "; %>
<html>
<head>
<title><%= pageTitle %></title>
</head>

<%@ include file="/infobase/ibheader.jspf" %>

<%
if (ar.getValue("infoMessage")!=null&&(!ar.getValue("infoMessage").equals(""))){
	%>
<%= font %> <center><p style="color:red;"><%= ar.getValue("infoMessage")%></p></center>
	<%
}
if(ar.getCollection("perps")!=null&&((ar.getCollection("perps")).size()>0)){%>
	<table cellspacing=0 cellpadding=5 border=0 align="center" <%=bgcolorL%>>
<tr><td colspan=8><%=fontB%>People with emails or account numbers matching your submission:</td></tr>
<tr><td>&nbsp;</td><td><%=fontB%>First</td><td><%=fontB%>Preferred</td><td><%=fontB%>Last</td>
<td><%=fontB%>Staff Account #</td><td><%=fontB%>Address Type</td><td><%=fontB%>Address</td><td><%=fontB%>Email</td><td><%=fontB%>Phone #s</td></tr>
<%Vector<Person>perps=(Vector<Person>)ar.getCollection("perps");
for(Person p:perps){
	Address address=new Address();
	boolean firstAdd=true;
	for(Address a:(Vector<Address>)address.selectList("fk_PersonID='"+p.getPersonID()+"' and addressType in ('current','permanent')")){
		
	%>
	<tr><td>
<%if(firstAdd){ %>
<a href="/servlet/InfoBaseController?action=saveTeamMember&personID=<%=p.getPersonID() %>&locallevelid=<%=teamID %>&teamID=<%=teamID %>"><%=fontB%>That's the One!</a>
<%} %>
</td><td><%=fontB%>
<%=firstAdd?p.getFirstName():"&nbsp;" %>
</td><td><%=fontB%>
<%=firstAdd?p.getPreferredName():"&nbsp;" %>
</td><td><%=fontB%>
<%=firstAdd?p.getLastName():"&nbsp;" %>
</td><td><%=fontB%>
<%=firstAdd?p.getAccountNo():"&nbsp;" %>
</td><td><%=fontB%>		
<%=a.getAddressType() %>
		</td><td><%=fontB%>
		<%=a.getAddress1() %><%=(a.getAddress2()!=null)&&(a.getAddress2().length()>0)?"<br>"+a.getAddress2():"" %><br>
		<%=a.getCity() %>,
		<%=a.getState() %>&nbsp;
		<%=a.getZip() %>
		</td><td><%=fontB%>
		<%=a.getEmail() %>
		</td><td><%=fontB%>
		<%=(a.getHomePhone()!=null)&&(a.getHomePhone().length()>0)?"<br>Home: "+a.getHomePhone():"" %>
		<%=(a.getWorkPhone()!=null)&&(a.getWorkPhone().length()>0)?"<br>Work: "+a.getWorkPhone():"" %>
		<%=(a.getCellPhone()!=null)&&(a.getCellPhone().length()>0)?"<br>Cell: "+a.getCellPhone():"" %>
</td></tr>
	<%firstAdd=false;
	}}
%>
</table>
<%
}
else {
	if(ar.getCollection("suspects")!=null&&((ar.getCollection("suspects")).size()>0)){
		confirmed=true;%>
		<table cellspacing=0 cellpadding=5 border=0 align="center" <%=bgcolorL%>>
		<tr><td colspan=8><%=fontB%>People with names matching your submission:</td></tr>
		<tr><td>&nbsp;</td><td><%=fontB%>First</td><td><%=fontB%>Preferred</td><td><%=fontB%>Last</td>
		<td><%=fontB%>Staff Account #</td><td><%=fontB%>Address Type</td><td><%=fontB%>Address</td><td><%=fontB%>Email</td><td><%=fontB%>Phone #s</td></tr>
		<%Vector<Person>suspects=(Vector<Person>)ar.getCollection("suspects");
		for(Person p:suspects){
			Address address=new Address();
			
			boolean firstAdd=true;
			for(Address a:(Vector<Address>)address.selectList("fk_PersonID='"+p.getPersonID()+"' and addressType in ('current','permanent')")){
				
			%>
			<tr><td>
		<%if(firstAdd){ %>
		<a href="/servlet/InfoBaseController?action=saveTeamMember&personID=<%=p.getPersonID() %>&locallevelid=<%=teamID %>&teamID=<%=teamID %>"><%=fontB%>Choose this person</a>
		<%} %>
		</td><td><%=fontB%>
		<%=firstAdd?p.getFirstName():"&nbsp;" %>
		</td><td><%=fontB%>
		<%=firstAdd?p.getPreferredName():"&nbsp;" %>
		</td><td><%=fontB%>
		<%=firstAdd?p.getLastName():"&nbsp;" %>
		</td><td><%=fontB%>
		<%=firstAdd?p.getAccountNo():"&nbsp;" %>
		</td><td><%=fontB%>		
		<%=a.getAddressType() %>
		</td><td><%=fontB%>
		<%=a.getAddress1() %><%=(a.getAddress2()!=null)&&(a.getAddress2().length()>0)?"<br>"+a.getAddress2():"" %><br>
		<%=a.getCity() %>,
		<%=a.getState() %>&nbsp;
		<%=a.getZip() %>
		</td><td><%=fontB%>
		<%=a.getEmail() %>
		</td><td><%=fontB%>
		<%=(a.getHomePhone()!=null)&&(a.getHomePhone().length()>0)?"<br>Home: "+a.getHomePhone():"" %>
		<%=(a.getWorkPhone()!=null)&&(a.getWorkPhone().length()>0)?"<br>Work: "+a.getWorkPhone():"" %>
		<%=(a.getCellPhone()!=null)&&(a.getCellPhone().length()>0)?"<br>Cell: "+a.getCellPhone():"" %>
		</td></tr>
			<%firstAdd=false;
			}}
		%>
		</table>
		<%
	}
	

	


%>


<table cellspacing=0 cellpadding=5 border=0 align="center" <%=bgcolorL%>>
	<form method="post" name="makePerson" action="/servlet/InfoBaseController" >
            <input type="hidden" name="action" value="checkNewPerson"/>
            <input type="hidden" name="teamID" value="<%=teamID%>"/>
			<input type="hidden" name="locallevelid" value="<%=teamID%>"/>
	<input type="hidden" name="confirmed" value="<%=confirmed?"confirmed":"no" %>"/>
     <tr><td align=right ><%=fontB%>*First Name: </td><td><input bgcolor="yellow" type="text" name="firstName" value="<%=holdPerson.get("firstName")!=null?holdPerson.get("firstName"):"" %>" required/></td></tr>
<tr><td align=right ><%=fontB%>(Preferred Name): </td><td><input bgcolor="yellow" type="text" name="preferredName" value="<%=holdPerson.get("preferredName")!=null?holdPerson.get("preferredName"):"" %>" /></td></tr>
     <tr><td align=right ><%=fontB%>*Last Name: </td><td><input bgcolor="yellow" type="text" name="lastName" value="<%=holdPerson.get("lastName")!=null?holdPerson.get("lastName"):"" %>" required/></td></tr>
     <tr><td align=right ><%=fontB%>*Email: </td><td><input bgcolor="yellow" type="text" name="email" value="<%=holdPerson.get("email")!=null?holdPerson.get("email"):"" %>" required/></td></tr>
<tr><td align=right ><%=fontB%>Marital Status: </td><td><select bgcolor="yellow"  name="marital"  >
																<%Hashtable marital=new Hashtable();
																marital.put("","Not Specified");
																marital.put("M","Married");
																marital.put("S","Single");
																Iterator wed=marital.keySet().iterator();
																while (wed.hasNext()){
																	String ms=(String)wed.next();
																	//why is all this necessary? excellence. We want a nice dropdown that looks neat and retains its data through error-checking cycles.
																	%>
																	<option <%= ms.equals(holdPerson.get("marital"))?"selected":"" %> value="<%=ms %>"><%= marital.get(ms)%></option>
																	<%
																}
																%>
														</select></td></tr>
<tr><td colspan="2"><%=fontB %><Center> Current Contact Info (Optional but helpful):</Center></td></tr>     
<tr><td align=right ><%=fontB%>Home Phone: </td><td><input type="text" name="homePhone" value="<%=holdPerson.get("homePhone")!=null?holdPerson.get("homePhone"):"" %>" /></td></tr>
    <tr><td align=right ><%=fontB%>Work Phone: </td><td><input type="text" name="workPhone" value="<%=holdPerson.get("workPhone")!=null?holdPerson.get("workPhone"):"" %>" /></td></tr>
    <tr><td align=right ><%=fontB%>Mobile Phone: </td><td><input type="text" name="mobilePhone" value="<%=holdPerson.get("mobilePhone")!=null?holdPerson.get("mobilePhone"):"" %>" /></td></tr>
    <tr><td align=right ><%=fontB%>Address 1: </td><td><input type="text" name="address1" value="<%=holdPerson.get("address1")!=null?holdPerson.get("address1"):"" %>" /></td></tr>
    <tr><td align=right ><%=fontB%>Address 2: </td><td><input type="text" name="address2" value="<%=holdPerson.get("address2")!=null?holdPerson.get("address2"):"" %>" /></td></tr>
    <tr><td align=right ><%=fontB%>City: </td><td><input type="text" name="city" value="<%=holdPerson.get("city")!=null?holdPerson.get("city"):"" %>" /></td></tr>
    <tr><td align=right ><%=fontB%>State: </td><td><input type="text" name="state" value="<%=holdPerson.get("state")!=null?holdPerson.get("state"):"" %>" /></td></tr>
    <tr><td align=right ><%=fontB%>Zip: </td><td><input type="text" name="zip" value="<%=holdPerson.get("zip")!=null?holdPerson.get("zip"):"" %>" /></td></tr>
    <tr><td align=right ><%=fontB%>Country:</td><td><input type="text" name="country" value="<%=holdPerson.get("country")!=null?holdPerson.get("country"):"" %>" /></td></tr>
    <tr><td><input type="submit" name="Submit" value="<%=confirmed?"Just Do It":"Submit"%>" /></td></tr>
        </form>
 </table>
<%} %>
<%@ include file="/infobase/ibfooter.jspf" %>
</html>