/* NEED TO REFACTOR THIS TO USE THE NEW StaffLookup SESSION BEAN */

package org.alt60m.html;

import java.util.*;

public class InfoBaseLookup implements java.io.Serializable {

	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";
	String searchType = "lastname";
	String searchTitle = "Last Name:";

    public InfoBaseLookup() {}

	public void setBodyFont(String aValue) { bodyFont = aValue; }
	public void setSearchType(String aValue) { searchType = aValue; }
	public void setSearchTitle(String aValue) { searchTitle = aValue; }

	public String print() {
			String stringBuffer = "<!--  --------------------InfoBaseLookup SEARCH MODULE ------------------- --> ";

			stringBuffer = stringBuffer + "			<table width='100%'><tr><td align='center'><form method='post' action='/sc'><input type=hidden name='page' value='/ib/list_staff.jsp'>" + bodyFont;
			stringBuffer = stringBuffer + "				" + searchTitle + ":<br>";
			stringBuffer = stringBuffer + "				<input type=hidden name=\"searchby\" value=\"" + searchType + "\">\n<input type=hidden name=\"action\" value=\"view\">\n<input type=\"text\" name=\"searchstring\" size=\"12\">";
			stringBuffer = stringBuffer + "				<input type=\"image\" alt=\"Search\" border='0' src='/images/search_bon.gif'>";
			stringBuffer = stringBuffer + "			</td></tr></form></table>";

		return stringBuffer;
	}

}
