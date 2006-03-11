<%@ page import="org.alt60m.ministry.model.dbio.*,java.util.*" %>
<!-- <jsp:useBean id="selProj" class="org.alt60m.wsn.sp.bean.dbio.SelectWsnProj2000"/> -->

<% Hashtable h = (Hashtable) session.getValue("tub"); %>
<% int count = (Integer) session.getValue("count"); %>

<HTML>
<HEAD>
<TITLE>WSN SPT</TITLE>
</HEAD>

<% String pageTitle = "Account Numbers Needed"; %>

<%@ include file="wsnspheader.jspf" %>

<p>Using the link below, download a comma seperated file containing all the Summer Project Applicants that 
still need Account numbers. To download the file, right click on the link and click "Save Target As..."<br />

<% if(count > 0) { %>
<a href="/wsnsp/tmp/sp_need_account_no.txt">Download list of applicants</a><br />
<% } else {%>
<strong>There are no new applicants requiring account numbers</strong>
<% } %>
<form method="post" action="/servlet/WsnSpController?action=accountNo&view=accountnoconf" enctype="multipart/form-data">

<!-- <input type='hidden' name='view' value='accountnoconf'> -->
Once you have the account numbers back from the Donations system in a <strong>comma seperated</strong> file format, use the form
below to upload the file.<br />
<input type="file" name="accountlist">
<input type="submit" value="Upload File">
<!--
<table width ='95%' border='1' bordercolor="<%=bordercolor%>" BORDERCOLORLIGHT="<%=bordercolorlight%>">
<tr><td colspan='6'><center><input type='Submit' value='Save'></center></td></tr>

<tr align='center'><td><%=fontText%>&nbsp;</td>
	<td><%=fontText%><b>Name</td>
	<td><%=fontText%><b>Assigned Project/<br>Business Unit<br>Operating Unit<br>Dept ID<br>Project ID<br>Scholarship Desig. #</td>
	<td><%=fontText%><b>Address/<br>Soc. Sec. #</td>
	<td><%=fontText%><b>Account Number</td>
	<td><%=fontText%><b>Account Number from Previous Years</td></tr>
	<%
	if (!h.containsKey("0")) {
		%>
		<TH colspan=8><%=font%>There are currently no account numbers to assign.</font></TH>
		<%
	} else {
		Integer counter= new Integer(0);
		while (h.containsKey(counter.toString())){
			Hashtable app = (Hashtable)h.get(counter.toString());
			%>
			<tr align=center>
				<td><%=fontS%><b><%=counter.intValue()+1%></td>
				<td><%=fontText%><%=app.get("Name")%>&nbsp;</td>
				<td><%=fontTextS%><%=app.get("AssignmentName")%>&nbsp;<br><%=app.get("ScholarshipBusinessUnit")%>&nbsp;/&nbsp;<%=app.get("ScholarshipOperatingUnit")%>&nbsp;/&nbsp;<%=app.get("ScholarshipDeptID")%>&nbsp;/&nbsp;<%=app.get("ScholarshipProjectID")%>&nbsp;/&nbsp;<%=app.get("ScholarshipDesignation")%>&nbsp;</td>
				<td><%=fontTextS%><%=app.get("CurrentAddress")%>,&nbsp;<%=app.get("CurrentCity")%>,&nbsp;<%=app.get("CurrentState")%>,&nbsp;<%=app.get("CurrentZip")%>&nbsp;<br><%=app.get("Ssn")%>&nbsp;</td>
				<td><input type='hidden' name="<%=counter.toString()%>" value='<%=app.get("WsnApplicationID")%>'><input name="<%=app.get("WsnApplicationID")%>" size=8 maxlength=9></td>
				<td><%=fontTextS%><%=app.get("AccountNo")%>&nbsp;</td>
			</tr>
			<%
			counter=new Integer(counter.intValue()+1);
		}
		%><input type="hidden" name='counter' value='<%=h.get("number")%>'>
			<tr><td colspan='6'><center><input type='Submit' value='Save'></center></td></tr>
		<%
	}
	%>
</table><br>
-->
</form>

<%@ include file="wsnspfooter.jspf" %>

</HTML>