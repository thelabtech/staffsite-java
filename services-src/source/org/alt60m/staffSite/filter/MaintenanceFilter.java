package org.alt60m.staffSite.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MaintenanceFilter implements Filter {
	private String maintenancePage;
	public void init(FilterConfig config) throws ServletException {
		maintenancePage = "/maintenance.html";
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.getRequestDispatcher(maintenancePage).forward(request, response);
	}

	public void destroy() {

	}

}
