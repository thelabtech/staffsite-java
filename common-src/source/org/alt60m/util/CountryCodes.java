package org.alt60m.util;

public class CountryCodes
{

	public static final String[] countryList = new String[]  {
		"United States","USA","Canada","CAN","Albania","ALB","American Samoa","ASM","Andorra","AND","Anguilla","AIA",
			"Antigua and Barbuda","ATG","Argentina","ARG","Armenia","ARM","Aruba","ABW","Australia","AUS","Austria","AUT",
			"Bahamas","BHS","Bahrain","BHR","Bangladesh","BGD","Barbados","BRB","Belarus","BLR","Belgium","BEL","Belize","BLZ",
			"Benin","BEN","Bermuda","BMU","Bhutan","BTN","Bolivia","BOL","Bosnia and Herzegovina","BIH","Botswana","BWA",
			"Bouvet Island","BVT","Brazil","BRA","British Indian Ocean Territory","IOT","Brunei Darussalam","BRN",
			"Bulgaria","BGR","Burkina Faso","BFA","Burundi","BDI","BZA","BZA","BZH","BZH","Cameroon","CMR","Cape Verde","CPV",
			"Cayman Islands","CYM","Central African Republic","CAF","Chad","TCD","Chile","CHL","Christmas Island","CXR",
			"Cocos (Keeling) Islands","CCK","Colombia","COL","Comoros","COM","Congo, Democratic Republic of","DRC",
			"Congo, Republic of","COG","Cook Islands","COK","Costa Rica","CRI","Cote D'Ivoire (Ivory Coast)","CIV",
			"Croatia (Hrvatska)","HRV","Cyprus","CYP","Czech Republic","CZE","Denmark","DNK","Dominica","DMA",
			"Dominican Republic","DOM","DZA","DZA","DZB","DZB","DZC","DZC","East Timor","TMP","Eastern Europe","XEE",
			"Ecuador","ECU","Egypt","EGY","El Salvador","SLV","Equatorial Guinea","GNQ","Eritrea","ERI","Estonia","EST",
			"Ethiopia","ETH","Falkland Islands (Malvinas)","FLK","Faroe Islands","FRO","Fiji","FJI","Finland","FIN",
			"France","FRA","French Guiana","GUF","French Polynesia","PYF","French Southern Territories","ATF","Gabon","GAB",
			"Gambia","GMB","Georgia","GEO","Germany","DEU","Ghana","GHA","Gibraltar","GIB","Greece","GRC","Grenada","GRD",
			"Guadeloupe","GLP","Guam","GUM","Guatemala","GTM","Guinea","GIN","Guinea-Bissau","GNB","Guyana","GUY","Haiti","HTI",
			"Heard and McDonald Islands","HMD","Honduras","HND","Hong Kong","HKG","Hungary","HUN","HZA","HZA","HZB","HZB","HZC","HZC",
			"HZD","HZD","HZE","HZE","HZG","HZG","HZH","HZH","HZI","HZI","HZJ","HZJ","HZK","HZK","HZR","HZR","HZS","HZS",
			"Lebanon","HZT","Iceland","ISL","India","IND","Indonesia","IDN","Ireland","IRL","Italy","ITA","Jamaica","JAM",
			"Japan","JPN","Jordan","JOR","Kazakhstan","KAZ","Kenya","KEN","Kiribati","KIR","Korea (South)","KOR","Kuwait","KWT",
			"Kyrgyzstan","KGZ","Latin America","XLA","Latvia","LVA","Lesotho","LSO","Liberia","LBR","Liechtenstein","LIE",
			"Lithuania","LTU","Luxembourg","LUX","Macau","MAC","Macedonia","MKD","Madagascar","MDG","Malawi","MWI",
			"Malaysia","MYS","Maldives","MDV","Mali","MLI","Malta","MLT","Marshall Islands","MHL","Martinique","MTQ",
			"Mauritania","MRT","Mauritius","MUS","Mayotte","MYT","Mexico","MEX","Micronesia","FSM","Moldova","MDA",
			"Monaco","MCO","Montserrat","MSR","Mozambique","MOZ","Myanmar","MMR","Namibia","NAM","NAME","XNM","Nauru","NRU",
			"Neptal","NPL","Netherlands","NLD","Netherlands Antilles","ANT","New Caledonia","NCL","New Zealand (Aotearoa)","NZL",
			"Nicaragua","NIC","Niger","NER","Nigeria","NGA","Niue","NIU","Norfolk Island","NFK","Northern Mariana Islands","MNP",
			"Norway","NOR","Oman","OMN","Pakistan","PAK","Palau","PLW","Panama","PAN","Papua New Guinea","PNG","Paraguay","PRY",
			"Peru","PER","Philippines","PHL","Pitcairn","PCN","Poland","POL","Portugal","PRT","Puerto Rico","PRI",
			"Reunion","REU","Romania","ROM","Russian Federation","RUS","Rwanda","RWA","RZB","RZB",
			"S. Georgia and S. Sandwich Isls.","SGS","Saint Kitts and Nevis","KNA","Saint Lucia","LCA",
			"Saint Vincent and the Grenadines","VCT","Samoa","WSM","San Marino","SMR","Sao Tome and Principe","STP",
			"Senegal","SEN","Serbia and Montenegro","SRM","Seychelles","SYC","Sierra Leone","SLE","Singapore","SGP",
			"Slovakia","SVK","Slovenia","SVN","Solomon Islands","SLB","Somalia","SOM","South Africa","ZAF","South Asia","XSA",
			"Southeast Asia","XSE","Spain","ESP","Sri Lanka","LKA","St. Helena","SHN","St. Pierre and Miquelon","SPM",
			"Sudan","SUD","Suriname","SUR","Svalbard and Jan Mayen Islands","SJM","Swaziland","SWZ","Sweden","SWE",
			"Switzerland","CHE","Taiwan","TWN","Tajikistan","TJK","Tanzania","TZA","Thailand","THA","Togo","TGO",
			"Tokelau","TKL","Tonga","TON","Trinidad and Tobago","TTO","Turkmenistan","TKM",
			"Turks and Caicos Islands","TCA","Tuvalu","TUV","Uganda","UGA","Ukraine","UKR","United Arab Emirates","UAE",
			"United Kingdom","GBR","Uruguay","URY","Vanuatu","VUT","Vatican City State (Holy See)","VAT","Venezuela","VEN",
			"Virgin Islands (British)","VGR","Virgin Islands (U.S.)","VIR","VZA","VZA","VZB","VZB","VZC","VZC","VZD","VZD",
			"VZE","VZE","VZF","VZF","VZG","VZG","VZS","VZS","Wallis and Futuna Islands","WLF","Zambia","ZMB","Zimbabwe","ZWE"
	};

	public static String codeToName(String code) {

		for(int i=1; i < countryList.length; i += 2) {
			if(countryList[i].equalsIgnoreCase(code)) {
				return countryList[i-1];
			}
		}

		return null;
	}

	public static String nameToCode(String name) {

		for(int i=0; i < countryList.length; i += 2) {
			if(countryList[i].toLowerCase().startsWith(name.toLowerCase())) {
				return countryList[i+1];
			}
		}
		return null;

	}


	public static void main(String[] args) 
	{
		System.out.println(" ** Code to name ** ");
		System.out.println("(nominal) OMN=" + codeToName("OMN"));
		System.out.println("(erroneous) XYZ=" + codeToName("XYZ"));
		System.out.println("(lower bounds) USA="+ codeToName("USA"));
		System.out.println("(upper bounds) ZWE=" + codeToName("ZWE"));

		System.out.println("\n ** Name to code ** ");
		System.out.println("(nominal) Oman=" + nameToCode("Oman"));
		System.out.println("(erroneous) XYZ=" + nameToCode("XYZ"));
		System.out.println("(lower bounds) United states="+ nameToCode("United states"));
		System.out.println("(upper bounds) zim=" + nameToCode("zim"));

	}
}
