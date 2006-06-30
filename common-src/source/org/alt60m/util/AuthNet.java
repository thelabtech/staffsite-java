// Decompiled by DJ v3.9.9.91 Copyright 2005 Atanas Neshkov  Date: 6/30/2006 2:31:27 PM
// Home Page : http://members.fortunecity.com/neshkov/dj.html  - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   AuthNet.java

package org.alt60m.util;

import com.sun.net.ssl.internal.ssl.Provider;
import java.io.*;
import java.net.*;
import java.security.Security;
import java.util.StringTokenizer;
import java.util.Vector;
import javax.net.SocketFactory;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;

public class AuthNet
{

    public AuthNet()
    {
        _lTimeOut = 60000;
        _strResponseDelimiter = ",";
        _strPostDelimiter = "&,";
        _bLogEnabled = false;
        _strLogFile = "ANetSSLPostlog.txt";
        bLogFileOK = false;
        _lTimeOut = 60000;
        _strResponseDelimiter = ",";
        _strPostDelimiter = "&,";
        _bLogEnabled = false;
        _strLogFile = "ANetSSLPostlog.txt";
        _strErrorMessage = "Success";
        _lErrorCode = 0;
        _strHost = "secure.authorize.net";
        _strFile = "/gateway/transact.dll";
        _nPort = 443;
        _vResponseFields = new Vector();
        _vReponseHeaders = new Vector();
    }

    public AuthNet(boolean flag, String s)
    {
        _lTimeOut = 60000;
        _strResponseDelimiter = ",";
        _strPostDelimiter = "&,";
        _bLogEnabled = false;
        _strLogFile = "ANetSSLPostlog.txt";
        bLogFileOK = false;
        _lTimeOut = 30000;
        _strResponseDelimiter = ",";
        _strPostDelimiter = "&,";
        _bLogEnabled = flag;
        _strLogFile = s;
        _strErrorMessage = "Success";
        _lErrorCode = 0;
        _strHost = "secure.authorize.net";
        _strFile = "/gateway/transact.dll";
        _nPort = 443;
        _vResponseFields = new Vector();
        _vReponseHeaders = new Vector();
    }

    public AuthNet(int i)
    {
        _lTimeOut = 60000;
        _strResponseDelimiter = ",";
        _strPostDelimiter = "&,";
        _bLogEnabled = false;
        _strLogFile = "ANetSSLPostlog.txt";
        bLogFileOK = false;
        _lTimeOut = i * 1000;
        _strResponseDelimiter = ",";
        _strPostDelimiter = "&,";
        _bLogEnabled = false;
        _strLogFile = "ANetSSLPostlog.txt";
        _strErrorMessage = "Success";
        _lErrorCode = 0;
        _strHost = "secure.authorize.net";
        _strFile = "/gateway/transact.dll";
        _nPort = 443;
        _vResponseFields = new Vector();
        _vReponseHeaders = new Vector();
    }

    public void setTimeOut(int i)
    {
        _lTimeOut = i * 1000;
    }

    public int getTimeOut()
    {
        return _lTimeOut / 1000;
    }

    public void enableLogging()
    {
        _bLogEnabled = true;
    }

    public void disableLogging()
    {
        _bLogEnabled = false;
    }

    public boolean IsLoggingEnabled()
    {
        return _bLogEnabled;
    }

    public void setLogFile(String s)
    {
        _strLogFile = s;
    }

    public String getLogFile()
    {
        return _strLogFile;
    }

    public String getErrorMessage()
    {
        return _strErrorMessage;
    }

    public int getErrorCode()
    {
        return _lErrorCode;
    }

    public String getResponseString()
    {
        return _strResponse;
    }

    public int numFields()
    {
        return _vResponseFields.size();
    }

    public void setHost(String s)
    {
        _strHost = s;
    }

    public void setFile(String s)
    {
        _strFile = s;
    }

    public void setPort(int i)
    {
        _nPort = i;
    }

