package org.alt60m.html;

public class SelectOpp implements java.io.Serializable {

    private final String[] _regAbbrev = {" ", "OLB", "NCO", "HLD", "LOA", "LVS", "REG"};
	private final String[] _regExpand = {" ", "On Location Baby", "National Campus Office", "On Hold", "Leave of Absence", "Leaving Staff", "Other Regional Summer Project"};
	private final String[] _edAbbrev = {" ", "SOLTO", "SOLTS", "SOLLA", "EDOTH" };
	private final String[] _edExpand = {" ","Theological-Biblical Track: Orlando", "Theological-Biblical Track: San Clemente", "Leadership Adventure", "Other Theological Studies"};
    private final String[] _usAbbrev = {" ", "DAY", "HAM","MYR","NMB","OC1","OZK","PAN","VIR","WLD","YLS","LKT","NEW","SAN","SCZ","ORL","SEA","HID"};
	private final String[] _usExpand = {" ","Daytona Beach, FL (May 21 - June 30)","Hampton Beach, NH (May 19 - July 5)","Myrtle Beach, SC (May 22 - July 8)","North Myrtle Beach, SC (May 22 - July 8)","Ocean City, NJ (May 15 - July 12)","Ozark Lakes, MO (May 13 - July 5)","Panama City Beach, FL (May 19 - July 6)","Virginia Beach, VA (May 17 - July 8)","Wildwood, NJ (May 21 - July 10)","Yellowstone, WY (May 21 - June 29)","Lake Tahoe, CA (June 1 - July 12)","Newport Beach, CA (June 1 - July 13)","San Diego, CA (May 25 - July 6)","Santa Cruz, CA (May 25 - July 6)","Orlando, FL (Lake Hart) (May 29 - July 13)","Seattle, WA (ISR; June 5 - July 18","Ohio (Hidden People's; June 3 - July 10)"};
    private final String[] _wsnAbbrev = {" ","UMW-4TH","GL-ABB","GL-ACT","MS-ARG","RR-ARG","PSW-AUM","PSW-AUS","MA-BOG","UMW-BRA","GP-CHI","PSW-DES","WSN-ETH","GL-FRA","WSN-FRA","UMW-FRA","RR-GER","GL-GER","RR-ITA","SE-ITA","GL-ITA","UMW-JAK","UMW-JAO","PSW-JAP","RR-JOR","PSW-KAS","MA-KAZ","GP-KAZ","PSW-KAZ","GL-MAC","GL-MEX","PSW-MEX","RR-MEX","GP-MEX","MS-NIG","WSN-OEX","SE-OEX","PSW-OEX","GNW-OEX","MS-OPE","GP-RUS","MS-RUP","RR-RUS","MS-RUS","GNW-RUS","SE-SAR","MS-SLO","GNW-SLO","GP-SPB","RR-SPA","GP-SPM","GP-SPS","RR-THA","GP-UKR","PSW-UNI","RR-VAI","MA-VEN", "WSN-IMP"};
	private final String[] _wsnExpand = {" ","UMW-4th Journey","GL-Abba","GL-Acts 29","MS-Argentina: La Plata","RR-Argentina: Mendoza","PSW-Australia: Melbourne","PSW-Australia: Sydney","MA-Bogart","UMW-Brazil: Fortaleza","GP-Chile","PSW-Desert Rivers","WSN-Ethiopia","GL-France: Nice","WSN-France: Paris","UMW-France: Toulouse","RR-Germany: Berlin","GL-Germany: Freiburg","RR-Italy: Florence","SE-Italy: Pisa","GL-Italy: Rome","UMW-Japan: Kobe","UMW-Japan: Osaka","PSW-Japan","RR-Jordan: Amman","PSW-Kasbah","MA-Kazakhstan: Almaty","GP-Kazakhstan: Astana","PSW-Kazakhstan: Shymkent","GL-Macedonia","GL-Mexico: Guadalajara","PSW-Mexico: Mexico City","RR-Mexico: Monterrey","GP-Mexico: Puebla","MS-Nigeria (ESM)","OEX A","SE-OEX B","PSW-OEX B","GNW-OEX C","MS-Open Spaces","GP-Russia: Kyzyl","MS-Russia: Perm","RR-Russia: Samara","MS-Russia: Saratov","GNW-Russia: Ulan Ude","SE-Sarajevo","MS-Slovakia","GNW-Slovenia","GP-Spain: Barcelona","RR-Spain: Granada","GP-Spain: Malaga","GP-Spain: Sevilla","RR-Thailand: Bangkok","GP-Ukraine: Odessa","PSW-United Kingdom","RR-Vail","MA-Venezuela", "Impact: Operation Sunrise"};
	String current;
    String name;
	String type;

