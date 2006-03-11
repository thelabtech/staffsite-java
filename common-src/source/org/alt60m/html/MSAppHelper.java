package org.alt60m.html;

import java.util.*;
import javax.servlet.http.*;
import org.alt60m.servlet.*;

public class MSAppHelper {

	//constructor
	public void MSAppHelper() {}

	private final int APP_PAGES = 6;
	private final int REF_PAGES = 3;

	//creates a navagation bar at the top of the application based on what page the viewer is on
	public String appNavBar(String page) {
	try {
		String nav = "";
		int pageNum = Integer.parseInt(page.substring(3,4));
		
		if (pageNum > 1) {
			nav += "<A href=\"javascript:doPostForm('app" + (pageNum-1) + "')\"><IMG src=\"../hr_ms/images/back_arrow.gif\" border=0></A>";
		} else nav += "<IMG src=\"../hr_ms/images/blank_arrow.gif\" border=0>";

		for (int i = 1;i <= APP_PAGES ; i++) {
			if (i != pageNum) { 
				nav += "<A href=\"javascript:doPostForm('app" + i + "')\"> " + i + " </A>";
			} else nav += "<B> " + i + " </B>";
		}
		
		if (pageNum < APP_PAGES) {
			nav += "<A href=\"javascript:doPostForm('app" + (pageNum+1) + "')\"><IMG src=\"../hr_ms/images/next_arrow.gif\" border=0></A>";
		} else nav += "<A href=\"javascript:doPostForm('payment')\"><IMG src=\"../hr_ms/images/next_arrow.gif\" border=0></A>";

		return nav;
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
	}

	//creates a navagation bar at the top of the refrence form based on what page the viewer is on
	// TO DO: 7 August 2002 Needs to be rather a lot more like appNavBar -- RDH
	public String refNavBar(String page) {
		String nav = "";
		int pageNum = Integer.parseInt(page.substring(3,4));
		
		if (pageNum > 1) {
			nav += "<A href=\"Manager?action=save&page=ref" + (pageNum-1) + "\"><IMG src=\"../hr_ms/images/back_arrow.gif\" border=0></A>";
		} else nav += "<IMG src=\"../hr_ms/images/blank_arrow.gif\" border=0>";

		for (int i = 1;i <= REF_PAGES ; i++) {
			if (i != pageNum) { 
				nav += "<A href=\"Manager?action=save&page=ref" + i + "\"> " + i + " </A>";
			} else nav += "<B> " + i + " </B>";
		}
		
		if (pageNum < REF_PAGES) {
			nav += "<A href=\"Manager?action=save&page=ref" + (pageNum+1) + "\"><IMG src=\"../hr_ms/images/next_arrow.gif\" border=0></A>";
		} else nav += "<A href=\"Manager?action=save&page=thankY\"><IMG src=\"../hr_ms/images/next_arrow.gif\" border=0></A>";

		return nav;		
	}

}
