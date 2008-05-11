package edu.yale.its.tp.cas.proxy;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.alt60m.gcx.ConnexionBar;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import edu.yale.its.tp.cas.util.SecureURL;

/**
 * Receives and keeps track fo PGTs and serial PGT identifiers (IOUs) sent
 * by CAS in response to a ServiceValidate request.
 */
public class ProxyTicketReceptor extends HttpServlet {
  private static Log log = LogFactory.getLog(ProxyTicketReceptor.class);

  //*********************************************************************
  // Constants

  private static final String PGT_IOU_PARAM = "pgtIou";
  private static final String PGT_ID_PARAM = "pgtId";

  //TODO: for now, stored in WEB-INF.  Probably should find a better place.
  private static final String SAVED_RECEPTOR_FILE_NAME = "proxyreceptor.save";

  //*********************************************************************
  // Private state

  private static Map<String, CacheEntry> pgtMap;
  private static String casProxyUrl;


  /**
   * pasted from ConnexionBar.java; might be worth it to make a utility class for caches
   *
   */
	private class CacheEntry implements Serializable {

		private static final long serialVersionUID = 2L;

		public CacheEntry(String pgt) {
			this.pgt = pgt;
			cacheTimestamp = System.currentTimeMillis();
		}

		static final int validTime =  1 * 60 * 60 * 1000; //in ms

		public String pgt;

		public Long cacheTimestamp;

		public boolean expired() {
			return (System.currentTimeMillis() - cacheTimestamp > validTime);
		}
	}

  //*********************************************************************
  // Initialization

  @SuppressWarnings("unchecked")
public void init(ServletConfig config) throws ServletException {
		super.init(config);
		synchronized (ProxyTicketReceptor.class) {
			if (pgtMap == null) {

				FileInputStream fis = null;
				ObjectInputStream in = null;
				try {
					File savefile = new File(getServletContext().getRealPath("/WEB-INF/"), SAVED_RECEPTOR_FILE_NAME);
					fis = new FileInputStream(savefile);
					in = new ObjectInputStream(fis);
					pgtMap = (HashMap<String, CacheEntry>) in.readObject();
					in.close();
				} catch (FileNotFoundException e){
					pgtMap = new HashMap<String, CacheEntry>();
				} catch (IOException e) {
					e.printStackTrace();
					pgtMap = new HashMap<String, CacheEntry>();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					pgtMap = new HashMap<String, CacheEntry>();
				}
				clearCache();
			}
			// retrieve the URL for CAS
			if (casProxyUrl == null) {
				ServletContext app = config.getServletContext();
				String string = "edu.yale.its.tp.cas.proxyUrl";
				casProxyUrl = (String) app
						.getInitParameter(string);
				if (casProxyUrl == null)
					throw new ServletException(
							"need " + string);
			}
		}
	}

  public void destroy() {
		clearCache();
		saveState();
	}

	public void clearCache() {
		for (Iterator<CacheEntry> i = pgtMap.values().iterator(); i.hasNext();) {
			CacheEntry entry = i.next();
			if (entry.expired()) {
				i.remove();
			}
		}
	}

  // simple state saving; could be better
	public void saveState() {
		FileOutputStream fos = null;
		ObjectOutputStream out = null;
		try {
			File savefile = new File(getServletContext().getRealPath("/WEB-INF/"), SAVED_RECEPTOR_FILE_NAME);
			fos = new FileOutputStream(savefile);
			out = new ObjectOutputStream(fos);
			out.writeObject(pgtMap);
			out.close();
		} catch (IOException ex) {
			System.err.println("IO Exception saving proxyTicket cache");
			ex.printStackTrace();
		} catch (Exception e) { //don't think this is possible, but I'm seeing some goofy behavior, so...
			System.err.println("Non-IO Exception saving proxyTicket cache");
			e.printStackTrace();
		}
	}

  // *********************************************************************
  // Request handling

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
   String pgtId = request.getParameter(PGT_ID_PARAM);
   String pgtIou = request.getParameter(PGT_IOU_PARAM);
   if (pgtId != null && pgtIou != null) {
     synchronized(pgtMap) {
       pgtMap.put(pgtIou, new CacheEntry(pgtId));
     }
   }
   PrintWriter out = response.getWriter();
   out.println(
     "<casClient:proxySuccess " +
       "xmlns:casClient=\"http://www.yale.edu/tp/casClient\"/>");
   out.flush();
  }

  //*********************************************************************
  // Interface to package members

  // NOTE: PUBLIC FOR THE MOMENT

  /**
   * Retrieves a proxy ticket using the PGT that corresponds to the given
   * PGT IOU.
   */
  public static String getProxyTicket(String pgtIou, String target)
      throws IOException {
    synchronized(ProxyTicketReceptor.class) {
      // ensure state is sensible
      if (casProxyUrl == null || pgtMap == null)
        throw new IllegalStateException(
          "getProxyTicket() only works after servlet has been initialized");
    }

    // retrieve PGT
    String pgtId = null;
    synchronized(pgtMap) {
      CacheEntry cacheEntry = pgtMap.get(pgtIou);
      pgtId = cacheEntry == null ? null : cacheEntry.pgt;
    }
    if (pgtId == null)
      return null;

    // retrieve an XML response from CAS's "Proxy" actuator
    String url = casProxyUrl + "?pgt=" + pgtId + "&targetService=" + target;
    log.info("Retrieving Proxy Ticket from: " + url);
    String response = SecureURL.retrieve(url);

    // parse this response (use a lightweight approach for now)
    if (response.indexOf("<cas:proxySuccess>") != -1
        && response.indexOf("<cas:proxyTicket>") != -1) {
      int startIndex = response.indexOf("<cas:proxyTicket>")
        + "<cas:proxyTicket>".length();
      int endIndex = response.indexOf("</cas:proxyTicket>");
      return response.substring(startIndex, endIndex);
    } else {
      // generic failure
      return null;
    }
  }
}
