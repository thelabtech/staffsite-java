<%@ page import="java.util.*" %>
<%@ page import="org.alt60m.servlet.*, java.util.Date" %>

<HTML>
<HEAD>
<TITLE>Receive Payment</TITLE>
</HEAD>
<BODY >


<% String pageTitle="Receive Payments"; %>

<%@ include file="header.jspf" %>

<%	
ActionResults ar = ActionResults.getActionResults(session);
Hashtable people = ar.getHashtable("people");
if (people==null) people= new Hashtable();
%>
<script language="javascript">
<!--
	function doPostForm(page) {
		var theform = document.pmtForm;
		theform.page.value = page;
		theform.submit();
	}
-->
</script>

<form name="pmtForm" action="SIController" method="post">
<input type="hidden" name="as" value="student">
<input type="hidden" name="page">

<input type="hidden" name="action" value="postCoordinatorPaymentFind">
<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
<TR><TD class="app" colspan="2">
<h2>Receive Payments</h2>
Please type in the name of the person whose payment you have received.  You can use the percent symbol (%) as a wildcard.  
For example: Fred% as a first name would find all firstnames beginning with Fred (like Fredrick).  <BR><BR>Note: Clicking upon a
name of a match marks that application as being paid (immediately).<BR><BR>
</TD></TR>
	<TR>
		<TD CLASS="app" ALIGN="RIGHT" WIDTH="20%"VALIGN="TOP">Firstname / Lastname</TD>
		<TD CLASS="app"><INPUT type="text" name="firstname" size=10 CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)">
				<INPUT type="text" name="lastname" size=20 CLASS="required" onFocus="Highlight(this)" onBlur="UnHighlight(this)"></TD>
	</TR>
<TR><TD class="app">&nbsp;</TD><TD class="app">&nbsp;</TD></TR>
	<TR>
		<TD class="app">&nbsp;</TD>
		<TD ALIGN="RIGHT" VALIGN="TOP" WIDTH="65%" CLASS="app"><A CLASS="button" HREF="JavaScript: doPostForm('find')" CLASS="button">Find Applicants</A></TD>
		<TD>&nbsp;</TD>
	</TR>
</table>
</form>

<TABLE WIDTH="100%" CELLSPACING="0" BORDER="0">
<TR><TD class="app" colspan="2">

<%
if(people.containsKey("ErrorMessage"))
  out.print("Message: <B>" + (String) people.get("ErrorMessage") + "</B>");
else
{
	if (people.size()>0) 
	  out.print("The following matching people were found:");
	out.print("</TD></TR>");
 try
 {
  if (people.keySet().size()>0)
  {
   out.println(" <table border=1>");
   out.println(" <TR><TH>Name</TH><TH>Email</TH><TH>City</TH><TH>State</TH></TR>");
   out.println(" <TR>");
   }

	for (Iterator i = people.keySet().iterator(); i.hasNext(); )
	{
	   String key = (String) i.next();
	   Hashtable h = (Hashtable) people.get(key);
	   String link = (String) h.get("link");
  
	   out.println("<TR><TD width=\"20%\"><A HREF='/servlet/SIController?action=postReceiveCoordinatorPayments&" + link + "'>" + key + "</A></TD>");
	   out.println("<TD width=\"20%\">" + h.get("CurrentEmail") + "</TD>");
	   out.println("<TD width=\"20%\">" + h.get("City") + "</TD>");
	   out.println("<TD width=\"20%\">" + h.get("State") + "</TD>");
	   out.println("</TR>");
	}
 }
 catch(Exception e)
 {
    e.printStackTrace();
 }
}
%>
</table>
</table>

<%@ include file="footer.jspf" %>
</BODY>
</HTML>
