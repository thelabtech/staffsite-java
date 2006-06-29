<%
 Path = server.mappath("/cmstaff/survey") & "\"
 RootPath = request.servervariables("http_host") & "/cmstaff/survey"

Function todisplay(the_string)
   If (len(the_string) > 0) Then  'Make sure there's some text to adjust
	 the_string=CStr(the_string) 'Make sure we're looking at it as a string
	 the_string=Replace(the_string,"<","&lt;")  'Escape the "<" char
	 the_string=Replace(the_string,vbcrlf,"&nbsp;<br>")  'Replace newlines, with the BR tag
	 the_string=Replace(the_string,"  "," &nbsp;")  'make sure a row of spaces still looks spaced over
   End If
   todisplay = the_string
End Function

%>