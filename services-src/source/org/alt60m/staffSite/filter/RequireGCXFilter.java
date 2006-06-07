package org.alt60m.staffSite.filter;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class RequireGCXFilter extends MaintenanceFilter {
	private static Log log = LogFactory.getLog(RequireGCXFilter.class);
	
	
	
	@Override
	protected boolean blockUser(ServletRequest request) {
		if (request instanceof HttpServletRequest) {
			if (((HttpServletRequest) request).getSession().getAttribute("CASUser") != null) {
				log.debug("Not blocking user");
				return false;
			}
		}
		log.debug("Blocking user");
		return true;
	}
}
