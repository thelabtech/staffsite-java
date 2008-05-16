/**
 * Matt Drees
 * 10/31/05
 */
package org.alt60m.cas;

import java.util.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.CookieHandler;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.regex.*;
import java.util.Map;

import org.apache.commons.httpclient.*;
import org.apache.commons.httpclient.methods.*;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.alt60m.util.BasicCookieHandler;



/**
 * @author matthew.drees
 *
 * A basic class for connecting to a resource that requires a CAS signin.
 * 
 */
public class CASURLConnection {
	private static Log log = LogFactory.getLog(CASURLConnection.class);

	private static final String USERNAME_TOKEN = "username";
	private static final String PASSWORD_TOKEN = "password";
	private static final String LOGIN_TICKET_TOKEN = "lt";
	private static final String SERVICE_TOKEN = "service";
	private static final String LOGOUT_CALLBACK_TOKEN = "logoutCallback";
	private static final String SERVICE_TICKET_TOKEN = "ticket";
	private static final String RENEW_TOKEN = "renew";
	

    protected static final int READ_TIMEOUT_DEFAULT = 15000;  //in ms
    protected static final int CONNECT_TIMEOUT_DEFAULT = 4000; 
    
    protected static int redirectLimit = 5;

    // ex: <input type="hidden" name="lt"
	// value="LT-16105-3Q8PS7S6jLaEplIbdMcn" />

	private static final Pattern TICKET_PATTERN = Pattern.compile("<input\\s+type\\s*=\\s*\"hidden\"\\s+"
			+ "name\\s*=\\s*\"" + LOGIN_TICKET_TOKEN
			+ "\"\\s+value\\s*=\\s*\"(.*)\"\\s*/>", Pattern.DOTALL);
	
	//private static final Pattern LOGGED_IN_PATTERN = Pattern.compile("")
	
	
	private String signinUrl;
	
	private String service;
	
	private String username;
	
	private String password;
	
	private String myLastError;
	
	// Create an instance of HttpClient.
	private HttpClient client = new HttpClient();
	{
        client.getHttpConnectionManager().
        getParams().setConnectionTimeout(CONNECT_TIMEOUT_DEFAULT);

        client.getHttpConnectionManager().
        getParams().setSoTimeout(READ_TIMEOUT_DEFAULT);
        
	}
	
	public CASURLConnection(String signinUrl, String username, String password) 
	{
		this.signinUrl = signinUrl;
		this.username = username;
		this.password = password;
		
		//future:  maybe sign in to cas, get cas ticket-granting cookie; 
		//only useful if logging in to different services
	}
	
	/**
	 * Useful method for testing
	 * @param args
	 */
	public static void main(String[] args) {
		System.setProperty("org.apache.commons.logging.Log", "org.apache.commons.logging.impl.SimpleLog");
		System.setProperty("org.apache.commons.logging.simplelog.showdatetime", "true");
		System.setProperty("org.apache.commons.logging.simplelog.log.httpclient.wire.header", "debug");
		System.setProperty("org.apache.commons.logging.simplelog.log.org.apache.commons.httpclient", "debug");
		
		String testCasServer = "https://signin.mygcx.org/cas/login";
		String testUsername = "campus.admin@mygcx.org";
		String testPassword = "BeThouMyVision12";
		String testService = "http://www.mygcx.org/authz-admin/CampusStaff";
		String testTicketService = "http://www.mygcx.org/authz-admin/CampusStaff";
		CASURLConnection con = new CASURLConnection(testCasServer, testUsername, testPassword);
		try {
			log.debug("Logging in...");
			String content = con.logIn(testService, testTicketService, null);
			if (content != null) {
				if (content.trim().equals("Bad URL or parameters.  Sorry."))
					log.debug("OK");
				else
					log.debug(content);
				System.out.flush();
			} 
			else {

				log.debug("Error: " + con.getError());
				return;
			}
			
			//con.logOut();
			
			String command = "<listUsers/>";
			
			String request = "<?xml version = \"1.0\"?> " +
					"<!DOCTYPE admin_commands SYSTEM \"http://gcxapp.mygcx.org/dtd/admin_commands.dtd\"> " +
					"<admin_commands> <command> "+ command + " </command></admin_commands>";
			
			Map<String, String> paramList = new HashMap<String, String>();
			paramList.put("admin_commands", request);
			log.debug("Sending Request...");
			content = con.sendRequest(paramList);
			
			if (content != null) {
				log.debug(content);
			} 
			else {

				log.debug("Error: " + con.getError());
				return;
			}
		}
		catch (Exception e) {
			log.error(e, e);
		}
	}
	
	private static void log(String message)
	{
		log.info(message);
	}
	
