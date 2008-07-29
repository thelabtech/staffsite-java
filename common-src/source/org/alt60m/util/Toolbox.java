package org.alt60m.util;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public final class Toolbox
{
	public Toolbox(){
		
	}
	private int secureRows=0;
	protected static Log log = LogFactory.getLog(Toolbox.class);
	//Trims surrounding whitespace, then trailing non-numeric characters, from a String representation
	//of an Integer. If the non-whitespace portion starts with any non-numeric character, it returns null.
	// also returns null if there is no integer to be found.
	//the value "fox" will produce null, as will "abc123". "123abc" and "123" will both produce (String)"123".
	public static String cleanNumeric(String numericParameter){
		String retValue=new String("");
		if (numericParameter!=null){
			retValue=numericParameter;
			}
		return retValue.trim().replaceAll("[^-0123456789]","a").split("a",1)[0];
	}
	//converts a String to an Integer without throwing an exception on an invalid input value.
	//the value "fox" will produce null, as will "abc123". "123abc" and "123" will both produce (Integer)123.
	public static Integer stringToInteger(String numeric){
		String numberMaybe=cleanNumeric(numeric);
		if (numberMaybe!=null){
			return Integer.valueOf(numberMaybe);
		}
		else 
		{
			return null;
		}
	}
	public static String escapeSingleQuotes(String fixme){
		return fixme.replace("'","%27");
	}
	public int getSecureRows(){
		return secureRows;
	}
	public  StringBuffer renderMuster(StringBuffer renderedReport, boolean lighter, java.sql.ResultSet resultSet, String type, java.util.Vector<String> keys)throws Exception{

		String cellAlt="";
		String cell="";
		boolean secure=false;
			if(lighter){
						cell="light";
						cellAlt="darker";
					}
					else
					{
						cell="darker";
						cellAlt="veryDark";
					}
					secure=(!(resultSet.getString("isSecure").equals("F")))&&(!type.equals("team"));
					if(
						(!secure)||
						(keys.contains(resultSet.getString("campusID"))||
						(keys.contains(resultSet.getString("region"))||
						(keys.contains("ALL"))))
						){ 
							renderedReport.append("<tr >");
							renderedReport.append("<td class=\"label_"+(!type.equals("movement")?cell:cellAlt) +"\">"+(secure?"<i>":""));
							if(type.equals("team")){ 
								renderedReport.append("<a href=\"/servlet/InfoBaseController?action=showTeam&locallevelid="+resultSet.getString("teamID")+"\">");
								renderedReport.append(resultSet.getString("teamName"));
							}
							 else 
							{ 
								renderedReport.append("<a href=\"/servlet/InfoBaseController?action=showTargetArea&targetareaid="+resultSet.getString("campusID")+"\">");
								if (type.equals("movement")){
									renderedReport.append((resultSet.getString("campusName")+((secure?" (sensitive)":"")+"</a>")+" </td><td class=\""+
											(type.equals("movement")?"report_"+cell:"label_"+cellAlt) +"\">"+(secure?"<i>":"")+
											org.alt60m.ministry.Strategy.expandStrategy(resultSet.getString("strategy"))));
								}
								else if (type.equals("location")){
									renderedReport.append(resultSet.getString("campusName")+((secure?" (sensitive)":"")+"</a>"));
								}
								
								
							}
						 
						
						renderedReport.append("</td><td class=\"report_"+cellAlt +"\">"+(secure?"<i>":"")+""+resultSet.getString("region")+"</td>");
						renderedReport.append("<td class=\"report_"+cell +"\">"+(secure?"<i>":"")+""+resultSet.getString("city")+"</td>");
						renderedReport.append("<td class=\"report_"+cellAlt +"\">"+(secure?"<i>":"")+""+resultSet.getString("state")+"</td>");
						renderedReport.append("<td class=\"report_"+cell +"\">"+(secure?"<i>":"")+""+resultSet.getString("country")+"</td>");
						if (type.equals("movement")){ 
							 renderedReport.append("<td class=\"report_"+cellAlt +"\">"+(secure?"<i>":"")+""+resultSet.getString("status")+"</td>");
							 renderedReport.append("<td class=\"report_"+cell +"\">"+(secure?"<i>":""));
							 renderedReport.append("<a href=\"/servlet/InfoBaseController?action=showTeam&locallevelid="+resultSet.getString("teamID")+"\">"+resultSet.getString("teamName")+"</a>");	
									 renderedReport.append("</td>");
						} 
			renderedReport.append("</tr>");
					}else{
			secureRows++;
					}
			
			
		
		return renderedReport;
	}
}