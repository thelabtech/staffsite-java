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
 * Validates STs and optionally retrieves PGT IOUs.
 * Designed with a bean-like interface for simplicity and generality.
 */
public class ServiceTicketValidator {

  //*********************************************************************
  // For testing...
  public static void main(String args[]) throws Exception {
    System.setProperty("java.protocol.handler.pkgs",
      "com.sun.net.ssl.internal.www.protocol");
    edu.yale.its.tp.cas.client.ServiceTicketValidator sv
      = new edu.yale.its.tp.cas.client.ServiceTicketValidator();
    sv.setCasValidateUrl("https://portal1.wss.yale.edu/cas/serviceValidate");
    sv.setProxyCallbackUrl("https://portal1.wss.yale.edu/casProxy/receptor");
    sv.setService(args[0]);
    sv.setServiceTicket(args[1]);
    sv.validate();
    System.out.println(sv.getResponse());
    System.out.println();
    if (sv.isAuthenticationSuccessful()) { 
      System.out.println("user: " + sv.getUser());
      System.out.println("pgtIou: " + sv.getPgtIou());
    } else {
      System.out.println("error code: " + sv.getErrorCode());
      System.out.println("error message: " + sv.getErrorMessage());
    }
  }


  //*********************************************************************
  // Private state

  private String casValidateUrl, proxyCallbackUrl, st, service, pgtIou,
    user, errorCode, errorMessage, entireResponse;

  // NK
  //private String attrName;
  private Map attributes = new HashMap();
  
  private boolean attemptedAuthentication;
  private boolean successfulAuthentication;


  //*********************************************************************
  // Accessors

  /**
   * Sets the CAS validation URL to use when validating tickets and
   * retrieving PGT IOUs.
   */
  public void setCasValidateUrl(String x) {
    this.casValidateUrl = x;
  }

  /**
   * Gets the CAS validation URL to use when validating tickets and
   * retrieving PGT IOUs.
   */
  public String getCasValidateUrl() {
    return this.casValidateUrl;
  }

  /**
   * Sets the callback URL, owned logically by the calling service, to
   * receive the PGTid/PGTiou mapping.
   */
  public void setProxyCallbackUrl(String x) {
    this.proxyCallbackUrl = x;
  }

  /**
   * Gets the callback URL, owned logically by the calling service, to
   * receive the PGTid/PGTiou mapping.
   */
  public String getProxyCallbackUrl() {
    return this.proxyCallbackUrl;
  }

  /**
   * Sets the ST to validate.
   */
  public void setServiceTicket(String x) {
    this.st = x;
  }

  /**
   * Sets the service to use when validating.
   */
  public void setService(String x) {
    this.service = x;
  }

  /**
   * Returns the strongly authenticated username.
   */
  public String getUser() {
    return this.user;
  }

  /**
   * Returns the emplid
   */
  public Map getAttributes() {
    return this.attributes;
  }

  /**
   * Returns the PGT IOU returned by CAS.
   */
  public String getPgtIou() {
    return this.pgtIou;
  }

  /**
   * Returns <tt>true</tt> if the most recent authentication attempted
   * succeeded, <tt>false</tt> otherwise.
   */
  public boolean isAuthenticationSuccessful() {
    return this.successfulAuthentication;
  }

  /**
   * Returns an error message if CAS authentication failed.
   */
  public String getErrorMessage() {
    return this.errorMessage;
  }

  /**
   * Returns CAS's error code if authentication failed.
   */
  public String getErrorCode() {
    return this.errorCode;
  }

  /**
   * Retrieves CAS's entire response, if authentication was succsesful.
   */
  public String getResponse()  {
    return this.entireResponse;
  }


  //*********************************************************************
  // Actuator

