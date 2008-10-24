<%@ include file="/style.jspf"%>

<html>
<body>

		<FORM method="post" ACTION="/servlet/StaffController">
		<input type="text" name="UserName">
		<input type="PASSWORD" name="Password">
		<input type="hidden" name="action" value="authenticate">
		<input type="submit">
		</form>
<%@ include file="/headers/google_analytics.jspf"%>
</BODY>
</HTML>