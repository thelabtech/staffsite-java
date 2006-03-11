package org.alt60m.fsk;

import java.util.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import java.io.*;

public class FskUsersProcessor {

    private static final String DEFAULT_PARSER_NAME = "org.apache.xerces.parsers.SAXParser";
    private String uri = new String();

    public static Hashtable parse(String uri) {
	FskUsersHandler f = new FskUsersHandler();
	try {	    
	    Parser parser = ParserFactory.makeParser(DEFAULT_PARSER_NAME);
            if ( parser instanceof XMLReader ){
                ((XMLReader)parser).setFeature( "http://xml.org/sax/features/validation", false);
                ((XMLReader)parser).setFeature( "http://xml.org/sax/features/namespaces", true );
                //((XMLReader)parser).setFeature( "http://apache.org/xml/features/validation/schema", true );
            }
            parser.setDocumentHandler(f);
            parser.setErrorHandler(f);
            parser.parse(new InputSource(new FileReader(new File(uri))));
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return f.getUsers();
    }

    public FskUsersProcessor() {}

    public FskUsersProcessor(String xmlFile) {
	uri = xmlFile;
    }

    /*
    public static void main(String argv[]) {
	//System.out.println("Starting...");
        uri = "fsk.xml";
        Hashtable hash = parse(uri);

	for (Enumeration e = hash.keys(); e.hasMoreElements();) {
	    String k = (String) e.nextElement();
	    System.out.println(":" + k + ": :" + hash.get(k));
	}
        //System.out.println("done.");
    }
    */
}
