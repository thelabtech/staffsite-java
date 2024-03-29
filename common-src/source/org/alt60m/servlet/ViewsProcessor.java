package org.alt60m.servlet;

import java.util.*;
import java.io.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;

public class ViewsProcessor {

    private static final String DEFAULT_PARSER_NAME = "org.apache.xerces.parsers.SAXParser";
    private String uri = new String();

    public static Hashtable parse(String uri) {
	ViewsHandler v = new ViewsHandler();
	try {	    
	    Parser parser = ParserFactory.makeParser(DEFAULT_PARSER_NAME);
            if ( parser instanceof XMLReader ){
                ((XMLReader)parser).setFeature( "http://xml.org/sax/features/validation", false);
                ((XMLReader)parser).setFeature( "http://xml.org/sax/features/namespaces", true );
                //((XMLReader)parser).setFeature( "http://apache.org/xml/features/validation/schema", true );
            }
            parser.setDocumentHandler(v);
            parser.setErrorHandler(v);
            parser.parse(new InputSource(new FileReader(new File(uri))));
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return v.getViews();
    }

    public ViewsProcessor() {}

    public ViewsProcessor(String xmlFile) {
	uri = xmlFile;
    }
}


