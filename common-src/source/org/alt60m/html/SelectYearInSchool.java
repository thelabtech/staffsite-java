package org.alt60m.html;


public class SelectYearInSchool implements java.io.Serializable {
	String required = "";
	String disabled = "";
    String[] options = {"", "High School", "Freshman", "Sophomore", "Junior", "Senior", "Graduate Student", "Graduate", "Other"};
	String currentYear;
    String name;

    public SelectYearInSchool() {}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentYear = new String(aValue);
    }

    public void setRequired(String aValue) {
		required = new String(aValue);
    }

    public void setDisabled(String aValue) {
		disabled = new String(aValue);
    }

    public String print() {
		StringBuffer sb = new StringBuffer();
		int i;

		if(required.equals(""))
			sb.append("<select " + disabled + " name=\"" + name + "\">");
		else{
			// Added by Andy Stanberry for MS fully backward compatible
			sb.append("<select " + disabled + " class=\"" + required + "\" onFocus=\"Highlight(this)\" onBlur=\"UnHighlight(this)\" name=\"" + name + "\">");
		}

		for (i = 0; i < options.length; ++i) {
			if (options[i].equals(currentYear)) {
				sb.append("<option value=\"" + options[i] + "\" selected>" + options[i] + "</option>");
			} else {
				sb.append("<option value=\"" + options[i] + "\">" + options[i] + "</option>");
			}
		}
		sb.append("</select>");
		return sb.toString();
    }
}
