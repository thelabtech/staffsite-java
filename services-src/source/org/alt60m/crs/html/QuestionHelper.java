package org.alt60m.crs.html;

import org.alt60m.html.*;

public class QuestionHelper implements java.io.Serializable {
	private String answerType = new String();

	private String html = new String();

	private String bgcolor = new String();

	private int rowNum = 0;

	private FormHelper formHelp = new FormHelper();

	public void setAnswerType(String answerType) {
		this.answerType = answerType;
	}

	public String print(String question, String name, boolean required,
			String font, String a, int limit) {
		try {
			int answerIndex = -1;
			if (a == null)
				a = "";
			String answerTypes[] = { "divider", "info", "YN", "checkbox",
					"radio10", "date", "shirt", "textXS", "textS", "textM",
					"textL", "region", "customD", "hide", "country", "state",
					"year", "status", "campus", "pm" };
			for (int i = 0; i < answerTypes.length; i++) {
				if (answerTypes[i].equals(answerType)) {
					answerIndex = i;
				}
			}

			switch (answerIndex) { // make the content so the user can answer
			// the question
			case 0: // divider
				html = "<DIV CLASS='subboxheader'>" + question + "</DIV>";
				break;
			case 1: // info
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				break;
			case 2: // YN : yes or no drop box
				//                if(a.equals("") && question.equals("Are You Staying at the
				// Hotel?")) a = "Y"; //Hotel default = Yes
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html += "<DIV CLASS='answer'>";
				html += "<SELECT NAME='"
						+ name
						+ "' CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)'>";
				html += "<OPTION VALUE='' " + (a.equals("") ? "SELECTED" : "")
						+ "></OPTION>";
				html += "<OPTION VALUE='Y' "
						+ (a.equals("Y") ? "SELECTED" : "") + ">Yes</OPTION>";
				html += "<OPTION VALUE='N' "
						+ (a.equals("N") ? "SELECTED" : "") + ">No</OPTION>";
				html += "</SELECT>";
				html += "</DIV>";
				break;
			case 3: // checkbox
				html = "<DIV CLASS='question'><INPUT TYPE=\"checkbox\" name=\""
						+ name + "\"" + formHelp.check(a, "Yes")
						+ " VALUE='Yes'> " + question + "</DIV>";
				break;
			case 4: // radio10
				html = "<DIV CLASS='question'>" + question + "</b></DIV>";
				SelectNumRadio selRadio = new SelectNumRadio();
				selRadio.setName("" + name);
				html += "<DIV CLASS='answer'>";
				if (a.equals(""))
					a = "1";
				selRadio.setCurrentNumberR(a);
				html += selRadio.print();
				html += "</DIV>";
				break;
			case 5: // date
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				if (a == null || a.equals("") || a.equals("null")) {
					a = "";
				}
				html += "<DIV CLASS='answer'><INPUT TYPE=text name=\""
						+ name
						+ "\" value=\""
						+ a
						+ "\" CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)' SIZE='10'> (MM/DD/YYYY)";
				html += "</DIV>";
				break;
			case 6: // shirt
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html += "<DIV CLASS='answer'>";
				html += "<select name=\""
						+ name
						+ "\" CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)'>";
				html += "\n\t<option value=''></option>";
				html += "\n\t<option value=\"S\" " + formHelp.select("S", a)
						+ ">S</option>";
				html += "\n\t<option value=\"M\" " + formHelp.select("M", a)
						+ ">M</option>";
				html += "\n\t<option value=\"L\" " + formHelp.select("L", a)
						+ ">L</option>";
				html += "\n\t<option value=\"XL\" " + formHelp.select("XL", a)
						+ ">XL</option>";
				html += "\n\t<option value=\"XXL\" "
						+ formHelp.select("XXL", a) + ">XXL</option>";
				html += "</select>";
				html += "</DIV>";
				break;
			case 7: // textXS
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html += "<DIV CLASS='answer'><INPUT TYPE='text' name='"
						+ name
						+ "' value='"
						+ a
						+ "' size=1 maxlength=1 CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)'></DIV>";
				break;
			case 8: // textS
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html += "<DIV CLASS='answer'><INPUT TYPE='text' name='"
						+ name
						+ "' value='"
						+ a
						+ "' size=15 maxlength=15 CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)'></DIV>";
				break;
			case 9: // textM
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html += "<DIV CLASS='answer'><INPUT TYPE='text' name='"
						+ name
						+ "' value='"
						+ a
						+ "' size=30 maxlength=30 CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)'></DIV>";
				break;
			case 10: // textL
				html = "<DIV CLASS='question'>" + question + " (Max. " + limit+" characters)</DIV>";
				html += "<DIV CLASS='answer'><TEXTAREA COLS='60' ROWS='3' NAME='t"
						+ name
						+ "' CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)'"
						+ " onKeyDown=\"textCounter(this.form.t"+name+",this.form.remLen"+name+","+limit+");\""
						+ " onKeyUp=\"textCounter(this.form.t"+name+",this.form.remLen"+name+","+limit+");\""
						+ ">";
				if (a == null)
				{
					html+="\"\"";
				} else {
					html+=a;
				}
				html+="</TEXTAREA></DIV>";
				//
				html+= "<div class=\"small\" align=\"right\">Characters remaining: <input type=\"text\" name=\"remLen"+name+"\" size=\"3\" maxlength=\"4\" value=\"";
				int tmpLength = limit - a.length();
				html+= tmpLength;
				html+= "\">";
				html+= "</div>";
				break;
			case 11: // region
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				SelectRegion selRegion = new SelectRegion();
				selRegion.setName("" + name);
				selRegion.setCurrentValue(a);
				html += "<DIV CLASS='answer'>";
				html += "<SELECT CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)' NAME='"
						+ name + "'>";
				html += "<OPTION VALUE=''></OPTION>";
				for (int i = 0; i < SelectRegion.regions.length; i++)
					html += "<OPTION VALUE='" + SelectRegion.regions[i] + "' "
							+ formHelp.select(a, SelectRegion.regions[i]) + ">"
							+ SelectRegion.regionNames[i] + "</OPTION>";
				html += "</SELECT>";

				html += "</DIV>";
				break;
			case 12: // customD
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html = "<DIV CLASS='answer'><select name=\""
						+ name
						+ "\" CLASS='"
						+ (required ? "required" : "empty")
						+ "' onFocus='Highlight(this)' onBlur='UnHighlight(this)'><option value=''> - Select One - </option>\n";
				question += ";";
				int startPos = 0;
				int endPos = question.indexOf(";", startPos + 1);
				while (endPos > 0) {
					String tempSelect = question.substring(startPos, endPos);
					String tsTrimmed = tempSelect.trim();
					html += "\n\t<option value=\"" + tsTrimmed + "\"";
					if (a.equals(tsTrimmed)) {
						html += " selected=\"selected\"";
					}
					html += ">" + tsTrimmed + "</option>\n";
					startPos = endPos + 1;
					endPos = question.indexOf(";", startPos);
				}
				html += "</select>";
				html += "</DIV>";
				break;
			case 13: // hide
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html += "<INPUT TYPE='hidden' name='" + name + "' value='"
						+ question + "'>";
				break;
			case 14: // country
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				SelectCountry selCountry = new SelectCountry();
				selCountry.setName("" + name);
				selCountry.setCurrentValue(a);
				html += "<DIV CLASS='answer'>" + selCountry.print();
				html += "</DIV>";
				break;
			case 15: // state
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				SelectState selState = new SelectState();
				selState.setName("" + name);
				selState.setCurrentValue(a);
				html += "<DIV CLASS='answer'>" + selState.print();
				html += "</DIV>";
				break;
			case 16: // year
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				SelectYearInSchool selYear = new SelectYearInSchool();
				selYear.setName("" + name);
				selYear.setCurrentValue(a);
				html += "<DIV CLASS='answer'>" + selYear.print();
				html += "</DIV>";
				break;
			case 17: // status
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html += "<DIV CLASS='answer'><select name=\"MaritalStatus\">";
				if (a.equals("M")) {
					html += "<option value=\"\"></option><option value=\"S\">Single</option><option value=\"M\" selected>Married</option>";
				} else if (a.equals("S")) {
					html += "<option value=\"\"></option><option value=\"S\" selected>Single</option><option value=\"M\">Married</option>";
				} else {
					html += "<option value=\"\" selected></option><option value=\"S\">Single</option><option value=\"M\">Married</option>";
				}
				html += "</select></DIV>";
				break;
			case 18: // campus
				html = "<DIV CLASS='question'>" + question + "</DIV>";
				html += "<DIV CLASS='answer'>";
				html += "<INPUT readonly TYPE=\"text\" name=\"" + name
						+ "\" value=\"" + a + "\" size=30 maxlength=128>";
				html += "<font size=\"-1\"><A href=\"javascript:popupWindow('/crs/campuslist.jsp','Help','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=400,width=510,height=400'%20)\">Click Here</A><BR>Select your school from the provided list.</font>";
				html += "</DIV>";
				break;
			}
			rowNum++;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return html;
	}
}
