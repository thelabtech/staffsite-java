package org.alt60m.html;

public class SelectBoolean implements java.io.Serializable {


    private String _true = "1";
    private String _false = "0";
    private String currentValue = "0";
    private String name;
    private String size;
    private String tLabel = "True";
    private String fLabel = "False";


    public SelectBoolean() {}


    public void setName(String aName) {
		name = aName;
    }


    public void setSize(String aSize) {
		size = aSize;
    }


    public void setCurrentValue(String aValue) {
		currentValue = "0";
		try {
			currentValue = aValue;
		}
		catch (Exception e) {
			currentValue = "0";
		}
    }

	public void setCurrentValue(boolean aValue) {
		currentValue = "0";
		try {
			if (aValue) {
				currentValue = "1";
			}
		}
		catch (Exception e) {
			currentValue = "0";
		}
    }


    public void setLabels(String trueLabel, String falseLabel) {
		tLabel = trueLabel;
		fLabel = falseLabel;
    }


    public String print() { 
		StringBuffer ob = new StringBuffer();

		ob.append("<select name=\"" + name + "\" ");


		// ToDo: add this capability to the bean
		/*
		if (!size.equals(null)) {
			ob.append("size=\"" + size + "\"");
		}
		*/

		ob.append(">");

		if (currentValue.equals(_true)) {
			ob.append("<option value=\"\" ></option>");
			ob.append("<option value=\"1\" selected>" + tLabel + "</option>");
			ob.append("<option value=\"0\" >" + fLabel + "</option>");
		} else if (currentValue.equals(_false)) {
			ob.append("<option value=\"\" ></option>");
			ob.append("<option value=\"1\" >" + tLabel + "</option>");
			ob.append("<option value=\"0\" selected>" + fLabel + "</option>");
		} else {
			ob.append("<option value=\"\" selected></option>");
			ob.append("<option value=\"1\" >" + tLabel + "</option>");
			ob.append("<option value=\"0\" >" + fLabel + "</option>");
		}


		ob.append("</select>");

		return ob.toString();
    }


   public String printBoolean() {				// if the model has our field as a boolean
		StringBuffer ob = new StringBuffer();	// it only accepts "true" and "false" as
												// opposed to 1s and 0s
		ob.append("<select name=\"" + name + "\" ");

		// ToDo: add this capability to the bean
		/*
		if (!size.equals(null)) {
			ob.append("size=\"" + size + "\"");
		}
		*/

		ob.append(">");

		if (currentValue.equals(_true)) {
			ob.append("<option value=\"\" ></option>");
			ob.append("<option value=\"true\" selected>" + tLabel + "</option>");
			ob.append("<option value=\"false\" >" + fLabel + "</option>");
		} else if (currentValue.equals(_false)) {
			ob.append("<option value=\"\" ></option>");
			ob.append("<option value=\"true\" >" + tLabel + "</option>");
			ob.append("<option value=\"false\" selected>" + fLabel + "</option>");
		} else {
			ob.append("<option value=\"\" selected></option>");
			ob.append("<option value=\"true\" >" + tLabel + "</option>");
			ob.append("<option value=\"false\" >" + fLabel + "</option>");
		}


		ob.append("</select>");

		return ob.toString();
    }
	public String printRadioBoolean(){
		StringBuffer ob = new StringBuffer();

		ob.append(tLabel + " <INPUT TYPE='RADIO' NAME='" + name + "' VALUE='true' " + (currentValue.equals(_true) ? "CHECKED" : "") + ">"); 
		ob.append(fLabel + " <INPUT TYPE='RADIO' NAME='" + name + "' VALUE='false' " + (currentValue.equals(_true) ? "" : "CHECKED") + ">"); 

		return ob.toString();
	}
}
