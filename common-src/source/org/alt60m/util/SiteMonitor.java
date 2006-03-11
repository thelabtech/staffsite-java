package org.alt60m.util;


import java.io.*;
import java.net.*;
import java.util.Timer;
import java.util.TimerTask;

public class SiteMonitor {

    int _interval;
    int _checks = 0;
    Timer _timer;
    URL _watch;
    String _lookfor = new String();

    public SiteMonitor() {}

    public SiteMonitor(String s, int i) {
	try {
	    _watch = new URL(s);
	    System.out.println("initializing...");
	    _lookfor = fetch();
	    System.out.println("monitor on");
	    _timer = new Timer();
	    _timer.schedule(new MonitorTask(), 0, i * 1000);
	} catch (MalformedURLException e) {
	    e.printStackTrace();
	}
    }

    private boolean check(String s) {
	if (_lookfor.equals(s)) {
	    return true;
	} else {
	    return false;
	}
    }
    
    private String fetch() {
	try {
	    BufferedReader in = new BufferedReader(new InputStreamReader(_watch.openStream()));
	    StringBuffer sb = new StringBuffer();
	    String l = new String();
	    while ((l = in.readLine()) != null) {
		sb.append(l);
	    }
	    in.close();
	    return sb.toString();
	} 
	catch (MalformedURLException mal) {
	    return "Your url's bad.";
	} 
	catch (java.io.IOException io) {
	    return "IO Error!";
	}
    }


    public static void main(String[] args) {
	try{
	    System.out.println("Starting monitor...");
	    System.out.println("Watching URL: " + args[0] + "  every " + args[1] + " seconds.");
	    new SiteMonitor(args[0], new Integer(args[1]).intValue());
	} catch (ArrayIndexOutOfBoundsException a) {
	    System.out.println("usage: url check interval in seconds");
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }


    class MonitorTask extends TimerTask {
	public void run() {
	    //System.out.println("checks = " + _checks++);
	    //System.out.println("running...\nchecking...");
	    if (!check(fetch())) {
		System.out.println("Site " + _watch + " is down. " + new java.util.Date());
		try {
		    SendMessage email = new SendMessage();
		    email.setTo("first.last@uscm.org");
		    email.setFrom("SiteMonitor@uscm.org");
		    email.setSubject("Site " + _watch + " is down. " + new java.util.Date());
		    email.setBody("Site " + _watch + " is down. " + new java.util.Date());
		    email.send();
		} catch (Exception e) {
		    e.printStackTrace();
		}
	    }
	    //System.out.println("finished check\n\n");
	}
    }
}



