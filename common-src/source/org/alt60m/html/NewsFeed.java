	 
	 // This class gets xml data of the following format and prints it to html for display
	 
package org.alt60m.html;

import javax.xml.parsers.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import org.w3c.dom.*;
import java.util.*;
import java.io.*;

public class NewsFeed extends org.xml.sax.HandlerBase implements java.io.Serializable {

	String xmlSource = "http://p.moreover.com/cgi-local/page?c=Religion%20news&o=xml";
	//String xmlSource = "page.xml";

	public NewsFeed() {}

/** This is the main method for this class. When called, it returns a formatted String that can be out.println'ed to an html page.
 */        
	public String parseNews() {
        
		String s = new String();

        try {
			javax.xml.parsers.SAXParserFactory spf=SAXParserFactory.newInstance();
			spf.setValidating(false);
			javax.xml.parsers.SAXParser sp = spf.newSAXParser();
			NewsFeedHandler handler = new NewsFeedHandler();
			handler.setNumArticles(5);
			sp.parse(xmlSource, handler);
			s = handler.getNews();
		} catch (Exception e) {
			s = "News headlines are unavailable at the moment.";				
		}
		return s;
    }
    
	public String print() {
		return parseNews();
	}

	public static void main(String[] args) {
		NewsFeed nf = new NewsFeed();
		System.out.println(nf.parseNews());
	}

}
