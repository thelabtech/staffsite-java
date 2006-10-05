package  org.alt60m.html;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CRSCustomQuestionHelper implements java.io.Serializable
{
	private static Log log = LogFactory.getLog(CRSCustomQuestionHelper.class);
	
	private String answerType = new String();
	private String html = new String();
	private String bgcolor = new String();
	private int rowNum = 0;

	private FormHelper formHelp = new FormHelper();

	public void setAnswerType(String answerType) {
		this.answerType = answerType;
	}

	public String print(String question, String name, String require, String font, String a) {
		try {
		int answerIndex = -1;
		String answerTypes[] = {"divider","info","YN","checkbox","radio10",
				"date","shirt","textXS","textS","textM","textL","region",
				"customD","hide","country","state","year","status","campus","pm"};
		for (int i = 0; i < answerTypes.length; i++) {
			if (answerTypes[i].equals(answerType)) {
				answerIndex = i;
			}
		}

		switch(answerIndex) { // make the content so the user can answer the question
			case 0: // divider
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html = "<tr><td colspan=\"2\"><hr></td></tr>";
				break;
			case 1: // info
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html = "<tr><td colspan=\"2\">"+font+"<b>"+question+"</b></font></td></tr>";
				break;
			case 2: // YN : yes or no drop box
                if(a.equals("") && question.equals("Are You Staying at the Hotel?")) a = "Y"; //Hotel default = Yes
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html += "<td><select name=\""+name+"\">";
				if (a.equals("Y")) {
					html += "\n\t<option value=\"Y\" selected=\"selected\">Yes</option><option value=\"N\">No</option>";
				} else {
					html += "\n\t<option value=\"N\" selected=\"selected\">No</option><option value=\"Y\">Yes</option>";
				}
				html += "</select>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 3: // checkbox
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html = "<tr><td colspan=\"2\"><input type=\"checkbox\" name=\""+name+"\""+formHelp.check(a,"Yes")+">"+font+"<b>"+question+"</b></font></td></tr>";
				break;
			case 4: // radio10
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				SelectNumRadio selRadio = new SelectNumRadio();
				selRadio.setName(""+name);
				html += "<td>";
				if (a.equals("")) { a = "1"; }
				selRadio.setCurrentNumberR(a);
				html += selRadio.print();
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 5: // date
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				if (a == null || a.equals("") || a.equals("null")) { a = ""; }
//				if (name.indexOf("Birth")==-1)
                html += "<td><input readonly type=text name=\""+name+"\" value=\""+a+"\"><font size=\"-1\"><A HREF=\'javascript:pickdate(document.theForm."+name+")\'>choose</A></font>";
//				else html += "<td><input onFocus='pickdate(this)' type=text name=\""+name+"\" value=\""+a+"\"><font size=\"-1\"><A HREF=\'javascript:pickdate(document.theForm."+name+")\'>choose</A></font>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 6: // shirt
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html += "<td>";
				html += "<select name=\""+name+"\">";
				html += "\n\t<option value=\"-\" "+formHelp.select("-",a)+">-</option>";
				html += "\n\t<option value=\"S\" "+formHelp.select("S",a)+">S</option>";
				html += "\n\t<option value=\"M\" "+formHelp.select("M",a)+">M</option>";
				html += "\n\t<option value=\"L\" "+formHelp.select("L",a)+">L</option>";
				html += "\n\t<option value=\"XL\" "+formHelp.select("XL",a)+">XL</option>";
				html += "\n\t<option value=\"XXL\" "+formHelp.select("XXL",a)+">XXL</option>";
				html += "</select>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 7: // textXS
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html += "<td>";
				html += "<input type=\"text\" name=\""+name+"\" value=\""+a+"\" size=1 maxlength=1>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 8: // textS
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html += "<td>";
				html += "<input type=\"text\" name=\""+name+"\" value=\""+a+"\" size=15 maxlength=15>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 9: // textM
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html += "<td>";
				html += "<input type=\"text\" name=\""+name+"\" value=\""+a+"\" size=30 maxlength=30>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 10: // textL
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html += "<td>";
				html += "<textarea name=\""+name+"\">"+a+"</textarea>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 11: // region
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				SelectRegion selRegion = new SelectRegion();
				selRegion.setName(""+name);
				selRegion.setCurrentValue(a);
				html += "<td>"+selRegion.print();
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 12: // customD
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html = "<tr><td colspan=\"2\"><select name=\""+name+"\"><option> - Select One - </option>\n";
				question += ";";
				int startPos = 0;
				int endPos = question.indexOf(";", startPos+1);
				while (endPos>0) {
					String tempSelect = question.substring(startPos, endPos);
					String tsTrimmed = tempSelect.trim();
					html += "\n\t<option value=\""+tsTrimmed+"\"";
					if (a.equals(tsTrimmed)) { html += " selected=\"selected\""; }
					html += ">"+tsTrimmed+"</option>\n";
					startPos = endPos+1;
					endPos = question.indexOf(";",startPos);
				}
				html += "</select>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 13: // hide
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html = "<input type=\"hidden\" name=\""+name+"\" value=\""+question+"\">";
				break;
			case 14: // country
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				SelectCountry selCountry = new SelectCountry();
				selCountry.setName(""+name);
				selCountry.setCurrentValue(a);
				html += "<td>"+selCountry.print();
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 15: // state
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				SelectState selState = new SelectState();
				selState.setName(""+name);
				selState.setCurrentValue(a);
				html += "<td>"+selState.print();
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 16: // year
                html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
                SelectYearInSchool selYear = new SelectYearInSchool();
                selYear.setName(""+name);
                selYear.setCurrentValue(a);
                html += "<td>"+selYear.print();
                if(require.equals("2")) html += font + "*";
                html += "</td></tr>";
                break;
			case 17: // status
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
                html += "<td><select name=\"MaritalStatus\">";
                if(a.equals("M")) {
					html += "<option value=\"\"></option><option value=\"S\">Single</option><option value=\"M\" selected>Married</option>";
				} else if(a.equals("S")) {
					html += "<option value=\"\"></option><option value=\"S\" selected>Single</option><option value=\"M\">Married</option>";
				} else {
					html += "<option value=\"\" selected></option><option value=\"S\">Single</option><option value=\"M\">Married</option>";
				}
                html += "</select></td>";
				html += "<td>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			case 18: // campus
				html = "<tr><td>"+font+"<b>"+question+"</b></font></td>";
				html += "<td>";
				html += "<input readonly type=\"text\" name=\""+name+"\" value=\""+a+"\" size=30 maxlength=128>";
				html += "<font size=\"-1\"><A href=\"javascript:popupWindow('/crs/campuslist.jsp','Help','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,left=400,width=510,height=400'%20)\">Click Here</A><BR>Select your school from the provided list.</font>";
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
			default: // we are going to go ahead and assume that if nothing else works, it must be of payment type :)
				html = "<tr><td>"+font+"<b>Would you like to include "+question+" for an additional $"+answerType.substring(2)+"?</b></font></td>";
				html += "<td><select name=\""+name+"\">";
				if (a.equals("Y")) {
					html += "\n\t<option value=\"Y\" selected=\"selected\">Yes</option><option value=\"N\">No</option>";
				} else {
					html += "\n\t<option value=\"N\" selected=\"selected\">No</option><option value=\"Y\">Yes</option>";
				}
				if (require.equals("2")) html += font + "*";
				html += "</td></tr>";
				break;
		}
		rowNum++;
		} catch (Exception e) {
			log.error(e, e);

		}
		return html;
	}
}


