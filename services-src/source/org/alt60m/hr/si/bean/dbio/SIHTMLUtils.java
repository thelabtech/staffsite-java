package org.alt60m.hr.si.bean.dbio;

public class SIHTMLUtils implements java.io.Serializable {

	boolean optionFilledOut = true;
    boolean submitted = false;

	public SIHTMLUtils() {}

    public void setSubmitted(boolean value) {
        submitted = value;
    }

	public String printAttribNumbers() {
		StringBuffer sb = new StringBuffer();
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"15%\">&nbsp;</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"10%\">N/A</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"10%\">1</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"10%\">2</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"10%\">3</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"10%\">4</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"10%\">5</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"10%\">6</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\" width=\"10%\">7</td>");
		return sb.toString();
	}

	public String printAttribTitle(String titleToPrint) {
		StringBuffer sb = new StringBuffer();
		sb.append("<tr><td class=\"insideboxblue\" valign=\"bottom\" colspan=\"9\" nowrap><B>");
		sb.append(titleToPrint);
		sb.append("</td></tr>");
		return sb.toString();
	}
	
	public String printAttribDetail(int refNum, int optionChecked, boolean _optionFilledOut) {
		optionFilledOut = _optionFilledOut;
		return(printAttribDetail(refNum, optionChecked));
	}

	public String printAttribDetail(int refNum, int optionChecked) {
		StringBuffer sb = new StringBuffer();
		sb.append("<tr><td class=\"insideboxblue\" valign=\"bottom\" nowrap>");
		if (refNum == 1)
		{
			sb.append("STAFF 1");
		} else if (refNum == 2)
		{
			sb.append("STAFF 1");
		} else {
			sb.append("PEER");
		}
		sb.append("</td>");
		int pageNum = 0;
		for(int x = 0; x < 8; x++){
			if(x == optionChecked){
				sb.append("<td CLASS=\"insideboxbb\" ALIGN=\"center\" valign=\"bottom\">");
				if(optionFilledOut){
					sb.append("X");
				} else {
					sb.append("-");
				}
			} else {
				sb.append("<td CLASS=\"insideboxbb\">&nbsp;");
			}
			sb.append("</td>");
		}
		sb.append("</tr>");
		optionFilledOut = true;
		return sb.toString();
	}
	
	public String printAttribLabels3(String phrase1, String phrase2, String phrase3) {
		StringBuffer sb = new StringBuffer();
		sb.append("<TR><td CLASS=\"insideboxbb\" colspan=\"2\">&nbsp;</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"LEFT\" COLSPAN=\"7\">");
		sb.append("<table width=\"100%\">");
		sb.append("<tr><td width=\"33%\" class=\"evalsmallboldtitle\">");
		sb.append(phrase1);
		sb.append("</TD>");
		sb.append("<td width=\"33%\" class=\"evalsmallboldtitle\" ALIGN=\"CENTER\">");
		sb.append(phrase2);
		sb.append("</TD>");
		sb.append("<td width=\"33%\" class=\"evalsmallboldtitle\" ALIGN=\"RIGHT\">");
		sb.append(phrase3);
		sb.append("</TD></tr>");
		sb.append("</table></td></TR>");
		return sb.toString();
	}

	public String printAttribLabels4(String phrase1, String phrase2, String phrase3, String phrase4) {
		StringBuffer sb = new StringBuffer();
		sb.append("<TR><td CLASS=\"insideboxbb\" colspan=\"2\">&nbsp;</td>");
		sb.append("<TD CLASS=\"insideboxbb\" ALIGN=\"LEFT\" COLSPAN=\"7\">");
		sb.append("<table width=\"100%\">");
		sb.append("<tr><td width=\"25%\" class=\"evalsmallboldtitle\">");
		sb.append(phrase1);
		sb.append("</TD>");
		sb.append("<td width=\"25%\" class=\"evalsmallboldtitle\">");
		sb.append(phrase2);
		sb.append("</TD>");
		sb.append("<td width=\"25%\" class=\"evalsmallboldtitle\" ALIGN=\"RIGHT\">");
		sb.append(phrase3);
		sb.append("</TD>");
		sb.append("<td width=\"25%\" class=\"evalsmallboldtitle\" ALIGN=\"RIGHT\">");
		sb.append(phrase4);
		sb.append("</TD></tr>");
		sb.append("</table></td></TR>");
		return sb.toString();
	}

	public String printInputArea(String question, String questionNumber, String inputType, int numberOfCharacters, String inputAreaName, String inputAreaValue, boolean required) {
		StringBuffer sb = new StringBuffer();
		if (questionNumber.length() > 0)
		{
			sb.append("<tr><TD CLASS=\"app\" ALIGN=\"left\" VALIGN=\"TOP\" WIDTH=\"5%\">");
			if (!questionNumber.equals(null))
			{
				sb.append(questionNumber + ".");
			} else {
				sb.append("&nbsp;");
			}
			sb.append("</TD>");
			sb.append("<TD CLASS=\"app\" ALIGN=\"left\" WIDTH=\"95%\">");
			sb.append(question);
		} else {
			sb.append("<DIV>" + question + "</div>");
		}
		if (inputType.equals("textarea"))
		{
			sb.append("<DIV CLASS=\"app\"><TEXTAREA ");
            if(!(inputAreaValue==null || "".equals(inputAreaValue)) && submitted)
                sb.append("READONLY ");

			if (required)
				sb.append("class=\"required\" ");

			sb.append("name=\"");
			sb.append(inputAreaName);
			sb.append("\" rows=\"7\" cols=\"100\" onkeyup=\"TrackCount(this,'" + inputAreaName + "textcount',");
			sb.append(numberOfCharacters);
			sb.append(")\" onkeypress=\"LimitText(this,");
			sb.append(numberOfCharacters + ")\">");
			if (inputAreaValue == null)
			{
				sb.append("\"\"");
			} else {
				sb.append(inputAreaValue);
			}
			sb.append("</TEXTAREA></DIV>");
			sb.append("<div class=\"small\" align=\"right\">Characters remaining: <input type=\"text\" name=\"" + inputAreaName + "textcount\" size=\"3\" value=\"");
			int tmpLength = numberOfCharacters - inputAreaValue.length();
			sb.append(tmpLength);
			sb.append("\" DISABLED>");
			sb.append("</div>");
		} else if (inputType.equals("yesno"))
		{
			sb.append("<DIV CLASS=\"app\">");
			if (inputAreaValue.equalsIgnoreCase("y") || inputAreaValue.equalsIgnoreCase("yes") || inputAreaValue.equalsIgnoreCase("t") || inputAreaValue.equalsIgnoreCase("true")) {
				sb.append("<INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"true\" checked=\"checked\"> Yes <INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"false\"> No");
			} else if (inputAreaValue.equalsIgnoreCase("n") || inputAreaValue.equalsIgnoreCase("no") || inputAreaValue.equalsIgnoreCase("f") || inputAreaValue.equalsIgnoreCase("false")) {
				sb.append("<INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"true\"> Yes <INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"false\" checked=\"checked\"> No");
			} else {
				sb.append("<INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"true\"> Yes <INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"false\"> No");
			}
			sb.append("</DIV>");
		}else if (inputType.equals("intyesno"))   // for radio buttons with values 0,1,2 for false,true,unanswered
		{
			sb.append("<DIV CLASS=\"app\">");
			if (inputAreaValue.equalsIgnoreCase("1") ||inputAreaValue.equalsIgnoreCase("y") || inputAreaValue.equalsIgnoreCase("yes") || inputAreaValue.equalsIgnoreCase("t") || inputAreaValue.equalsIgnoreCase("true")) {
				sb.append("<INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"1\" checked=\"checked\"> Yes <INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"0\"> No");
			} else if (inputAreaValue.equalsIgnoreCase("0") ||inputAreaValue.equalsIgnoreCase("n") || inputAreaValue.equalsIgnoreCase("no") || inputAreaValue.equalsIgnoreCase("f") || inputAreaValue.equalsIgnoreCase("false")) {
				sb.append("<INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"1\"> Yes <INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"0\" checked=\"checked\"> No");
			} else {
				sb.append("<INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"1\"> Yes <INPUT "+(submitted?"DISABLED":"")+" type=radio name=\"" + inputAreaName + "\" value=\"0\"> No");
			}
			sb.append("</DIV>");
		}
		return sb.toString();
	}

}
