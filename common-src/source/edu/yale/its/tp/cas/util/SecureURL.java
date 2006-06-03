package edu.yale.its.tp.cas.util;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * A class housing some utility functions exposing secure URL validation
 * and content retrieval.  The rules are intended to be about as restrictive
 * as a common browser with respect to server-certificate validation.
 */
public class SecureURL {

  /**
   * For testing only...
   */
  public static void main(String args[]) throws IOException {
    System.setProperty("java.protocol.handler.pkgs",
      "com.sun.net.ssl.internal.www.protocol");
    System.out.println(SecureURL.retrieve(args[0]));
  }

  /** 
   * Retrieve the contents from the given URL as a String, assuming the
   * URL's server matches what we expect it to match.
   */
  public static String retrieve(String url) throws IOException {
    BufferedReader r = null;
    try {
      URL u = new URL(url);
      //if (!u.getProtocol().equals("https"))
      //  throw new IOException("only 'https' URLs are valid for this method");
      URLConnection uc = u.openConnection();
      uc.setRequestProperty("Connection", "close");
      r = new BufferedReader(new InputStreamReader(uc.getInputStream()));
      String line;
      StringBuffer buf = new StringBuffer();
      String lineSep = System.getProperty("line.separator");
      while ((line = r.readLine()) != null)
        buf.append(line + lineSep);
      return buf.toString();
    } finally {
      try {
        if (r != null)
          r.close();
      } catch (IOException ex) {
        // ignore
      }
    }
  }
}