	/**
	 * A convience method when there is no logoutCallback
	 * 
	 * @param service
	 * @return
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public String logIn(String service) throws MalformedURLException, IOException {
		return logIn(service, null);
	}
	
	public String logIn(String service, String logoutCallback) throws MalformedURLException,
	IOException {
		return logIn(service, null, logoutCallback);
	}

	
	/**
	 * Logs into CAS, and then the given service.
	 * @param service (not URL encoded)
	 * @param logoutCallback (not URL encoded)
	 * @return the content of the service requested, or null if there was an error
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public String logIn(String service, String ticketService, String logoutCallback) throws 
			IOException
	{
		if (service == null) {
			myLastError = "Null service!";
			return null;
		}
		
		if (ticketService == null)
		{
			ticketService = URLEncoder.encode(service, "UTF-8");
		}
		else
		{
			ticketService = URLEncoder.encode(ticketService, "UTF-8");
		}
		
		this.service = service;
		
		
		//service = URLEncoder.encode(service, "UTF-8");
		
		logoutCallback = logoutCallback != null ? 
				URLEncoder.encode(logoutCallback, "UTF-8") : null;
		
		// get login ticket
		String loginTicket = null;


		String content = "";
		String url = signinUrl + "?" + RENEW_TOKEN + "=" + "true";
			
		HttpMethod getLogin = new GetMethod(url);
		content = getContent(getLogin);
		
		// Not necessary anymore after Oracle Identity Management changes - 5/16/2008 JCS 
/*		Matcher ticketFinder = TICKET_PATTERN.matcher(content);

		if (ticketFinder.find()) {
			loginTicket = ticketFinder.group(1);
		} else {
			log("Can't get ticket");
			myLastError = "Unable to find login ticket from " + signinUrl + ";" + "\r\n" +"content: "
					+ content;
			return null;
		}
*/
		url = signinUrl;

		PostMethod postLogin = new PostMethod(url);
		
//		NameValuePair ticketPair = new NameValuePair(LOGIN_TICKET_TOKEN, loginTicket);
		NameValuePair servicePair = new NameValuePair(SERVICE_TOKEN, ticketService);
		NameValuePair passwordPair = new NameValuePair(PASSWORD_TOKEN, password);
		NameValuePair usernamePair = new NameValuePair(USERNAME_TOKEN, username);
		postLogin.setRequestBody( 
		          new NameValuePair[] {servicePair, usernamePair, passwordPair});
				
		if (logoutCallback != null) {
			NameValuePair logoutCallbackPair = new NameValuePair(LOGOUT_CALLBACK_TOKEN, logoutCallback);
			postLogin.addParameter(logoutCallbackPair);
		}
		
		content = getContent(postLogin);
		String ticket = postLogin.getResponseHeader("CAS-Ticket").getValue();
		
		url = service + "?" + SERVICE_TICKET_TOKEN + "=" + ticket;
		GetMethod getGCX = new GetMethod(url);
		
		content = getContent(getGCX);
		return content;
	}

	// adapted from httpClient tutorial
	String getContent(HttpMethod method) throws HttpException, IOException {

		// Create a method instance.
		//GetMethod method = new GetMethod(url);

		// Provide custom retry handler is necessary
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
				new DefaultHttpMethodRetryHandler(3, false));

		String content = null;
		try {
			// Execute the method.
			int statusCode = client.executeMethod(method);

			if (statusCode != HttpStatus.SC_OK) {
				log("Method failed: " + method.getStatusLine());
			}

			// Read the response body.
			InputStream is = method.getResponseBodyAsStream();

			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			String lineSep = System.getProperty("line.separator");
			StringBuffer sb = new StringBuffer();
			String nextLine;
			while ((nextLine = br.readLine()) != null) {
				sb.append(nextLine);
				sb.append(lineSep);
			}

			content = sb.toString();

		} catch (HttpException e) {
			System.err.println("Fatal protocol violation: " + e.getMessage());
			throw e;
		} catch (IOException e) {
			System.err.println("Fatal transport error: " + e.getMessage());
			throw e;
		} finally {
			// Release the connection.
			method.releaseConnection();
		}
		return content;
	}
	
		
	public void logOut()
	{
		client.getState().clear();
	}
	
	/**
	 * Sends a request to the given service.
	 * 
	 * @param parameterList
	 *            A Map consisting of (paramName, paramValue) pairs to send to
	 *            the service
	 * @return The service's reply
	 * @throws MalformedURLException
	 * @throws IOException
	 */
	public String sendRequest(Map<String, String> parameterList) throws MalformedURLException,
	IOException
	{
		if (service == null)
			return null;
		
		
		StringBuilder urlString = new StringBuilder(service);
		Iterator i = parameterList.keySet().iterator();
		boolean first = true;
		while (i.hasNext()){
			if (first) {
				urlString.append("?");
				first = false;
			}
			else
				urlString.append("&");
			
			String key = (String) i.next();
			urlString.append(URLEncoder.encode(key, "UTF-8")).append("=")
					.append(URLEncoder.encode(parameterList.get(key), "UTF-8"));
		}
		
		HttpURLConnection.setFollowRedirects(false);
		log("connecting to " + urlString.toString());
		
		GetMethod command = new GetMethod(urlString.toString());
		String content = getContent(command);
		return content;
	}
	
	
	public String getError() {
		return myLastError;
	}
	
	
	public int getReadTimeout(){

        
        return client.getHttpConnectionManager().
        getParams().getSoTimeout();
	}
	
	public void setReadTimeout(int newReadTimeout)
	{
		client.getHttpConnectionManager().
        getParams().setSoTimeout(newReadTimeout);
    
	}
	
	public int getConnectTimeout(){
		return client.getHttpConnectionManager().
		getParams().getConnectionTimeout();
	}
	
	public void setConnectTimeout(int newConnectTimeout)
	{

        client.getHttpConnectionManager().
        getParams().setConnectionTimeout(newConnectTimeout);
	}
}


