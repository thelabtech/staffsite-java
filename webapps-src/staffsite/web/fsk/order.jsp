<%@ page import="org.alt60m.html.*,org.alt60m.fsk.model.dbio.*, javax.rmi.*, java.util.*, java.sql.*, java.text.*" %>
<jsp:useBean id="formHelp" class="org.alt60m.html.FormHelper"/>
<jsp:useBean id="regions" class="org.alt60m.html.SelectRegion" />

<% 
Hashtable h = (Hashtable) session.getValue("tub");
//Find todays date as stringdate to pass with form and as java.sql.Date to set to database	
String stringdate = new String();
//String stringdateinput = new String();
SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
//SimpleDateFormat formatterinput = new SimpleDateFormat("yyyy-MM-dd");
//stringdateinput = formatterinput.format(new java.util.Date());
stringdate = formatter.format(new java.util.Date());
//long longDate = new java.util.Date().parse(stringdate);
//java.sql.Date sqldate = new java.sql.Date(longDate);

//Set display format of date fields to MM/dd/yyyy
String addDate = new String();
String updateDate = new String();

if (h != null) {
	if (h.get("DateCreated") != null) {
		addDate = formatter.format(h.get("DateCreated"));
	}

	if (h.get("DateUpdated") != null) {
		updateDate = formatter.format(h.get("DateUpdated"));
	}
}
%>
<html>
<head>
<title>Order</title>
<%@ include file="/validate.js"%>
<SCRIPT LANGUAGE="JavaScript"><!--
	function validate() {

		failed = false;
		errorMessage = "You didn't enter the following required fields:\n";

		emptyCheck(document.myForm.CampusName,"Campus Name.");
		selectedCheck(document.myForm.Region,"Region.");
//		emptyCheck(document.myForm.LocalAcctNo1,"Local Campus Account #.");
//		emptyCheck(document.myForm.LocalAcctNo2,"Local Campus Account #.");
//		emptyCheck(document.myForm.LocalAcctNo3,"Local Campus Account #.");
		emptyCheck(document.myForm.StaffFirstName,"Staff First Name.");
		emptyCheck(document.myForm.StaffLastName,"Staff Last Name.");
		emptyCheck(document.myForm.StaffPhone,"Staff Phone.");
		emptyCheck(document.myForm.StaffEmail,"Staff Email.");
		emptyCheck(document.myForm.ContactFirstName,"Contact First Name.");
		emptyCheck(document.myForm.ContactLastName,"Contact Last Name.");
		emptyCheck(document.myForm.ContactPhone,"Contact Phone.");
		emptyCheck(document.myForm.ContactEmail,"Contact Email.");
		emptyCheck(document.myForm.KitShipName,"Kit Ship Name.");
		emptyCheck(document.myForm.KitShipAddress1,"Kit Ship Address1.");
		emptyCheck(document.myForm.KitShipCity,"Kit Ship City.");
		emptyCheck(document.myForm.KitShipState,"Kit Ship State.");
		emptyCheck(document.myForm.KitShipZip,"Kit Ship Zip.");
		emptyCheck(document.myForm.KitShipPhone,"Kit Ship Phone.");
		emptyCheck(document.myForm.TotalKits,"Total Kits.");

		if (failed) {
			alert(errorMessage);
			return false;
		} else {
			errorMessage = "You must only enter numbers without commas in the following fields:\n";

			isIntegerWithMessage(document.myForm.TotalKits,"Total Kits."); 
			isIntegerWithMessage(document.myForm.BagToyWay,"Bag/Toy Waymore.");
			isIntegerWithMessage(document.myForm.BagToyImp,"Bag/Toy Impact.");
			isIntegerWithMessage(document.myForm.BagToyDes,"Bag/Toy Destino.");
			isIntegerWithMessage(document.myForm.BagToyEp,"Bag/Toy Epic.");
			isIntegerWithMessage(document.myForm.BagToyESC,"Bag/Toy EveryStudent.");
			isIntegerWithMessage(document.myForm.BibleTwo,"Bible NIV NT");
			isIntegerWithMessage(document.myForm.BibleThree,"My City, My God");
			isIntegerWithMessage(document.myForm.BibleMisc,"Bible NIV Whole Bible");
			isIntegerWithMessage(document.myForm.BibleBilingual,"Bible Bilingual");
			isIntegerWithMessage(document.myForm.BookMTACLoJ,"Book Carpenter Life of Jesus.");
			isIntegerWithMessage(document.myForm.BookCaseForC,"Book Case For Christ.");
			isIntegerWithMessage(document.myForm.BookCaseForF,"Book Case for Faith.");
			isIntegerWithMessage(document.myForm.BookBeyond,"Book Beyond.");
			isIntegerWithMessage(document.myForm.BookSurvUS,"Book Survive US.");
			isIntegerWithMessage(document.myForm.BookLatino,"Book Latino in Christ.");
			isIntegerWithMessage(document.myForm.BookBlueJazz,"Book Blue Like Jazz.");
			isIntegerWithMessage(document.myForm.CdHipHop,"Cd Hip Hop.");
			isIntegerWithMessage(document.myForm.CdSetApart,"Cd Set Apart.");
			isIntegerWithMessage(document.myForm.CdMisc,"Cd Alternative Rock.");
			isIntegerWithMessage(document.myForm.VideoDrinkRelDVD,"DVD Drink Relationship.");
			isIntegerWithMessage(document.myForm.VideoMisc,"Uncensored DVD.");
			isIntegerWithMessage(document.myForm.VideoImpactDVD,"Impact DVD.");
			isIntegerWithMessage(document.myForm.VideoJfpCD,"CD-ROM Jesus Film.");

			if (failed) {
				alert(errorMessage);
				return false;
			} else {
				errorMessage = "The following fields must be multiples of 100:\n";

				var anybad = false;
				if(document.myForm.TotalKits.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Total Kits";
				} 
				if(document.myForm.BagToyWay.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bag/Toy Waymore";
				} 
				if(document.myForm.BagToyImp.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bag/Toy Impact";
				} 
				if(document.myForm.BagToyDes.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bag/Toy Destino";
				} 
				if(document.myForm.BagToyEp.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bag/Toy Epic";
				} 
				if(document.myForm.BagToyESC.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bag/Toy ESC";
				} 
				if(document.myForm.BibleTwo.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bible NIV NT";
				} 
				if(document.myForm.BibleThree.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bible My City, My God";
				} 
				if(document.myForm.BibleMisc.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bible NIV Whole Bible";
				} 
				if(document.myForm.BibleBilingual.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bible Bilingual";
				} 
				if(document.myForm.BookBeyond.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Book Beyond";
				} 
				if(document.myForm.BookMTACLoJ.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Book Carpenter Life of Jesus";
				} 
				if(document.myForm.BookCaseForC.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Book Case For Christ";
				} 
				if(document.myForm.BookCaseForF.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Book Case For Faith";
				} 
				if(document.myForm.BookSurvUS.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Book Survive US";
				} 
				if(document.myForm.BookLatino.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Book Latino in Christ";
				} 
				if(document.myForm.BookBlueJazz.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Book Blue Like Jazz";
				} 
				if(document.myForm.CdHipHop.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Cd Hip Hop";
				} 
				if(document.myForm.CdSetApart.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Cd Set Apart";
				} 
				if(document.myForm.CdMisc.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Cd Alternative Rock";
				} 
				if(document.myForm.VideoDrinkRelDVD.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n DVD Drink Relationships";
				} 
				if(document.myForm.VideoMisc.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Bible Isi NT";
				} 
				if(document.myForm.VideoImpactDVD.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n Impact DVD";
				} 
				if(document.myForm.VideoJfpCD.value % 100 != 0) {
					anybad = true;
					errorMessage = errorMessage + "\n CD-ROM Jesus Film";
				} 
				if (anybad) {
					alert(errorMessage);
					return false;
				} else {
					var wrongsum = false;
					
					var v1 = 0;
					var v2 = 0;
					var v3 = 0;
					var v4 = 0;
					var v5 = 0;
					var v6 = 0;
					var v7 = 0;
					var total = 0;
					var total = eval(document.myForm.TotalKits.value);
					errorMessage = "The the sum of the items in the following categories must equal the total kits ordered:\n";

					var v1 = eval(document.myForm.BagToyWay.value);
					var v2 = eval(document.myForm.BagToyImp.value);
					var v3 = eval(document.myForm.BagToyDes.value);
					var v4 = eval(document.myForm.BagToyEp.value);
					var v5 = eval(document.myForm.BagToyESC.value);

					if(eval(v1+v2+v3+v4+v5) != eval(total)) {
						errorMessage = errorMessage + "\n Bag/Toys";
						wrongsum = true;
					}

					var v1 = eval(document.myForm.BibleTwo.value);
					var v2 = eval(document.myForm.BibleThree.value);
					var v3 = eval(document.myForm.BibleMisc.value);
					var v4 = eval(document.myForm.BibleBilingual.value);

					if(eval(v1+v2+v3+v4) != eval(total)) {
						errorMessage = errorMessage + "\n Bibles";
						wrongsum = true;
					}

					var v1 = eval(document.myForm.BookBeyond.value);
					var v2 = eval(document.myForm.BookCaseForC.value);
					var v3 = eval(document.myForm.BookCaseForF.value);
					var v4 = eval(document.myForm.BookMTACLoJ.value);
					var v5 = eval(document.myForm.BookSurvUS.value);
					var v6 = eval(document.myForm.BookLatino.value);
					var v7 = eval(document.myForm.BookBlueJazz.value);

					if((v1+v2+v3+v4+v5+v6+v7) != eval(total)) {
						errorMessage = errorMessage + "\n Books";
						wrongsum = true;
					}
					var v1 = eval(document.myForm.CdHipHop.value);
					var v2 = eval(document.myForm.CdSetApart.value);
					var v3 = eval(document.myForm.CdMisc.value);

					if(eval(v1+v2+v3) != eval(total)) {
						errorMessage = errorMessage + "\n Music CDs";
						wrongsum = true;
					}
					var v1 = eval(document.myForm.VideoDrinkRelDVD.value);
					var v2 = eval(document.myForm.VideoMisc.value);
					var v3 = eval(document.myForm.VideoJfpCD.value);
					var v4 = eval(document.myForm.VideoImpactDVD.value);

					if(eval(v1+v2+v3+v4) != eval(total)) {
						errorMessage = errorMessage + "\n DVD/CD-ROMs";
						wrongsum = true;
					}
					if (wrongsum) {
						alert(errorMessage);
						return false;
					} else {
						return true;
					}
				}
			}
		}
	}   

	function zeroMe() {
		if (window.document.myForm.TotalKits.value=="") window.document.myForm.TotalKits.value="0";
		if (window.document.myForm.BagToyWay.value=="") window.document.myForm.BagToyWay.value="0";
		if (window.document.myForm.BagToyImp.value=="") window.document.myForm.BagToyImp.value="0";
		if (window.document.myForm.BagToyDes.value=="") window.document.myForm.BagToyDes.value="0";
		if (window.document.myForm.BagToyEp.value=="") window.document.myForm.BagToyEp.value="0";
		if (window.document.myForm.BagToyESC.value=="") window.document.myForm.BagToyESC.value="0";
		if (window.document.myForm.BibleTwo.value=="") window.document.myForm.BibleTwo.value="0";
		if (window.document.myForm.BibleThree.value=="") window.document.myForm.BibleThree.value="0";
		if (window.document.myForm.BibleMisc.value=="") window.document.myForm.BibleMisc.value="0";
		if (window.document.myForm.BibleBilingual.value=="") window.document.myForm.BibleBilingual.value="0";
		if (window.document.myForm.BookBeyond.value=="") window.document.myForm.BookBeyond.value="0";
		if (window.document.myForm.BookMTACLoJ.value=="") window.document.myForm.BookMTACLoJ.value="0";
		if (window.document.myForm.BookCaseForC.value=="") window.document.myForm.BookCaseForC.value="0";
		if (window.document.myForm.BookCaseForF.value=="") window.document.myForm.BookCaseForF.value="0";
		if (window.document.myForm.BookLatino.value=="") window.document.myForm.BookLatino.value="0";
		if (window.document.myForm.BookSurvUS.value=="") window.document.myForm.BookSurvUS.value="0";
		if (window.document.myForm.BookBlueJazz.value=="") window.document.myForm.BookBlueJazz.value="0";
		if (window.document.myForm.CdHipHop.value=="") window.document.myForm.CdHipHop.value="0";
		if (window.document.myForm.CdSetApart.value=="") window.document.myForm.CdSetApart.value="0";
		if (window.document.myForm.CdMisc.value=="") window.document.myForm.CdMisc.value="0";
		if (window.document.myForm.VideoDrinkRelDVD.value=="") window.document.myForm.VideoDrinkRelDVD.value="0";
		if (window.document.myForm.VideoMisc.value=="") window.document.myForm.VideoMisc.value="0";
		if (window.document.myForm.VideoImpactDVD.value=="") window.document.myForm.VideoImpactDVD.value="0";
		if (window.document.myForm.VideoJfpCD.value=="") window.document.myForm.VideoJfpCD.value="0";
		}
