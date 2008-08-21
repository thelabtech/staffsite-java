package org.alt60m.util;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public final class Toolbox
{
	public Toolbox(){
		
	}
	
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
		if ((numberMaybe!=null)&&(!numberMaybe.equals(""))){
			return Integer.valueOf(numberMaybe);
		}
		else 
		{
			return null;
		}
	}
	public static Integer stringToIntegerForceZero(String numeric){
		String numberMaybe=cleanNumeric(numeric);
		if ((numberMaybe!=null)&&(!numberMaybe.equals(""))){
			return Integer.valueOf(numberMaybe);
		}
		else 
		{
			return 0;
		}
	}
	public static String commatize(String numeric){
		String prettyOutput="";
		String num=stringToIntegerForceZero(numeric)+"";
		while(num.length()>3){
			prettyOutput=","+num.substring(num.length()-3,num.length())+prettyOutput;
			num=num.substring(0,num.length()-3);
		}
		prettyOutput=num+prettyOutput;
		return prettyOutput;
	}
	public static String escapeSingleQuotes(String fixme){
		return fixme.replace("'","%27");
	}
	
}