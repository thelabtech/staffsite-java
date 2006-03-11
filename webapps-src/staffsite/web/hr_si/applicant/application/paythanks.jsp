DEPRECATED - 12-17-02 BY DC Folded into payment.jsp
<%@ include file="header.jspf" %>


<script language="javascript">
<!--
//set the action for this particular page.
document.appForm.action.value="goToPage";
-->
</script>

<TABLE WIDTH="100%" CELLSPACING="0">
	<TR>
		<TD CLASS="app" COLSPAN="2">

<%
	String firstName = p.getFirstName();
	String welcomeText = "";
	if (firstName == "")
		welcomeText = "Thank you!";
	else
		welcomeText = "Thank you, " + firstName + "!";
%>
			<STRONG><%=welcomeText%></STRONG>
			<P>
			Your payment is complete.<BR><BR><BR><BR>
			<TD>	</TR>
<%@ include file="bnav2way.jspf" %>