    public int getPort()
    {
        return _nPort;
    }

    public String getHost()
    {
        return _strHost;
    }

    public String getFile()
    {
        return _strFile;
    }

    public boolean postSuccess()
    {
        return _lErrorCode == 0;
    }

    public String getField(int i)
    {
        String s = "";
        if(i <= 0 || i > _vResponseFields.size())
            return s;
        else
            return (String)_vResponseFields.elementAt(i - 1);
    }

    public void doSSLPost(String s)
    {
        try
        {
            if(IsLoggingEnabled())
                try
                {
                    fLogFile = new PrintWriter(new FileOutputStream(_strLogFile, true));
                    bLogFileOK = true;
                    if(IsLoggingEnabled() && bLogFileOK)
                    {
                        fLogFile.println("************************ New Post **********************************");
                        fLogFile.println("Log file " + _strLogFile + " created or opened successfully");
                        fLogFile.println();
                    }
                }
                catch(IOException ioexception)
                {
                    _lErrorCode = 1;
                    _strErrorMessage = "Error: Unable to log on request, operation aborted. Please contact administrators for file creation privs.";
                    bLogFileOK = false;
                    return;
                }
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println("User posted data: " + s);
                fLogFile.println();
            }
            s = prepareInput(s);
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println("Starting SSLSocket creation ... ");
                fLogFile.println();
            }
            Security.addProvider(new Provider());
            SSLSocketFactory sslsocketfactory = (SSLSocketFactory)SSLSocketFactory.getDefault();
            SSLSocket sslsocket = (SSLSocket)sslsocketfactory.createSocket(_strHost, _nPort);
            sslsocket.setSoTimeout(_lTimeOut);
            sslsocket.startHandshake();
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println("SSLSocket creation and handshaking complete");
                fLogFile.println();
            }
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println("Start writing output stream");
                fLogFile.println();
            }
            PrintWriter printwriter = new PrintWriter(new BufferedWriter(new OutputStreamWriter(sslsocket.getOutputStream())));
            printwriter.println("POST " + _strFile + " " + "HTTP/1.0");
            printwriter.println("Content-Type: application/x-www-form-urlencoded");
            printwriter.println("Content-Encoding: 8859_1");
            printwriter.println("Content-Length:  " + s.length());
            printwriter.println("");
            printwriter.println(s);
            printwriter.flush();
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println("SSLSocket writing data completed");
                fLogFile.println();
            }
            if(printwriter.checkError() && IsLoggingEnabled() && bLogFileOK)
            {
                _lErrorCode = 6;
                _strErrorMessage = "Error: Critical error occured when socket tried to write data. please check transaction manually";
                if(IsLoggingEnabled() && bLogFileOK)
                {
                    fLogFile.println("Error: Critical error occured when socket tried to write data. please check transaction manually");
                    fLogFile.println();
                }
            }
            BufferedReader bufferedreader = new BufferedReader(new InputStreamReader(sslsocket.getInputStream()));
            readHeaders(bufferedreader);
            _strResponse = readContent(bufferedreader, _vReponseHeaders);
            parseAndStoreResponse(_strResponse);
            bufferedreader.close();
            printwriter.close();
            sslsocket.close();
            _lErrorCode = 0;
            _strErrorMessage = "Success";
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println(_strErrorMessage);
                fLogFile.println();
                fLogFile.flush();
                fLogFile.close();
            }
        }
        catch(UnknownHostException unknownhostexception)
        {
            _lErrorCode = 2;
            _strErrorMessage = "Error: Host unknown. contact AuthorizeNet for updated SDK";
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println(_strErrorMessage);
                fLogFile.println();
            }
            unknownhostexception.printStackTrace();
        }
        catch(ConnectException connectexception)
        {
            _lErrorCode = 3;
            _strErrorMessage = "Error: Connection refused, is server down? try again later";
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println(_strErrorMessage);
                fLogFile.println();
            }
            connectexception.printStackTrace();
        }
        catch(NoRouteToHostException noroutetohostexception)
        {
            _lErrorCode = 4;
            _strErrorMessage = "Error: Connect timed out. Try again later";
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println(_strErrorMessage);
                fLogFile.println();
            }
            noroutetohostexception.printStackTrace();
        }
        catch(MalformedURLException malformedurlexception)
        {
            _lErrorCode = 5;
            _strErrorMessage = "Error: Malformed URL exception, please check transaction manually.";
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println(_strErrorMessage);
                fLogFile.println();
            }
            malformedurlexception.printStackTrace();
        }
        catch(IOException ioexception1)
        {
            _lErrorCode = 6;
            _strErrorMessage = "Error: IO exception, please check transaction manually";
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println(_strErrorMessage);
                fLogFile.println();
            }
            ioexception1.printStackTrace();
        }
        catch(Exception exception)
        {
            _lErrorCode = 7;
            _strErrorMessage = "Error: Unkown exception happened, please check transaction manually";
            if(IsLoggingEnabled() && bLogFileOK)
            {
                fLogFile.println(_strErrorMessage);
                fLogFile.println();
            }
            exception.printStackTrace();
        }
        finally
        {
            if(IsLoggingEnabled() && bLogFileOK)
                fLogFile.close();
        }
    }

    protected String prepareInput(String s)
    {
        StringBuffer stringbuffer = new StringBuffer();
        boolean flag = true;
        String s1;
        for(StringTokenizer stringtokenizer = new StringTokenizer(s, _strPostDelimiter); stringtokenizer.hasMoreTokens(); stringbuffer.append(URLEncoder.encode(s1)))
        {
            s1 = stringtokenizer.nextToken();
            String s2 = s1.toLowerCase();
            if(s2.indexOf("x_adc_delim_character") >= 0)
            {
                int i = s2.indexOf("=");
                if(i >= 0)
                {
                    _strResponseDelimiter = s2.substring(i + 1, s2.length()).trim();
                    System.out.println("The response delim is: " + _strResponseDelimiter);
                }
            }
            if(flag)
                flag = false;
            else
                stringbuffer.append("&");
        }

        return stringbuffer.toString();
    }

    protected void parseAndStoreResponse(String s)
    {
        int i = 0;
        boolean flag = false;
        for(int j = s.indexOf(_strResponseDelimiter, i); j >= 0;)
        {
            String s1;
            if(i < j)
                s1 = s.substring(i, j);
            else
                s1 = "";
            i = j + 1;
            j = s.indexOf(_strResponseDelimiter, i);
            _vResponseFields.addElement(s1);
        }

        if(i < s.length())
        {
            String s2 = s.substring(i, s.length());
            _vResponseFields.addElement(s2);
        }
    }

    protected void readHeaders(BufferedReader bufferedreader)
        throws IOException
    {
        if(IsLoggingEnabled() && bLogFileOK)
        {
            fLogFile.println();
            fLogFile.println("Reading header data ...");
            fLogFile.println();
        }
        String s;
        while(!(s = bufferedreader.readLine()).equals("")) 
        {
            _vReponseHeaders.addElement(s);
            if(IsLoggingEnabled() && bLogFileOK)
                fLogFile.println(s);
        }
        if(IsLoggingEnabled() && bLogFileOK)
        {
            fLogFile.println();
            fLogFile.println("Header data done");
            fLogFile.println();
        }
    }

    protected String readContent(BufferedReader bufferedreader, Vector vector)
        throws IOException
    {
        if(IsLoggingEnabled() && bLogFileOK)
        {
            fLogFile.println("Reading Content Data...");
            fLogFile.println();
        }
        int i = getContentLength(vector);
        if(i < 0)
            throw new IOException("missing content-length");
        StringBuffer stringbuffer = new StringBuffer();
        String s;
        while((s = bufferedreader.readLine()) != null) 
            stringbuffer.append(s);
        if(stringbuffer.length() != i)
            throw new IOException("content-length=" + i + ", " + "length=" + stringbuffer.length());
        if(IsLoggingEnabled() && bLogFileOK)
        {
            fLogFile.println(stringbuffer.toString());
            fLogFile.println();
            fLogFile.println("Reading Content Data Complete");
            fLogFile.println();
        }
        return stringbuffer.toString();
    }

    protected int getContentLength(Vector vector)
    {
        String s = new String("Content-Length: ");
        s = s.toLowerCase();
        String s1 = "-1";
        int i = 0;
        for(int j = vector.size(); i < j; i++)
        {
            String s2 = (String)vector.elementAt(i);
            if(!s2.toLowerCase().startsWith(s))
                continue;
            s1 = s2.substring("Content-Length: ".length(), s2.length());
            break;
        }

        try
        {
            return Integer.parseInt(s1);
        }
        catch(Exception exception)
        {
            return -1;
        }
    }

    protected static final String HTTP10 = "HTTP/1.0";
    protected static final String POST = "POST";
    protected static final String STANDARD_POST_DELIM = "&";
    protected static final String CONTENT_TYPE_STRING = "Content-Type: application/x-www-form-urlencoded";
    protected static final String CONTENT_LENGTH = "Content-Length: ";
    protected static final String CONTENT_ENCODE_STRING = "Content-Encoding: 8859_1";
    protected static final String ANET_HOST = "secure.authorize.net";
    protected static final String ANET_FILE = "/gateway/transact.dll";
    protected static final int ANET_PORT = 443;
    protected static final String ANET_POST_DELIM = "&,";
    protected static final String ANET_RESPONSE_DEFAULT_DELIM = ",";
    protected static final String ANET_DELIM_PARAM_STRING = "x_adc_delim_character";
    protected static final String ANET_DEFAULT_LOG = "ANetSSLPostlog.txt";
    protected static final int SUCCESS = 0;
    protected static final int FILE_WRITER_CREATION_ERROR = 1;
    protected static final int UNKNOWN_HOST_ERROR = 2;
    protected static final int CONNECTION_REFUSED_ERROR = 3;
    protected static final int NO_ROUTE_TO_HOST_ERROR = 4;
    protected static final int MAL_FORMED_URL_ERROR = 5;
    protected static final int IO_ERROR = 6;
    protected static final int SOCKET_POST_ERROR = 6;
    protected static final int UNKNOWN_EXCEPTION = 7;
    protected static final String SUCCESS_MSG = "Success";
    protected static final String FILE_WRITER_CREATION_ERROR_MSG = "Error: Unable to log on request, operation aborted. Please contact administrators for file creation privs.";
    protected static final String UNKNOWN_HOST_ERROR_MSG = "Error: Host unknown. contact AuthorizeNet for updated SDK";
    protected static final String CONNECTION_REFUSED_ERROR_MSG = "Error: Connection refused, is server down? try again later";
    protected static final String NO_ROUTE_TO_HOST_ERROR_MSG = "Error: Connect timed out. Try again later";
    protected static final String MAL_FORMED_URL_ERROR_MSG = "Error: Malformed URL exception, please check transaction manually.";
    protected static final String IO_ERROR_MSG = "Error: IO exception, please check transaction manually";
    protected static final String SOCKET_POST_ERROR_MSG = "Error: Critical error occured when socket tried to write data. please check transaction manually";
    protected static final String UNKNOWN_EXCEPTION_MSG = "Error: Unkown exception happened, please check transaction manually";
    protected int _lTimeOut;
    protected String _strResponseDelimiter;
    protected String _strPostDelimiter;
    protected boolean _bLogEnabled;
    protected String _strLogFile;
    protected String _strErrorMessage;
    protected int _lErrorCode;
    protected Vector _vResponseFields;
    protected Vector _vReponseHeaders;
    protected String _strHost;
    protected String _strFile;
    protected int _nPort;
    protected String _strResponse;
    protected boolean bLogFileOK;
    PrintWriter fLogFile;
}