    public SelectOpp() {}


    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		current = new String(aValue);
    }

	public void setType(String aType) { type = aType; }

    public String print() {
	StringBuffer sb = new StringBuffer();
	int i;
	
	sb.append("<select name=\"" + name + "\">");
	
	if(type.equals("regPref")) {

		for (i = 0; i < _regAbbrev.length; ++i) {
			if (_regAbbrev[i].equals(current)) {
				sb.append("<option value=\"" + _regAbbrev[i] + "\" selected>" + _regExpand[i] + "</option>");
			} else {
				sb.append("<option value=\"" + _regAbbrev[i] + "\">" + _regExpand[i] + "</option>");
		    }
		}
	}

	if(type.equals("edPref")) {

		for (i = 0; i < _edAbbrev.length; ++i) {
			if (_edAbbrev[i].equals(current)) {
				sb.append("<option value=\"" + _edAbbrev[i] + "\" selected>" + _edExpand[i] + "</option>");
			} else {
				sb.append("<option value=\"" + _edAbbrev[i] + "\">" + _edExpand[i] + "</option>");
		    }
		}
	}
	
	if(type.equals("wsnPref")) {

		for (i = 0; i < _wsnAbbrev.length; ++i) {
			if (_wsnAbbrev[i].equals(current)) {
				sb.append("<option value=\"" + _wsnAbbrev[i] + "\" selected>" + _wsnExpand[i] + "</option>");
			} else {
				sb.append("<option value=\"" + _wsnAbbrev[i] + "\">" + _wsnExpand[i] + "</option>");
		    }
		}
	}

	if(type.equals("usPref")) {

		for (i = 0; i < _usAbbrev.length; ++i) {
			if (_usAbbrev[i].equals(current)) {
				sb.append("<option value=\"" + _usAbbrev[i] + "\" selected>" + _usExpand[i] + "</option>");
			} else {
				sb.append("<option value=\"" + _usAbbrev[i] + "\">" + _usExpand[i] + "</option>");
		    }
		}
	}

	sb.append("</select>");
	return sb.toString();
    }

	public String display() {
	StringBuffer sb = new StringBuffer();
	int i;

	if(type.equals("regPref")) {
		for (i = 0; i < _regAbbrev.length; ++i) {
			if (_regAbbrev[i].equals(current)) {
				sb.append(_regExpand[i]);
		    }
		}
	}
	if(type.equals("edPref")) {
		for (i = 0; i < _edAbbrev.length; ++i) {
			if (_edAbbrev[i].equals(current)) {
				sb.append(_edExpand[i]);
		    }
		}
	}
	if(type.equals("wsnPref")) {
		for (i = 0; i < _wsnAbbrev.length; ++i) {
			if (_wsnAbbrev[i].equals(current)) {
				sb.append(_wsnExpand[i]);
		    }
		}
	}
	if(type.equals("usPref")) {
		for (i = 0; i < _usAbbrev.length; ++i) {
			if (_usAbbrev[i].equals(current)) {
				sb.append(_usExpand[i]);
		    }
		}
	}

	return sb.toString();
    }
}
