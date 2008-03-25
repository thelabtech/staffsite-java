<%@ page import="java.io.*,java.util.*,javax.servlet.http.*,org.alt60m.util.*,org.alt60m.servlet.*" %>
<%@ include file="/style.jspf"%>

<HTML>
<HEAD>
<TITLE>Campus Crusade Staff HR Snapshot</TITLE>

<SCRIPT LANGUAGE="JavaScript"><!--

function submit1() {
    isValid= true;
	/* perform any validation here */
    if (isValid&&document.captureForm.FirstName.value == "") {
    	isValid=false;
    	alert("Please enter your first name.");
    	document.captureForm.FirstName.focus();
    }
    if (isValid&&document.captureForm.LastName.value == "") {
    	isValid=false;
    	alert("Please enter your last name.");
    	document.captureForm.LastName.focus();
    }
    if (isValid&&!document.captureForm.AddressType[0].checked&&!document.captureForm.AddressType[1].checked) {
    	isValid=false;
    	alert("Please indicate whether you have a US or International Address.");
    }
    if (isValid&&document.captureForm.AddressType[1].checked) {
    	if (document.captureForm.Country.value == "") {
        	isValid=false;
        	alert("You indicated you have an international address. Please select your country.");
        	document.captureForm.Country.focus();
        }else if (document.captureForm.IntAddress.value == "") {
        	isValid=false;
        	alert("You indicated you have an international address. Please enter that address.");
        	document.captureForm.IntAddress.focus();
        }
  	}
    if (isValid&&document.captureForm.AddressType[0].checked) {
		if (document.captureForm.Address1.value == "") {
	    	isValid=false;
	    	alert("You indicated you have a U.S. address. Please enter your street address.");
	    	document.captureForm.Address1.focus();
	    }else if (document.captureForm.City.value == "") {
	    	isValid=false;
	    	alert("You indicated you have a U.S. address. Please enter your city.");
	    	document.captureForm.City.focus();
	    }else if (document.captureForm.State.value == "") {
	    	isValid=false;
	    	alert("You indicated you have a U.S. address. Please enter your state.");
	    	document.captureForm.State.focus();
	    }else if (document.captureForm.Zip.value == "") {
	    	isValid=false;
	    	alert("You indicated you have a U.S. address. Please enter your zip code.");
	    	document.captureForm.Zip.focus();
	    }
	}
    if (isValid&&document.captureForm.WorkPhone.value == "") {
    	isValid=false;
    	alert("Please enter your work phone number.");
    	document.captureForm.WorkPhone.focus();
	}
    if (isValid&&document.captureForm.Ministry.value == "") {
    	isValid=false;
    	alert("Please enter your ministry.");
    	document.captureForm.Ministry.focus();
	}
    if (isValid&&document.captureForm.Department.value == "") {
    	isValid=false;
    	alert("Please enter your department.");
    	document.captureForm.Department.focus();
	}
    if (isValid&&document.captureForm.SubMinistry.value == "") {
    	isValid=false;
    	alert("Please enter your sub ministry.");
    	document.captureForm.SubMinistry.focus();
	}
    if (isValid&&document.captureForm.Position.options[document.captureForm.Position.selectedIndex].value=="") {
    	isValid=false;
    	alert("Please enter your position.");
    	document.captureForm.Position.focus();
	}
    else if (isValid&&document.captureForm.Position.options[document.captureForm.Position.selectedIndex].value=="Other"&&document.captureForm.OtherPosition.value == "") {
    	isValid=false;
    	alert("You chose 'Other' as your position.  Please provide a description of your position.");
    	document.captureForm.OtherPosition.focus();
	}
    if (isValid&&document.captureForm.Strategy.value == "") {
    	isValid=false;
    	alert("Please enter your strategy.");
    	document.captureForm.Strategy.focus();
	}
    if (isValid&&document.captureForm.Role.value == "") {
    	isValid=false;
    	alert("Please describe your role.");
    	document.captureForm.Role.focus();
	}
    if (isValid&&document.captureForm.AccountNo.value == "") {
    	isValid=false;
    	alert("Please enter your account number.");
    	document.captureForm.AccountNo.focus();
	}
    if (isValid&&document.captureForm.Married.options[document.captureForm.Married.selectedIndex].value=="") {
    	isValid=false;
    	alert("Please provide your marital status.");
    	document.captureForm.Married.focus();
	}else if (isValid&&document.captureForm.Married.options[document.captureForm.Married.selectedIndex].value=="T") {
		if (isValid&&document.captureForm.SpouseFirstName.value == "") {
	    	isValid=false;
	    	alert("You indicated you are married. Please enter your spouse's first name.");
	    	document.captureForm.SpouseFirstName.focus();
		}else if (isValid&&document.captureForm.SpouseLastName.value == "") {
	    	isValid=false;
	    	alert("You indicated you are married. Please enter your spouse's last name.");
	    	document.captureForm.SpouseLastName.focus();
		}
	}
	
    return isValid;
}
function submit2() {
	if (submit1()) {
		document.captureForm.submit();
	}
}
//--></script>
<%

