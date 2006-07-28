package org.alt60m.cas;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CASHelper {
	private static Log log = LogFactory.getLog(CASHelper.class);
	
	private String proxyUrlSuffix;
	private String logoutCallbackSuffix;
	private String loginPath;
	
	public void init(ServletConfig config, String loginPath) {
	proxyUrlSuffix = config.getInitParameter("ProxyUrlSuffix");

	logoutCallbackSuffix = config.getInitParameter("LogoutCallbackSuffix");
	
	//maybe this could be an initParmater too
	this.loginPath = loginPath;
	}

	public String getLogoutUrl(HttpServletRequest request) {
		try {
		String gcxLogoutURL = CASAuthenticator.CAS_LOGOUT_URL + "?"
			+ "service=" + URLEncoder.encode(getService(request), "UTF-8")
			+ "&" + "logoutCallback=" + URLEncoder.encode(getLogoutCallbackService(request), "UTF-8");
		return gcxLogoutURL;
		} catch (UnsupportedEncodingException e) {
			log.error("Somehow managed to mess up UTF-8 encoding...?", e);
			return null;
		}
	}
	

	public String getService(HttpServletRequest request) {
		return request.getScheme() + "://"
				+ request.getServerName() +
				((request.getLocalPort() != 80 && request.getLocalPort() != 443) ? 
						":" + request.getLocalPort() : "") 
				+ loginPath;
	}
	
	
	public String getLogoutCallbackService(HttpServletRequest request) {
		return "https://"
		+ request.getServerName() + logoutCallbackSuffix;
	}
	
	public String getProxyCallbackService(HttpServletRequest request) {
		return "https://"
		+ request.getServerName() 
		+ proxyUrlSuffix;
	}

}
