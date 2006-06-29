<%
  Public Function tosql(s) ' helper function for putFormInfo. Takes care of bad characters in the SQL statement.
   If (len(s) > 0) Then  'Make sure there's some text to fix
	 s=CStr(s) 'Make sure we're looking at it as a string
	 s=Replace(s,"'","''")  'Escape apostrophes
	 s=Replace(s,"|","'& CHR(124) &'")  'Escape the pipe character
	 s=Replace(s,"%","'& CHR(37) &'")  'Escape the percent character
   End If
   tosql = s
  End Function

  Public Function PrepareFieldInfo(iFormItem)
    dim svalue, stype
	stype=left(iFormItem,3)
	if request.form(iFormItem)<>"" then
	  if request.form(iFormItem).count > 1 Then 'this is a collection so combine each value
		for i = 1 to (request.form(iFormItem).count)
		  svalue=svalue & request.form(iFormItem)(i)
		next
	  else 'this is a single control item
		svalue=request.form(iFormItem)
	  end if
	  Select Case stype
	  Case "btf" '(boolean true/false) writes a boolean true if item is on (checkboxes and radio buttons)
		svalue = "false"
		if instr(request.form(iFormItem),"on")>0 then svalue = "true"
	  Case "dte" '(date) adds date literals
		svalue = "#" & request.form(iFormItem) & "#"
	  Case "num" '(numeric) doesn't add anything
		svalue=tosql(request.form(iFormItem))
	  Case "str" '(string) adds quotes
		svalue = "'" & tosql(request.form(iFormItem)) & "'"
	  Case else
		svalue=""
	  End Select
	end if
	PrepareFieldInfo = svalue
  End Function

  Public Function UpdateFormInfo(t,w)
  ' This function updates form values into table t with WHERE clause w
  ' Form fields beginning with btf, dte, num or str will be processed
    UpdateFormInfo=False
	for each iFormItem in request.form 'loop through the Request.Form collection
	  sname=right(iFormItem,len(iFormItem)-3)
	  svalue = PrepareFieldInfo(iFormItem)
  	  if svalue<>"" then SQLValues = SQLValues & sname & "=" & svalue & ", "
	next
	if SQLValues<>"" then
	  SQLValues = left(SQLValues,(len(SQLValues)-2)) 'strip off the last comma
	  SQL = "UPDATE " & t & " SET " & SQLValues & " WHERE " & w 'put together the SQL
	  UpdateFormInfo = ExecuteQuery(SQL,"") 'make the changes
	end if
  End Function

  Public Function AddFormInfo(t,pkf, pk)
  ' This function adds form values into table t
  ' Form fields beginning with btf, dte, num or str will be processed
  ' if pkf and pk are specified, then the value of pk from field pkf will be checked to see if it is already in the table.
    AddFormInfo=False
    if pk<>"" or pkf<>"" then
	  if not isNumeric(pk) then pk="'" & pk & "'"
	  set ors = getRS("SELECT " & pkf & " from " & t & " where " & pkf & "=" & pk,"")
	  if not ors.EOF then Exit Function
	  destroy(ors)
    end if
	for each iFormItem in request.form 'loop through the Request.Form collection
	  sname=right(iFormItem,len(iFormItem)-3)
    svalue = PrepareFieldInfo(iFormItem)
  	  if svalue<>"" then 
	    SQLValues = SQLValues & svalue & ", "
		SQLFields = SQLFields & sname & ", "
	  end if
	next
	if SQLValues<>"" then
    SQLValues = left(SQLValues,(len(SQLValues)-2)) 'strip off the last comma
	  SQLFields = left(SQLFields,(len(SQLFields)-2)) 'strip off the last comma
	  SQL = "INSERT INTO " & t & "(" & SQLFields & ") VALUES(" & SQLValues & ")" 'put together the SQL
	  AddFormInfo = ExecuteQuery(SQL,"") 'make the changes
	end if
  End Function

 %>