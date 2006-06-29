<%
Public Sub Destroy(Name)
  Name.Close
  Set Name = Nothing
End Sub

Public Function getRS(sQuery, oConn)', sOpenMethod, sLockMethod, sCommandType)
  if oConn="" then set oConn=getConn("")
  set getRS = Server.CreateObject("ADODB.Recordset")
  getRS.Open sQuery, oConn', sOpenMethod, sLockMethod, sCommandType
End Function

Public Function getConn(sDSN)
	set getConn = server.CreateObject("adodb.connection")
	getConn.open "DSN=istprod;UID=istprod;PWD=w5u#AGa"
End Function

Public Function getDatum(oConn, sfield, stable, swhere) 'gets value of field f from table t usine WHERE clause w
  dim err, oRS
  err=0
  if oConn="" then
     set oConn=getConn("")
	 err=1
  end if
  Set oRS=getRS("SELECT " & sfield & " FROM " & stable & " WHERE " & swhere, oConn)
  getDatum = oRS(sfield)
  destroy(oRS)
  if err=1 then destroy(oConn)
End Function

Public Function ExecuteQuery(sQuery,oConn)
  ExecuteQuery=false
  dim err
  err=0
  if oConn="" then 
    set oConn=getConn("")
	err=1
  end if
  oConn.Execute(sQuery)
  if err=1 then destroy(oConn)
  ExecuteQuery=true
end function

%>