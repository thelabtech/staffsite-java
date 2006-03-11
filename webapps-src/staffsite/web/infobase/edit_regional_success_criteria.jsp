<%@ page import="org.alt60m.servlet.*, java.text.*" %>
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />

<%

String pageTitle = "Entering Success Criteria";%>
<html>
<head>
<title><%= pageTitle %></title>
<SCRIPT LANGUAGE="javascript">
<!--
function isInteger(theField, string) {
    var sTmp = "True"
    var Chars = "0123456789";
    for (var i = 0; i < string.length; i++) {
       if (Chars.indexOf(string.charAt(i)) == -1) sTmp="False"
    }
	if (sTmp=="False"){
         alert("You need to put a number without commas here.");
      	 theField.value="";
	     theField.focus();
    }
} 
// -->
</SCRIPT>
</head>

<%@ include file="/infobase/ibheader.jspf" %>
<%
ActionResults ar; 
ar = ActionResults.getActionResults(session);
Hashtable h = new Hashtable();
h = ar.getHashtable("statistic");
String NiCat = "";
String NsCat = "";
String NsIcrD = "";
String NiIcrD = "";
String NsIcrE = "";
String NiIcrE = "";
String NsIcrI = "";
String NiIcrI = "";
String NsSc = "";
String NiSc = "";
String NsWsn = "";
String NiWsn = "";
String NsBr = "";
String NiBr = "";
String RegionalStatID = "";
if(h != null) {
	NsCat = ((Long)h.get("NsCat")).toString();
	NiCat = ((Long)h.get("NiCat")).toString();
	NsIcrD = ((Long)h.get("NsIcrD")).toString();
	NiIcrD = ((Long)h.get("NiIcrD")).toString();
	NsIcrE = ((Long)h.get("NsIcrE")).toString();
	NiIcrE = ((Long)h.get("NiIcrE")).toString();
	NsIcrI = ((Long)h.get("NsIcrI")).toString();
	NiIcrI = ((Long)h.get("NiIcrI")).toString();
	NsSc = ((Long)h.get("NsSc")).toString();
	NiSc = ((Long)h.get("NiSc")).toString();
	NsWsn = ((Long)h.get("NsWsn")).toString();
	NiWsn = ((Long)h.get("NiWsn")).toString();
	NsBr = ((Long)h.get("NsBr")).toString();
	NiBr = ((Long)h.get("NiBr")).toString();
	RegionalStatID = (String)h.get("RegionalStatId");
}
SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
String region = request.getParameter("region");
regions.setName("region");
regions.setCurrentValue(region);
String reportTitle = regions.display() + " Regional Success Criteria";
%>
<form method="post" action="/servlet/InfoBaseController">
<input type=hidden name=action value="saveRegionalSuccessCriteria">
<input type=hidden name="regionalstatid" value="<%=RegionalStatID%>">
<input type=hidden name="region" value="<%=region%>">
<input type=hidden name="validate" value="go">
<input type=hidden name=mode value=<%
	if(h==null) { 
		out.print("create");
	} else {
		out.print("update");
	}
	%>>

<TABLE width="100%">
	<TR>
		<td><%=fontB3%><b><%= reportTitle %></b></font><br></td>
		<TD align=right><%=fontB%><a href="JavaScript: popupWindow('/help/help_enter_success_criteria.jsp', 'StaffSiteHelp', 'height=550,width=600,dependent=yes,scrollbars=yes,resizable')">Help with Entering Success Criteria</a></font></TD>
	</TR>
</TABLE>


<table border=1 <%=bgcolorL%>>
	<tr>
		<td align=left><%=fontB%><b>Period Begin: </b></font></td>
		<td align=center>
			<%=fontB%><%=ar.getValue("periodbegin")%></font>
			<input type="hidden" size=10 name="periodbegin" value="<%=ar.getValue("periodbegin")%>">
		</td>
	</tr>
	<tr>
		<td align=left><%=fontB%><b>Period End:</b></font> </td>
		<td align=center>
			<%=fontB%><%=ar.getValue("periodend")%></font>
			<input type="hidden" size=10 name="periodend" value="<%=ar.getValue("periodend")%>">
		</td>
	</tr>
</table>
<br>
<table border=1 <%=bgcolorL%>>
	<tr>
		<!-- <td rowspan=2 align=center><%=fontB1%>&nbsp</font></td> -->
		<td colspan=2 align=center><%=fontB1%>Catalytic</font></td>
		<td colspan=2 align=center><%=fontB1%>ESM - Destino</font></td>
		<td colspan=2 align=center><%=fontB1%>ESM - Epic</font></td>
		<td colspan=2 align=center><%=fontB1%>ESM - Impact</font></td>
		<td colspan=2 align=center><%=fontB1%>Staffed Campus</font></td>
		<td colspan=2 align=center><%=fontB1%>WSN</font></td>
		<td colspan=2 align=center><%=fontB1%>Bridges</font></td>
	</tr>
	<tr>
		<td align=center><%=fontB1%>New Staff Reported</font></td>
		<td align=center><%=fontB1%>Interns Reported</font></td>
		<td align=center><%=fontB1%>New Staff Reported</font></td>
		<td align=center><%=fontB1%>Interns Reported</font></td>
		<td align=center><%=fontB1%>New Staff Reported</font></td>
		<td align=center><%=fontB1%>Interns Reported</font></td>
		<td align=center><%=fontB1%>New Staff Reported</font></td>
		<td align=center><%=fontB1%>Interns Reported</font></td>
		<td align=center><%=fontB1%>New Staff Reported</font></td>
		<td align=center><%=fontB1%>Interns Reported</font></td>
		<td align=center><%=fontB1%>New Staff Reported</font></td>
		<td align=center><%=fontB1%>Interns Reported</font></td></tr>
		<td align=center><%=fontB1%>New Staff Reported</font></td>
		<td align=center><%=fontB1%>Interns Reported</font></td></tr>
	</tr>
	<tr>
		<!-- <td><%=fontB1%><b>Summary</b></font></td> -->
		
		<td align=center><%=fontB1%><input type="text" name="NsCat" value="<%=NsCat%>" size="5" onBlur="isInteger(this, this.value)"></font></td>
		<td align=center><input type="text" name="NiCat" value="<%=NiCat%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NsIcrD" value="<%=NsIcrD%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NiIcrD" value="<%=NiIcrD%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NsIcrE" value="<%=NsIcrE%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NiIcrE" value="<%=NiIcrE%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NsIcrI" value="<%=NsIcrI%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NiIcrI" value="<%=NiIcrI%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NsSc" value="<%=NsSc%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NiSc" value="<%=NiSc%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NsWsn" value="<%=NsWsn%>" size="5" onBlur="isInteger(this, this.value)"> </td>
		<td align=center><input type="text" name="NiWsn" value="<%=NiWsn%>" size="5" onBlur="isInteger(this, this.value)"></td>
		<td align=center><input type="text" name="NsWsn" value="<%=NsBr%>" size="5" onBlur="isInteger(this, this.value)"> </td>
		<td align=center><input type="text" name="NiWsn" value="<%=NiBr%>" size="5" onBlur="isInteger(this, this.value)"></td>
	</tr>
</table>
<br>
<input type="submit" value="Save Changes">
</form>
<!-- <%=fontB%><%=ar.toHTML()%> -->
<%@ include file="/infobase/ibfooter.jspf" %>
</html>