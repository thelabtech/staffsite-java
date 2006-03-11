<%@ page language="java" %>
<jsp:useBean id="qb" class="org.alt60m.rd.QuestBean"/>
<%@ page import="java.util.*,java.awt.*,java.sql.*" %>
<%!
boolean haveSession(HttpSession thisSession) {
	if ((String)thisSession.getValue("version")!=null){ 
		return true;
	}
	else { return false; }
}
%>
<%!
String user     = "randd";
String password = "quest20";
String url      = "jdbc:oracle:thin:@(description=(address=(host=hart-ca009v.net.ccci.org)(protocol=tcp)(port=1521))(connect_data=(sid=prod)))";
ResultSet rs				= null;
Statement stmt				= null;
Connection con				= null;
int cutOffPercentage		= 1;
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
%>
<%
String iSubmit	= request.getParameter("submit");
String iValue	= request.getParameter("value");
String iID		= request.getParameter("ID");
String tempdel	= request.getParameter("del");
String table	= request.getParameter("table");
int    del		= 0;
String tableName			= "";	//name of the table in the database
String tableNameFriendly	= "";	//friendly description of the table
String tableSeqName			= "";	//database table sequence name
String resultString			= "";	//standard and error output

if (tempdel != null) {	del=Integer.parseInt(tempdel); }
if (iValue == null) {	iValue = ""; }
if (iID == null) {	iID = "0"; }
if (iSubmit == null) {	iSubmit = ""; }

try {
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from RandD_Tables where ID=" + Integer.parseInt(table) + "" );
	rs.next();
	tableName			= rs.getString("tableName").trim();
	tableNameFriendly   = rs.getString("tableNameFriendly").trim();
	tableSeqName		= rs.getString("tableSeqName").trim();
	stmt.close();
	con.close();
}
catch (Exception e) {
	System.out.println(e);
}
/*---------------------------   delete a record ------------------------------------*/
if (del != 0 ) {
	try {
		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String sqlCommand= "Delete from " + tableName + " where ID = " + del + "";
		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		resultString = "Deleted Record Number <b>" + del + "</b> from the table<p>";
	}
	catch (Exception e) {
		System.out.println(e);
		resultString = "WARNING: Deletion failed<p>";
	}
}
/*---------------------------   modify a record ------------------------------------*/
else if ((iSubmit.equals("Update")) && (!iID.equals("0")) && (!iValue.equals(""))) {
	try {		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String sqlCommand= "Update " + tableName + " set value = '" + iValue + "' where ID = " + iID + "";
		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		resultString = "Updated Record Number <b>" + iID + "</b> from the table with: <b>" + iValue + "</b><p>";
	}
	catch (Exception e) {
		System.out.println(e);
		resultString = "WARNING: Update failed<p>";
	}
	iValue="";
	iID="0";
}
/*---------------------------   insert a record ------------------------------------*/
else if (iSubmit.equals("Insert")) {	//  add submited info
	try {
		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		if ((iValue != null) && (iValue.length() != 0)) {	//  add submited info
			String sqlCommand= "Insert into " + tableName + " (ID,value) values (" + tableSeqName +".NEXTVAL,'" + iValue + "')";
			int rowsAffected = stmt.executeUpdate(sqlCommand);
		}
		stmt.close();
		con.close();
	resultString= "Inserted <b>" + iValue + "</b> into the " + tableNameFriendly + " table<p>";
	iValue="";
	}
	catch (Exception e) {
		System.out.println(e);
	resultString= "WARNING: Insertion failed<p>";
	}
}
%>
<%=qb.printAdminBanner("Quest Data Table Viewer", "tableview.jsp?table=" + table) %>

<table width="100%">
	<tr><td bgcolor="#eeeeee" rowspan="2"><font size="2" face="arial"><b>Here is a listing of the <i><%= tableNameFriendly %></i> table:</b><hr>
<%
/*---------------------------   Display entries ------------------------------------*/
if (!resultString.equals("")){ resultString = "<img src='/quest/images/rarrow.gif'> &nbsp; " + resultString; }
try {
	
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();

	%><table width="100%"><%
	ResultSet rs = stmt.executeQuery("select * from " + tableName + " ORDER BY value");
	while (rs.next()) {
		String resultID = rs.getString("id");
		String result   = rs.getString("value");
		%>	<tr><td><font size="1" face="arial"><a href="tableview.jsp?table=<%= table %>&del=<%= resultID %>"><img src="/quest/images/del.gif" border="0"></a></td>
				<td><a href="tableview.jsp?table=<%= table %>&ID=<%= resultID %>"><img src="/quest/images/edit.gif" border="0"></a></td>
				<td nowrap><font size="1" face="arial"><%= result %></td>
			</tr>			    
		<%
	}
	if (!iID.equals("0")){
		rs = stmt.executeQuery("select value from " + tableName + " WHERE ID = " + iID + "");
		rs.next();
		iValue = rs.getString("value");
	}
	stmt.close();
	con.close();
}
catch (Exception e) {
	System.out.println(e);
}
%>
</table>



</td>
	<td bgcolor="#eeeeff" ><font size="2" face="arial">
	The <b>Data Table Viewer</b> allows you to view the contents of a table, modify specific entries, or delete entries.<br>
<font size="1">
<ul><li><b>INSERT</b>: To insert/add an entry, just enter the information into the bottom form box and press the "Insert" button.</li>
<li><b>MODIFY</b>: To modify an entry, click the appropriate "edit" button. The bottom box will then fill with that entry. When you are satisfied with your edit, press the "Update" button.</li>
<li><b>DELETE</b>: To delete an entry, click the appropriate "del" button. There will be no confirmation and the delete is permenant.</li>
</ul>
<b>IMPORTANT:</b><br>
<ul><li>Deleting or Modifying tables at this point may ruin data already collected and alter the statistics.</li>
<li>Do not use apostrophes('), quotes(") or ampersands (&amp;) for any entry.</li>
<li>When adding/editing an entry you must click on the button. Pressing <i>Enter</i> does not work.</li>
</ul>
	</td>
</tr>
<tr>
<td valign="center"><font size="1" face="arial" color="#5555aa">
	<center> &nbsp; <%= resultString %>	 </center>

</td></tr></table>
<hr>
<font size="2" face="arial"><b><% if (iID.equals("0")){ %>Add<% } else{ %>Update/Edit<% }%> an entry:</b><br>
<form method="post" action="tableview.jsp">
<input type="hidden" name="ID" value="<%= iID %>">
<input type="hidden" name="table" value="<%= table %>">
Value: <input type="text" name="value" value="<%= iValue %>">
<input type="submit" name="submit" value="<% if (iID.equals("0")){ %>Insert<% } else{ %>Update<% }%>">
</form>
<hr>
<center>
<font size="2" face="arial">
	<a href="tableview.jsp?table=<%= table %>">Refresh view</a><br>
	<a href="table.jsp">Relist Tables</a>
</center>

<p> &nbsp;
<p> &nbsp;
<%@ include file="footer.jspf" %>
