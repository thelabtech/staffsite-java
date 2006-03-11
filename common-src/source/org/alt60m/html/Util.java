package org.alt60m.html;

import java.util.*;
import javax.servlet.http.*;
import org.alt60m.servlet.*;
import java.text.SimpleDateFormat;

public class Util {

	//constructor
	public void Util() {}


	// function to make the top of a table
	public String tableTop(String url, String width, String text, String font, String barColor, String finish, String cont) {
		String table = "<TABLE cellpadding=0 cellspacing=0 border=0 width=" + width + " " + barColor + ">";

		table += "<TR><TD width=5px align=left valign=top><IMG src=\"" + url + "/lCorner.gif\" border=0>";
		if (finish.length() > 0) { table += "</TD><TD width=5px><A HREF=\"" + finish + "\"><IMG src=\"" + url + "/finish.gif\" border=0></A>"; }
		table += "</TD>";
		table += "<TD width=* align=center>" + font + " " + text + "</TD>";
		if (cont.length() > 0){ table += "<TD width=5px><A HREF=\"" + cont + "\"><IMG src=\"" + url + "/continue.gif\" border=0></A></TD>"; }
		table += "<TD width=5px align=right valign=top><IMG src=\"" + url + "/rCorner.gif\" border=0></TD></TR>";
		table += "</TABLE>";

		return table;
	}

	//function to output a date input feild with a secified name
	public String dateInput(String name) {
		return "<INPUT type=text name=" + name + " size=15>";
	}

	//function to output a phone number or ssn input feild with a secified name
	public String phoneInput(String name) {
		return "<INPUT type=text name=" + name + " size=15>";
	}

	//function to select a state
	public String stateSelect(String name) {
		String states = "<SELECT name=" + name + "><OPTION value=0> </OPTION><OPTION value=0>---</OPTION>";

		states += "<OPTION value=1>NC</OPTION>";
		
		return states + "</SELECT>";
	}

	//function to select a project
	public String projectSelect() {
		String projects = "<SELECT name=state><OPTION value=0>Select One</OPTION><OPTION value=0>-------------</OPTION>";

		projects += "<OPTION value=1>WSN Summer Project</OPTION>";
		
		return projects + "</SELECT>";
	}

	//function to output a yes no option with a name
	public String yesNo(String name) {
		return "<INPUT type=radio name=\"" + name + "\" value=\"true\"> Yes <INPUT type=radio name=\"" + name + "\" value=\"false\"> No";
	}

	/**
	 * returns the yesno value if the value is a string.
	 * modified 1/7/2003 kb - assumes false if string is null.
	 * @param name
	 * @param value
	 * @return String
	 */
	public String yesNo(String name, String value) 
	{
		if(value==null) value = "n";
		
		if (value.equalsIgnoreCase("y") || value.equalsIgnoreCase("yes") || value.equalsIgnoreCase("t") || value.equalsIgnoreCase("true"))
			return "<INPUT type=radio name=\"" + name + "\" value=\"true\" checked=\"checked\"> Yes <INPUT type=radio name=\"" + name + "\" value=\"false\"> No";
		else if (value.equalsIgnoreCase("n") || value.equalsIgnoreCase("no") || value.equalsIgnoreCase("f") || value.equalsIgnoreCase("false"))
			return "<INPUT type=radio name=\"" + name + "\" value=\"true\"> Yes <INPUT type=radio name=\"" + name + "\" value=\"false\" checked=\"checked\"> No";
		else
			return "<INPUT type=radio name=\"" + name + "\" value=\"true\"> Yes <INPUT type=radio name=\"" + name + "\" value=\"false\"> No";
	}
	
	/**
	 * returns the yesNo string for the value of type boolean
	 * kb - 1/7/2003
	 * @param name
	 * @param value
	 * @return String
	 */
	public String yesNo(String name, Boolean value)
	{
		if(value==null)
			return yesNo(name, value);
		else
			return yesNo(name, value.toString());
	}
	
	
	public static String formatDate(Date thedate)
	{
		if(thedate==null) return "";
		return new SimpleDateFormat("MM/dd/yyyy").format(thedate).toString();
	}

	public static String formatDateTime(Date thedate)
	{
		if(thedate==null) return "";
		return new SimpleDateFormat("MM/dd/yyyy HH:mm:ss a").format(thedate).toString();
	}

	/**
	 * returns "" no matter what.
	 * if it finds the parm in the request, it returns it, if not returns ""
	 * @param response
	 * @param parm
	 * @return String
	 */
	public static String getRequestValue(HttpServletRequest req, String parm)
	{
		try
		{
			String val = (String) req.getParameter(parm);
			if (val==null) val = "";
			return val;
		}catch(Exception e)
		{
			e.printStackTrace();
			return "";	
		}
		
	}

}
