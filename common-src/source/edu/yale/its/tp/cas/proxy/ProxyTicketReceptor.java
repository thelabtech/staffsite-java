package edu.yale.its.tp.cas.proxy;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import edu.yale.its.tp.cas.util.SecureURL;

/**
 * Receives and keeps track fo PGTs and serial PGT identifiers (IOUs) sent
 * by CAS in response to a ServiceValidate request.
 */
public class ProxyTicketReceptor extends HttpServlet {

  //*********************************************************************
  // Constants

  private static final String PGT_IOU_PARAM = "pgtIou";
  private static final String PGT_ID_PARAM = "pgtId";

  //TODO: for now, stored in WEB-INF.  Probably should find a better place.
  private static final String SAVED_RECEPTOR_FILE_NAME = "proxyreceptor.save"; 

  //*********************************************************************
  // Private state

  private static Map pgt;
  private static String casProxyUrl;

  //*********************************************************************
  // Initialization 

  public void init(ServletConfig config) throws ServletException {
		super.init(config);
		synchronized (ProxyTicketReceptor.class) {
			if (pgt == null) {

				FileInputStream fis = null;
				ObjectInputStream in = null;
				try {
					File savefile = new File(getServletContext().getRealPath("/WEB-INF/"), SAVED_RECEPTOR_FILE_NAME);
					fis = new FileInputStream(savefile);
					in = new ObjectInputStream(fis);
					pgt = (HashMap) in.readObject();
					in.close();
				} catch (FileNotFoundException e){
					pgt = new HashMap();
				} catch (IOException e) {
					e.printStackTrace();
					pgt = new HashMap();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					pgt = new HashMap();
				}
			}
			// retrieve the URL for CAS
			if (casProxyUrl == null) {
				ServletContext app = config.getServletContext();
				casProxyUrl = (String) app
						.getInitParameter("edu.yale.its.tp.cas.proxyUrl");
				if (casProxyUrl == null)
					throw new ServletException(
							"need edu.yale.its.tp.cas.proxyUrl");
			}
		}
	}

  public void destroy() {
		saveState();
	}

  //simple state saving; could be better
	public void saveState() {
		FileOutputStream fos = null;
		ObjectOutputStream out = null;
		try {
			File savefile = new File(getServletContext().getRealPath("/WEB-INF/"), SAVED_RECEPTOR_FILE_NAME);
			fos = new FileOutputStream(savefile);
			out = new ObjectOutputStream(fos);
			out.writeObject(pgt);
			out.close();
		} catch (IOException ex) {
			ex.printStackTrace();
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
     synchronized(pgt) {
       pgt.put(pgtIou, pgtId);
       saveState();
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
      if (casProxyUrl == null || pgt == null)
        throw new IllegalStateException(
          "getProxyTicket() only works after servlet has been initialized");
    }

    // retrieve PGT
    String pgtId = null;
    synchronized(pgt) {
      pgtId = (String) pgt.get(pgtIou);
    }
    if (pgtId == null)
      return null;

    // retrieve an XML response from CAS's "Proxy" actuator
    String url = casProxyUrl + "?pgt=" + pgtId + "&targetService=" + target;
    String response = SecureURL.retrieve(url);

    System.out.println(response);
    
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
