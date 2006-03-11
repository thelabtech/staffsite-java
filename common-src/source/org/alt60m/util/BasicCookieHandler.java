/**
 * Matt Drees
 * 10/31/05
 */
package org.alt60m.util;

import java.io.IOException;
import java.net.CookieHandler;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Basic cookie handler.  Can be used as the system's cookie handler 
 * (by using CookieHandler.setDefault(new BasicCookieHandler())).  Can also
 * be used manually, e.g., by doing a cookieHandler.addCookies(connection) 
 * before opening the connection and by doing a 
 * cookieHandler.putCookies(connection) afterwards.
 *  
 * 
 * Adapted from http://java.sun.com/developer/JDCTechTips/2005/tt0913.html
 */


public class BasicCookieHandler extends CookieHandler {

    // "Long" term storage for cookies, not serialized so only
    // for current JVM instance
    private List<Cookie> cache = new LinkedList<Cookie>();

    /**
     * Saves all applicable cookies present in the response 
     * headers into cache.
     * @param uri URI source of cookies
     * @param responseHeaders Immutable map from field names to 
     * lists of field
     *   values representing the response header fields returned
     */

    private void log(String message) 
    {
    	System.out.println("BasicCookieHandler: " + message);
    }
    
    public void put(
        URI uri,
        Map<String, List<String>> responseHeaders)
          throws IOException {

      log("(Put) Cache: " + cache);
      List<String> setCookieList = 
        responseHeaders.get("Set-Cookie");
      if (setCookieList != null) {
        for (String item : setCookieList) {
          Cookie cookie = new Cookie(uri, item);
          // Remove cookie if it already exists
          // New one will replace
          for (Cookie existingCookie : cache) {
            if((cookie.getDomain().equals(
              existingCookie.getDomain())) &&
               (cookie.getName().equals(
                 existingCookie.getName()))) {
             cache.remove(existingCookie);
             break;
           }
         }
         log("(Put) Adding to cache: " + cookie);
         cache.add(cookie);
       }
     }
   }
    
    public void put(URL url, Map<String, List<String>> responseHeaders)
			throws IOException {
		try {
			put(url.toURI(), responseHeaders);
		} catch (URISyntaxException e) {
			log("URISyntaxException: " + e);
			log("ignoring...");
		}
    }

   /**
	 * Gets all the applicable cookies from a cookie cache for the specified uri
	 * in the request header.
	 * 
	 * @param uri
	 *            URI to send cookies to in a request
	 * @param requestHeaders
	 *            Map from request header field names to lists of field values
	 *            representing the current request headers
	 * @return Immutable map, with field name "Cookie" to a list of cookies
	 */

	public Map<String, List<String>> get(URI uri,
			Map<String, List<String>> requestHeaders) throws IOException {

		String cookies = "";
		cookies = applicableCookies(uri);

		// Map to return
		Map<String, List<String>> cookieMap = new HashMap<String, List<String>>(
				requestHeaders);

		// Convert StringBuilder to List, store in map
		if (cookies.length() > 0) {
			List<String> list = Collections.singletonList(cookies);
			cookieMap.put("Cookie", list);
		}
		log("(Get) Cookies: " + cookies);
		return Collections.unmodifiableMap(cookieMap);
	}

	/**
	 * Convenience method for manually putting cookies into the cache (i.e.,
	 * when not using as the system-wide default CookieHandler). Ignores
	 * Exceptions.
	 * 
	 * @param conn connection to get cookies from
	 */
	public void put(URLConnection conn)
	{
		try {
			put(conn.getURL(), conn.getHeaderFields());
		}
		catch (IOException e)
		{
			log("Eror: " + e);
			log("Ignoring...");
		}
	}

	/**
	 * Convenience method for manually getting cookies from the cache (i.e.,
	 * when not using as the system-wide default CookieHandler). Ignores
	 * Exceptions.
	 * 
	 * @param conn connection to add cookies to
	 */
	public void get(URLConnection conn)
	{
		String cookies = "";
		try {
			cookies = applicableCookies(conn.getURL().toURI());
		}
		catch (URISyntaxException e) {
			log("Error: " + e);
			log("Ignoring...");
		}
		// Convert StringBuilder to List, store in map
		if (cookies.length() > 0) {
			conn.setRequestProperty("Cookie", cookies);
		}

		log("(Get) Cookies: " + cookies);
	}
	