Hashtable tub = (Hashtable) session.getValue("HRinfo");
String accountNo = (String)tub.get("AccountNo");
String firstName = (String)tub.get("FirstName");
String lastName = (String)tub.get("LastName");

%>

</HEAD>
<BODY BGCOLOR=#FFFFFF>
<TABLE WIDTH="100%" HEIGHT="100%" ALIGN=center>
<TR HEIGHT="80%"><TD colspan=2 align=center>
<TABLE WIDTH=500 BORDER=0 CELLPADDING=5 CELLSPACING=0 align="center">


	<TR>
	<TD><IMG SRC="/images/CMlogobig.gif"/ height="141" width="75" alt="Campus Crusade for Christ"></TD>
	<TD VALIGN="BOTTOM">In an effort to have up-to-date information on all of our staff, we are asking you for your most recent job information, just this one time, before you login to the staff site.<br /><br /><B>Please answer the questions below.</B></TD>
	</TR>
	
	<form name="captureForm" METHOD="POST" ACTION="/servlet/StaffController?action=captureHRinfo" onSubmit="return submit2()">	

	<TR>
	<TD COLSPAN="2">&nbsp;</TD>
	</TR>
	
	<TR>
		<TD CLASS="cell">First Name</TD>
		<TD height="30"> 
        <input type="text" name="FirstName"  value="<%=firstName.equals("")?"":firstName%>" size="40">
		</TD>
	</TR>
	<TR>
	<TD CLASS="cell">Middle Name</TD>
	<TD height="30"> 
    <input type="text" name="MiddleName" size="40">
	</TD>
</TR>
<TR>
<TD CLASS="cell">Last Name</TD>
<TD height="30"> 
<input type="text" name="LastName"  value="<%=lastName.equals("")?"":lastName%>" size="40">
</TD>
</TR>
	</TABLE>
<TABLE border="0" cellspacing="25" cellpadding="0">
<TR align="center"><TD COLSPAN="2" align="center"><B>Enter your address in the appropriate form:</B></TD></TR>

