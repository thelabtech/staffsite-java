<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Staffsite Status Monitor</title>
</head>
<body>
<h1>
Staffsite Status
</h1>

<h3>
Status: ${tub.statusMessage }
</h3>

<h3>
Database Tests: ${tub.dbMessage }
</h3>
<p>
Person results:
</br>
${tub.personResult }
</p>

<p>
User results:
</br>
${tub.userResult }
</p>
<%-- 
<p>
Staff results:
</br>
${tub.staffResult }
</p>
--%>
<h3>
GCX Tests:
</h3>
<p>
Status: (not yet implemented)
</p>

<h3>
CAS Tests:
</h3>
<p>
Status: (not yet implemented)
</p>



</body>
</html>