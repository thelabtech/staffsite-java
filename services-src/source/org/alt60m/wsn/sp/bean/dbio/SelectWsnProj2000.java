package org.alt60m.wsn.sp.bean.dbio;

import java.util.*;
import org.alt60m.wsn.sp.model.dbio.*;
import org.alt60m.hr.ms.servlet.dbio.*;

public class SelectWsnProj2000 implements java.io.Serializable {

	String currentWsnProj="0";
	String name;
	private Vector projectsList = null;
	
	private final String currentWsnYear = MSInfo.CURRENT_WSN_YEAR;

    public SelectWsnProj2000() {}

    public void setName(String aName) { name = aName; }

    public void setCurrentValue(String aValue) {
		currentWsnProj = new String(aValue);
    }

	public String print() {
		StringBuffer sb = new StringBuffer();
		int i=0;
		sb.append("<select name=\"" + name + "\">");
		sb.append("<option value=\"\" selected> </option>");
		try {
			try {
				try {
					//following refactored kb 3/5/03
					// lists ALL projects, regardless of whether they are full or not

					// added cache jcs 2/1/2005
					if ( projectsList == null ) {
						projectsList = (new WsnProject()).selectList("wsnYear="+currentWsnYear+" order by name");
					}
					
					Iterator projects = projectsList.iterator();
				    
				    while(projects.hasNext()) {
						WsnProject fields = (WsnProject) projects.next();
					     
					    String projectID = fields.getWsnProjectID();
					    String projectnamestring = fields.getName();
	
						if (projectID.equals(currentWsnProj)) {
							sb.append("<option value=\"" + projectID + "\" selected>" + projectnamestring + "</option>");
						}
						else {
							sb.append("<option value=\"" + projectID + "\">" + projectnamestring + "</option>");
						}
						i++;
				    }
                }
				catch (Exception e) {
                    System.err.println(e);
                }
            }
			catch (Exception e) {
                System.err.println(e.toString());
            }
        }
		catch (Exception e) {
            System.err.println(e);
        }
		sb.append("</select>");
		return sb.toString();
    }

	public String display() {
		StringBuffer sb = new StringBuffer();
		int i=0;
		try {
			try {
				try {
					WsnProject project = new WsnProject(currentWsnProj);
					String projectname = project.getName();
					sb.append(projectname);
                }
				catch (Exception re) {
                    System.err.println(re);
                }
            }
			catch (Exception e) {
                System.err.println(e.toString());
            }
        } catch (Exception ne) {
            System.err.println(ne);
        }
		return sb.toString();
    }
}