<TR><TD valign="top" border="1"><TABLE cellpadding="5" cellspacing="0" border="0"><TR><TD align="right"> 
    		<input type="radio" name="AddressType" value="US">
			</TD>
			<TD CLASS="cell">U.S. Addresses</TD>
			
		</TR>
		<TR>
			<TD align="right" CLASS="cell">Address 1</TD>
			<TD height="30"> 
	    	<input type="text" name="Address1" size="40">
			</TD>
		</TR>
		<TR>
			<TD align="right" CLASS="cell">Address 2</TD>
			<TD height="30"> 
			<input type="text" name="Address2" size="40">
			</TD>
		</TR>
		<TR>
			<TD align="right" CLASS="cell">City</TD>
			<TD height="30"> 
			<input type="text" name="City" size="30">
			</TD>
		</TR>
		<TR>
		<TD align="right" CLASS="cell">State</TD>
		<TD height="30"> 
		
			<SELECT NAME="State">
	
			<OPTION VALUE="" SELECTED>Select your state
	
			<OPTION VALUE="AL">Alabama
	
			<OPTION VALUE="AZ">Arizona
	
			<OPTION VALUE="AR">Arkansas
	
			<OPTION VALUE="CA">California
	
			<OPTION VALUE="CO">Colorado
	
			<OPTION VALUE="CT">Connecticut
	
			<OPTION VALUE="DE">Delaware
	
			<OPTION VALUE="DC">District of Columbia
	
			<OPTION VALUE="FL">Florida
	
			<OPTION VALUE="GA">Georgia
	
			<OPTION VALUE="ID">Idaho
	
			<OPTION VALUE="IL">Illinois
	
			<OPTION VALUE="IN">Indiana
	
			<OPTION VALUE="IA">Iowa
	
			<OPTION VALUE="KS">Kansas
	
			<OPTION VALUE="KY">Kentucky
	
			<OPTION VALUE="LA">Louisiana
	
			<OPTION VALUE="ME">Maine
	
			<OPTION VALUE="MD">Maryland
	
			<OPTION VALUE="MA">Massachusetts
	
			<OPTION VALUE="MI">Michigan
	
			<OPTION VALUE="MN">Minnesota
	
			<OPTION VALUE="MS">Mississippi
	
			<OPTION VALUE="MO">Missouri
	
			<OPTION VALUE="MT">Montana
	
			<OPTION VALUE="NE">Nebraska
	
			<OPTION VALUE="NV">Nevada
	
			<OPTION VALUE="NH">New Hampshire
	
			<OPTION VALUE="NJ">New Jersey
	
			<OPTION VALUE="NM">New Mexico
	
			<OPTION VALUE="NY">New York
	
			<OPTION VALUE="NC">North Carolina
	
			<OPTION VALUE="ND">North Dakota
	
			<OPTION VALUE="OH">Ohio
	
			<OPTION VALUE="OK">Oklahoma
	
			<OPTION VALUE="OR">Oregon
	
			<OPTION VALUE="PA">Pennsylvania
	
			<OPTION VALUE="RI">Rhode Island
	
			<OPTION VALUE="SC">South Carolina
	
			<OPTION VALUE="SD">South Dakota
	
			<OPTION VALUE="TN">Tennessee
	
			<OPTION VALUE="TX">Texas
	
			<OPTION VALUE="UT">Utah
	
			<OPTION VALUE="VT">Vermont
	
			<OPTION VALUE="VA">Virginia
	
			<OPTION VALUE="VI">Virgin Islands
	
			<OPTION VALUE="WA">Washington
	
			<OPTION VALUE="WV">West Virginia
	
			<OPTION VALUE="WI">Wisconsin
	
			<OPTION VALUE="WY">Wyoming
	
			</SELECT>
		</TD>
		</TR>
		<TR>
			<TD align="right" CLASS="cell">Zip</TD>
			<TD height="30"> 
			<input type="text" name="Zip" size="9">
			</TD>
		</TR>
		</TABLE></TD>
		<TD border="1">
		<TABLE border="0" cellspacing="0" cellpadding="5">
		<TR>			
			<TD align="right"> 
			<input type="radio" name="AddressType" value="Int">
			</TD>
			<TD CLASS="cell">International Addresses</TD>
		</TR>
		<TR>
			<TD CLASS="cell">Country:</TD>
			<TD>
			<SELECT NAME="Country">
			
			<OPTION VALUE="">Select your country
			
			<OPTION VALUE="USA">United States (USA)
			
			<OPTION VALUE="CAN">Canada (CAN)
			
			<OPTION VALUE="ALB">Albania (ALB)
			
			<OPTION VALUE="ASM">American Samoa (ASM)
			
			<OPTION VALUE="AND">Andorra (AND)
			
			<OPTION VALUE="AGO">Angola (AGO)
			
			<OPTION VALUE="AIA">Anguilla (AIA)
			
			<OPTION VALUE="ATG">Antigua and Barbuda (ATG)
			
			<OPTION VALUE="ARG">Argentina (ARG)
			
			<OPTION VALUE="ABW">Aruba (ABW)
			
			<OPTION VALUE="AUS">Australia (AUS)
			
			<OPTION VALUE="AUT">Austria (AUT)
			
			<OPTION VALUE="AZE">Azerbaijan (AZE)
			
			<OPTION VALUE="BHS">Bahamas (BHS)
			
			<OPTION VALUE="BHR">Bahrain (BHR)
			
			<OPTION VALUE="BGD">Bangladesh (BGD)
			
			<OPTION VALUE="BRB">Barbados (BRB)
			
			<OPTION VALUE="BLR">Belarus (BLR)
			
			<OPTION VALUE="BEL">Belgium (BEL)
			
			<OPTION VALUE="BLZ">Belize (BLZ)
			
			<OPTION VALUE="BEN">Benin (BEN)
			
			<OPTION VALUE="BMU">Bermuda (BMU)
			
			<OPTION VALUE="BTN">Bhutan (BTN)
			
			<OPTION VALUE="BOL">Bolivia (BOL)
			
			<OPTION VALUE="BIH">Bosnia and Herzegovina (BIH)
			
			<OPTION VALUE="BWA">Botswana (BWA)
			
			<OPTION VALUE="BVT">Bouvet Island (BVT)
			
			<OPTION VALUE="BRA">Brazil (BRA)
			
			<OPTION VALUE="IOT">British Indian Ocean Territory (IOT)
			
			<OPTION VALUE="BRN">Brunei Darussalam (BRN)
			
			<OPTION VALUE="BGR">Bulgaria (BGR)
			
			<OPTION VALUE="BFA">Burkina Faso (BFA)
			
			<OPTION VALUE="BDI">Burundi (BDI)
			
			<OPTION VALUE="KHM">Cambodia (KHM)
			
			<OPTION VALUE="CMR">Cameroon (CMR)
			
			<OPTION VALUE="CPV">Cape Verde (CPV)
			
			<OPTION VALUE="CYM">Cayman Islands (CYM)
			
			<OPTION VALUE="CAF">Central African Republic (CAF)
			
			<OPTION VALUE="TCD">Chad (TCD)
			
			<OPTION VALUE="CHL">Chile (CHL)
			
			<OPTION VALUE="CXR">Christmas Island (CXR)
			
			<OPTION VALUE="CCK">Cocos (Keeling) Islands (CCK)
			
			<OPTION VALUE="COL">Colombia (COL)
			
			<OPTION VALUE="COM">Comoros (COM)
			
			<OPTION VALUE="DRC">Congo, Democratic Republic of (DRC)
			
			<OPTION VALUE="COG">Congo, Republic of (COG)
			
			<OPTION VALUE="COK">Cook Islands (COK)
			
			<OPTION VALUE="CRI">Costa Rica (CRI)
			
			<OPTION VALUE="CIV">Cote D'Ivoire (Ivory Coast) (CIV)
			
			<OPTION VALUE="HRV">Croatia (Hrvatska) (HRV)
			
			<OPTION VALUE="CYP">Cyprus (CYP)
			
			<OPTION VALUE="CZE">Czech Republic (CZE)
			
			<OPTION VALUE="DNK">Denmark (DNK)
			
			<OPTION VALUE="DMA">Dominica (DMA)
			
			<OPTION VALUE="DOM">Dominican Republic (DOM)
			
			<OPTION VALUE="XEA">East Asia (XEA)
			
			<OPTION VALUE="TMP">East Timor (TMP)
			
			<OPTION VALUE="XEE">Eastern Europe (XEE)
			
			<OPTION VALUE="ECU">Ecuador (ECU)
			
			<OPTION VALUE="SLV">El Salvador (SLV)
			
			<OPTION VALUE="GNQ">Equatorial Guinea (GNQ)
			
			<OPTION VALUE="ERI">Eritrea (ERI)
			
			<OPTION VALUE="EST">Estonia (EST)
			
			<OPTION VALUE="ETH">Ethiopia (ETH)
			
			<OPTION VALUE="FLK">Falkland Islands (Malvinas) (FLK)
			
			<OPTION VALUE="FRO">Faroe Islands (FRO)
			
			<OPTION VALUE="FJI">Fiji (FJI)
			
			<OPTION VALUE="FIN">Finland (FIN)
			
			<OPTION VALUE="FRA">France (FRA)
			
			<OPTION VALUE="GUF">French Guiana (GUF)
			
			<OPTION VALUE="PYF">French Polynesia (PYF)
			
			<OPTION VALUE="ATF">French Southern Territories (ATF)
			
			<OPTION VALUE="GAB">Gabon (GAB)
			
			<OPTION VALUE="GMB">Gambia (GMB)
			
			<OPTION VALUE="GEO">Georgia (GEO)
			
			<OPTION VALUE="DEU">Germany (DEU)
			
			<OPTION VALUE="GHA">Ghana (GHA)
			
			<OPTION VALUE="GIB">Gibraltar (GIB)
			
			<OPTION VALUE="GRB ">Great Britain (UK) (GRB )
			
			<OPTION VALUE="GRC">Greece (GRC)
			
			<OPTION VALUE="GRD">Grenada (GRD)
			
			<OPTION VALUE="GLP">Guadeloupe (GLP)
			
			<OPTION VALUE="GUM">Guam (GUM)
			
			<OPTION VALUE="GTM">Guatemala (GTM)
			
			<OPTION VALUE="GIN">Guinea (GIN)
			
			<OPTION VALUE="GNB">Guinea-Bissau (GNB)
			
			<OPTION VALUE="GUY">Guyana (GUY)
			
			<OPTION VALUE="HTI">Haiti (HTI)
			
			<OPTION VALUE="HMD">Heard and McDonald Islands (HMD)
			
			<OPTION VALUE="HND">Honduras (HND)
			
			<OPTION VALUE="HKG">Hong Kong (HKG)
			
			<OPTION VALUE="HUN">Hungary (HUN)
			
			<OPTION VALUE="ISL">Iceland (ISL)
			
			<OPTION VALUE="IND">India (IND)
			
			<OPTION VALUE="IDN">Indonesia (IDN)
			
			<OPTION VALUE="IRL">Ireland (IRL)
			
			<OPTION VALUE="ITA">Italy (ITA)
			
			<OPTION VALUE="JAM">Jamaica (JAM)
			
			<OPTION VALUE="JPN">Japan (JPN)
			
			<OPTION VALUE="JOR">Jordan (JOR)
			
			<OPTION VALUE="KAZ">Kazakhstan (KAZ)
			
			<OPTION VALUE="KEN">Kenya (KEN)
			
			<OPTION VALUE="KIR">Kiribati (KIR)
			
			<OPTION VALUE="KOR">Korea (South) (KOR)
			
			<OPTION VALUE="KGZ">Kyrgyzstan (KGZ)
			
			<OPTION VALUE="LAO">Laos (LAO)
			
			<OPTION VALUE="XLA">Latin America (XLA)
			
			<OPTION VALUE="LVA">Latvia (LVA)
			
			<OPTION VALUE="LBN">Lebanon (LBN)
			
			<OPTION VALUE="LSO">Lesotho (LSO)
			
			<OPTION VALUE="LBR">Liberia (LBR)
			
			<OPTION VALUE="LBY">Libya (LBY)
			
			<OPTION VALUE="LIE">Liechtenstein (LIE)
			
			<OPTION VALUE="LTU">Lithuania (LTU)
			
			<OPTION VALUE="LUX">Luxembourg (LUX)
			
			<OPTION VALUE="MAC">Macau (MAC)
			
			<OPTION VALUE="MKD">Macedonia (MKD)
			
			<OPTION VALUE="MDG">Madagascar (MDG)
			
			<OPTION VALUE="MWI">Malawi (MWI)
			
			<OPTION VALUE="MYS">Malaysia (MYS)
			
			<OPTION VALUE="MDV">Maldives (MDV)
			
			<OPTION VALUE="MLI">Mali (MLI)
			
			<OPTION VALUE="MLT">Malta (MLT)
			
			<OPTION VALUE="MHL">Marshall Islands (MHL)
			
			<OPTION VALUE="MTQ">Martinique (MTQ)
			
			<OPTION VALUE="MRT">Mauritania (MRT)
			
			<OPTION VALUE="MUS">Mauritius (MUS)
			
			<OPTION VALUE="MYT">Mayotte (MYT)
			
			<OPTION VALUE="MEX">Mexico (MEX)
			
			<OPTION VALUE="FSM">Micronesia (FSM)
			
			<OPTION VALUE="MDA">Moldova (MDA)
			
			<OPTION VALUE="MCO">Monaco (MCO)
			
			<OPTION VALUE="MNG">Mongolia (MNG)
			
			<OPTION VALUE="MSR">Montserrat (MSR)
			
			<OPTION VALUE="MOZ">Mozambique (MOZ)
			
			<OPTION VALUE="MMR">Myanmar (MMR)
			
			<OPTION VALUE="XNM">NAME (XNM)
			
			<OPTION VALUE="NAM">Namibia (NAM)
			
			<OPTION VALUE="NRU">Nauru (NRU)
			
			<OPTION VALUE="NLD">Netherlands (NLD)
			
			<OPTION VALUE="ANT">Netherlands Antilles (ANT)
			
			<OPTION VALUE="NCL">New Caledonia (NCL)
			
			<OPTION VALUE="NZL">New Zealand (Aotearoa) (NZL)
			
			<OPTION VALUE="NIC">Nicaragua (NIC)
			
			<OPTION VALUE="NER">Niger (NER)
			
			<OPTION VALUE="NGA">Nigeria (NGA)
			
			<OPTION VALUE="NIU">Niue (NIU)
			
			<OPTION VALUE="NFK">Norfolk Island (NFK)
			
			<OPTION VALUE="MNP">Northern Mariana Islands (MNP)
			
			<OPTION VALUE="NOR">Norway (NOR)
			
			<OPTION VALUE="OMN">Oman (OMN)
			
			<OPTION VALUE="PAK">Pakistan (PAK)
			
			<OPTION VALUE="PLW">Palau (PLW)
			
			<OPTION VALUE="PAN">Panama (PAN)
			
			<OPTION VALUE="PNG">Papua New Guinea (PNG)
			
			<OPTION VALUE="PRY">Paraguay (PRY)
			
			<OPTION VALUE="PER">Peru (PER)
			
			<OPTION VALUE="PHL">Philippines (PHL)
			
			<OPTION VALUE="PCN">Pitcairn (PCN)
			
			<OPTION VALUE="POL">Poland (POL)
			
			<OPTION VALUE="PRT">Portugal (PRT)
			
			<OPTION VALUE="PRI">Puerto Rico (PRI)
			
			<OPTION VALUE="REU">Reunion (REU)
			
			<OPTION VALUE="ROM">Romania (ROM)
			
			<OPTION VALUE="RUS">Russian Federation (RUS)
			
			<OPTION VALUE="RWA">Rwanda (RWA)
			
			<OPTION VALUE="SGS">S. Georgia and S. Sandwich Isls. (SGS)
			
			<OPTION VALUE="KNA">Saint Kitts and Nevis (KNA)
			
			<OPTION VALUE="LCA">Saint Lucia (LCA)
			
			<OPTION VALUE="VCT">Saint Vincent and the Grenadines (VCT)
			
			<OPTION VALUE="WSM">Samoa (WSM)
			
			<OPTION VALUE="SMR">San Marino (SMR)
			
			<OPTION VALUE="STP">Sao Tome and Principe (STP)
			
			<OPTION VALUE="SEN">Senegal (SEN)
			
			<OPTION VALUE="SYC">Seychelles (SYC)
			
			<OPTION VALUE="SLE">Sierra Leone (SLE)
			
			<OPTION VALUE="SGP">Singapore (SGP)
			
			<OPTION VALUE="SVK">Slovak Republic (SVK)
			
			<OPTION VALUE="SVN">Slovenia (SVN)
			
			<OPTION VALUE="SLB">Solomon Islands (SLB)
			
			<OPTION VALUE="SOM">Somalia (SOM)
			
			<OPTION VALUE="ZAF">South Africa (ZAF)
			
			<OPTION VALUE="XSA">South Asia (XSA)
			
			<OPTION VALUE="XSE">Southeast Asia (XSE)
			
			<OPTION VALUE="ESP">Spain (ESP)
			
			<OPTION VALUE="LKA">Sri Lanka (LKA)
			
			<OPTION VALUE="SHN">St. Helena (SHN)
			
			<OPTION VALUE="SPM">St. Pierre and Miquelon (SPM)
			
			<OPTION VALUE="SUD">Sudan (SUD)
			
			<OPTION VALUE="SUR">Suriname (SUR)
			
			<OPTION VALUE="SJM">Svalbard and Jan Mayen Islands (SJM)
			
			<OPTION VALUE="SWZ">Swaziland (SWZ)
			
			<OPTION VALUE="SWE">Sweden (SWE)
			
			<OPTION VALUE="CHE">Switzerland (CHE)
			
			<OPTION VALUE="TWN">Taiwan (TWN)
			
			<OPTION VALUE="TJK">Tajikistan (TJK)
			
			<OPTION VALUE="TZA">Tanzania (TZA)
			
			<OPTION VALUE="THA">Thailand (THA)
			
			<OPTION VALUE="TGO">Togo (TGO)
			
			<OPTION VALUE="TKL">Tokelau (TKL)
			
			<OPTION VALUE="TON">Tonga (TON)
			
			<OPTION VALUE="TTO">Trinidad and Tobago (TTO)
			
			<OPTION VALUE="TKM">Turkmenistan (TKM)
			
			<OPTION VALUE="TCA">Turks and Caicos Islands (TCA)
			
			<OPTION VALUE="TUV">Tuvalu (TUV)
			
			<OPTION VALUE="UGA">Uganda (UGA)
			
			<OPTION VALUE="UKR">Ukraine (UKR)
			
			<OPTION VALUE="UAE">United Arab Emirates (UAE)
			
			<OPTION VALUE="GBR">United Kingdom (GBR)
			
			<OPTION VALUE="URY">Uruguay (URY)
			
			<OPTION VALUE="VUT">Vanuatu (VUT)
			
			<OPTION VALUE="VAT">Vatican City State (Holy See) (VAT)
			
			<OPTION VALUE="VEN">Venezuela (VEN)
			
			<OPTION VALUE="VGR">Virgin Islands (British) (VGR)
			
			<OPTION VALUE="VIR">Virgin Islands (U.S.) (VIR)
			
			<OPTION VALUE="WLF">Wallis and Futuna Islands (WLF)
			
			<OPTION VALUE="YUG">Yugoslavia (YUG)
			
			<OPTION VALUE="ZMB">Zambia (ZMB)
			
			<OPTION VALUE="ZWE">Zimbabwe (ZWE)
			
			</SELECT>
			</TD></TR>
			<TR COLSPAN="2"><TD COLSPAN="2">
				Enter International Address
				<br />
				<TEXTAREA NAME="IntAddress" ROWS="6" COLS="46"></TEXTAREA>
			
			</TD></TR>
			</TABLE>
			
		</TD></TR>
		</TABLE>
