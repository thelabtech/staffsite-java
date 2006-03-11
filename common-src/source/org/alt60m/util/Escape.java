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
			case 224: sb.append("&agrave;");break; // '�'
			case 192: sb.append("&Agrave;");break; // '�'
			case 226: sb.append("&acirc;");break; // '�'
			case 194: sb.append("&Acirc;");break; // '�'
			case 228: sb.append("&auml;");break; // '�'
			case 196: sb.append("&Auml;");break; // '�'
			case 229: sb.append("&aring;");break; // '�'
			case 197: sb.append("&Aring;");break; // '�'
			case 230: sb.append("&aelig;");break; // '�'
			case 198: sb.append("&AElig;");break; // '�'
			case 231: sb.append("&ccedil;");break; // '�'
			case 199: sb.append("&Ccedil;");break; // '�'
			case 233: sb.append("&eacute;");break; // '�'
			case 201: sb.append("&Eacute;");break; // '�'
			case 232: sb.append("&egrave;");break; // '�'
			case 200: sb.append("&Egrave;");break; // '�'
			case 234: sb.append("&ecirc;");break; // '�'
			case 202: sb.append("&Ecirc;");break; // '�'
			case 235: sb.append("&euml;");break; // '�'
			case 203: sb.append("&Euml;");break; // '�'
			case 239: sb.append("&iuml;");break; // '�'
			case 207: sb.append("&Iuml;");break; // '�'
			case 237: sb.append("&iacute;");break; // '�'
			case 205: sb.append("&Iacute;");break; // '�'
			case 243: sb.append("&oacute;");break; // '�'
			case 211: sb.append("&Oacute;");break; // '�'
			case 244: sb.append("&ocirc;");break; // '�'
			case 212: sb.append("&Ocirc;");break; // '�'
			case 246: sb.append("&ouml;");break; // '�'
			case 214: sb.append("&Ouml;");break; // '�'
			case 248: sb.append("&oslash;");break; // '�'
			case 216: sb.append("&Oslash;");break; // '�'
			case 223: sb.append("&szlig;");break; // '�'
			case 249: sb.append("&ugrave;");break; // '�'
			case 217: sb.append("&Ugrave;");break;          // '�'
			case 251: sb.append("&ucirc;");break;          // '�'
			case 219: sb.append("&Ucirc;");break; // '�'
			case 252: sb.append("&uuml;");break; // '�'
			case 220: sb.append("&Uuml;");break; // '�'
			case 174: sb.append("&reg;");break;          // '�'
			case 169: sb.append("&copy;");break;    // '�'
			case 193: sb.append("&#193;"); break; // '�'
			case 225: sb.append("&#225;"); break; // '�'
			case 209: sb.append("&#209;"); break; // '�'
			case 241: sb.append("&#241;"); break; // '�'

			 default:  sb.append(c); break;
		  }
	   }
	   return sb.toString();
	}
}
