
	 /* 
	 <article id="_23064055">
	  <url>http://c.moreover.com/click/here.pl?x23064054</url> 
	  <headline_text>Islamic militants denounce U.N. monitoring efforts</headline_text> 
	  <source>Nando Times</source> 
	  <media_type>text</media_type> 
	  <cluster>moreover...</cluster> 
	  <tagline /> 
	  <document_url>http://www.nandotimes.com/world/</document_url> 
	  <harvest_time>Aug 9 2001 3:22PM</harvest_time> 
	  <access_registration /> 
	  <access_status /> 
	</article>
	*/

package org.alt60m.html;

import javax.xml.parsers.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import org.w3c.dom.*;
import java.util.*;
import java.io.*;

public class NewsFeedHandler extends org.xml.sax.HandlerBase implements java.io.Serializable {

	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"2\" COLOR=\"#336699\">";
	String bodyFontS = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#000000\">";
	StringBuffer news = new StringBuffer();

    StringBuffer accumulator = new StringBuffer();  // Accumulate parsed text
    String articleId;
	String url;
    String headline;
    String source;
	String doc_url;
	String time;
	int numArticles;
	int cntArticles=0;
	Properties p = new Properties();

	public NewsFeedHandler() { }

	public String getNews() { return news.toString(); }
	public void setNumArticles(int aValue) { numArticles=aValue; }

	public void init() {
		/*
		File f = new File("webapps/staffsite/newsfeed.properties");
		FileInputStream fis = new FileInputStream(f);
		p.load(fis);
		String pathToFile	= p.getProperty("_pathToFile");
		*/
	}

    // When the parser encounters plain text (not XML elements), it calls
    // this method, which accumulates them in a string buffer
    public void characters(char[] buffer, int start, int length) {
        accumulator.append(buffer, start, length);
    }

    // Every time the parser encounters the beginning of a new element, it
    // calls this method, which resets the string buffer
    public void startElement(String name, AttributeList attributes) {
        accumulator.setLength(0);  // Ready to accumulate new text
        // If its a servlet tag, look for id attribute
        if (name.equals("article"))
            articleId = attributes.getValue("id");
    }

    // When the parser encounters the end of an element, it calls this method
    public void endElement(String name) {
        if (name.equals("url")) {
            url = accumulator.toString().trim();
        }
        else if (name.equals("headline_text")) {
            headline = accumulator.toString().trim();
        }
        else if (name.equals("source")) {
            source = accumulator.toString().trim();
        }
        else if (name.equals("harvest_time")) {
            time = accumulator.toString().trim();
        }
        else if (name.equals("article")) {
            // Assuming the document is valid, then when we parse </article>,
            // we know we've got all the article info to print out
            if (cntArticles<=numArticles) {
				news.append(bodyFont + "<a href=\"" + url + "\" target=\"_blank\">" 
							+ headline + "</a></font><br>\n" 
							+ bodyFontS + source + "&nbsp;&nbsp;&nbsp;" 
							+ time + "</font><br>\n");
				cntArticles++;
			}
        }
    }

    /** This method is called when warnings occur */
    public void warning(SAXParseException exception) {
        System.err.println("WARNING: line " + exception.getLineNumber() + ": "+ exception.getMessage());
    }

    /** This method is called when errors occur */
    public void error(SAXParseException exception) {
        System.err.println("ERROR: line " + exception.getLineNumber() + ": " + exception.getMessage());
    }

    /** This method is called when non-recoverable errors occur. */
    public void fatalError(SAXParseException exception) throws SAXException {
        System.err.println("FATAL: line " + exception.getLineNumber() + ": " + exception.getMessage());
        throw(exception);
    }

}
