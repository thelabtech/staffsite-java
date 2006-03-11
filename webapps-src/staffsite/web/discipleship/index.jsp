<%@ page language="java" contentType="text/html" import="javax.xml.transform.*, java.net.*, javax.xml.transform.stream.*"%>

<jsp:useBean id="states" class="org.alt60m.html.SelectState" />
<jsp:useBean id="country" class="org.alt60m.html.SelectCountry" />

<html>
<head>
<title>Campus Discipleship Tool Homepage</title>
</head>

<% String pageTitle = "Main Page"; %>
<%@ include file="/discipleship/discipleshipheader.jspf" %>

<table width="100%" border="0" align="center">
	<tr valign="top"> 
		<td align=center>
		<form action="/discipleship/index.jsp" method=GET>
		<input type="hidden" name="action" value="listMyContacts">
		<input type="hidden" name="staffaccountno" value="<%=accountNo%>">
		<input type="hidden" name="view" value="listContacts">
		<input type=submit value="List My Contacts">
		</form>
		<form action="/discipleship/index.jsp" method=GET>
		<input type="hidden" name="action" value="listSchoolContacts">
		<input type="hidden" name="staffaccountno" value="<%=accountNo%>">
		<input type="hidden" name="view" value="listContacts">
		<input type=submit value="List Contacts From My School">
		</form>
		<form action="/discipleship/index.jsp" method=GET>
		<input type="hidden" name="action" value="listSchoolRolodex">
		<input type="hidden" name="staffaccountno" value="<%=accountNo%>">
		<input type="hidden" name="view" value="listRolodex">
		<input type=submit value="List Everyone In Rolodex From My School">
		</form>		
		<form action="/discipleship/index.jsp" method=GET>
		<input type="hidden" name="view" value="addContact">
		<input type="hidden" name="action" value="editContact">
		<input type=submit value="Add a Contact">
		</form>		
		</td>
	</tr>
</table>
		<% String view = request.getParameter("view");
		if (view!=null && view.equals("listContacts")) {
			String url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&staffaccountno="+request.getParameter("staffaccountno");
	
			URL xmlUrl = new URL(url);
			Source xsl = new StreamSource(getServletContext().getRealPath("/discipleship/contactlist.xsl"));
			Source xml = new StreamSource(xmlUrl.toExternalForm());
			
			System.setProperty("javax.xml.transform.TransformerFactory", "com.sun.org.apache.xalan.internal.xsltc.trax.TransformerFactoryImpl");  //Needed for JDK 1.5.0
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(xsl);
			transformer.transform(xml, new StreamResult(out));
			
		} else if (view!=null && view.equals("listRolodex")) {
			String url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&staffaccountno="+request.getParameter("staffaccountno");
	
			URL xmlUrl = new URL(url);
			Source xsl = new StreamSource(getServletContext().getRealPath("/discipleship/rolodexlist.xsl"));
			Source xml = new StreamSource(xmlUrl.toExternalForm());
			
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(xsl);
			transformer.transform(xml, new StreamResult(out));
		} else if (view!=null && view.equals("addContact")) {
			String url;
			if (request.getParameter("ContactId")!=null) {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&staffaccountno="+request.getParameter("staffaccountno")+"&ContactId="+request.getParameter("ContactId");
			} else {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&staffaccountno="+request.getParameter("staffaccountno");			
			}
			URL xmlUrl = new URL(url);
			Source xsl = new StreamSource(getServletContext().getRealPath("/discipleship/editcontact.xsl"));
			Source xml = new StreamSource(xmlUrl.toExternalForm());
			
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(xsl);
			transformer.transform(xml, new StreamResult(out));
		} else if (view!=null && view.equals("viewContactDetail")) {
			String url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&ContactId="+request.getParameter("ContactId");

			URL xmlUrl = new URL(url);
			Source xsl = new StreamSource(getServletContext().getRealPath("/discipleship/viewcontact.xsl"));
			Source xml = new StreamSource(xmlUrl.toExternalForm());
			
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(xsl);
			transformer.transform(xml, new StreamResult(out));
		} else if (view!=null && view.equals("addCall")) {
			String contactid = (String)request.getParameter("ContactId");
			String callid = (String)request.getParameter("CallId");
			String url;
			if (callid != null) {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&CallId="+callid;
			} else if (contactid != null) {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&ContactId="+contactid;
			} else {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action");			
			}
			
			URL xmlUrl = new URL(url);
			Source xsl = new StreamSource(getServletContext().getRealPath("/discipleship/editcall.xsl"));
			Source xml = new StreamSource(xmlUrl.toExternalForm());
			
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(xsl);
			transformer.transform(xml, new StreamResult(out));
		} else if (view!=null && view.equals("addSchedule")) {
			String contactid = (String)request.getParameter("ContactId");
			String scheduleid = (String)request.getParameter("ScheduleId");
			String url;
			if (scheduleid != null) {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&ScheduleId="+scheduleid;
			} else if (contactid != null) {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&ContactId="+contactid;
			} else {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action");			
			}
			
			URL xmlUrl = new URL(url);
			Source xsl = new StreamSource(getServletContext().getRealPath("/discipleship/editschedule.xsl"));
			Source xml = new StreamSource(xmlUrl.toExternalForm());
			
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(xsl);
			transformer.transform(xml, new StreamResult(out));
		} else if (view!=null && view.equals("addLesson")) {
			String contactid = (String)request.getParameter("ContactId");
			String lessonid = (String)request.getParameter("LessonId");
			String url;
			if (lessonid != null) {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&LessonId="+lessonid;
			} else if (contactid != null) {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action")+"&ContactId="+contactid;
			} else {
				url = "http://localhost/servlet/DiscipleshipController?action="+request.getParameter("action");			
			}
			
			URL xmlUrl = new URL(url);
			Source xsl = new StreamSource(getServletContext().getRealPath("/discipleship/editlesson.xsl"));
			Source xml = new StreamSource(xmlUrl.toExternalForm());
			
			TransformerFactory tFactory = TransformerFactory.newInstance();
			Transformer transformer = tFactory.newTransformer(xsl);
			transformer.transform(xml, new StreamResult(out));
		} %>
<br>
<%@ include file="/discipleship/discipleshipfooter.jspf" %>

</html>