<TABLE WIDTH=500 BORDER=0 CELLPADDING=5 CELLSPACING=0 align="center">
	<TR>
		<TD CLASS="cell">Work Phone</TD>
		<TD height="30"> 
		<input type="text" name="WorkPhone" size="20">
		</TD>
	</TR>
	<TR>
		<TD CLASS="cell">Cell Phone</TD>
		<TD height="30"> 
		<input type="text" name="MobilePhone" size="20">
		</TD>
	</TR>
	<TR>
		<TD CLASS="cell">Ministry</TD>
		<TD height="30"> 
    	<input type="text" name="Ministry" size="40">
		</TD>
	</TR>
	
	<TR>
		<TD CLASS="cell">Department</TD>
		<TD height="30"> 
    	<input type="text" name="Department" size="40">
		</TD>
	</TR>
	
	<TR>
		<TD CLASS="cell">Sub-ministry</TD>
		<TD>
			<SELECT NAME="SubMinistry">
				<OPTION VALUE="" SELECTED>Select your sub-ministry</OPTION>
				<OPTION VALUE="NE">Northeast</OPTION>
				<OPTION VALUE="MA">Mid-Atlantic</OPTION>
				<OPTION VALUE="MS">Mid South</OPTION>
				<OPTION VALUE="SE">Southeast</OPTION>
				<OPTION VALUE="GL">Great Lakes</OPTION>
				<OPTION VALUE="MW">Upper Midwest</OPTION>
				<OPTION VALUE="GP">Great Plains Int'l</OPTION>
				<OPTION VALUE="RR">Red River</OPTION>
				<OPTION VALUE="NW">Greater Northwest</OPTION>
				<OPTION VALUE="SW">Pacific Southwest</OPTION>
				<OPTION VALUE="NC">National Campus Office</OPTION>
				<OPTION VALUE="BR">Bridges</OPTION>
			</SELECT>
		</TD>
	</TR>
	

	<TR>
		<TD CLASS="cell">Position</TD>
		
		<TD>
			<SELECT NAME="Position">
				<OPTION VALUE="" SELECTED>Select your position</OPTION>
				<OPTION VALUE="ND">National Director</OPTION>
				<OPTION VALUE="NETM">National Executive Team Member</OPTION>
				<OPTION VALUE="RD">Regional Director</OPTION>
				<OPTION VALUE="LL">Local/Team Leader</OPTION>
				<OPTION VALUE="SS">Senior Staff</OPTION>
				<OPTION VALUE="NS">New Staff</OPTION>
				<OPTION VALUE="NSIM">New Staff - Initial MPD</OPTION>
				<OPTION VALUE="CMI">US Intern</OPTION>
				<OPTION VALUE="WSN">WSN STINTer</OPTION>
				<OPTION VALUE="ICS">International Campus Staff (ICS)</OPTION>
				<OPTION VALUE="Other">Other</OPTION>
			</SELECT>
		</TD>
	</TR>
	
	<TR>
		<TD CLASS="cell">If "Other", please describe</TD>
		<TD height="30"> 
		<input type="text" name="OtherPosition" size="40">
		</TD>
	</TR>

	<TR>
		<TD CLASS="cell">Strategy</TD>
		<TD height="30"> 
		<SELECT NAME="Strategy">
			<OPTION VALUE="" SELECTED>Select your strategy</OPTION>
			<OPTION VALUE="SC">Staff Campus</OPTION>
			<OPTION VALUE="Catalytic">Catalytic</OPTION>
			<OPTION VALUE="WSN">WSN</OPTION>
			<OPTION VALUE="ESM">ESM</OPTION>
			<OPTION VALUE="HR">HR</OPTION>
			<OPTION VALUE="Ops">Operations</OPTION>
			<OPTION VALUE="FD">Fund Development</OPTION>
			<OPTION VALUE="BR">Bridges</OPTION>
		</SELECT>
		</TD>
	</TR>
	
	<!--
	<TR>
		<TD CLASS="cell">International Status?</TD>
		<TD height="30"> 
		<SELECT NAME="International">
		<OPTION SELECTED></OPTION>
		<OPTION VALUE="True">Yes</OPTION>
		<OPTION VALUE="False">No</OPTION>
		</SELECT>
		</TD>
	</TR>
	
	<TR>
		<TD CLASS="cell">If yes, STINT or ICS?</TD>
		<TD height="30"> 
			<SELECT NAME="IntRole">
			<OPTION SELECTED></OPTION>
			<OPTION VALUE="STINT">STINT</OPTION>
			<OPTION VALUE="ICS">ICS</OPTION>
			</SELECT>
		</TD>
	</TR>
	-->
	
	<TR>
		<TD CLASS="cell">Role</TD>
		<TD height="30"> 
    	<input type="text" name="Role" size="40">
		</TD>
	</TR>
	
	<TR>
		<TD CLASS="cell">Account #</TD>
		<TD height="30"> 
    	<input type="text" name="AccountNo" size="9" value="<%=accountNo.equals("")?"":accountNo%>">
		</TD>
	</TR>
	
	<TR>
		<TD CLASS="cell">Married?</TD>
		<TD height="30"> 
		<SELECT NAME="Married">
			<OPTION VALUE="F" SELECTED>No</OPTION>
			<OPTION VALUE="T">Yes</OPTION>
			
		</SELECT>
		</TD>
	</TR>

	<TR>
		<TD CLASS="cell">If Yes, Spouse's First Name</TD>
		<TD height="30"> 
    	<input type="text" name="SpouseFirstName" size="40">
		</TD>
	</TR>
	<TR>
	<TD CLASS="cell">Spouse's Middle Name</TD>
	<TD height="30"> 
	<input type="text" name="SpouseMiddleName" size="40">
	</TD>
