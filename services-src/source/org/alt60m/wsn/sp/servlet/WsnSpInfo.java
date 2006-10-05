package org.alt60m.wsn.sp.servlet;

import org.alt60m.wsn.sp.model.dbio.*;
import org.alt60m.util.*;
import org.alt60m.hr.ms.servlet.dbio.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
//import org.apache.log4j.Priority;
//import org.exolab.castor.jdo.OQLQuery;
//import org.exolab.castor.jdo.QueryResults;

//import java.io.FileWriter;
//import java.io.IOException;
//import java.lang.reflect.InvocationTargetException;
//import java.lang.reflect.Method;
//import java.text.*;
import java.util.*;

/**
 *
 * @author  Mike Brinkley
 * @version 1.0
 */
public class WsnSpInfo {

	private static Log log = LogFactory.getLog(WsnApplication.class);
	public WsnSpInfo()  {

	}


	//11-10-03 mb & kl:  ****CODE to build 2004 projects from 2003 projects****
	public Iterator getProjectsFromYear(String year) {
		Iterator projects = null;
		try {

			try {
				WsnProject wsn = new WsnProject();
				wsn.setWsnYear(year);
				projects = wsn.selectList().iterator();
			} catch (Exception e) {
				log.error(e, e);
			}
		} catch (Exception e) {
			log.error(e, e);
		}
		return projects;
	}

	public void createCurrentYearProjectsFromPreviousYear(Iterator projectsOld) {
		try {
			while (projectsOld.hasNext()) {
				WsnProject project = new WsnProject();
				WsnProject proj = (WsnProject) projectsOld.next();
				Hashtable projHash = ObjectHashUtil.obj2hash(proj);
				projHash.put("WsnYear", MSInfo.CURRENT_WSN_YEAR);
				projHash.remove("WsnProjectID");
				ObjectHashUtil.hash2obj(projHash, project);
				project.setWsnProjectID("0");
				project.setIsAPDId(0);
				project.setIsPDId(0);
				project.setIsCoordId(0);
				project.persist();
			}
		} catch (Exception e) {
			log.error(e, e);
		}
	}

	public static void main(String args[]) {
		WsnSpInfo wsnc = new WsnSpInfo();
		int lastYear = Integer.parseInt(MSInfo.CURRENT_WSN_YEAR)-1;
		String lYear = new Integer(lastYear).toString();
		wsnc.createCurrentYearProjectsFromPreviousYear(wsnc.getProjectsFromYear(lYear));
	}
}