	private String applicableCookies(URI uri)
	{

		// Retrieve all the cookies for matching URI
		// Put in comma-separated list
		StringBuilder cookies = new StringBuilder();
		Cookie cookie;
		for (Iterator<Cookie> cookieIt = cache.iterator(); cookieIt.hasNext();) {
			cookie = cookieIt.next();
			// Remove cookies that have expired
			if (cookie.hasExpired()) {
				cookieIt.remove();
			} else if (cookie.matches(uri)) {
				if (cookies.length() > 0) {
					cookies.append(", ");
				}
				cookies.append(cookie.toHeader());
			}
		}
		return cookies.toString();
	}
	
	public void clearCookies() {
		cache.clear();
	}
}

class Cookie {

    String name;
    String value;
    URI uri;
    String domain;
    Date expires;
    String path;

    private static DateFormat expiresFormat1
        = new SimpleDateFormat("E, dd MMM yyyy k:m:s 'GMT'", Locale.US);

    private static DateFormat expiresFormat2
       = new SimpleDateFormat("E, dd-MMM-yyyy k:m:s 'GMT'", Locale.US);
		

    /**
     * Construct a cookie from the URI and header fields
     *
     * @param uri URI for cookie
     * @param header Set of attributes in header
     */
    public Cookie(URI uri, String header) {
      String attributes[] = header.split(";");
      String nameValue = attributes[0].trim();
      this.uri = uri;
      this.name = 
        nameValue.substring(0, nameValue.indexOf('='));
      this.value = 
        nameValue.substring(nameValue.indexOf('=')+1);
      this.path = "/";
      this.domain = uri.getHost();

      for (int i=1; i < attributes.length; i++) {
        nameValue = attributes[i].trim();
        int equals = nameValue.indexOf('=');
        if (equals == -1) {
          continue;
        }
        String name = nameValue.substring(0, equals);
        String value = nameValue.substring(equals+1);
        if (name.equalsIgnoreCase("domain")) {
          String uriDomain = uri.getHost();
          if (uriDomain.equals(value)) {
            this.domain = value;
          } else {
            if (!value.startsWith(".")) {
              value = "." + value;
            }
            uriDomain = uriDomain.substring(
              uriDomain.indexOf('.'));
            if (!uriDomain.equals(value)) {
              throw new IllegalArgumentException(
                "Trying to set foreign cookie");
            }
            this.domain = value;
          }
        } else if (name.equalsIgnoreCase("path")) {
          this.path = value;
        } else if (name.equalsIgnoreCase("expires")) {
          try {
            this.expires = expiresFormat1.parse(value);
          } catch (ParseException e) {
            try {
              this.expires = expiresFormat2.parse(value);
            } catch (ParseException e2) {
              throw new IllegalArgumentException(
                "Bad date format in header: " + value);
            }
          }
        }
      }
    }

    public boolean hasExpired() {
      if (expires == null) {
        return false;
      }
      Date now = new Date();
      return now.after(expires);
    }

    public String getName() {
      return name;
    }

    public URI getURI() {
      return uri;
    }
    
    public String getDomain(){
    	return domain;
    	}

    /**
     * Check if cookie isn't expired and if URI matches,
     * should cookie be included in response.
     *
     * @param uri URI to check against
     * @return true if match, false otherwise
     */
    public boolean matches(URI uri) {

      if (hasExpired()) {
        return false;
      }

      //simplified domain check;  real version should verify
      //domain has appropriate number of periods
      String auth = uri.getAuthority();
      if (!uri.getAuthority().endsWith(domain)) {
    	  return false;
      }
      
     String path = uri.getPath();
      if (path == null) {
        path = "/";
      }

      return path.startsWith(this.path);
    }

    public String toHeader()
    {
    	StringBuilder result = new StringBuilder(name);
        result.append("=").append(value);
        return result.toString();
    }
    
    public String toString() {
      StringBuilder result = new StringBuilder(name);
      result.append("=");
      result.append(value);
      result.append("(");
      result.append(domain);
      result.append(")");
      return result.toString();
    }
  }