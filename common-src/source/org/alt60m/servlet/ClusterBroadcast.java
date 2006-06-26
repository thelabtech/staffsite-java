package org.alt60m.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.alt60m.util.HttpHelper;
import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Intended to solve some problems with clustering a server behind SSO.
 * We solve the problem by broadcasting the the incoming requests
 * within the cluster.
 * 
 * Requires a context parameter called "ClusteredServers" containing a comma-delimited
 * list of server names within the cluster, and a servlet init parameter called "BroadcastUrlSuffix"
 * containing the relative url of the request to broadcast.
 * 
 * @author matthew.drees
 *
 */
public class ClusterBroadcast extends HttpServlet  {
	private static Log log = LogFactory.getLog(ClusterBroadcast.class);
	
	private Collection<String> servers;
	
	private String broadcastUrlSuffix;
	
	private String successfulResponse;
	
	private String failureResponse;
	
	public void init(ServletConfig config) throws ServletException {
		log.debug("Initializing " + config.getServletName());
		super.init(config);
		servers = Arrays.asList(getServletContext().getInitParameter("ClusteredServers").split(",\\s*"));
		if (log.isDebugEnabled())
		{
			log.debug("Clustered servers:");
			for (String server : servers)
				log.debug("  " + server);
		}
		
		broadcastUrlSuffix = config.getInitParameter("BroadcastUrlSuffix");
		log.debug("BroadcastUrlSuffix: " + broadcastUrlSuffix);
		

		successfulResponse = config.getInitParameter("SuccessfulResponse");
		log.debug("SuccessfulResponse: " + successfulResponse);

		failureResponse = config.getInitParameter("FailureResponse");
		if (failureResponse != null) {
			log.debug("FailureResponse: " + failureResponse);
		}
		else {
			log.debug("FailureResponse not specified; using SuccessfulResponse");
			failureResponse = successfulResponse;
		}	
	}
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Map<String, String> responses = sendRequests(request.getQueryString());
		
		boolean success = false;
		if (responses.size() == 0) // they all failed
		{
			log.warn("No responses");

		} else {
			for (String server : servers) {
				if (responses.get(server) != null && !responses.get(server).trim().equals(successfulResponse)) {
					log.warn("Unsuccessful response from " + server + ": "
							+ responses.get(server));
				} else {
					success = true;
				}
			}
		}
		if (success)
		{
			response.getOutputStream().print(successfulResponse);
		} else {
			log.warn("All broadcasted requests failed");
			response.getOutputStream().print(failureResponse);
		}
	}

	private Map<String, String> sendRequests(String queryString) {
		HttpHelper helper = new HttpHelper();
		Map<String, String> responses = new HashMap<String, String>();
		for (String server : servers) {
			try {
				String requestUrl = constructServerRequestUrl(server, queryString);
				log.debug("Sending request to " + requestUrl);
				String content = helper.getContent(requestUrl);
				log.debug("Received: " + content);
				responses.put(server, content);
			}
			catch (IOException e)
			{
				log.error("Unable to rebroadcast logout request to " + server, e);
			}
		}
		return responses;
	}

	private String constructServerRequestUrl(String server, String queryString)
	{
		StringBuffer requestUrl;
		if (server.startsWith("http://") || server.startsWith("https://"))
			requestUrl = new StringBuffer();
		else
			requestUrl = new StringBuffer("http://");
		requestUrl.append(server);
		if (broadcastUrlSuffix.startsWith("/"))
			requestUrl.append(broadcastUrlSuffix);
		else
			requestUrl.append("/").append(broadcastUrlSuffix);
		if (queryString != null)
		{
			if (requestUrl.toString().contains("?"))
			{
				requestUrl.append('&');
			}
			else
			{
				requestUrl.append( '?');
			}
			requestUrl.append(queryString);
		}
		return requestUrl.toString();
	}
}