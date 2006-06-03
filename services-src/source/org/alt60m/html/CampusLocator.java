package org.alt60m.html;

import java.util.*;
import org.apache.log4j.*;
import org.alt60m.servlet.*;
import org.alt60m.ministry.servlet.*;
import org.alt60m.util.*;

/* Class added 14 October 2002 by RDH. Used by /campusList.jsp to get a list of campuses. */

public class CampusLocator extends Controller {
	private final String VIEWS_FILE = "/WEB-INF/campuslocator.xml";
    private final String DEFAULT_ACTION = "locateCampus";

	public void init() {
		super.setViewsFile(getServletContext().getRealPath(VIEWS_FILE));
		super.setDefaultAction(DEFAULT_ACTION);
	}

	public void outputCampusList (javax.servlet.http.HttpServletResponse res, String searchText) throws Exception {

		MinistryLocatorInfo mlInfo = new MinistryLocatorInfo();
		Collection campuses;
		campuses = ObjectHashUtil.list(mlInfo.getTargetAreaNamesByState(searchText));
		Iterator campusList = campuses.iterator();
		res.setContentType( "text/xml" );
		java.io.PrintWriter out = res.getWriter();
		out.println("<campusList>");
		while(campusList.hasNext()) {
			String campusname;
			String cityname;
			Hashtable targetarea = new Hashtable();
			targetarea = (Hashtable)campusList.next();
			campusname = (String)targetarea.get("Name");
			cityname = (String)targetarea.get("City");
			out.println("<campus name=\"" + ((campusname != null) ? org.alt60m.util.Escape.textToXML(campusname) : "") + "\" city=\"" + ((cityname != null) ? org.alt60m.util.Escape.textToXML(cityname) : "") + "\" />");
		}
		out.println("</campusList>");
		out.flush();
	}

	public void locateCampus (ActionContext ctx) {
        try {
       		String searchText = ctx.getInputString("searchtext", true);
			outputCampusList(ctx.getResponse(), searchText);
        } catch (Exception e) {
            log.error("Failed to perform campusLocate().", e);
		}
	}
}