package org.alt60m.cms.servlet;

import java.util.*;
import org.xml.sax.*;
import org.xml.sax.helpers.AttributeListImpl;

public class CmsFileSpecsHandler extends HandlerBase {

    private String currType = new String();
    private String currDesc = new String();
    private String currMime = new String();
    private String currNote = new String();
    private String currGroup = new String();
	private String currImg = new String();
	private Hashtable specs = new Hashtable();

    public CmsFileSpecsHandler() {}

    public Hashtable getSpecs() { return specs; }

    public void startElement(String name, AttributeList attrs) {
        if (name.equalsIgnoreCase("spec")) {
            if (attrs != null) {
				currType = "";
				currDesc = "";
				currMime = "";
				currNote = "";
				currGroup = "";
				currImg = "";
                attrs = sortAttributes(attrs);
                int len = attrs.getLength();
                for (int i = 0; i < len; i++) {
                    if (attrs.getName(i).equalsIgnoreCase("type")) {
                        currType = attrs.getValue(i);
                    }
					if (attrs.getName(i).equalsIgnoreCase("desc")) {
						currDesc = attrs.getValue(i);
					}
					if (attrs.getName(i).equalsIgnoreCase("mime")) {
						currMime = attrs.getValue(i);
					}
					if (attrs.getName(i).equalsIgnoreCase("note")) {
                        currNote = attrs.getValue(i);
                    }
					if (attrs.getName(i).equalsIgnoreCase("group")) {
						currGroup = attrs.getValue(i);
                    }
					if (attrs.getName(i).equalsIgnoreCase("img")) {
						currImg = attrs.getValue(i);
                    }
                }
            }
        }
		Hashtable spec = new Hashtable();
		spec.put("Desc", currDesc);
		spec.put("Mime", currMime);
		spec.put("Note", currNote);
		spec.put("Group", currGroup);
		spec.put("Img", currImg);
		specs.put(currType, spec);
    }

    /*
    public void characters(char ch[], int start, int length) {
        if (curElement.equalsIgnoreCase("user")) {
            users.put(curActionName,normalize(new String(ch,start,length)));
        }
    }
    */

    /*
    public void ignorableWhitespace(char ch[], int start, int length) {
        characters(ch, start, length);
    }
    */

    /*
    public void endElement(String name) {
        curElement = "";
        if (name.equalsIgnoreCase("action")) {
            curActionName = "";
        }
    }
    */


    /*
    protected String normalize(String s) {
        StringBuffer str = new StringBuffer();
        int len = (s != null) ? s.length() : 0;
        for (int i = 0; i < len; i++) {
            char ch = s.charAt(i);
            switch (ch) {
                case '<': {
                    str.append("&lt;");
                    break;
                }
                case '>': {
                    str.append("&gt;");
                    break;
                }
                case '&': {
                    str.append("&amp;");
                    break;
                }
                case '"': {
                    str.append("&quot;");
                    break;
                }
                case '\r':
                case '\n': {
                    if (canonical) {
                        str.append("&#");
                        str.append(Integer.toString(ch));
                        str.append(';');
                        break;
                    }
                }
                default: {
                    str.append(ch);
                }
            }
        }

        return str.toString();
    }
    */

    
    protected AttributeList sortAttributes(AttributeList attrs) {
        AttributeListImpl attributes = new AttributeListImpl();
        int len = (attrs != null) ? attrs.getLength() : 0;
        for (int i = 0; i < len; i++) {
            String name = attrs.getName(i);
            int count = attributes.getLength();
            int j = 0;
            while (j < count) {
                if (name.compareTo(attributes.getName(j)) < 0) {
                    break;
                }
                j++;
            }
            attributes.addAttribute( name, attrs.getType(i),attrs.getValue(i));
        }
        return attributes;
    }
    

}