</TR>
<TR>
<TD CLASS="cell">Spouse's Last Name</TD>
<TD height="30"> 
<input type="text" name="SpouseLastName" size="40">
</TD>
</TR>
	<TR>
		<TD CLASS="cell">Number of Children</TD>
		<TD height="30"> 
		<SELECT NAME="NumChildren" class=required>
		<OPTION VALUE="0" SELECTED>0</OPTION>
		<OPTION VALUE="1">1</OPTION>
		<OPTION VALUE="2">2</OPTION>
		<OPTION VALUE="3">3</OPTION>
		<OPTION VALUE="4">4</OPTION>
		<OPTION VALUE="5">5</OPTION>
		<OPTION VALUE="6">6</OPTION>
		<OPTION VALUE="7">7</OPTION>
		<OPTION VALUE="8">8</OPTION>
		<OPTION VALUE="9">9</OPTION>
		<OPTION VALUE="10">10</OPTION>
	</SELECT>
		</TD>
	</TR>
	
	<TR>
	<TD COLSPAN="2">&nbsp;</TD>
	</TR>
	
	<TR>
		<TD></TD>
		<TD>
			<A HREF="javascript:submit2(document.captureForm)" onMouseOver="document.submitbutton.src='/images/submit_bon.gif';" onMouseOut="document.submitbutton.src='/images/submit_boff.gif';"><IMG NAME="submitbutton" SRC="/images/submit_boff.gif" BORDER="0" ALIGN="TOP"></A>
		</TD>
	</TR>

</TABLE>
</FORM>
</TD></TR>
<TR height="15%"><TD colspan=2>&nbsp;</TD></TR>
<TR><TD colspan=2>
<%=hr%>
</TD></TR>
</TR>
</TABLE>
 	<!-- Begin Google Analytics code -->
	<script src="/urchin.js" type="text/javascript">
	</script>
	<script type="text/javascript">
	_uacct = "UA-79392-3";
	urchinTracker();
	</script>
	<!-- End Google Analytics code -->
</BODY>
</HTML>