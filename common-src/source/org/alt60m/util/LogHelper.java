package org.alt60m.util;

import org.apache.log4j.Priority;
import org.apache.log4j.Category;
import org.apache.log4j.xml.DOMConfigurator;

import java.util.Hashtable;

/**
 * Created by IntelliJ IDEA.
 * User: David Bowdoin
 * Date: Jul 31, 2003
 * Time: 4:10:24 PM
 */

/* Example code, to enable use in non servlet classes
	//Log Helper Code//
	private static LogHelper logHelper = new LogHelper();
	private void log(Priority p, String msg) { logHelper.log(this.getClass().toString(),p,msg); }
	private void log(Priority p, String msg, java.lang.Throwable t) { logHelper.log(this.getClass().toString(),p,msg,t); }
	//End of Log Helper Code//
*/

public class LogHelper {

	private static String LOG_CONFIG_FILE;
	private static Hashtable loggers = new Hashtable();

	protected Category cat;

	public void setLog4JConfigFile(String logConfFile) {
		LOG_CONFIG_FILE = logConfFile;
		DOMConfigurator.configure(LOG_CONFIG_FILE);
	}

	public boolean getLogger(String className) {
		if(cat==null && LOG_CONFIG_FILE != null) {    //Enter if there is no logger, and the logger config has been initilized
			cat = (Category)loggers.get(className);
			if(cat==null) {    //If the logger has not been initilized for a given class, it creates a one.
				cat = Category.getInstance(className);
				loggers.put(className,cat); //Persist the logger
				cat.log(Priority.INFO,"Init Log4J for: "+className);
			}
		}
		return (cat!=null);
	}

	public void log(String className, String msg) {
		if(getLogger(className)) cat.log(Priority.DEBUG, msg);
		else System.out.println(msg);
	}
	public void log(String className, String msg, Throwable t) {
		if(getLogger(className)) cat.log(Priority.DEBUG, msg, t);
		else System.out.println(msg + "\n" + t);
	}
	public void log(String className, Priority p, String msg) {
		if(getLogger(className)) cat.log(p, msg);
		else System.out.println(msg);
	}
	public void log(String className, Priority p, String msg, Throwable t) {
		if(getLogger(className)) cat.log(p, msg, t);
		else System.out.println(msg + "\n" + t);
	}
}