//-->
</script>
</head>
<!-- The field names need to match attributes in FSKOrder -->
<body>

<% String pageTitle = "Order"; %>
<%@ include file="/fsk/fskheader.jspf"%>
<%=fontText%>
		<p>
		On this page you can tell us who to  ship the kits to and what you would like in them. 
		<BR>
		<BR>
		On <b>Monday, May 16, 2005</b>, we will begin ordering the material.  After that date, we cannot guarantee that all items will be available. 
		You can change the shipping and order information until <b>Monday, July 11, 2005</b>. At that time we will pull the data offline to  
		prepare for fulfillment.
		<BR>
		<BR>
		You must click the "Submit Order" button at the end of this page or your order will not be saved and processed. 
		All fields are required unless otherwise noted (*). 
		<BR>
		<BR>
		Once you have clicked the "Submit Order" button you will receive an e-mail confirmation, please check it carefully for
		any errors.  If you do not receive the email, we do NOT have a record of your order.  Thanks!
		<BR><BR>
		If you are having difficulty ordering, please click on the "FSK Help?" link on the top right of the page.
		<BR><BR>
		
<form action="/servlet/FskController" method="POST" name="myForm" onSubmit="return validate()">
			<input TYPE="hidden" NAME="action" value="saveOrder">
			<input TYPE="hidden" NAME="id" value="<%=h.get("FskOrderID")%>">
			<input TYPE="hidden" NAME="accountno" value="<%=session.getValue("fskLocalLeaderAccountNo")%>">
			<input TYPE="hidden" NAME="AllocationID" value="<%=request.getParameter("allocationID")%>">
			
		<table border="0" width="600">
			<tr>
				 <td width="414"><%=fontB4%>Order Number:</font>  <%=fontB3%><%=h.get("FskOrderID")%></font></td>
			</tr>
			<tr>
				<td>Date Added:  <% if (addDate != null) { %><%=addDate%><% } %></td>
			</tr>
			<tr>
				<td>Date Last Updated:  <% if (updateDate != null) { %><%=updateDate%><% } %></td>
			</tr>
			<tr><td colspan=2><%=hr%></td></tr>
			<tr>
				 <td>Location (campus name, metro name, etc.)</td>
				 <td width="176"><input type="text" size="20" name="CampusName" value="<%=formHelp.value((String)h.get("CampusName"))%>" maxlength="128"></td>
			</tr>
			<tr>
				 <td>Region</td>
				 <td><%
				  regions.setName("Region");
				  regions.setCurrentValue(formHelp.value((String)h.get("Region")));
								%>
				  <%=regions.print()%>
				 </td>
		  	</tr>
