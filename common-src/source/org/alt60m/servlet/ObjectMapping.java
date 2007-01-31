package org.alt60m.servlet;

import java.util.*;
import java.io.*;

public class ObjectMapping {

    /**
     * @param Filename is like "discussion_service.config". 
     */

	private static String path;
	
    public static void setConfigPath(String path) {
    	ObjectMapping.path = path;
    }

    public static String getConfigPath() {
    	return path;
    }
}
