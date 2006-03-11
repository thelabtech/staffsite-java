package org.alt60m.html;
import java.util.*;
import java.lang.*;

//	SelectNumRadio outputs a list of Radio buttons numbered 0 through 10 (WOW!)
//	usage as follows:

//	<jsp:useBean id="numradio" class="org.alt60m.html.SelectNumRadio" />
//	in the body:
//	<%
//	numradio.setName("variable");
//	numradio.setCurrentNumberR(YourOwnW.getWhateverNumber());
//	%>
//	<%=numradio.print()%>

public class SelectNumRadio implements java.io.Serializable {

    int[] theNumbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
	int currentNumberR;
    String name;

    public SelectNumRadio() {}

    public void setName(String aName) { name = aName; }

    public void setCurrentNumberR(int aNumber) {
		currentNumberR = aNumber;
    }

    public void setCurrentNumberR(String aNumber) {
		currentNumberR = new Integer(aNumber).intValue();
    }

    public String print() {
	StringBuffer sb = new StringBuffer();
	int i;

	sb.append("<table><tr>");

	for (i = 0; i < 10; ++i) {
		if (theNumbers[i] == currentNumberR) {	
			sb.append("<td><input type=\"radio\" name=\"" + name + "\" value=\"" + theNumbers[i] + "\" checked></td>");
	    } else {
			sb.append("<td><input type=\"radio\" name=\"" + name + "\" value=\"" + theNumbers[i] + "\"></td>");
	    }
	}
	sb.append("</tr><tr><td align=\"center\"><font size=\"1\" face=\"Verdana\">1</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">2</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">3</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">4</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">5</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">6</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">7</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">8</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">9</td>" +
		"<td align=\"center\"><font size=\"1\" face=\"Verdana\">10</td>" +
		"</tr>" +
		"</table>");
	
	return sb.toString();
    }
}
