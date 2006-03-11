package org.alt60m.html;

import java.util.*;

public class BibleSearch implements java.io.Serializable {

	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";

    public BibleSearch() {}

	public void setBodyFont(String aValue) { bodyFont = aValue; }

	public String print() {
			String stringBuffer = "<!--  --------------------BIBLE SEARCH MODULE ------------------- --> ";

			stringBuffer = stringBuffer + "			<table width='100%'><tr><td align='center'><FORM name='bibleForm' Target='_blank' ACTION='http://bible.gospelcom.net/cgi-bin/bible'>" + bodyFont;
			stringBuffer = stringBuffer + "				<INPUT TYPE='hidden' NAME='version' VALUE='NASB' >";
			stringBuffer = stringBuffer + "				Passage:<br><input SIZE='15' NAME='passage'><br>";
			stringBuffer = stringBuffer + "				<INPUT TYPE=hidden name=maxmatches value=10>";
			stringBuffer = stringBuffer + "				Search word(s):<br><input SIZE='15' NAME='search'><br>";
			stringBuffer = stringBuffer + "				<input type=image src='/images/lookup_boff.gif' border='0'>";
			stringBuffer = stringBuffer + "			</td></form></tr></table>";

		return stringBuffer;
	}

}