  public void validate()
      throws IOException, SAXException, ParserConfigurationException {
    if (casValidateUrl == null || st == null)
      throw new IllegalStateException("must set validation URL and ticket");
    clear();
    attemptedAuthentication = true;
    StringBuffer sb = new StringBuffer();
    sb.append(casValidateUrl);
    if (casValidateUrl.indexOf('?') == -1)
      sb.append('?');
    else
      sb.append('&');
    sb.append("service=" + service + "&ticket=" + st);
    if (proxyCallbackUrl != null)
      sb.append("&pgtUrl=" + proxyCallbackUrl);
    String url = sb.toString();
    System.out.println("Validating ticket: " + url);
    String response = SecureURL.retrieve(url);
    this.entireResponse = response;
    
    // parse the response and set appropriate properties
    if (response != null) {
      XMLReader r =
        SAXParserFactory.newInstance().newSAXParser().getXMLReader();
      r.setFeature("http://xml.org/sax/features/namespaces", false);
      r.setContentHandler(newHandler());
      r.parse(new InputSource(new StringReader(response)));
    }
  }


  //*********************************************************************
  // Response parser

  protected DefaultHandler newHandler() {
    return new Handler();
  }

  protected class Handler extends DefaultHandler {

    //**********************************************
    // Constants

    protected static final String AUTHENTICATION_SUCCESS = 
      "cas:authenticationSuccess";
    protected static final String AUTHENTICATION_FAILURE =
      "cas:authenticationFailure";
    protected static final String PROXY_GRANTING_TICKET =
      "cas:proxyGrantingTicket";
    protected static final String USER = "cas:user";
    //NK
    protected static final String ATTRS = "cas:attributes";

    //**********************************************
    // Parsing state

    protected StringBuffer currentText = new StringBuffer();
    protected boolean authenticationSuccess = false;
    protected boolean authenticationFailure = false;
    //protected String netid, pgtIou, errorCode, errorMessage;
    protected boolean insideAttrs = false;
    

    //**********************************************
    // Parsing logic

    public void startElement(String ns, String ln, String qn, Attributes a) {
      // clear the buffer
      currentText = new StringBuffer();

      // check outer elements
      if (qn.equals(AUTHENTICATION_SUCCESS)) {
        authenticationSuccess = true;
      } else if (qn.equals(AUTHENTICATION_FAILURE)) {
        authenticationFailure = true;
        errorCode = a.getValue("code");
        if (errorCode != null)
          errorCode = errorCode.trim();
      }
      else if (qn.equals(ATTRS))
      {
          insideAttrs = true;
      }
      
    }

    public void characters(char[] ch, int start, int length) {
      // store the body, in stages if necessary
      currentText.append(ch, start, length);
    }

    public void endElement(String ns, String ln, String qn)
        throws SAXException {
      if (authenticationSuccess) {
        if (qn.equals(USER))
          user = currentText.toString().trim();
          
        //NK
        else if (qn.equals(ATTRS))
        {
        	insideAttrs = !insideAttrs;

        }
        else if (insideAttrs)
        {
            attributes.put(qn, currentText.toString().trim());
        }
          
        if (qn.equals(PROXY_GRANTING_TICKET))
          pgtIou = currentText.toString().trim();
      } else if (authenticationFailure) {
        if (qn.equals(AUTHENTICATION_FAILURE))
          errorMessage = currentText.toString().trim();
      }
    }
 
    public void endDocument() throws SAXException {
      // save values as appropriate
      if (authenticationSuccess) {
          successfulAuthentication = true;
//        ServiceTicketValidator.this.user = user;
//        ServiceTicketValidator.this.pgtIou = pgtIou;
//        ServiceTicketValidator.this.successfulAuthentication = true;
//        
//        // NK - what does this do?
//        ServiceTicketValidator.this.attributes = attributes;
      } else if (authenticationFailure) {
          successfulAuthentication = false;
//        ServiceTicketValidator.this.errorMessage = errorMessage;
//        ServiceTicketValidator.this.errorCode = errorCode;
//        ServiceTicketValidator.this.successfulAuthentication = false;
      } else
        throw new SAXException("no indication of success of failure from CAS");
    }
 }

  //*********************************************************************
  // Utility methods

  /**
   * Clears internally manufactured state.
   */
  protected void clear() {
   user = pgtIou = errorMessage = null;
   //NK
   attributes.clear();
   attemptedAuthentication = false;
   successfulAuthentication = false;
  }

}
