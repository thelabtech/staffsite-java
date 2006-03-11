package org.alt60m.html;

import java.util.*;
import java.net.*;
import java.io.*;

public class Weather implements java.io.Serializable {

	String bodyFont = "<FONT FACE=\"Arial\" SIZE=\"1\" COLOR=\"#336699\">";
	String sectionFont = "<FONT FACE=\"Arial\" SIZE=\"2\" COLOR=\"#336699\">";
	String zipCode = "32828";
	String view = "current";
	String weatherSite = "http://www.weather.com/weather/local/";
	URL siteURL;

	String temperature ="-40C";
	String weatherImage = "";
	String cityZip = "Antartica";
	String feelsLike = "Really Cold";

	public Weather() {}

	public void setBodyFont(String aValue) { bodyFont = aValue; }
	public void setSectionFont(String aValue) { sectionFont = aValue; }

	public void setWeatherSite(String aValue) { weatherSite = aValue; }
	public void setZipCode(String aValue) {
		if (aValue==null){
			zipCode = "32832";
		}
		else{
			zipCode = aValue;
		}
	}

	public void setView(String aValue) {
		if (aValue==null){
			view = "current";
		}
		else{
			view = aValue;
		}
		if (view.equals("today")||view.equals("tenday")){
			setWeatherSite("http://www.weather.com/weather/tenday/");
		}
	}

	public void setSiteURL() {
		try{
			siteURL = new URL(weatherSite + zipCode); 
		}
		catch (MalformedURLException me){
			System.err.println("Weather Module malformed URL error!");
		}
	}
	public void setSiteURL(String aValue) {
		try{
			siteURL = new URL(aValue); 	}
		catch (MalformedURLException me){
			System.err.println("Weather Module malformed URL error!");
		}
	}


	public String print() {
			String stringBuffer = "<!--  --------------------Weather MODULE ------------------- --> ";
			setSiteURL();
			stringBuffer = stringBuffer + "<center>\n" + getWeather() + "</center>\n";
		return stringBuffer;
	}

    private String fetch() {
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(siteURL.openStream()));
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

    private String parse(String s) {
		int beginning = 0;
		int ending = 0;
		String tempString;

			if (view.equals("today")){
				beginning = s.indexOf("categoryTitle");  //make sure there is real data to pickup
				if (beginning>0){
					beginning = s.indexOf("<IMG",beginning);
					beginning = s.indexOf(">",beginning);
					ending = s.indexOf("</TD>",beginning);
					cityZip = s.substring(beginning+1,ending).trim();

					beginning = s.indexOf("<!-- insert day/date here -->",ending);
					ending = s.indexOf("</TR>",beginning);
					tempString = s.substring(beginning+29,ending).trim();
					String detailedWeatherLink = "<a href=\"http://www.weather.com" + tempString.substring(tempString.indexOf("/weather"),tempString.indexOf("onClick")).trim();

					beginning = tempString.indexOf("\">");
					ending = tempString.indexOf("</A>",beginning);
					String label =  tempString.substring(beginning+2,ending).trim();

					beginning = tempString.indexOf("<IMG SRC",ending);  //skip blank image

					beginning = tempString.indexOf("<IMG SRC",beginning+7);
					ending = tempString.indexOf(">",beginning);
					weatherImage =  tempString.substring(beginning,ending+1).trim();

					weatherImage = weatherImage.substring(weatherImage.indexOf("http"),weatherImage.indexOf("gif")+3);
					weatherImage = "<img src=\"/servlet/ImageController?url="+ weatherImage + "\">";

					beginning = tempString.indexOf("&nbsp;",ending);
					ending = tempString.indexOf("<",beginning);
					String hiT =  tempString.substring(beginning+6,ending).trim();
					if (hiT.equals("")){
						hiT="-";
					}

					beginning = tempString.indexOf("&nbsp;",ending);
					ending = tempString.indexOf("<",beginning);
					String loT =  tempString.substring(beginning+6,ending).trim();
					if (loT.equals("")){
						loT="-";
					}

					return "<b>" + cityZip + "</b>\n<BR><table width='100%' align=center>\n <tr><td align=center><b>"+sectionFont+label+"</b><br>" + weatherImage + "</td><td valign=bottom>"+bodyFont+"Hi: " + hiT + "<br> Lo: " + loT + "<br><br>"+ detailedWeatherLink +"' target='_blank'><i>more</i></a></font></td></tr>\n</table>\n";
				}
				else{
					return "Your zipcode is not properly set up.<br><a href='/servlet/StaffController?action=showCustomize'>fix</a>";
				}

			}
			else{
				beginning = s.indexOf("Current Conditions");
				if (beginning>0){
					beginning = s.indexOf("<B>",beginning);
					ending = s.indexOf("<!-- Insert City Name and Zip Code -->",beginning);
					
					cityZip = s.substring(beginning+3,ending).trim();

					beginning = s.indexOf("<!-- insert wx icon -->",ending);
					ending = s.indexOf(">",beginning);
					weatherImage =  s.substring(beginning+23,ending+1).trim();

					beginning = s.indexOf("<!-- insert current temp -->",ending);
					ending = s.indexOf("<",beginning+28);
					temperature =  s.substring(beginning,ending-1).trim();

					weatherImage = weatherImage.substring(weatherImage.indexOf("http"),weatherImage.indexOf("gif")+3);
					weatherImage = "<img src=\"/servlet/ImageController?url="+ weatherImage + "\">";

					return "<b>" + cityZip + "</b>\n<table><tr><td>" + weatherImage + "</td><td>" + bodyFont + "Currently</font><br>" + sectionFont + temperature + "&deg;F</font></td></tr></table>\n" + bodyFont + "<a href='http://www.weather.com/weather/local/" + zipCode + "' target='_blank'><i>more</i></a>\n";
				}
				else{
					return "You're zipcode is not properly set up.<br><a href='/servlet/StaffController?action=showCustomize'>fix</a>";
				}

			}
		
    }

	public String getWeather() {
		String myWeather = "";
		System.out.println("slurping....");
	    myWeather = fetch();
	    System.out.println("finished weather slurp");
		return parse(myWeather);
    }

}