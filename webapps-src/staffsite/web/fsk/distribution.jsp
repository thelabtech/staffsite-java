<%@ page import="org.alt60m.html.*,org.alt60m.fsk.model.dbio.*, javax.rmi.*, java.util.*, java.sql.*, java.text.*" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<% 
Hashtable h = (Hashtable) session.getValue("tub");
int undistributed = new Integer((String) request.getParameter("undistributed")).intValue();
int originalKits = 0;
if (h.get("TotalKits")!= null) {
	originalKits = new Integer((String)h.get("TotalKits")).intValue();
} 
%>
<html>
<head>
<title>Distribution</title>
<%@ include file="/validate.js"%>
<SCRIPT LANGUAGE="JavaScript"><!--
	function validate(undistributed, originalKits) {
		failed = false;

		errorMessage = "You didn't enter the following required fields:\n";
		emptyCheck(document.myForm.CampusName,"Campus Name."); 	
			if (failed) {
			alert(errorMessage);
			return false;
	
		} else {
			errorMessage = "You must enter numbers without commas in the following fields:\n";
//			alert("distribution.jsp ... "+document.myForm.TotalKits.value);
			isIntegerWithMessage(document.myForm.TotalKits,"Total Kits.");
			if (failed) {
				alert(errorMessage);
				return false;
			} else {
				errorMessage = "The number of kits distributed can NOT exceed the kits allocated: \n";
				var anybad = false;
				if(document.myForm.TotalKits.value > eval(undistributed + originalKits)) {
					anybad = true;
					errorMessage = (errorMessage);
					} 
				if (anybad) {
					alert(errorMessage);
					return false;
				} else {
					return true;
				}
			}
		}
	}   

	function zeroMe() {
		if (window.document.myForm.TotalKits.value=="") window.document.myForm.TotalKits.value="0";
		}

	function popupWindow(cUrl,cName,cFeatures) {
		var childWindow = window.open(cUrl,cName,cFeatures);
		if (childWindow.opener == null) childWindow.opener = self;
		childWindow.focus();
	}
	//-->
</script>
</head>
<!-- The field names need to match attributes in Distribution -->
<body>

<% String pageTitle = "Distribution"; %>
<%@ include file="/fsk/fskheader.jspf"%>
<%=fontText%>
		
<p> On this page tell us the campus name and the number kits you plan to distribute at that campus. 
  <BR>
  <BR>
  You must click the "Submit Distribution" button at the bottom or your distribution 
  will not be saved or processed. All fields are required. <BR>
<form action="/servlet/FskController" method="POST" name="myForm" onSubmit="return validate(<%=undistributed%>, <%=originalKits%>)">
			<input TYPE="hidden" NAME="action" value="saveDistribution">
			<input TYPE="hidden" NAME="id" value="<%=h.get("DistributionID")%>">
			<input TYPE="hidden" NAME="accountno" value="<%=session.getValue("fskLocalLeaderAccountNo")%>">
			<input TYPE="hidden" NAME="AllocationID" value="<%=request.getParameter("allocationID")%>">
			<input TYPE="hidden" NAME="Fk_Allocation" value="<%=request.getParameter("allocationID")%>">
			
		<table border="0" width="716">
			<tr><td colspan=2><%=hr%></td></tr>
			<tr><td width="258">Campus Name </td>
				 <td width="424"><input type="text" size="35" name="CampusName" value="<%=formHelp.value((String)h.get("CampusName"))%>" maxlength="128" readonly>
				<A HREF="javascript:popupWindow('../fsk/campuslist.jsp','Help','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=400,width=510,height=400' )"> 
				Select School</A></td>
			</tr>
			<tr><td colspan=2><%=hr%></td></tr>
			<tr><td>Kits Distributed at this Campus</td>
				<td><input type="text" size="20" name="TotalKits" value="<%=formHelp.value((String)h.get("TotalKits"))%>" ></td> 
			</tr>
		</table>
		<p><input type="submit" name="action" value="Submit Distribution" onClick="zeroMe()"></p>
		</form>
	</font>
<%@ include file="/footer.jspf" %>
</body>
</html>
