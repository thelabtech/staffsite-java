package org.alt60m.ministry.html;

import java.util.EnumSet;

import org.alt60m.ministry.Status;


public class SelectStatus implements java.io.Serializable {

    static String lineSep = System.getProperty("line.separator") != null ? System.getProperty("line.separator") : "\n";
    
    
    String currentStatus;
    String name;
	EnumSet<Status> statuses;
	String strategyName;
	
    public SelectStatus() {}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentStatus = new String(aValue);
    }

        public EnumSet<Status> getStatuses() {
		return statuses;
	}

	public void setStatuses(EnumSet<Status> statuses) {
		this.statuses = statuses;
	}

	public String getStrategyName() {
		return strategyName;
	}

	public void setStrategyName(String strategyName) {
		this.strategyName = strategyName;
	}

	public String print() {
	StringBuffer sb = new StringBuffer();
	sb.append("<select name=\"" + name + "\">");
	for (Status status : statuses) {
		String selected;
		if (status.toString().equals(currentStatus)) {
			selected = " selected";
		} else {
			selected = "";
		}
		sb.append("<option value=\"" + status + "\"" + selected + ">" + status.getName() + "</option>");
		sb.append(lineSep);
	}
	sb.append("</select>");
	return sb.toString();
    }


    public String printRadio() {
		StringBuffer sb = new StringBuffer();
		for (Status status : statuses) {
			String checked;
			if (status.toString().equals(currentStatus)) {
				checked = " checked";
			} else {
				checked = "";
			}
			sb.append("<input type=radio name=" + name + " value=" + status
					+ checked + "> <SPAN NAME=\"" + toDef(status)
					+ "\" onMouseOver=\"setDefinition(" + toDef(status)
					+ ")\" onMouseOut=\"setDefinition(empty)\">"
					+ status.getName().toUpperCase() + "</SPAN> "
					+ strategyName + " campus.<br>");
			sb.append(lineSep);
		}
		return sb.toString();
	}

	private String toDef(Status status) {
		return status.getName().toLowerCase().replace(" " , "");
	}
}