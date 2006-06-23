package org.alt60m.gcx;

import java.io.IOException;
import java.net.UnknownHostException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.gcx.cas.CASProxyURLConnection;

import edu.yale.its.tp.cas.proxy.ProxyTicketReceptor;

public class ConnexionBar {
	private static Log log = LogFactory.getLog(ConnexionBar.class);

	public static String render(String pgtiou) {
		if (pgtiou == null) {
			throw new RuntimeException("Cannot give a null pgtiou!");
		}

		String content = null;
		//TODO: at some point, the GCX guys need to fix their system so we can request a ticket for the same URL we use to get the bar itself
		String barTicketService = "http://www.mygcx.org/module/global/omnibar/omnibarExternal";
		String barService = "http://gcx3.mygcx.org/module/global/omnibar/omnibarExternal";
		// "http://gcx1.mygcx.org/module/global/omnibar/omnibarExternal";
		String signinService = "signin.mygcx.org";
		try {
			content = getBar(pgtiou, barTicketService, barService, signinService);
		} catch (IOException e) {
			log.error("Exception Occurred getting bar: ", e);
			//TODO: if it's the first time a user logs in, GCX doesn't like to
			//send the toolbar.  So rerequest the toolbar.  Remove this when GCX
			//team fixes their server.
			//
			//update: this shouldnt' be necessary, since the first time a user
			//logs in, we add them to gcx (in simplesecuritymanager).  But it
			//doesn't hurt to leave it for now.
			if (e.getMessage().indexOf(
					"Server returned HTTP response code: 401") != -1) {
				log.info("Retrying...");
				try {
					content = getBar(pgtiou, barTicketService, barService, signinService);
				} catch (IOException e2) {
					log.error("Exception occurred during second attempt", e2);
				}
			}
		}
		
		return content;
	}

	private static String getBar(String pgtiou, String barTicketService, String barService, String signinService) throws IOException, UnknownHostException {
		log.debug("Getting connexion bar for pgtiou " + pgtiou);
		String content = null;
		String proxyticket = ProxyTicketReceptor.getProxyTicket(pgtiou,
				barTicketService);
		if (proxyticket == null)
			log.warn("No ticket given from receptor!");
		else {
			CASProxyURLConnection proxyCon = new CASProxyURLConnection(
					signinService);

			String received = proxyCon.getURL(barService, proxyticket);
			if (proxyCon.wasSuccess() && received != null) {
				content = received;
			} else {
				//TODO: retry with real service url?
				log.error("Connection failed: " + proxyCon.getError());
			}
		}
		return content;
	}
}
