package org.alt60m.cms.servlet;

import java.util.*;
import org.xml.sax.*;
import org.xml.sax.helpers.*;
import java.io.File;
import java.io.FileReader;
import org.xml.sax.InputSource;

public class CmsFileSpecsProcessor {

    private static final String DEFAULT_PARSER_NAME = "org.apache.xerces.parsers.SAXParser";
//    private String uri = new String();

    public static Hashtable parse(String uri) {
		CmsFileSpecsHandler h = new CmsFileSpecsHandler();
		try {	    
			Parser parser = ParserFactory.makeParser(DEFAULT_PARSER_NAME);
				if ( parser instanceof XMLReader ){
					((XMLReader)parser).setFeature( "http://xml.org/sax/features/validation", false);
					((XMLReader)parser).setFeature( "http://xml.org/sax/features/namespaces", true );
					//((XMLReader)parser).setFeature( "http://apache.org/xml/features/validation/schema", true );
				}
				parser.setDocumentHandler(h);
				parser.setErrorHandler(h);
				parser.parse(new InputSource(new FileReader(new java.io.File(uri))));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return h.getSpecs();
    }

    public CmsFileSpecsProcessor() {}

//    public CmsFileSpecsProcessor(String xmlFile) {
//		uri = xmlFile;
//    }

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


