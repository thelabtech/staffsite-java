package org.alt60m.fsk;

import java.util.*;
import org.xml.sax.*;
import org.xml.sax.helpers.AttributeListImpl;

public class FskUsersHandler extends HandlerBase {

    private String currUserName = new String();
    private String currUserRole = new String();
    //private String curElement = new String();
    private Hashtable users = new Hashtable();

    public FskUsersHandler() {}

    public Hashtable getUsers() { return users; }

    public void startElement(String name, AttributeList attrs) {
        if (name.equalsIgnoreCase("user")) {
            if (attrs != null) {
                attrs = sortAttributes(attrs);
                int len = attrs.getLength();
                for (int i = 0; i < len; i++) {
                    if (attrs.getName(i).equalsIgnoreCase("name")) {
                        currUserName = attrs.getValue(i);
                    }
		    if (attrs.getName(i).equalsIgnoreCase("role")) {
			currUserRole = attrs.getValue(i);
		    }
                }
            }
        }
	//System.out.println("event " + currUserName + " " + currUserRole);
        users.put(currUserName, currUserRole);
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

