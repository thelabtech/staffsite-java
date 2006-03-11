<%@ include file="evaluateHeaderCode.jspf" %>
<html>

<head>
<title>Evaluation Summary - Split Screen</title>
</head>
<frameset rows="70%,*">
  <frame name="top" src="MSController?action=evalFormEdit&toframe=yes&page=evalpersonschool&sendingpage=<%=request.getParameter("nextParm")%>&nextPage=goToView&nextParm=<%=request.getParameter("sendingpage")%>&WsnApplicationID=<%=request.getParameter("WsnApplicationID")%>">
   <frame name="bottom" src="/servlet/MSController?action=evalFormEdit&page=evalpersonschool&sendingpage=<%=request.getParameter("sendingpage")%>&toframe=yes&WsnApplicationID=<%=request.getParameter("WsnApplicationID")%>&nextPage=goToView&nextParm=evalsummaryframe">
  <!-- 02-25-03 kl: for defect 817, new toframe=yes instead of toframe=no, currently on hold-->
  <!-- 02-25-03 kl: for defect 817, new action=evalFormEditBottom instead of action=evalFormEdit, currently on hold-->
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>

</html>
<%
	// big try-catch for evaluation pages  (see evaluateheader.jsp for try)
	} catch (Exception e) {
		System.out.println(e);
		e.printStackTrace();		
	}
%>
