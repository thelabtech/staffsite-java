package edu.yale.its.tp.cas.client;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.parsers.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import edu.yale.its.tp.cas.util.SecureURL;

/**
 * Validates PTs and optionally retrieves PGT IOUs.  Subclassed
 * instead of collapsed into parent because we don't want users
 * to accidentally accept a proxy ticket when they mean only to
 * accept service tickets.  That is, proxy targets need to know
 * that they're proxy targets, not first-level web applications.
 */
public class ProxyTicketValidator extends ServiceTicketValidator {

  //*********************************************************************
  // For testing...
  public static void main(String args[]) throws Exception {
    System.setProperty("java.protocol.handler.pkgs",
      "com.sun.net.ssl.internal.www.protocol");
    edu.yale.its.tp.cas.client.ProxyTicketValidator pv
      = new edu.yale.its.tp.cas.client.ProxyTicketValidator();
    pv.setCasValidateUrl("https://portal.yale.edu/cas/proxyValidate");
    //pv.setProxyCallbackUrl("https://portal.yale.edu/casProxy/receptor");
    pv.setService(args[0]);
    pv.setServiceTicket(args[1]);
    pv.validate();
    System.out.println(pv.getResponse());
    System.out.println();
    if (pv.isAuthenticationSuccessful()) { 
      System.out.println("user: " + pv.getUser());
      //System.out.println("pgtIou: " + pv.getPgtIou());
      System.out.println("proxies:\n " + pv.getProxyList());
    } else {
      System.out.println("error code: " + pv.getErrorCode());
      System.out.println("error message: " + pv.getErrorMessage());
    }
  }

  //*********************************************************************
  // Additive state

  protected List proxyList;


  //*********************************************************************
  // Accessors

  /**
   * Retrieves a list of proxies involved in the current authentication.
   */
  public List getProxyList() {
    return proxyList;
  }


  //*********************************************************************
  // Response parser

  protected DefaultHandler newHandler() {
    return new ProxyHandler();
  }

  protected class ProxyHandler extends ServiceTicketValidator.Handler {

    //**********************************************
    // Constants

    protected static final String PROXIES = "cas:proxies";
    protected static final String PROXY = "cas:proxy";

    //**********************************************
    // Parsing state

    protected List proxyList = new ArrayList();
    protected boolean proxyFragment = false;

    //**********************************************
    // Parsing logic

    public void startElement(String ns, String ln, String qn, Attributes a) {
      super.startElement(ns, ln, qn, a);
      if (authenticationSuccess && qn.equals(PROXIES))
        proxyFragment = true;
    }

    public void endElement(String ns, String ln, String qn)
        throws SAXException {
      super.endElement(ns, ln, qn);
      if (qn.equals(PROXIES))
        proxyFragment = false;
      else if (proxyFragment && qn.equals(PROXY))
        proxyList.add(currentText.toString().trim());
    }
 
    public void endDocument() throws SAXException {
      super.endDocument();
      if (authenticationSuccess)
        ProxyTicketValidator.this.proxyList = proxyList;
    }
  }

  //*********************************************************************
  // Utility methods

  /**
   * Clears internally manufactured state.
   */
  protected void clear() {
    super.clear();
    proxyList = null;
  }

}
