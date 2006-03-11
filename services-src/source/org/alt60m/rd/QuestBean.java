/* ---------   Greg's Sloppy Quest Bean   ---------- */
/*                created 11/30/00                   */
/* ---------   Mike's Even Sloppier Quest Bean   ---------- */
/*                created 6/18/02                   */

package org.alt60m.rd;

import java.util.*;
import java.sql.*;

public class QuestBean implements java.io.Serializable {

    String tableName;
    String queryString;
    String user;
    String pwd;
    String url;
	Connection con;
	Statement stmt;

	public QuestBean() {}

    public void setUser(String aUser) { user = aUser; }

	public String printAdminBanner(String pageTitle, String pageName) {
		return "<HTML>\r<HEAD>\r<TITLE>" + pageTitle + "</TITLE>\r</HEAD>\r<BODY BGCOLOR='#FFFFFF'>\r<table cellpadding='0' cellspacing='0' border='0' width='100%'>\r<tr valign='bottom' bgcolor='#ddddee'>\r<td>\r<font size='3' face='arial'><b>Research and Development<p>\r	</td>\r	<td align='right'>\r	<font size='2' face='arial'><b>Quest Tablespace admin tool (beta v0.75)<p></font>\r	</td>\r</tr>\r<tr align='center' valign='bottom' bgcolor='#ddddee'><td>	<font size='2' face='arial'><b><i>" + pageTitle + "</td><td align='right'><a href='" + pageName + "'><img src='images/refresh.gif' alt='refresh' border='0'></a> <a href='./admin.jsp'><img src='images/home.gif' alt='home' border='0'></a></td></tr></table><!-- ---------------endofheader-------------- -->";
	}

	public String printNormalBanner(String pageTitle) {
		return "<html><head><title>" + pageTitle + "</title></head>\r<body><table cellpadding='0' cellspacing='0' border='0' width='100%'> <tr valign='bottom' bgcolor='#ddddee'>	<td align='right'><font face='arial' size='1'><b> " + pageTitle + " </td></tr></table> \r <a href='entrance.jsp'><img src='./images/questlogo.gif' border='0'></a><font face='arial'><p><font size='2'><center>";
	}

	//	returns the ID in tableName where we have entered '-Not Answered'
	//	else we return 1 in the hopes that it was the first entry
	public String getNA(String tableName) {
		if (tableName.equalsIgnoreCase("q2_relBackground")){	return "1";	}
		else
		if (tableName.equalsIgnoreCase("q2_relIdentity")){	return "1";	}
		else
		if (tableName.equalsIgnoreCase("q2_relexpword")){	return "41";	}
		else
		if (tableName.equalsIgnoreCase("q2_whoIsGod")){		return "1";	}
		else
		if (tableName.equalsIgnoreCase("q2_expGodHow")){	return "42";	}
		else	
		if (tableName.equalsIgnoreCase("q1_AfterDeath")){	return "1";	}
		else
		if (tableName.equalsIgnoreCase("q1_DescribeLife")){	return "1";	}
		else
		if (tableName.equalsIgnoreCase("q1_howToX")){		return "1";	}
		else
		if (tableName.equalsIgnoreCase("q1_singleThing")){	return "1";	}
		else
		if (tableName.equalsIgnoreCase("q2_ageprofile")){	return "21";	}
		else
		if (tableName.equalsIgnoreCase("q_ethnicity")){		return "175";	}
		else return "1";
	}

	public String stripNA (String inputString){
		int tempInt1	= inputString.indexOf(">-N");
		int tempInt2	= inputString.indexOf("</option>",tempInt1);
		String subStr1	= inputString.substring(0,tempInt1+1);
		String subStr2	= inputString.substring(tempInt2);
		String outString = "-";
		inputString = subStr1.concat("-");
		return inputString.concat(subStr2);
	}

	public String printPercentage (int numerator, int denominator){
		return "" + ((numerator*100)/denominator) + "";
	}


}
