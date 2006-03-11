<%@ include file="evaluateHeaderCode.jspf" %>

<HTML>
<HEAD>
<TITLE> Printer Friendly Application </TITLE>
<link rel="stylesheet" href="/hr_ms/themes/hr_ms_evalpf.css" type="text/css"> <!--NN4 Compatible sheet -->
<style type="text/css">
@import url(/hr_ms/themes/hr_ms_evalpf.css); /*IE and NN6x styles*/
</style>
</HEAD>

<BODY>
<table align="center" cellpadding="0" cellspacing="0" width="600">
	<tr><td align="right"><a href="javascript:window.print()"><big><strong>Send To Printer</strong></big></a></td>
	</tr>
	<tr><td align="center">
		<h1>Summer Project Application</h1>
	</tr></td>
	<tr><td>
		<h3>Applicant<h3><h1><%=ShowNoNull(p.getLegalFirstName()) + " " + ShowNoNull(p.getLegalLastName()) %></h1>
	</tr></td>
	<tr><td>
		<%@ include file="evalpersonschooltable.jspf" %>
	</tr></td>
	<tr><td>
		<%@ include file="evalprojpreferencetable.jspf" %>
	</tr></td>
	<tr><td>
		<%@ include file="evalexperiencetable.jspf" %>
	</tr></td>
	<tr><td>
		<%@ include file="evalspiritualtable.jspf" %>
	</tr></td>
	<tr><td>
		<%@ include file="evalconfidentialtable.jspf" %>
	</tr></td>
	<tr><td>
		<%@ include file="evalappshortanswertable.jspf" %>
	</tr></td>
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
