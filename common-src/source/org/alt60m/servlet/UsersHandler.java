package org.alt60m.servlet;

import java.util.*;
import org.xml.sax.*;
import org.xml.sax.helpers.AttributeListImpl;

public class UsersHandler extends HandlerBase {

    private String currUserName = new String();
    private String currUserRole = new String();
    private Hashtable users = new Hashtable();

    public UsersHandler() {}

    public Hashtable getUsers() { return users; }

    public void startElement(String name, AttributeList attrs) {
        if (name.equalsIgnoreCase("user")) {
            if (attrs != null) {
                attrs = sortAttributes(attrs);
                int len = attrs.getLength();
                for (int i = 0; i < len; i++) {
                    if (attrs.getName(i).equalsIgnoreCase("name")) {
                        currUserName = attrs.getValue(i).toLowerCase();
                    }
		    if (attrs.getName(i).equalsIgnoreCase("role")) {
			currUserRole = attrs.getValue(i);
		    }
                }
            }
        }
        users.put(currUserName, currUserRole);
    }
   
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

