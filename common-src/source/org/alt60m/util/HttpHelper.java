package org.alt60m.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class HttpHelper {
	private static Log log = LogFactory.getLog(HttpHelper.class);

	//at some point read these as init parameters?
    protected static final int READ_TIMEOUT_DEFAULT = 10000;  //in ms
    protected static final int CONNECT_TIMEOUT_DEFAULT = 10000;


	// Create an instance of HttpClient.
	private HttpClient client = new HttpClient();
	{
        client.getHttpConnectionManager().
        getParams().setConnectionTimeout(CONNECT_TIMEOUT_DEFAULT);

        client.getHttpConnectionManager().
        getParams().setSoTimeout(READ_TIMEOUT_DEFAULT);

	}


	public String getContent(String url) throws IOException
	{
		HttpMethod method = new GetMethod(url);
		return getContent(method);
	}


	// adapted from httpClient tutorial
	public String getContent(HttpMethod method) throws IOException {

		// Create a method instance.
		//GetMethod method = new GetMethod(url);

		// Provide custom retry handler is necessary
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
				new DefaultHttpMethodRetryHandler(3, false));

		String content = null;
		try {
			// Execute the method.
			log.debug("executing method...");
			int statusCode = client.executeMethod(method);
			log.debug("...done.");
			if (statusCode != HttpStatus.SC_OK) {
				log.warn("Method failed: " + method.getStatusLine());
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
			log.warn("Fatal protocol violation getting content");
			throw e;
		} catch (IOException e) {
			log.warn("Fatal transport error getting content");
			throw e;
		} finally {
			// Release the connection.
			log.debug("releasing connection...");
			method.releaseConnection();
			log.debug("done.");
		}
		return content;
	}

}