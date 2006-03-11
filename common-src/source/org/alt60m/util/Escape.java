package org.alt60m.util;

import java.util.*;

public class Escape {

	public static final String textToXML(String s){
	   StringBuffer sb = new StringBuffer();
	   int n = s.length();
	   for (int i = 0; i < n; i++) {
		  char c = s.charAt(i);
		  switch (c) {
			case 60: sb.append("&lt;"); break; // '<'
			case 62: sb.append("&gt;"); break; // '>'
			case 38: sb.append("&amp;"); break; // '&'
			case 34: sb.append("&quot;"); break; // '"'
			case 224: sb.append("&agrave;");break; // 'à'
			case 192: sb.append("&Agrave;");break; // 'À'
			case 226: sb.append("&acirc;");break; // 'â'
			case 194: sb.append("&Acirc;");break; // 'Â'
			case 228: sb.append("&auml;");break; // 'ä'
			case 196: sb.append("&Auml;");break; // 'Ä'
			case 229: sb.append("&aring;");break; // 'å'
			case 197: sb.append("&Aring;");break; // 'Å'
			case 230: sb.append("&aelig;");break; // 'æ'
			case 198: sb.append("&AElig;");break; // 'Æ'
			case 231: sb.append("&ccedil;");break; // 'ç'
			case 199: sb.append("&Ccedil;");break; // 'Ç'
			case 233: sb.append("&eacute;");break; // 'é'
			case 201: sb.append("&Eacute;");break; // 'É'
			case 232: sb.append("&egrave;");break; // 'è'
			case 200: sb.append("&Egrave;");break; // 'È'
			case 234: sb.append("&ecirc;");break; // 'ê'
			case 202: sb.append("&Ecirc;");break; // 'Ê'
			case 235: sb.append("&euml;");break; // 'ë'
			case 203: sb.append("&Euml;");break; // 'Ë'
			case 239: sb.append("&iuml;");break; // 'ï'
			case 207: sb.append("&Iuml;");break; // 'Ï'
			case 237: sb.append("&iacute;");break; // 'í'
			case 205: sb.append("&Iacute;");break; // 'Í'
			case 243: sb.append("&oacute;");break; // 'í'
			case 211: sb.append("&Oacute;");break; // 'Í'
			case 244: sb.append("&ocirc;");break; // 'ô'
			case 212: sb.append("&Ocirc;");break; // 'Ô'
			case 246: sb.append("&ouml;");break; // 'ö'
			case 214: sb.append("&Ouml;");break; // 'Ö'
			case 248: sb.append("&oslash;");break; // 'ø'
			case 216: sb.append("&Oslash;");break; // 'Ø'
			case 223: sb.append("&szlig;");break; // 'ß'
			case 249: sb.append("&ugrave;");break; // 'ù'
			case 217: sb.append("&Ugrave;");break;          // 'Ù'
			case 251: sb.append("&ucirc;");break;          // 'û'
			case 219: sb.append("&Ucirc;");break; // 'Û'
			case 252: sb.append("&uuml;");break; // 'ü'
			case 220: sb.append("&Uuml;");break; // 'Ü'
			case 174: sb.append("&reg;");break;          // '®'
			case 169: sb.append("&copy;");break;    // '©'
			case 193: sb.append("&#193;"); break; // 'Á'
			case 225: sb.append("&#225;"); break; // 'á'
			case 209: sb.append("&#209;"); break; // 'Ñ'
			case 241: sb.append("&#241;"); break; // 'ñ'

			 default:  sb.append(c); break;
		  }
	   }
	   return sb.toString();
	}
}