<!--			 <tr>
					<td><br>Local Campus Account #:</td>
			 </tr>
			 <tr>
				 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Business Unit</td>
					<td><input type="text" size="10" name="LocalAcctNo1" value="CAMPS" maxlength="20"></td>
			 </tr>
			 <tr>
				 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Operating Unit</td>
					<td><input type="text" size="10" name="LocalAcctNo2" value="<%=formHelp.value((String)h.get("LocalAcctNo2"))%>" maxlength="20"></td>
			 </tr>
			 <tr>
				 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department</td>
					<td><input type="text" size="10" name="LocalAcctNo3" value="<%=formHelp.value((String)h.get("LocalAcctNo3"))%>" maxlength="20"></td>
			 </tr>
			 <tr>
				 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project ID</td>
					<td><input type="text" size="10" name="LocalAcctNo4" value="<%=formHelp.value((String)h.get("LocalAcctNo4"))%>" maxlength="20"></td>
			 </tr>
-->
			<tr><td colspan=2><%=hr%></td></tr>
			<tr>
				 <td colspan="2"><%=fontB4%>Staff: </font><%=fontB%>(who is placing this order)</font></td>
			</tr>    
			<tr>
				<td>First Name</td>
				<td><input type="text" size="20" name="StaffFirstName" value="<%=formHelp.value((String)h.get("StaffFirstName"))%>" maxlength="30"></td>
			</tr>
			<tr>
				 <td>Last Name</td>
				<td><input type="text" size="20" name="StaffLastName" value="<%=formHelp.value((String)h.get("StaffLastName"))%>" maxlength="30"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" size="20" name="StaffPhone" value="<%=formHelp.value((String)h.get("StaffPhone"))%>" maxlength="20"></td>
			</tr>
			<tr>
				<td><%=fontB4%>Email </font><%=fontB%>(Please enter your full e-mail address)<BR>
					&nbsp;&nbsp;&nbsp;&nbsp;(This is the email address that the order<BR>
					&nbsp;&nbsp;&nbsp;&nbsp;confirmation will be sent to.)</font></td>
				<td><input type="text" size="20" name="StaffEmail" value="<%=formHelp.value((String)h.get("StaffEmail"))%>" maxlength="50"></td>
			</tr>
			<tr><td colspan=2><%=hr%></td></tr>
			<tr>
				 <td colspan="2"><%=fontB4%>Contact: </font><%=fontB%>(who can we reach in August if there is a problem)</font></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" size="20" name="ContactFirstName" value="<%=formHelp.value((String)h.get("ContactFirstName"))%>" maxlength="30"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" size="20" name="ContactLastName" value="<%=formHelp.value((String)h.get("ContactLastName"))%>" maxlength="30"></td>
			</tr>
				<tr>
				<td>Phone</td>
				<td><input type="text" size="20" name="ContactPhone" value="<%=formHelp.value((String)h.get("ContactPhone"))%>" maxlength="24"></td>
			</tr>
				<tr>
				<td>Cell*</td>
				<td><input type="text" size="20" name="ContactCell" value="<%=formHelp.value((String)h.get("ContactCell"))%>" maxlength="24"></td>
			</tr>
				<tr>
				<td><%=fontB4%>Email </font><%=fontB%>(Please enter your full e-mail address)</font></td>
				<td><input type="text" size="20" name="ContactEmail" value="<%=formHelp.value((String)h.get("ContactEmail"))%>" maxlength="50"></td>
			</tr>
				<tr><td colspan=2><%=hr%></td></tr>
			<tr>
				 <td colspan="2"><%=fontB4%>Kit Shipping Information: </font><%=fontB%>(where do you want the kits to go)</font><BR>
				 In an effort to trim our cost and provide you with quality materials, large orders (over 800 kits) may be shipped by freight line using wooden pallets about 4 feet by 4 feet with multiple boxes stacked on top.  Please take this into consideration when entering your "ship to" address.<br>
        Note: The Shipping dates for kits are August 8-11.</td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" size="20" name="KitShipName" value="<%=formHelp.value((String)h.get("KitShipName"))%>" maxlength="30"></td>
			</tr>
			<tr>
				<td>Address1</td>
				<td><input type="text" size="20" name="KitShipAddress1" value="<%=formHelp.value((String)h.get("KitShipAddress1"))%>" maxlength="35"></td>
			</tr>
			<tr>
				<td>Address2*</td>
				<td><input type="text" size="20" name="KitShipAddress2" value="<%=formHelp.value((String)h.get("KitShipAddress2"))%>" maxlength="35"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" size="20" name="KitShipCity" value="<%=formHelp.value((String)h.get("KitShipCity"))%>" maxlength="30"></td>
			</tr>
			<tr>
				<td>State</td>
				<td><input type="text" size="20" name="KitShipState" value="<%=formHelp.value((String)h.get("KitShipState"))%>" maxlength="6"></td>
			</tr>
			<tr>
				<td>Zip</td>
				<td><input type="text" size="20" name="KitShipZip" value="<%=formHelp.value((String)h.get("KitShipZip"))%>" maxlength="10"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" size="20" name="KitShipPhone" value="<%=formHelp.value((String)h.get("KitShipPhone"))%>" maxlength="24"></td>
			</tr>
			<tr><td colspan=2><%=hr%></td></tr>
				<tr>
				 <td colspan="2"><%=fontB4%>Kit Contents: </font><%=fontB%>(select the products for your kit).</font><BR>
				 <small><%=fontR%>All quantities must be in multiples of 100</font>.  You can choose between several kinds of items in each category, 
				 in quantities of 100 and equaling the total for this order. <!-- You have formHelp.value((String)app.get("Unordered")) kits left to order. --></small></font>
				</td>
			</tr>
			<tr>
				<td>Total Quantity of Kits for this Order</td>
				<td><input type="text" size="20" name="TotalKits" value="<%=formHelp.value((String)h.get("TotalKits"))%>"></td>
			</tr>
			<tr>
				<td colspan="2">1.<a name="1"> </a>  <a href='#1' onClick="window.open('/fsk/Descrip.htm#bag', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Bag</a> &amp; 
				<a href='#1' onClick="window.open('/fsk/Descrip.htm#bottle', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Bottle</a> <BR>
			  <small>The bag is a 20x30 laundry bag with a logo that displays one of five websites.   Please choose the website you would like displayed on the laundry bag and bottle.</small></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. <a href="http://www.waymore.org/" target="_blank">www.waymore.org </a> (Sorry, no longer available)</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input DISABLED type="text" size="20" name="BagToyWay" value="<%=formHelp.value((String)h.get("BagToyWay"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B. <a href="http://www.Notyourmamasreligion.com" target="_blank">www.Notyourmamasreligion.com</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BagToyImp" value="<%=formHelp.value((String)h.get("BagToyImp"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C. <a href="http://www.MyDestino.com/" target="_blank">www.MyDestino.com</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BagToyDes" value="<%=formHelp.value((String)h.get("BagToyDes"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D. <a href="http://www.EpicMovement.com/" target="_blank">www.EpicMovement.com</a> (Sorry, no longer available)</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input DISABLED type="text" size="20" name="BagToyEp" value="<%=formHelp.value((String)h.get("BagToyEp"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E. <a href="http://www.EveryStudent.com/" target="_blank">www.EveryStudent.com</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BagToyESC" value="<%=formHelp.value((String)h.get("BagToyESC"))%>"></td>
			</tr>
			<tr>	
				<td>2.<a name="2"> </a><a href='#2' onClick='window.open("/fsk/Descrip.htm#bibles","plain","scrollbars,width=500,height=300,dependent=yes,resizable");'>Scripture.</a> (click on title for more info.)</td>
				<td></td>
			</tr>
			
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. <a href='#2' onClick="window.open('/fsk/Descrip.htm#cev', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">NIV New Testament</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BibleTwo" value="<%=formHelp.value((String)h.get("BibleTwo"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B. <a href='#2' onClick="window.open('/fsk/Descrip.htm#mycity', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">My City, My God (NIrV NT)</a> (Sorry, no longer available)</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input DISABLED type="text" size="20" name="BibleThree" value="<%=formHelp.value((String)h.get("BibleThree"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C. <a href='#2' onClick="window.open('/fsk/Descrip.htm#niv', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">NIV Whole Bible</a> (Sorry, no longer available)</td>
			    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input DISABLED type="text" name="BibleMisc" value="<%=formHelp.value((String)h.get("BibleMisc"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D. <a href='#2' onClick="window.open('/fsk/Descrip.htm#bilingual', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Bilingual New Testament (Spanish/English)</a></td>
			    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="BibleBilingual" value="<%=formHelp.value((String)h.get("BibleBilingual"))%>"></td>
			</tr>
			<tr>
				<td>3.<a name="3"> </a><a href='#3' onClick="window.open('/fsk/Descrip.htm#books', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Books.</a>  (click on title for more info.)</td>
				<td></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. <a href='#3' onClick="window.open('/fsk/Descrip.htm#flipbook', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">More Than a Carpenter / Life of Jesus (Flip Book)</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BookMTACLoJ" value="<%=formHelp.value((String)h.get("BookMTACLoJ"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B. <a href='#3' onClick="window.open('/fsk/Descrip.htm#case', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">The Case for Christ - Lee Strobel</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BookCaseForC" value="<%=formHelp.value((String)h.get("BookCaseForC"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C. <a href='#3' onClick="window.open('/fsk/Descrip.htm#casefaith', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">The Case for Faith - Lee Strobel</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BookCaseForF" value="<%=formHelp.value((String)h.get("BookCaseForF"))%>"></td>
			</tr>
			<tr>
      			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D. <a href='#3' onClick="window.open('/fsk/Descrip.htm#beyond', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Beyond Roots - Dwight McKissic</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BookBeyond" value="<%=formHelp.value((String)h.get("BookBeyond"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E. <a href='#3' onClick="window.open('/fsk/Descrip.htm#survus', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">How to Survive in the U.S. - I.S.I</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BookSurvUS" value="<%=formHelp.value((String)h.get("BookSurvUS"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;F. <a href='#3' onClick="window.open('/fsk/Descrip.htm#beinglatino', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Being Latino in Christ - Orlando Crespo</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="BookLatino" value="<%=formHelp.value((String)h.get("BookLatino"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G. <a href='#3' onClick="window.open('/fsk/Descrip.htm#bluelike', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Blue Like Jazz - Donald Miller</a> (Sorry, no longer available)</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input DISABLED type="text" size="20" name="BookBlueJazz" value="<%=formHelp.value((String)h.get("BookBlueJazz"))%>"></td>
			</tr>
			<tr>
				<td colspan="2">4. <a href='#4' onClick="window.open('/fsk/Descrip.htm#cds', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Music</a> (click on title for more info.)</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. <a href='#4' onClick="window.open('/fsk/Descrip.htm#nolies', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Pop Rock</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="CdSetApart" value="<%=formHelp.value((String)h.get("CdSetApart"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B. <a href='#4' onClick="window.open('/fsk/Descrip.htm#hiphop', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Hip Hop, Rap and Gospel</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="CdHipHop" value="<%=formHelp.value((String)h.get("CdHipHop"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C. <a href='#4' onClick="window.open('/fsk/Descrip.htm#altrock', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Alternative, Hard Rock</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="CdMisc" value="<%=formHelp.value((String)h.get("CdMisc"))%>"></td>
			</tr>
			<tr>
				<td colspan="2">5. <a href='#5' onClick="window.open('/fsk/Descrip.htm#dvds', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">DVD or CD-ROM</a> (click on title for more info.)</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. <a href='#5' onClick="window.open('/fsk/Descrip.htm#dvd', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">REELS</a> (Sorry, no longer available)</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input DISABLED type="text" size="20" name="VideoDrinkRelDVD" value="<%=formHelp.value((String)h.get("VideoDrinkRelDVD"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;B. <a href='#5' onClick="window.open('/fsk/Descrip.htm#uncensoreddvd', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Uncensored DVD</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="VideoMisc" value="<%=formHelp.value((String)h.get("VideoMisc"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C. <a href='#5' onClick="window.open('/fsk/Descrip.htm#impactdvd', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Impact DVD</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="VideoImpactDVD" value="<%=formHelp.value((String)h.get("VideoImpactDVD"))%>"></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D. <a href='#5' onClick="window.open('/fsk/Descrip.htm#jesuscd', 'Descriptions', 'height=300,width=500,dependent=yes,scrollbars=yes,resizable')">Jesus Film CD ROM</a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" name="VideoJfpCD" value="<%=formHelp.value((String)h.get("VideoJfpCD"))%>"></td>
			</tr>
		</table>
		<p><input type="submit" name="action" value="Submit Order" onClick="zeroMe()"> You will receive 
		an email confirmation within a few moments of submitting this order.</p>
</form>
	</font>
<%@ include file="/footer.jspf" %>
</body>
</html>
