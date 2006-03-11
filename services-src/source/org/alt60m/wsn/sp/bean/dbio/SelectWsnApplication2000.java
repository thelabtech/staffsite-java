package org.alt60m.wsn.sp.bean.dbio;

import org.alt60m.wsn.sp.model.dbio.*;
import org.alt60m.hr.ms.servlet.dbio.*;
import java.util.*;

public class SelectWsnApplication2000 implements java.io.Serializable {

	String currentWsnApplication = "0";
	String name;
	private final String currentWsnYear = MSInfo.CURRENT_WSN_YEAR;
	private Collection WsnApplications = null;
	private boolean isUsersOnly=false;

	public SelectWsnApplication2000() {}

	public void setName(String aName) {
		name = aName;
	}

	public void setCurrentValue(String aValue) {
		currentWsnApplication = new String(aValue);
	}

	public String print(boolean toolUsersOnly) {
		StringBuffer sb = new StringBuffer();
		int i = 0;
		sb.append("<select name=\"" + name + "\">");
		sb.append("<option value=\"\" selected> </option>");
		try {
			if (isUsersOnly!=toolUsersOnly || WsnApplications == null) {	// only select if don't have right collection (users only vs. all)
				WsnApplicationLight pers = new WsnApplicationLight();
				String whereClause = "legalLastName<>'' AND wsnYear = '" + currentWsnYear +"'";
				if(toolUsersOnly)
				{
					whereClause+=" AND surferID<>'' AND surferID IS NOT null";
				}
				whereClause+= " order by legalLastName";
				WsnApplications = pers.selectList(whereClause);
				isUsersOnly= toolUsersOnly;
			}
			Iterator persons = WsnApplications.iterator();
			while (persons.hasNext()) {
				WsnApplicationLight person = (WsnApplicationLight) persons.next();
				String personID = person.getWsnApplicationID();
				String personFirstName = person.getLegalFirstName();
				String personLastName = person.getLegalLastName();
				if (personID.equals(currentWsnApplication)) {
					sb.append("<option value=\"" + personID + "\" selected>" + personLastName + ", " + personFirstName + "</option>");
				} else {
					sb.append("<option value=\"" + personID + "\">" + personLastName + ", " + personFirstName + "</option>");
				}
				i++;
			}
		} catch (Exception e) {
			System.err.println(e);
		}
		sb.append("</select>");
		return sb.toString();
	}

	public String print() {
		return print(false);
	}
	
	public String display() {
		StringBuffer sb = new StringBuffer();
		int i = 0;
		try {
			WsnApplication person = new WsnApplication(currentWsnApplication);
			sb.append(person.getLegalFirstName() + " " + person.getLegalLastName());
			i++;
		} catch (Exception re) {
			System.err.println(re);
		}

		return sb.toString();
	}

}
