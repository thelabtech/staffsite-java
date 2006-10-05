package org.alt60m.html;

import java.util.*;
import javax.servlet.*;
import org.alt60m.servlet.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* -          Displays a little text saying how many people have sessions in the last 30 minutes  - */
/* -          Initial Coding: gdw 2002/01/18  - */

public class LoggedInToStaffsite implements java.io.Serializable {
	private static Log log = LogFactory.getLog(LoggedInToStaffsite.class);
	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";

	public LoggedInToStaffsite() {  }

	public void setBodyFont(String aValue) { bodyFont = aValue; }


	public String print(ServletContext theContext) {
		String stringBuffer = "<!--  --------------------LoggedInToStaffsite MODULE ------------------- --> <center>";
		try
		{
			ServletLogging sl = (ServletLogging) theContext.getAttribute("StaffSiteServletLogging");
			if (sl!=null){
				Collection loggedInCollection= sl.getSummary(30*60);
				stringBuffer = stringBuffer + bodyFont + "There ";
				if (loggedInCollection.size()>1){
					stringBuffer = stringBuffer + "are " + loggedInCollection.size()+ " people";
				}
				else{
					stringBuffer = stringBuffer + "is one other person";
				}
				stringBuffer = stringBuffer + " online right now</FONT>";
			}
			else{
				stringBuffer = stringBuffer + "You are the only one online right now!</FONT>";
			}

		} catch (Exception e) {
				stringBuffer = stringBuffer + bodyFont + "Temporarily unavailable";
			log.error(e, e);
		}
		stringBuffer = stringBuffer + "</center>";
		return stringBuffer;
	}

}












