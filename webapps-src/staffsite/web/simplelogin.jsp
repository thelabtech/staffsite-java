<%@ include file="/style.jspf"%>

<html>
<body>

		<FORM method="post" ACTION="/servlet/StaffController">
		<input type="text" name="UserName">
		<input type="PASSWORD" name="Password">
		<input type="hidden" name="action" value="authenticate">
		<input type="submit">
		</form>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</BODY>
</HTML>