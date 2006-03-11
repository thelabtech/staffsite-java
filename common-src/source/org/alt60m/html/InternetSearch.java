package org.alt60m.html;

import java.util.*;

public class InternetSearch implements java.io.Serializable {

	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";

    public InternetSearch() {}

	public void setBodyFont(String aValue) { bodyFont = aValue; }

	public String print() {
			String stringBuffer = "<!--  --------------------INTERNET SEARCH MODULE ------------------- --> ";

			stringBuffer = stringBuffer + "			<table width='100%'><tr><td align='center'><FORM name='searchForm' target='_blank' ACTION='http://www.google.com/search'>" + bodyFont;
			stringBuffer = stringBuffer + "				<INPUT TYPE='hidden' NAME='bfpage' VALUE='safesearch'>";
			stringBuffer = stringBuffer + "				<INPUT TYPE=hidden name=safe value=on>";
			stringBuffer = stringBuffer + "				<INPUT TYPE=text size=15 maxlength=255 ALIGN='CENTER' NAME=q><br>";
			stringBuffer = stringBuffer + "				<input type=image src='/images/search_boff.gif' border='0'>";
			stringBuffer = stringBuffer + "			</td></form></tr></table>";

		return stringBuffer;
	}

}
