package org.alt60m.html;

public class SelectLanguage implements java.io.Serializable {

	/*
	Hashtable lang = new Hashtable();
	lang.put("ABKHAZIAN","AB");
	lang.put("AFAN (OROMO)","OM");
	lang.put("AFAR","AA");
	lang.put("AFRIKAANS","AF");
	lang.put("ALBANIAN","SQ");
	lang.put("AMHARIC","AM");
	lang.put("ARABIC","AR");
	lang.put("ARMENIAN","HY");
	lang.put("ASSAMESE","AS");
	lang.put("AYMARA","AY");
	lang.put("AZERBAIJANI","AZ");
	lang.put("BASHKIR","BA");
	lang.put("BASQUE","EU");
	lang.put("BENGALI;BANGLA","BN");
	lang.put("BHUTANI","DZ");
	lang.put("BIHARI","BH");
	lang.put("BISLAMA","BI");
	lang.put("BRETON","BR");
	lang.put("BULGARIAN","BG");
	lang.put("BURMESE","MY");
	lang.put("BYELORUSSIAN","BE");
	lang.put("CAMBODIAN","KM");
	lang.put("CATALAN","CA");
	lang.put("CHINESE","ZH");
	lang.put("CORSICAN","CO");
	lang.put("CROATIAN","HR");
	lang.put("CZECH","CS");
	lang.put("DANISH","DA");
	lang.put("DUTCH","NL");
	lang.put("ENGLISH","EN");
	lang.put("ESPERANTO","EO");
	lang.put("ESTONIAN","ET");
	lang.put("FAROESE","FO");
	lang.put("FIJI","FJ");
	lang.put("FINNISH","FI");
	lang.put("FRENCH","FR");
	lang.put("FRISIAN","FY");
	lang.put("GALICIAN","GL");
	lang.put("GEORGIAN","KA");
	lang.put("GERMAN","DE");
	lang.put("GREEK","EL");
	lang.put("GREENLANDIC","KL");
	lang.put("GUARANI","GN");
	lang.put("GUJARATI","GU");
	lang.put("HAUSA","HA");
	lang.put("HEBREW","HE");
	lang.put("HINDI","HI");
	lang.put("HUNGARIAN","HU");
	lang.put("ICELANDIC","IS");
	lang.put("INDONESIAN","ID");
	lang.put("INTERLINGUA","IA");
	lang.put("INTERLINGUE","IE");
	lang.put("INUKTITUT","IU");
	lang.put("INUPIAK","IK");
	lang.put("IRISH","GA");
	lang.put("ITALIAN","IT");
	lang.put("JAPANESE","JA");
	lang.put("JAVANESE","JV");
	lang.put("KANNADA","KN");
	lang.put("KASHMIRI","KS");
	lang.put("KAZAKH","KK");
	lang.put("KINYARWANDA","RW");
	lang.put("KIRGHIZ","KY");
	lang.put("KOREAN","KO");
	lang.put("KURDISH","KU");
	lang.put("KURUNDI","RN");
	lang.put("LAOTHIAN","LO");
	lang.put("LATIN","LA");
	lang.put("LATVIAN;LETTISH","LV");
	lang.put("LINGALA","LN");
	lang.put("LITHUANIAN","LT");
	lang.put("MACEDONIAN","MK");
	lang.put("MALAGASY","MG");
	lang.put("MALAY","MS");
	lang.put("MALAYALAM","ML");
	lang.put("MALTESE","MT");
	lang.put("MAORI","MI");
	lang.put("MARATHI","MR");
	lang.put("MOLDAVIAN","MO");
	lang.put("MONGOLIAN","MN");
	lang.put("NAURU","NA");
	lang.put("NEPALI","NE");
	lang.put("NORWEGIAN","NO");
	lang.put("OCCITAN","OC");
	lang.put("ORIYA","OR");
	lang.put("PASHTO;PUSHTO","PS");
	lang.put("PERSIAN (farsi)","FA");
	lang.put("POLISH","PL");
	lang.put("PORTUGUESE","PT");
	lang.put("PUNJABI","PA");
	lang.put("QUECHUA","QU");
	lang.put("RHAETO-ROMANCE","RM");
	lang.put("ROMANIAN","RO");
	lang.put("RUSSIAN","RU");
	lang.put("SAMOAN","SM");
	lang.put("SANGHO","SG");
	lang.put("SANSKRIT","SA");
	lang.put("SCOTS GAELIC","GD");
	lang.put("SERBIAN","SR");
	lang.put("SERBO-CROATIAN","SH");
	lang.put("SESOTHO","ST");
	lang.put("SETSWANA","TN");
	lang.put("SHONA","SN");
	lang.put("SINDHI","SD");
	lang.put("SINGHALESE","SI");
	lang.put("SISWATI","SS");
	lang.put("SLOVAK","SK");
	lang.put("SLOVENIAN","SL");
	lang.put("SOMALI","SO");
	lang.put("SPANISH","ES");
	lang.put("SUNDANESE","SU");
	lang.put("SWAHILI","SW");
	lang.put("SWEDISH","SV");
	lang.put("TAGALOG","TL");
	lang.put("TAJIK","TG");
	lang.put("TAMIL","TA");
	lang.put("TATAR","TT");
	lang.put("TELUGU","TE");
	lang.put("THAI","TH");
	lang.put("TIBETAN","BO");
	lang.put("TIGRINYA","TI");
	lang.put("TONGA","TO");
	lang.put("TSONGA","TS");
	lang.put("TURKISH","TR");
	lang.put("TURKMEN","TK");
	lang.put("TWI","TW");
	lang.put("UIGUR","UG");
	lang.put("UKRAINIAN","UK");
	lang.put("URDU","UR");
	lang.put("UZBEK","UZ");
	lang.put("VIETNAMESE","VI");
	lang.put("VOLAPUK","VO");
	lang.put("WELSH","CY");
	lang.put("WOLOF","WO");
	lang.put("XHOSA","XH");
	lang.put("YIDDISH","YI");
	lang.put("YORUBA","YO");
	lang.put("ZHUANG","ZA");
	lang.put("ZULU","ZU");
	*/

    String[] languageValues = {"EN","ES","FR","DE","IT","XX"};
	String[] languageNames = {"English","Spanish","French","German","Italian","Other"};
	String currentValue = "English";
    String name = "languageSelect";

    public SelectLanguage() {}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentValue = new String(aValue);
    }


    public String print() {
		StringBuffer sb = new StringBuffer();
		int i;

		sb.append("<select name=\"" + name + "\">");

		for (i = 0; i<languageValues.length; ++i) {
			if (languageValues[i].equals(currentValue)) {
				sb.append("<option value=\"" + languageValues[i] + "\" selected>" + languageNames[i] + "</option>");
			} else {
				sb.append("<option value=\"" + languageValues[i] + "\">" + languageNames[i] + "</option>");
			}
		}
		sb.append("</select>");
		return sb.toString();
    }

	public String display() {
		StringBuffer sb = new StringBuffer();
		int i;

		for (i = 0; i < 12; ++i) {
			if (languageValues[i].equals(currentValue)) {
				sb.append(languageNames[i]);
			}
		}
		return sb.toString();
    }
}
