package org.alt60m.cms.servlet;

import java.util.*;
import org.xml.sax.*;
import org.xml.sax.helpers.AttributeListImpl;

@SuppressWarnings("deprecation")
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

