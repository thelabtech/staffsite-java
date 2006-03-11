<html>

<head>
<title>Pre- A Evaluation - Split Screen</title>
</head>
<frameset rows="70%,*">
  <frame name="top" src="/servlet/SIController?action=goToPage&page=<%=request.getParameter("sendingpage")%>&toframe=yes">
  <frame name="bottom" src="/servlet/SIController?action=goToPage&page=<%=request.getParameter("bottomframe")%>&toframe=no">
  <noframes>
  <body>

  <p>This page uses frames, but your browser doesn't support them.</p>

  </body>
  </noframes>
</frameset>

</html>
