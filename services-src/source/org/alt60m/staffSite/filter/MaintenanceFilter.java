package org.alt60m.staffSite.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class MaintenanceFilter implements Filter {
	private static Log log = LogFactory.getLog(MaintenanceFilter.class);
	private String maintenancePage;
	public void init(FilterConfig config) throws ServletException {
		
		maintenancePage = config.getInitParameter("pageName");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		log.debug("Doing filter");
		if (blockUser(request))
			request.getRequestDispatcher(maintenancePage).forward(request, response);
		else
			chain.doFilter(request, response);
	}

	public void destroy() {
	}
	
	protected boolean blockUser(ServletRequest request)
	{
		log.debug("blocking user");
		return true;
	}

}
