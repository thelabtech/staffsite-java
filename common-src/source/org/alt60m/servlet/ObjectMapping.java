package org.alt60m.servlet;

import java.util.*;
import java.io.*;

public class ObjectMapping {

    /**
     * @param Filename is like "discussion_service.config". 
     */
    private static Properties getProperties(String fullpath) throws FileNotFoundException, IOException {
	System.out.println("fullpath: "+ fullpath);
        java.io.File file = new java.io.File(fullpath);
        if(file.exists()==false) {
            System.out.println("Props doesn't exist!");
            return null;
        } else {
            FileInputStream fis = new FileInputStream(fullpath);
            Properties props = new Properties();
	    props.load(fis);
            System.out.println("Props: " + props);
            return props;
        }
    }

    private static String expandPath(String filename) {
	if(new java.io.File(filename).isAbsolute() == false) {
	    return new java.io.File(getConfigPath(), filename).getPath();
	} else {
            return filename;
        }
    }

    public static void setConfigPath(String path) {
	java.lang.System.setProperty(CONFIG_DIR_KEY, path);
    }

    public static String getConfigPath() {
	return java.lang.System.getProperty(CONFIG_DIR_KEY);
    }

    private static final String CONFIG_DIR_KEY = "org.alt60m.services.configdir";
}
