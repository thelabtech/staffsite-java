<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>

<% Hashtable h = (Hashtable) session.getValue("tub"); %>

<jsp:useBean id="selGender" class="org.alt60m.html.SelectGender"/>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Add / Edit Children Information"; %>

<%@ include file="wsnspheader.jspf" %>

<form method="post" action="/servlet/WsnSpController">
<input type='hidden' name="action" value="addKids">
<input type='hidden' name="view" value="showkids">
<input type='hidden' name="id" value='<%=h.get("WsnApplicationID")%>'>
<input type='hidden' name="del" value='no'>
<input type='hidden' name="LastName" value='<%=h.get("LegalLastName")%>'>
<input type='hidden' name="FirstName" value='<%=h.get("LegalFirstName")%>'>

<table border='0' width='100%'>
<tr valign='top'><td colspan='3'><%=fontTextXL%><%=h.get("LegalFirstName")%>&nbsp;and&nbsp;<%=h.get("SpouseFirstName")%>&nbsp;<%=h.get("LegalLastName")%>'s Children</font></td>
<td colspan='2'> &nbsp; </td>
</tr>
<tr valign='top'>
	<td width='50%'>
	
	<table width='50%'border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
	<tr align=center><td><%=fontText%> &nbsp;</td><td width='50%'><%=fontText%> First Name</td><td><%=fontTextS%> View/Edit</td><td><%=fontTextS%> Remove</td></tr>
	<%
	if (h.get("Children").equals("true")){ 
		%>
		<%=font%>&nbsp;
		<%
		if (!h.containsKey("0")) {
			%>
			<tr><td colspan=4><%=font%><b><i>You have no children associated.</b></i></td></tr>
			<%
		} else {
			Integer counter= new Integer(0);
			while (h.containsKey(counter.toString())){
				Hashtable app = (Hashtable)h.get(counter.toString());
				counter=new Integer(counter.intValue()+1);
				%>
				<tr align=center>
					<td>
						<%=fontS%><%=counter.toString()%>
					</td>
					<td>
						<%=fontS%><%=app.get("Name")%>
					</td>
					<td>
						<a href='/servlet/WsnSpController?view=showappinfo&action=adminEditApp&id=<%=app.get("WsnApplicationID")%>'>
						<img src='/wsnsp/images/magglass.gif' border=0></a>
					</td>
					<td>
						<a href='/servlet/WsnSpController?view=showkids&action=addKids&FirstName=<%=h.get("LegalFirstName")%>&LastName=<%=h.get("LegalLastName")%>&id=<%=h.get("WsnApplicationID")%>&KidWsnApplicationID=<%=app.get("WsnApplicationID")%>&del=yes'>
						<img src='/wsnsp/images/warning.gif' border=0></a>
					</td>
				</tr>
				<%
			}
		}
		%>
		<tr><td></td>
		<tr>
			<td align=center>
				<B>+</B>
			</td>
			<td>
				<input name="KidsFirstName">
			</td>
			<td colspan=2 align=center rowspan='2'>
				<input type='submit' value='Add'>
			</td>
		</tr>
		<%
	}

	if (h.containsKey("select0")) {
		Integer counter= new Integer(0);
		%>
		<tr>
			<td align=center>
			 <B>or</B> 
			</td>
			<td>
				<select name='KidWsnApplicationID'>
					<option value="none"></option>
					<%
					while (h.containsKey("select" + counter.toString())){
						Hashtable sel = (Hashtable)h.get("select" + counter.toString());
						%>
						<option value='<%=sel.get("WsnApplicationID")%>'><%=sel.get("Name")%></option>
						<%
						counter=new Integer(counter.intValue()+1);
					}
					%>
				</select>
			</td>
		</tr>
	<%
	}
%>			
</table>
	
</td>
<td> &nbsp; </td><td rowspan='3'><%=fontText%>Notes:<p> <%=font%> You may add children by typing in their first name
	and clicking on the <B>Add</B> button. The child will be assigned most of the same information
	as the parent.
	<p>
	If you have already entered the child (and the last name is the same) they will
	show up in the drop down box. After adding a child, you may click on the view/edit button to
	supply specific information.<p>
	Clicking on <B>remove</B> will remove the child from their association to their parents, but they will still exist in the system.
</td>
</tr>
<td colspan='2'> &nbsp; </td>
<tr><td align=center>
</form>
<form method="post" action="/servlet/WsnSpController">
<input type='hidden' name="action" value='adminEditApp'>
<input type='hidden' name="view" value="showappinfo">
<input type='hidden' name="id" value='<%=h.get("WsnApplicationID")%>'>
<input type='submit' value='Return'><%=fontText%> to <%=h.get("LegalFirstName")%>'s Record<p>
</td></tr>
</table>
</form>
<p> &nbsp;
<p> &nbsp;

<%@ include file="wsnspfooter.jspf" %>

<%
//for (Enumeration e = h.keys(); e.hasMoreElements();) {
//	String k = (String) e.nextElement();
//	out.println("key: " + k + " value: " + h.get(k) + " <br>");
//}
%>


</HTML>