<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="evaluateHeaderCode.jspf" %>

<HTML>
<HEAD>
<TITLE> Printer Friendly Application </TITLE>
<link rel="stylesheet" href="/hr_si/themes/hr_si_evalpf.css" type="text/css"> <!--NN4 Compatible sheet -->
<style type="text/css">
@import url(/hr_si/themes/hr_si_evalpf.css); /*IE and NN6x styles*/
</style>
</HEAD>

<BODY>
<table align="center" cellpadding="0" cellspacing="0" width="600">
	<tr><td align="right">
		<a href="javascript:window.print()"><big><strong>Send To Printer</strong></big></a>
	</td></tr>
	<tr><td align="center">
		<h1>STINT/Internship Application</h1>
	</td></tr>
	<tr><td>
		<h3>Applicant<h3><h1><%=p.getPreferredName().trim().length()>0?ShowNoNull(p.getPreferredName()):ShowNoNull(p.getFirstName())%> <%=ShowNoNull(p.getLastName())%></h1>
	</td></tr>
	<tr><td>
		<%@ include file="evalcontacttable.jspf" %>
	</td></tr>
	<tr><td>
		<%@ include file="evalintereststable.jspf" %>
	</td></tr>
	<tr><td>
		<%@ include file="evalexperiencetable.jspf" %>
	</td></tr>
	<tr><td align="right">
		<a href="javascript:window.print()"><big><strong>Send To Printer</strong></big></a>
	</td></tr>
<table>
</BODY>
</HTML>

<%
    // big try-catch for evaluation pages  (see evaluateheader.jsp for try)
    } catch (Exception e) {
        System.out.println(e);
        e.printStackTrace();
    }
%>