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
String iDel		= request.getParameter("del");
String iDelSeq	= request.getParameter("delseq");

String ID = "0";
String tableName			= "";	//name of the table in the database
String tableNameFriendly	= "";	//friendly description of the table
String tableSeqName			= "";	//database table sequence name

String result				= "";
%>
<% if ((iSubmit != null ) && (iSubmit.length() != 0)) { 
		tableName			= request.getParameter("tableName");
		tableNameFriendly   = request.getParameter("tableNameFriendly");
		tableSeqName		= request.getParameter("tableSeqName");
 	try {
		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String sqlCommand= "insert into RandD_Tables (ID, tableName, tableNameFriendly, tableSeqName) values (RandD_TableSeq.NEXTVAL, '"+ tableName + "', '"+ tableNameFriendly + "', '"+ tableSeqName + "')";
		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		result="Successfully added record<br>";
	}
	catch (Exception e) {
		System.out.println(e);
		result="**Table Addition Failed** (for some reason the tablename could not be recorded)<br>";
	}
 	try {
		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String sqlCommand= "create table " + tableName + " (ID integer, value char(64))";
		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		result= result + "Successfully created table<br>";
	}
	catch (Exception e) {
		System.out.println(e);
		result= result + " **Table Creation Failed** (you may have tried an invalid table name)<br>";
	}
 	try {
		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String sqlCommand= "create sequence " + tableSeqName + "";
		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		result= result + "Successfully created table sequence<br>";
	}
	catch (Exception e) {
		System.out.println(e);
		result= result + " **Sequence Creation Failed** (for some reason the sequence name could not be created)<br>";
	}
}
/*---------------------------------------  DELETE A TABLE AND ASSOCIATED SEQUENCE ----------------- */
/*
else if ((iDel != null ) && (iDel.length() > 2)) {
 	try {
		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String sqlCommand= "drop table " + iDel;
		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		result= result + "Successfully deleted table " + iDel + "<br>";
	}
	catch (Exception e) {
		System.out.println(e);
		result= result + " **Table Deletion Failed** notify the database administrator to delete table: " + iDel + "<br>";
	}
 	try {
		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String sqlCommand= "drop sequence " + iDelSeq;
		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		result= result + "Successfully deleted sequence " + iDelSeq + "<br>";
	}
	catch (Exception e) {
		System.out.println(e);
		result= result + " **Sequence Deletion Failed** notify the database administrator to remove sequence name: " + iDelSeq + "<br>";
	}
 	try {
		
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		String sqlCommand= "delete from RandD_Tables where tableName='" + iDel +"'";
		int rowsAffected = stmt.executeUpdate(sqlCommand);
		stmt.close();
		con.close();
		result= result + "Successfully deleted table record<br>";
	}
	catch (Exception e) {
		System.out.println(e);
		result= result + " **Record Deletion Failed** notify the database administrator to remove " + iDelSeq + " from the RandD_Tables<br>";
	}
}
*/
/*---------------------------------------  -------------------------------------- ----------------- */
%>
<%=qb.printAdminBanner("Survey Questions Tables", "table.jsp") %>

<table cellpadding="0" border="0" width="100%">
<tr bgcolor="#eeeeee">
	<td><font size="1" face="arial"><b>Table Name</td>
	<td><font size="1" face="arial"><b>Table Friendly Name</td>
	<td><font size="1" face="arial"><b>Table Sequence Name</td>
	<td> &nbsp; </td>
</tr>
<%
try {
	
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();

	ResultSet rs = stmt.executeQuery("select * from RandD_Tables ORDER BY tableName");
	while (rs.next()) {
		ID = rs.getString("id");
		tableName			= rs.getString("tableName").trim();
		tableNameFriendly   = rs.getString("tableNameFriendly").trim();
		tableSeqName		= rs.getString("tableSeqName").trim();

		%>	<tr>
				<td><font size="1" face="arial">	<%= tableName %></td>
			    <td><font size="1" face="arial"><a href="tableview.jsp?table=<%= ID %>"><%= tableNameFriendly %></a></td>
			    <td><font size="1" face="arial">	<%= tableSeqName %></td>
			    <td><font size="1" face="arial"><a href="tableview.jsp?table=<%= ID %>"><font color="#0000ff">View</a> - 
			<a href="table.jsp?del=<%= tableName %>&delseq=<%= tableSeqName %>"><font color="#ff0000">Delete</a></td></tr>
		<%
	}
	stmt.close();
	con.close();
}
catch (Exception e) {
	System.out.println(e);
}
if (result.length()>1) {
	result = result + "<br>If ANY errors occured, hit the delete button next to the table you tried to create and then try again.";
}
%>
<tr height="10"></tr>
<form method="post" action="table.jsp">
<tr><td><input type="text" name="tableName"></td>
	<td><input type="text" name="tableNameFriendly"></td>
	<td><input type="text" name="tableSeqName"></td>
	<td><input type="submit" name="submit" value="Add Table"></td>
</tr>
</table>
<center><b><font size="1" face="arial"><%= result %><p>
Do not hit DELETE unless you absolutely know what you are doing!<p>
</font></b></center>

<center><b><font size="2" face="arial"><a href="table.jsp">Refresh Listing</a></font></b></center><p>

<%@ include file="tableinstructions.jspf" %>

<%@ include file="footer.jspf" %>
