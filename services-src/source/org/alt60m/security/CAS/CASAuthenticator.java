/*
 * Created on Jul 27, 2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package org.alt60m.security.CAS;

import java.io.IOException;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.SAXException;
import edu.yale.its.tp.cas.client.ServiceTicketValidator;
import javax.servlet.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.*;

/**
 * @author justin.sabelko
 *
 * 
 * 
 */
public class CASAuthenticator {
	private static Log log = LogFactory.getLog(CASAuthenticator.class); 
	
	public static final String CAS_TICKET_TOKEN = "ticket";

	public static String CAS_LOGIN_URL; 

	public static String CAS_LOGOUT_URL;

	private static String CAS_VALIDATION_URL;
	
	public static String CAS_VERIFICATION_URL;
	

	public static void init(ServletContext app) throws ServletException
	{
		
        CAS_LOGIN_URL =(String) app.getInitParameter("CasLoginURL");
        if (CAS_LOGIN_URL == null)
			throw new ServletException("need parameter CasLoginURL");

		CAS_LOGOUT_URL = (String) app.getInitParameter("CasLogoutURL");
		if (CAS_LOGOUT_URL == null)
			throw new ServletException("need parameter CasLogoutURL");
        
        CAS_VALIDATION_URL = (String) app.getInitParameter("CasValidationURL");
		if (CAS_VALIDATION_URL == null)
			throw new ServletException("need parameter CasValidationURL");
          
		CAS_VERIFICATION_URL = (String) app.getInitParameter("CasVerificationURL");
		if (CAS_VERIFICATION_URL == null)
			throw new ServletException("need parameter CasVerificationURL");
          
	}
	

	/**
	 * @param cas_staffsite_service2
	 * @param ticket
	 * @return
	 * @throws NotAuthenticatedException
	 */
	public static CASUser authenticate(String service, String proxyCallback, String ticket) throws NotAuthenticatedException {
		CASUser result = null;
		
		String user = null;
		String errorCode = null;
		String errorMessage = null;
		String xmlResponse = null;
		 
		// instantiate a new ServiceTicketValidator
		ServiceTicketValidator sv = new ServiceTicketValidator();
		
		// TODO: for testing, don't request proxy (for connexion bar); our
		// localhosts don't have https set up.
		// In the future, we ought to. However...still might not be able to
		// receive from cas server, which is in the dmz...
		if (service.indexOf("https") != -1) {
			sv.setProxyCallbackUrl(proxyCallback);
			log.debug("Using proxyCallback: " + proxyCallback);
		}
			
		// set its parameters
		sv.setCasValidateUrl(CAS_VALIDATION_URL);
		sv.setService(service);
		sv.setServiceTicket(ticket);
		
		log.debug("Validating ticket: " + ticket);
		log.debug("For service: " + service);
		
		try {
			// contact CAS and validate
			sv.validate();
		} catch (IOException e) {
			log.error(e.getMessage(), e);
		} catch (SAXException e) {
			log.error(e.getMessage(), e);
		} catch (ParserConfigurationException e) {
			log.error(e.getMessage(), e);
		}
		 
		// if we want to look at the raw response, we can use getResponse()
		xmlResponse = sv.getResponse();
		log.debug(xmlResponse);
		if(sv.isAuthenticationSuccessful()) {
		    user = sv.getUser();
		    result = new CASUser(user, sv.getPgtIou(), sv.getAttributes());
			log.info("User " + user + " successfully authenticated against CAS");
		} else {
		    errorCode = sv.getErrorCode();
		    errorMessage = sv.getErrorMessage();
		    log.info("Unable to authenticate; Reason: " + sv.getErrorMessage());
		    // handle the error
		    throw new NotAuthenticatedException(errorCode, errorMessage);
		}
		
		return result;
	}
		
}
