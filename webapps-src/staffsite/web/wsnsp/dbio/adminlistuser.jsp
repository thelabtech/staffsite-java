<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Staff Listing"; %>

<%@ include file="wsnspheader.jspf" %>

<%=font3XL%>Select Staff:</font><br>
<table width='100%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr><th><%=fontS%>result</th><th><%=font%>Name</th><th><%=font%>Address</th><th><%=font%>City, State</th><th><%=font%>E-mail</th><th><%=font%>Phone</th></tr>
	<%
	if (!h.containsKey("0")) {
		%>
		<TH colspan=8><%=font%>There are currently no entries matching your search criteria.</font></TH>
	</table>
		<BR><BR>Please click the back button and check your spelling or try searching by the first few letters of their name. 
			If they are still not listed, see below.

			<BR><BR>We want to make sure that all of our WSN project leaders have access to the Campus Staff Website so that they'll be able to access the Summer Project Tool. If the leader who you're trying to add didn't show up in the search above, it means that they don't have access to the Staff Site yet. Please send an <a href="mailto:help@campuscrusadeforchrist.com&subject=Please create new Staff Site account for WSN User">e-mail to Customer Service</a> and request a staff.campuscrusadeforchrist.com login account for the person. In the email include: 1) include their Staff Account number if the person is on staff; 2) indicate whether they are married or single; 3) if female, indicate whether she is married to someone on staff; and 4) a password of 5-14 characters. Customer Service will create a login account for the person and reply to you within 24 hours. Once Customer Service notifies you that the login account has been created, try your search again by clicking "Add Leader/User" on your WSN home screen, and you should be able to find them.
		<%
	} else {
		Integer counter= new Integer(0);
		while (h.containsKey(counter.toString())){
			Hashtable app = (Hashtable)h.get(counter.toString());
			%>
			<tr align=center>
				<td><%=fontS%><b><%=counter.intValue()+1%></td>
				<td><%=fontText%><a href="/servlet/WsnSpController?view=adminedituser&action=adminEditUser&id=<%=formHelp.value((String)app.get("StaffProfileID"))%>"><%=formHelp.value((String)app.get("Name"))%></a>&nbsp;</td>
				<td><%=fontText%><%=formHelp.value((String)app.get("CurrentAddress"))%>&nbsp;</td>
				<td><%=fontTextS%><%=formHelp.value((String)app.get("CurrentCity"))%><%if (app.get("CurrentCity")!=null){%>, <%}%><%=formHelp.value((String)app.get("CurrentState"))%>&nbsp;</td>
				<td><%=fontText%><a href='mailto:<%=formHelp.value((String)app.get("CurrentEmail"))%>'><%=formHelp.value((String)app.get("CurrentEmail"))%>&nbsp;</a></td>
				<td><%=fontTextS%><%=formHelp.value((String)app.get("CurrentPhone"))%>&nbsp;</td>
			</tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
	%></table>
	<BR><BR>To select the person you want, click on their name above. If their name does not appear in the list, see below.

	<BR><BR>We want to make sure that all of our WSN project leaders have access to the Campus Staff Website so that they'll be able to access the Summer Project Tool. If the leader who you're trying to add didn't show up in the search above, it means that they don't have access to the Staff Site yet. Please send an <a href="mailto:help@campuscrusadeforchrist.com&subject=Please create new Staff Site account for WSN User">e-mail to Customer Service</a> and request a staff.campuscrusadeforchrist.com login account for the person. In the email include: 1) include their Staff Account number if the person is on staff; 2) indicate whether they are married or single; 3) if female, indicate whether she is married to someone on staff; and 4) a password of 5-14 characters. Customer Service will create a login account for the person and reply to you within 24 hours. Once Customer Service notifies you that the login account has been created, try your search again by clicking "Add Leader/User" on your WSN home screen, and you should be able to find them.
	<%
	}
	%>


<p> &nbsp;
<%@ include file="wsnspfooter.jspf" %>